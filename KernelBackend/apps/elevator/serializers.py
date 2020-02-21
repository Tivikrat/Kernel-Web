from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from apps.auth.serializers import UserSerializer, SuperuserAccessSerializer
from apps.elevator import models
from apps.elevator.models import Provider


class GoodSerializer(SuperuserAccessSerializer):
    class Meta:
        model = models.Good
        fields = '__all__'


class ElevatorSerializer(SuperuserAccessSerializer):
    class Meta:
        model = models.Elevator
        fields = '__all__'


class LabAssistantSerializer(SuperuserAccessSerializer):
    user = UserSerializer(read_only=True)
    user_name = serializers.CharField(write_only=True, required=True)
    elevator = ElevatorSerializer(read_only=True)
    elevator_name = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = models.LabAssistant
        fields = '__all__'

    def validate(self, attrs):
        request = self.context.get("request")
        errors = {}
        if request.method != 'PATCH' or attrs.get('user_name', None):
            users = User.objects.filter(username=attrs.pop('user_name'))
            if not users.exists():
                errors['user_name'] = _("Not found")
            attrs['user'] = users.first()
        if request.method != 'PATCH' or attrs.get('elevator_name', None):
            elevators = models.Elevator.objects.filter(name=attrs.pop('elevator_name'))
            if not elevators.exists():
                errors['elevator_name'] = _("Not found")
            attrs['elevator'] = elevators.first()
        if errors.get('user_name') or errors.get('elevator_name'):
            raise ValidationError(errors)
        return attrs

    def create(self, validated_data):
        instance, created = self.Meta.model.objects.get_or_create(**validated_data)
        return instance

    def update(self, instance, validated_data):
        user = validated_data.get('user', instance.user)
        elevator = validated_data.get('elevator', instance.elevator)
        instances = self.Meta.model.objects.filter(user=user, elevator=elevator)
        if instances.exists() \
                and (instance.user != user
                     or instance.elevator != elevator):
            instances.first().delete()
        instance.user = user
        instance.elevator = elevator
        instance.save()
        return instance


class WeighingSerializer(LabAssistantSerializer):
    class Meta:
        model = models.Weighing
        fields = '__all__'


class GuardianSerializer(LabAssistantSerializer):
    class Meta:
        model = models.Guardian
        fields = '__all__'


class ProviderSerializer(SuperuserAccessSerializer):
    user = UserSerializer(read_only=True)
    user_name = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = models.Provider
        fields = '__all__'

    def validate(self, attrs):
        request = self.context.get("request")
        errors = {}
        if request.method != 'PATCH' or attrs.get('user_name', None):
            users = User.objects.filter(username=attrs.pop('user_name'))
            if not users.exists():
                errors['user_name'] = _("Not found")
            attrs['user'] = users.first()
        if errors.get('user_name') or errors.get('elevator_name'):
            raise ValidationError(errors)
        return attrs

    def create(self, validated_data):
        instance, created = self.Meta.model.objects.get_or_create(**validated_data)
        return instance


class LSDSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.LSD
        fields = ['id', 'number', 'is_good']


class AdminGuardianDeliverySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.GuardianDelivery
        fields = ['id', 'name', 'date', 'car_number', 'trailer_number', 'driver_name', 'to_elevator']


class GuardianDeliverySerializer(serializers.ModelSerializer):
    lsds = LSDSerializer(many=True, required=False)

    class Meta:
        model = models.GuardianDelivery
        fields = ['id', 'name', 'date', 'car_number', 'trailer_number', 'driver_name', 'to_elevator', 'lsds']

    def validate(self, attrs):
        lsds = attrs.get('lsds', None)
        if lsds is not None:
            if not isinstance(lsds, list):
                raise ValidationError({
                    'lsds': f'Must be a list (array) of '
                            f'objects with "number" and "is_good" parameters '
                            f'(and "id" if need to be changed, "delete" for deletion)'})
            if self.context.get('request').method == "POST":
                for lsd in lsds:
                    if not ('number' in lsd
                            and len(lsd['number']) > 0
                            and 'is_good' in lsd
                            and isinstance(lsd['is_good'], bool)):
                        raise ValidationError({'lsds': 'Wrong lsds sequence'})
            for lsd in lsds:
                if 'id' in lsd:
                    lsds_instances = models.LSD.objects.filter(id=lsd['id'])
                    if not lsds_instances.exists():
                        raise ValidationError({'lsds': f'LSD {lsd["id"]} does not exists'})
                    lsd_instance: models.LSD = lsds_instances.first()
                    if self.instance is None or lsd_instance.guardian_delivery != self.instance.id:
                        raise ValidationError({'lsds': f'LSD {lsd["id"]} does not belong to this delivery'})
        return attrs

    def create(self, validated_data: dict):
        lsds = validated_data.pop('lsds', None)
        validated_data['elevator'] = models.Elevator.objects.filter(
            guardian__user=self.context.get('request').user).first()
        validated_data['guardian'] = models.Guardian.objects.filter(user=self.context.get('request').user).first()
        instance = super().create(validated_data)
        if lsds is not None:
            for lsd in lsds:
                models.LSD.objects.create(**lsd, guardian_delivery=instance)
        return instance

    def update(self, instance: models.GuardianDelivery, validated_data):
        lsds = validated_data.pop('lsds', None)
        updated_instance = super().update(instance, validated_data)
        for lsd in models.LSD.objects.filter(guardian_delivery=instance):
            lsd.delete()
        if lsds is not None:
            for lsd in lsds:
                if 'id' in lsd:
                    lsd_instance: models.LSD = models.LSD.objects.filter(id=lsd['id']).first()
                    lsd_instance.number = lsd.get('number', lsd_instance.number)
                    lsd_instance.is_good = lsd.get('is_good', lsd_instance.is_good)
                else:
                    models.LSD.objects.create(**lsd, guardian_delivery=instance)
        return updated_instance


class WeightCheckSerializer(serializers.ModelSerializer):
    weighing = WeighingSerializer(read_only=True)

    class Meta:
        model = models.WeightCheck
        fields = '__all__'


class LabAnalysisSerializer(serializers.ModelSerializer):
    lab_assistant = LabAssistantSerializer(read_only=True)

    class Meta:
        model = models.LabAnalysis
        fields = '__all__'


class WeighingDeliverySerializer(serializers.ModelSerializer):
    provider = ProviderSerializer(read_only=True)
    provider_name = serializers.CharField(write_only=True, required=True)
    elevator = ElevatorSerializer(read_only=True)
    elevator_name = serializers.CharField(write_only=True, required=True)
    weight_check = WeightCheckSerializer(read_only=True)
    lab_analysis = LabAnalysisSerializer(read_only=True)

    class Meta:
        model = models.Delivery
        fields = ['id', 'name', 'date', 'provider', 'elevator', 'to_elevator', 'weight_check', 'lab_analysis',
                  'provider_name', 'elevator_name', ]

    def validate(self, attrs):
        request = self.context.get("request")
        errors = {}
        if request.method != 'PATCH' or attrs.get('provider_name', None):
            provider = Provider.objects.filter(name=attrs.pop('provider_name'))
            if not provider.exists():
                errors['provider_name'] = _("Not found")
            attrs['provider'] = provider.first()
        if request.method != 'PATCH' or attrs.get('elevator_name', None):
            elevators = models.Elevator.objects.filter(name=attrs.pop('elevator_name'))
            if not elevators.exists():
                errors['elevator_name'] = _("Not found")
            attrs['elevator'] = elevators.first()
        if errors.get('provider_name') or errors.get('elevator_name'):
            raise ValidationError(errors)
        return attrs


class WeightCheckDeliverySerializer(serializers.ModelSerializer):
    gross_weight = serializers.FloatField(write_only=True)
    net_weight = serializers.FloatField(write_only=True)
    provider = ProviderSerializer(read_only=True)
    elevator = ElevatorSerializer(read_only=True)
    weight_check = WeightCheckSerializer(read_only=True)
    lab_analysis = LabAnalysisSerializer(read_only=True)

    class Meta:
        model = models.Delivery
        fields = ['id', 'name', 'provider', 'elevator', 'to_elevator', 'date', 'gross_weight', 'net_weight',
                  'weight_check', 'lab_analysis']
        read_only_fields = ['id', 'name', 'provider', 'elevator', 'to_elevator', 'date', 'weight_check', 'lab_analysis']

    def validate(self, attrs):
        if self.instance:
            weight_checks = models.WeightCheck.objects.filter(id=self.instance.weight_check)
            if weight_checks.exists():
                weight_check = weight_checks.first()
                gross_weight = attrs.get('gross_weight', weight_check.gross_weight)
                net_weight = attrs.get('net_weight', weight_check.net_weight)
                if (gross_weight is not None) and (net_weight is not None) and gross_weight < net_weight:
                    raise ValidationError({'non_field_errors': "Gross weight must be bigger than net weight"})
        attrs['weighing'] = models.Weighing.objects.filter(user=self.context.get("request").user).first()
        return attrs

    def update(self, instance, validated_data):
        if instance.weight_check is not None:
            weight_checks = models.WeightCheck.objects.filter(id=instance.weight_check.id)
            if weight_checks.exists():
                weight_check = weight_checks.first()
                if validated_data.get('gross_weight', None) is not None:
                    weight_check.gross_weight = validated_data['gross_weight']
                if validated_data.get('net_weight', None) is not None:
                    weight_check.net_weight = validated_data['net_weight']
                weight_check.save()
                return models.Delivery.objects.get(id=instance.id)
        weight_check = models.WeightCheck.objects.create(**validated_data)
        weight_check.save()
        instance.weight_check = weight_check
        instance.save()
        return models.Delivery.objects.get(id=instance.id)


class LabAnalysisDeliverySerializer(serializers.ModelSerializer):
    humidity = serializers.FloatField(write_only=True, allow_null=False, required=True, max_value=100)
    clogging = serializers.FloatField(write_only=True, allow_null=False, required=True, max_value=100)
    provider = ProviderSerializer(read_only=True)
    elevator = ElevatorSerializer(read_only=True)
    weight_check = WeightCheckSerializer(read_only=True)
    lab_analysis = LabAnalysisSerializer(read_only=True)

    class Meta:
        model = models.Delivery
        fields = ['id', 'name', 'provider', 'elevator', 'to_elevator', 'date', 'humidity', 'clogging', 'weight_check',
                  'lab_analysis']
        read_only_fields = ['id', 'name', 'provider', 'elevator', 'to_elevator', 'date', 'weight_check', 'lab_analysis']

    def validate(self, attrs):
        attrs['lab_assistant'] = models.LabAssistant.objects.filter(user=self.context.get("request").user).first()
        return attrs

    def update(self, instance, validated_data):
        if instance.lab_analysis is not None:
            lab_analysis = models.LabAnalysis.objects.filter(id=instance.lab_analysis.id)
            if lab_analysis.exists():
                analise = lab_analysis.first()
                analise.humidity = validated_data.get('humidity', analise.humidity)
                analise.clogging = validated_data.get('clogging', analise.clogging)
                analise.save()
                return models.Delivery.objects.get(id=instance.id)
        analise = models.LabAnalysis.objects.create(**validated_data)
        analise.save()
        instance.lab_analysis = analise
        instance.save()
        return models.Delivery.objects.get(id=instance.id)
