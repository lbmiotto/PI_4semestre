from rest_framework import serializers
from app_django.models import Map

class MapSerializer(serializers.ModelSerializer):
    class Meta:
        model = Map
        fields = ('id', 'map_image')