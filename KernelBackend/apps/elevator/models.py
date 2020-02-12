from django.contrib.auth.models import User
from django.db import models


class Good(models.Model):
    name = models.TextField(max_length=200, unique=True)


class Elevator(models.Model):
    name = models.TextField(max_length=200, unique=True)
    address = models.TextField(max_length=200)


class LabAssistant(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='lab_seats')
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE)

    class Meta:
        unique_together = ['user', 'elevator']


class Guardian(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE)

    class Meta:
        unique_together = ['user', 'elevator']


class Weighing(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE)

    class Meta:
        unique_together = ['user', 'elevator']


class Provider(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.TextField(max_length=200)


class Contract(models.Model):
    good = models.ForeignKey(Good, on_delete=models.CASCADE)
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE)
    name = models.TextField(max_length=200)
    weight = models.FloatField()
    is_confirmed = models.BooleanField()
    date = models.DateField()


class WeightCheck(models.Model):
    weighing = models.ForeignKey(Weighing, on_delete=models.CASCADE)
    gross_weight = models.FloatField(null=True)
    net_weight = models.FloatField(null=True)


class LabAnalysis(models.Model):
    lab_assistant = models.ForeignKey(LabAssistant, on_delete=models.CASCADE)
    humidity = models.FloatField(null=True)
    clogging = models.FloatField(null=True)


class Delivery(models.Model):
    name = models.TextField(max_length=200)
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE)
    # humidity = models.FloatField()
    # clogging = models.FloatField()
    # gross_weight = models.FloatField()
    # net_weight = models.FloatField()
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE)
    to_elevator = models.BooleanField(default=False)
    date = models.DateField(null=True)
    weight_check = models.ForeignKey(WeightCheck, on_delete=models.SET_NULL, null=True)
    lab_analysis = models.ForeignKey(LabAnalysis, on_delete=models.SET_NULL, null=True)
    guardian = models.ForeignKey(Guardian, on_delete=models.CASCADE, null=True)
    lsd_number = models.TextField(max_length=200, null=True)
    is_lsd_unhurted = models.BooleanField(null=True)
    car_number = models.TextField(max_length=200, null=True)
    driver_name = models.TextField(max_length=200, null=True)
