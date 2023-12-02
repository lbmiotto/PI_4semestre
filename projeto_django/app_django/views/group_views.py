from rest_framework import views, status
from rest_framework.response import Response
from app_django.serializers import GroupSerializer
from django.contrib.auth.models import Group

class CadastroNovoGrupoView(views.APIView):
    def post(self, request, format=None):
        name = request.data.get('name')

        if not name:
            return Response({"error": "Informe o nome do grupo"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            grupo = Group.objects.create(name=name)
            return Response({"group_id": grupo.id, "name": grupo.name}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class DeletarGrupoView(views.APIView):
    def delete(self, request, name):
        try:
            group = Group.objects.get(name=name)
            group.delete() 

            return Response({"message": "Organização excluída com sucesso"}, status=status.HTTP_204_NO_CONTENT)
        except Group.DoesNotExist:
            return Response({"error": "Organização não encontrada"}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class ObterGrupoView(views.APIView):
    def get(self, request, format=None):
        try:
            grupos = Group.objects.all()
            serialized_grupos = [{"id": grupo.id, "name": grupo.name} for grupo in grupos]

            return Response(serialized_grupos, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)