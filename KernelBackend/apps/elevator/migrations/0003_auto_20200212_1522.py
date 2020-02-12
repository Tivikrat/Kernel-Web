# Generated by Django 3.0.3 on 2020-02-12 13:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0002_auto_20200212_1122'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='delivery',
            name='arrival_time',
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='contract',
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='departure_time',
        ),
        migrations.AddField(
            model_name='delivery',
            name='date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='delivery',
            name='provider',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='elevator.Provider'),
            preserve_default=False,
        ),
    ]