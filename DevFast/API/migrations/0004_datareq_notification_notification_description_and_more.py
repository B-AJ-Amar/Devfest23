# Generated by Django 4.2.7 on 2023-12-13 02:29

import API.models
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0003_rename_img_progress_url'),
    ]

    operations = [
        migrations.AddField(
            model_name='datareq',
            name='notification',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.notification'),
        ),
        migrations.AddField(
            model_name='notification',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='notification',
            name='is_reded',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='notification',
            name='title',
            field=models.CharField(blank=True, default='No Title', max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='peyment',
            name='notification',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.notification'),
        ),
        migrations.AddField(
            model_name='progress',
            name='notification',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.notification'),
        ),
        migrations.AlterField(
            model_name='notification',
            name='type',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='progress',
            name='url',
            field=models.ImageField(blank=True, default='default.jpg', null=True, upload_to=API.models.get_progress_image_path),
        ),
        migrations.CreateModel(
            name='Teckit',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Type', models.CharField(max_length=30)),
                ('text', models.TextField()),
                ('date', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('costumer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.costumer')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Type', models.CharField(max_length=30)),
                ('text', models.TextField()),
                ('date', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('costumer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.costumer')),
            ],
        ),
    ]
