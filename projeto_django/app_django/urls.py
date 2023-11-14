from django.urls import path
from app_django.views import CadastroNovoUsuarioView
from app_django.views import CadastroNovoGrupoView
from app_django.views import AssociarUsuarioGrupoView

urlpatterns = [
    path('signup/', CadastroNovoUsuarioView.as_view(), name='signup'),
    path('group/', CadastroNovoGrupoView.as_view(), name='group'),
    path('usergroup/', AssociarUsuarioGrupoView.as_view(), name='usergroup'),

]
