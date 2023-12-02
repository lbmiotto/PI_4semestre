from rest_framework import views, status
from rest_framework.response import Response
from app_django.serializers import GroupSerializer
from django.contrib.auth.models import Group

class CadastroNovoGrupoView(views.APIView):
    def post(self, request):
        serializer = GroupSerializer(data=request.data)
        if serializer.is_valid():
            group = Group.objects.create(**serializer.validated_data)
            return Response(GroupSerializer(group).data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)