from rest_framework import views, status
from rest_framework.response import Response
from django.contrib.auth.models import User, Group

class AssociarUsuarioGrupoView(views.APIView):
    def post(self, request):
        user_id = request.data.get('user_id')
        group_id = request.data.get('group_id')

        try:
            user = User.objects.get(id=user_id)
            group = Group.objects.get(id=group_id)
        except User.DoesNotExist:
            return Response({'error': 'Usuário não encontrado.'}, status=status.HTTP_400_BAD_REQUEST)
        except Group.DoesNotExist:
            return Response({'error': 'Grupo não encontrado.'}, status=status.HTTP_400_BAD_REQUEST)

        user.groups.add(group)  # Adicione o usuário ao grupo

        return Response({'message': 'Usuário associado ao grupo com sucesso.'}, status=status.HTTP_200_OK)