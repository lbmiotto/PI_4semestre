from django.urls import path
from app_django.views import CadastroNovoUsuarioView
from app_django.views import CadastroNovoGrupoView
from app_django.views import AssociarUsuarioGrupoView
from app_django.views import VerMapaView
from app_django.views import LoginView


urlpatterns = [
    path('signup/', CadastroNovoUsuarioView.as_view(), name='signup'),
    path('login/', LoginView.as_view(), name='login'),
    path('group/', CadastroNovoGrupoView.as_view(), name='group'),
    path('usergroup/', AssociarUsuarioGrupoView.as_view(), name='usergroup'),
    # path('map/', VerMapaView.as_view(), name='map'),
    path('map/', VerMapaView.as_view(), name='map-list'),
    path('maps/<int:mapa_id>/', VerMapaView.as_view(), name='map'),
]
