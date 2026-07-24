from django.http import JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from .models import EquipoInfo
import json


@method_decorator(csrf_exempt, name='dispatch')
class EquipoInfoView(View):

    # ---------- GET ----------
    def get(self, request, id=None):
        if id:
            try:
                equipo = EquipoInfo.objects.get(id=id)
                data = self.model_to_dict(equipo)
                return JsonResponse(data, status=200)
            except EquipoInfo.DoesNotExist:
                return JsonResponse({"error": "Equipo no encontrado"}, status=404)
        else:
            equipos = list(EquipoInfo.objects.all())
            data = [self.model_to_dict(e) for e in equipos]
            return JsonResponse(data, safe=False, status=200)
    # En views.py
    # ---------- POST ----------
    def post(self, request):
        try:
            data = json.loads(request.body)

            # Crear objeto con todos los campos existentes en models.py
            equipo = EquipoInfo.objects.create(**data)

            return JsonResponse(
                {"message": "Equipo creado", "id": equipo.id},
                status=201
            )

        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    # ---------- PUT ----------
    def put(self, request, id):
        try:
            data = json.loads(request.body)
            equipo = EquipoInfo.objects.get(id=id)

            # Actualizar solo campos que existan en el modelo
            for field, value in data.items():
                if hasattr(equipo, field):
                    setattr(equipo, field, value)

            equipo.save()

            return JsonResponse({"message": "Equipo actualizado"}, status=200)

        except EquipoInfo.DoesNotExist:
            return JsonResponse({"error": "Equipo no encontrado"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    # ---------- DELETE ----------
    def delete(self, request, id):
        try:
            equipo = EquipoInfo.objects.get(id=id)
            equipo.delete()
            return JsonResponse({"message": "Equipo eliminado"}, status=200)

        except EquipoInfo.DoesNotExist:
            return JsonResponse({"error": "Equipo no encontrado"}, status=404)

    # ---------- Convertir modelo a diccionario ----------
    def model_to_dict(self, obj):
        """Convierte el modelo a dict usando TODOS los campos de models.py"""
        data = {}
        for field in obj._meta.fields:
            field_name = field.name
            data[field_name] = getattr(obj, field_name)
        return data

# from django.http import JsonResponse
# from django.views import View
# from django.utils.decorators import method_decorator
# from django.views.decorators.csrf import csrf_exempt
# from .models import EquipoInfo
# import json


# @method_decorator(csrf_exempt, name='dispatch')
# class EquipoInfoView(View):

#     # ---------- GET ----------
#     def get(self, request, id=None):
#         if id:
#             try:
#                 equipo = EquipoInfo.objects.get(id=id)
#                 data = self.model_to_dict(equipo)
#                 return JsonResponse(data, status=200)
#             except EquipoInfo.DoesNotExist:
#                 return JsonResponse({"error": "Equipo no encontrado"}, status=404)
#         else:
#             equipos = list(EquipoInfo.objects.values())
#             return JsonResponse(equipos, safe=False, status=200)

#     # ---------- POST ----------
#     def post(self, request):
#         try:
#             data = json.loads(request.body)
#             equipo = EquipoInfo.objects.create(**data)
#             return JsonResponse({"message": "Equipo creado", "id": equipo.id}, status=201)
#         except Exception as e:
#             return JsonResponse({"error": str(e)}, status=400)

#     # ---------- PUT ----------
#     def put(self, request, id):
#         try:
#             data = json.loads(request.body)
#             equipo = EquipoInfo.objects.get(id=id)

#             for field, value in data.items():
#                 setattr(equipo, field, value)

#             equipo.save()
#             return JsonResponse({"message": "Equipo actualizado"}, status=200)

#         except EquipoInfo.DoesNotExist:
#             return JsonResponse({"error": "Equipo no encontrado"}, status=404)
#         except Exception as e:
#             return JsonResponse({"error": str(e)}, status=400)

#     # ---------- DELETE ----------
#     def delete(self, request, id):
#         try:
#             equipo = EquipoInfo.objects.get(id=id)
#             equipo.delete()
#             return JsonResponse({"message": "Equipo eliminado"}, status=200)
#         except EquipoInfo.DoesNotExist:
#             return JsonResponse({"error": "Equipo no encontrado"}, status=404)

#     # ---------- Convertir modelo a diccionario ----------
#     def model_to_dict(self, obj):
#         """Convierte el modelo en un diccionario con todos los campos."""
#         fields = [f.name for f in obj._meta.fields]
#         return {field: getattr(obj, field) for field in fields}
