# Generated by Django 4.2.7 on 2023-11-17 15:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_django', '0002_rename_mapa_map'),
    ]

    operations = [
        migrations.AlterField(
            model_name='map',
            name='map_image',
            field=models.URLField(max_length=250, unique=True),
        ),
    ]