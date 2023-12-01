from rest_framework import views, status
from rest_framework.response import Response
from app_django.serializers import MapSerializer
from app_django.models import Map

class VerMapaView(views.APIView):
    def get(self, request, mapa_id=None):
        if mapa_id:
            try:
                mapa = Map.objects.get(id=mapa_id)
                link_do_mapa = mapa.map_image
                return Response({"link_do_mapa": link_do_mapa}, status=status.HTTP_200_OK)
            except Map.DoesNotExist:
                return Response({'error': 'Mapa não encontrado.'}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response({'error': 'ID do mapa não fornecido.'}, status=status.HTTP_400_BAD_REQUEST)
