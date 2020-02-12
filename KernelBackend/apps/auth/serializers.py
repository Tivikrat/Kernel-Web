from django.contrib.auth import login
from django.contrib.auth.models import User
from rest_framework import serializers
from django.core import validators
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import ValidationError
from rest_framework.fields import SerializerMethodField
from rest_framework.test import force_authenticate
from django.utils.translation import gettext_lazy as _
from rest_framework.validators import UniqueValidator

from apps.elevator import models


def has_user(serializer):
    request = serializer.context.get('request')
    return request.user \
        if request and hasattr(request, "user") and request.user.id is not None \
        else False


def is_superuser(serializer) -> bool:
    user = has_user(serializer)
    return bool(user and user.is_staff)


class SuperuserAccessSerializer(serializers.ModelSerializer):
    def validate(self, attrs):
        if not is_superuser(self):
            raise ValidationError("Forbidden")
        return attrs


class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password', 'first_name',
                  'last_name', 'is_superuser', 'token']
        read_only_fields = ['id', 'email', 'first_name', 'last_name',
                            'is_superuser', 'token']

    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True, write_only=True)
    token = SerializerMethodField()

    def get_token(self, instance):
        token, created = Token.objects.get_or_create(user=instance)
        return token.key

    def validate(self, attrs):
        user = User.objects.filter(username=attrs['username']).first()
        if user is not None:
            if user.check_password(attrs['password']):
                return attrs
        raise ValidationError(
            _("Please enter a correct %(username)s and password. "
              "Note that both fields may be case-sensitive.")
            % {'username': _('username')})

    def update(self, instance, validated_data):
        pass

    def create(self, attrs):
        request = self.context.get("request")
        user = User.objects.filter(username=attrs['username']).first()
        force_authenticate(request, user)
        login(request, user)
        return user


class UserSerializer(SuperuserAccessSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password1', 'password2', 'first_name', 'last_name',
                  'is_superuser']
        read_only_fields = ['token']

    username = serializers.CharField(required=True, min_length=3, max_length=64,
                                     validators=[validators.validate_slug,
                                                 UniqueValidator(User.objects.all())])
    email = serializers.EmailField(validators=[UniqueValidator(queryset=User.objects.all(), lookup='iexact')])
    password1 = serializers.CharField(write_only=True, required=True, min_length=8, max_length=256)
    password2 = serializers.CharField(write_only=True, min_length=8)

    def validate(self, attrs):
        super().validate(attrs)
        request = self.context.get("request")
        if request.method != 'PATCH' or attrs.get('username', None):
            attrs['username'] = attrs['username'].strip()
        if request.method != 'PATCH' or attrs.get('email', None):
            attrs['email'] = attrs['email'].lower().strip()
            if User.objects.filter(email=attrs['email']).exists():
                raise ValidationError({'email': [_('Email')]})
        if request.method == 'POST':
            password1 = attrs.pop('password1')
            password2 = attrs.pop('password2')
            if password1 != password2:
                raise ValidationError({
                    'password1': [_('Passwords must be the same')],
                    'password2': [_('Passwords must be the same')],
                })
            attrs['password'] = password1
        return attrs

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user

    def update(self, instance: User, validated_data: dict):
        instance.username = validated_data.get('username', instance.username)
        password = validated_data.get('password', None)
        if password is not None:
            instance.set_password(password)
        instance.email = validated_data.get('email', instance.email)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.is_staff = validated_data.get('is_staff', instance.is_staff)
        instance.is_superuser = validated_data.get('is_superuser', instance.is_superuser)
        instance.save()
        return instance


class CurrentUserSerializer(UserSerializer):
    is_lab = SerializerMethodField()
    is_weighing = SerializerMethodField()
    is_guardian = SerializerMethodField()
    is_provider = SerializerMethodField()
    token = SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password1', 'password2', 'first_name', 'last_name',
                  'is_superuser', 'token', "is_lab", "is_weighing", "is_guardian", "is_provider"]

    def get_token(self, instance):
        token, created = Token.objects.get_or_create(user=instance)
        return token.key

    def get_is_lab(self, instance):
        return models.LabAssistant.objects.filter(user=instance).exists()

    def get_is_weighing(self, instance):
        return models.Weighing.objects.filter(user=instance).exists()

    def get_is_guardian(self, instance):
        return models.Guardian.objects.filter(user=instance).exists()

    def get_is_provider(self, instance):
        return models.Provider.objects.filter(user=instance).exists()

    def create(self, validated_data):
        user = super().create(validated_data)
        login(self.context.get("request"), user)
        return user


class StaffSerializer(SuperuserAccessSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name',
                  'is_superuser', 'lab_elevator', 'guardian_elevator',
                  'weighing_elevator']
