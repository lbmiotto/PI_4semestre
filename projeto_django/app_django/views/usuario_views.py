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

            is_superuser = user.is_superuser if hasattr(user, 'is_superuser') else False

            return Response({"message": "Login bem-sucedido!", "is_superuser": is_superuser}, status=status.HTTP_200_OK)
        else:
            return Response({"error": "Combinação de login e senha inválida"}, status=status.HTTP_401_UNAUTHORIZED)

class DeletarUsuarioView(views.APIView):
    def delete(self, request, username):
        try:
            user = User.objects.get(username=username)
            user.delete() 

            return Response({"message": "Usuário excluído com sucesso"}, status=status.HTTP_204_NO_CONTENT)
        except User.DoesNotExist:
            return Response({"error": "Usuário não encontrado"}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class ObterUsuarioView(views.APIView):
    def get(self, request, format=None):
        try:
            usuarios = User.objects.all()
            serialized_usuarios = [{"id": usuario.id, "username": usuario.username} for usuario in usuarios]

            return Response(serialized_usuarios, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
