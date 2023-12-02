from rest_framework import views, status
from rest_framework.response import Response
from app_django.models import Project
from app_django.serializers import ProjectSerializer

class CadastroNovoProjetoView(views.APIView):
    def post(self, request, format=None):
        name = request.data.get('name')
        desc = request.data.get('desc')

        if not name or not desc:
            return Response({"error": "Informe o nome e a descrição do projeto"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            projeto = Project.objects.create(name=name, desc=desc)
            return Response({"project_id": projeto.id, "name": projeto.name, "desc": projeto.desc}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class DeletarProjetoView(views.APIView):
    def delete(self, request, name):
        try:
            project = Project.objects.get(name=name)
            project.delete() 

            return Response({"message": "Projeto excluída com sucesso"}, status=status.HTTP_204_NO_CONTENT)
        except Project.DoesNotExist:
            return Response({"error": "Projeto não encontrada"}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class ObterProjetoView(views.APIView):
    def get(self, request, format=None):
        try:
            projetos = Project.objects.all()
            serialized_projetos = [{"id": projeto.id, "name": projeto.name, "desc": projeto.desc} for projeto in projetos]

            return Response(serialized_projetos, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)