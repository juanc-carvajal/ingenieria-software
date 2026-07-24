# from django.urls import path
# from .views import PatientView

# urlpatterns = [
#     # path("paciente/", PatientView.as_view(), name= "patients_list")
#     path("paciente/", PatientView.as_view(), name="patients_list"),
#     path("paciente/<int:id>", PatientView.as_view(), name="patients_process")
# ]

from django.urls import path
from .views import PatientView, LaboratoristView, LabResultsView, DashboardCountsView

urlpatterns = [
    # Pacientes
    path('pacientes/', PatientView.as_view(), name='patients_list'),
    path('pacientes/<int:id>/', PatientView.as_view(), name='patient_process'),

    # Laboratoristas
    path('laboratoristas/', LaboratoristView.as_view(), name='laboratorist_list'),
    path('laboratoristas/<int:id>/', LaboratoristView.as_view(), name='laboratorist_process'),

    # Resultados de laboratorio
    path('resultados/', LabResultsView.as_view(), name='labresults_list'),
    path('resultados/<int:id>/', LabResultsView.as_view(), name='labresults_process'),

    # Dashboard
    path('dashboard/counts/', DashboardCountsView.as_view(), name='dashboard_counts'),
]

