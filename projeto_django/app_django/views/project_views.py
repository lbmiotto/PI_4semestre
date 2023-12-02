from rest_framework import views, status
from rest_framework.response import Response
from app_django.models import Project
from app_django.serializers import ProjectSerializer

class VerProjetoView(views.APIView):
    def get(self, request, projeto_id=None):
        if projeto_id:
            try:
                projeto = Project.objects.get(id=projeto_id)
                serializer = ProjectSerializer(projeto)
                return Response(serializer.data, status=status.HTTP_200_OK)
            except Project.DoesNotExist:
                return Response({'error': 'Projeto não encontrado.'}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response({'error': 'ID do projeto não fornecido.'}, status=status.HTTP_400_BAD_REQUEST)
    
    def post(self, request):
        serializer = ProjectSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

