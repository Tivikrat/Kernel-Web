# Generated by Django 3.0.3 on 2020-02-12 14:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0005_auto_20200212_1531'),
    ]

    operations = [
        migrations.AlterField(
            model_name='delivery',
            name='to_elevator',
            field=models.BooleanField(default=False),
        ),
    ]
