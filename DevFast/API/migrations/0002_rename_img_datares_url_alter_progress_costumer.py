# Generated by Django 5.0 on 2023-12-12 17:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='datares',
            old_name='img',
            new_name='url',
        ),
        migrations.AlterField(
            model_name='progress',
            name='costumer',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='customer', to='API.costumer'),
        ),
    ]