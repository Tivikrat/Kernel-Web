# Generated by Django 3.0.3 on 2020-02-12 13:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0004_delivery_to_elevator'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='delivery',
            name='clogging',
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='gross_weight',
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='humidity',
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='net_weight',
        ),
        migrations.AlterField(
            model_name='delivery',
            name='car_number',
            field=models.TextField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='driver_name',
            field=models.TextField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='guardian',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='elevator.Guardian'),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='is_lsd_unhurted',
            field=models.BooleanField(null=True),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='lab_analysis',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='elevator.LabAnalysis'),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='lsd_number',
            field=models.TextField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='delivery',
            name='weight_check',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='elevator.WeightCheck'),
        ),
    ]
