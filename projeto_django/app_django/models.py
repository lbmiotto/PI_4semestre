from django.db import models

from django.contrib.auth.models import User
# Create your models here.

class Map(models.Model):
    id = models.AutoField(primary_key=True)
    map_image = models.URLField(max_length=1000, unique=True)
    # usuario = models.ForeignKey(User, on_delete=models.CASCADE)

