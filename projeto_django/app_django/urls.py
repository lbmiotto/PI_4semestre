from django.urls import path
from app_django.views import CadastroNovoUsuarioView
from app_django.views import AssociarUsuarioGrupoView
from app_django.views import VerMapaView
from app_django.views import LoginView
from app_django.views import DeletarUsuarioView
from app_django.views import ObterUsuarioView
from app_django.views import VerProjetoView
from app_django.views import CadastroNovoGrupoView
from app_django.views import DeletarGrupoView
from app_django.views import ObterGrupoView


urlpatterns = [
    # User
    path('signup/', CadastroNovoUsuarioView.as_view(), name='signup'),
    path('login/', LoginView.as_view(), name='login'),
    path('delete/<str:username>/', DeletarUsuarioView.as_view(), name='delete'),
    path('read/', ObterUsuarioView.as_view(), name='read'),
    # Grupo
    path('group/', CadastroNovoGrupoView.as_view(), name='group'),
    path('usergroup/', AssociarUsuarioGrupoView.as_view(), name='usergroup'),
    path('delete_group/<str:name>/', DeletarGrupoView.as_view(), name='delete_group'),
    path('read_group/', ObterGrupoView.as_view(), name='read_group'),
    # Projeto
    path('project/', VerProjetoView.as_view(), name='project'),
    path('maps/<int:mapa_id>/', VerMapaView.as_view(), name='map'),
]
