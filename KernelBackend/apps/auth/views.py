from django.contrib.auth import logout
from django.contrib.auth.models import User
from django.http import HttpResponse
from rest_framework import viewsets

from apps.auth import serializers
from apps.auth.serializers import LoginSerializer, UserSerializer, CurrentUserSerializer
from apps.elevator import models


class LoginViewSet(viewsets.ModelViewSet):
    serializer_class = LoginSerializer
    queryset = User.objects.none()


class CurrentUserViewSet(viewsets.ModelViewSet):
    serializer_class = CurrentUserSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return User.objects.filter(id=self.request.user.id)
        else:
            return User.objects.none()


class UserViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer

    def get_queryset(self):
        if self.request.user.is_superuser:
            return User.objects.all()
        elif self.request.user.is_authenticated:
            return User.objects.filter(id=self.request.user.id)
        else:
            return User.objects.none()


class UserSearchViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer

    def get_queryset(self):
        if self.request.user.is_superuser:
            return User.objects.filter(username__contains=self.kwargs['username'])
        else:
            return User.objects.none()


def log_out(request):
    logout(request)
    request.session.flush()
    return HttpResponse()
