from django.urls import path
from app_django.views import CadastroNovoUsuarioView
from app_django.views import CadastroNovoGrupoView
from app_django.views import AssociarUsuarioGrupoView
from app_django.views import VerMapaView
from app_django.views import LoginView
from app_django.views import DeletarUsuarioView
# from app_django.views import AtualizarUsuarioView
from app_django.views import ObterUsuarioView


urlpatterns = [
    path('signup/', CadastroNovoUsuarioView.as_view(), name='signup'),
    path('login/', LoginView.as_view(), name='login'),
    path('delete/<str:username>/', DeletarUsuarioView.as_view(), name='delete'),
    # path('update/<str:username>/', AtualizarUsuarioView.as_view(), name='update'),
    path('read/', ObterUsuarioView.as_view(), name='read'),
    path('group/', CadastroNovoGrupoView.as_view(), name='group'),
    path('usergroup/', AssociarUsuarioGrupoView.as_view(), name='usergroup'),
    # path('map/', VerMapaView.as_view(), name='map'),
    path('map/', VerMapaView.as_view(), name='map-list'),
    path('maps/<int:mapa_id>/', VerMapaView.as_view(), name='map'),
]
