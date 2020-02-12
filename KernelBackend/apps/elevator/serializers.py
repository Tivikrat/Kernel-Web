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

    def validate(self, attrs):
        attrs['name'] = attrs.get('name', )


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


class LSDWeighingSerializer(serializers.ModelSerializer):
    provider = ProviderSerializer(read_only=True)
    provider_name = serializers.CharField(write_only=True, required=True)
    elevator = ElevatorSerializer(read_only=True)
    elevator_name = serializers.CharField(write_only=True, required=True)
    date = serializers.DateField(required=True)

    class Meta:
        model = models.Delivery
        fields = ['id', 'name', 'provider', 'elevator', 'to_elevator', 'date', 'provider_name', 'elevator_name']

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


class WeightCheckLSDSerializer(serializers.ModelSerializer):
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


class LabAnalysisLSDSerializer(serializers.ModelSerializer):
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
