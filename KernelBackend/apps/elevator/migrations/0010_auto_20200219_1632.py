# Generated by Django 3.0.3 on 2020-02-19 14:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0009_auto_20200212_1834'),
    ]

    operations = [
        migrations.AddField(
            model_name='delivery',
            name='trailer_number',
            field=models.TextField(max_length=200, null=True),
        ),
        migrations.CreateModel(
            name='LSD',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.TextField(max_length=100)),
                ('is_good', models.BooleanField()),
                ('delivery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='lsds', to='elevator.Delivery')),
            ],
        ),
    ]
