from django.urls import path
from .views import EquipoInfoView

urlpatterns = [
    # Pacientes
    path('equipos/', EquipoInfoView.as_view(), name='equipos_list'),
    path('equipos/<int:id>/', EquipoInfoView.as_view(), name='equipos_process'),
]

