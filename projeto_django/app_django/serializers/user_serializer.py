from django.contrib.auth.models import User
from rest_framework import serializers
import re

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    def validate_password(self, password):
#pelo menos uma letra maiuscula
        if not re.search('[A-Z]', password):
            raise serializers.ValidationError("A senha deve conter pelo menos uma letra maiúscula")
#pelo menos uma letra minuscula
        if not re.search('[a-z]', password):
            raise serializers.ValidationError("A senha deve conter pelo menos uma letra minúscula")
#pelo menos um numero
        if not re.search('[0-9]', password):
            raise serializers.ValidationError("A senha deve conter pelo menos um número")
#pelo menos um caracter especial (o ^ é para negar)
        if not re.search('[^a-zA-Z0-9]', password):
            raise serializers.ValidationError("A senha deve conter pelo menos um caracter especial")
#pelo menos oito caracteres
        if len(password) < 8:
            raise serializers.ValidationError("A senha deve conter pelo menos oito caracteres")
        return password
    
    def validate_email(self, email):
        if not re.match(r"[^@]+@[^@]+\.[a-zA-Z]+", email):
            raise serializers.ValidationError("Formato de e-mail inválido")
        return email

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'is_superuser')