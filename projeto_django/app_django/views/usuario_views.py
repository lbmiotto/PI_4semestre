from rest_framework import views, status
from rest_framework.response import Response
from app_django.serializers import UserSerializer
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login

class CadastroNovoUsuarioView(views.APIView):
    def post(self, request, format=None):
        username = request.data.get('username')
        password = request.data.get('password')

        if not username or not password:
            return Response({"error": "Informe o nome de usuário e senha"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user = User.objects.create_user(username=username, password=password)
            return Response({"user_id": user.id, "username": user.username}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class LoginView(views.APIView):
    def post(self, request, format=None):
        username = request.data.get('username')
        password = request.data.get('password')

        if not username or not password:
            return Response({"error": "Informe o nome de usuário e senha"}, status=status.HTTP_400_BAD_REQUEST)

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return Response({"message": "Login bem-sucedido!"}, status=status.HTTP_200_OK)
        else:
            return Response({"error": "Combinação de login e senha inválida"}, status=status.HTTP_401_UNAUTHORIZED)