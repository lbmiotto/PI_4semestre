from rest_framework import views, status
from rest_framework.response import Response
from app_django.serializers import MapSerializer
from app_django.models import Map

class VerMapaView(views.APIView):
    def post(self, request):
        serializer = MapSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, mapa_id=None):
        if mapa_id:
            try:
                mapa = Map.objects.get(id=mapa_id)
                serializer = MapSerializer(mapa)
                return Response(serializer.data, status=status.HTTP_200_OK)
            except Map.DoesNotExist:
                return Response({'error': 'Mapa não encontrado.'}, status=status.HTTP_404_NOT_FOUND)
        else:
            mapas = Map.objects.all()
            serializer = MapSerializer(mapas, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)

