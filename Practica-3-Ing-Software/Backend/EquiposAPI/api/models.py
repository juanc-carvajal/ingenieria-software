from django.db import models

class EquipoInfo(models.Model):
    # 1. INFORMACIÓN GENERAL
    servicio = models.CharField(max_length=100)
    sede = models.CharField(max_length=100)	
    nombre_equipo = models.CharField(max_length=150)
    codigo_inventario = models.CharField(max_length=50)
    codigo_ips = models.CharField(max_length=50)
    codigo_ecri = models.CharField(max_length=50)

    responsable_proceso = models.CharField(max_length=150)
    ubicacion_fisica = models.CharField(max_length=150)

    marca = models.CharField(max_length=100)
    modelo = models.CharField(max_length=100)
    serie = models.CharField(max_length=100)

    clasificacion_eje_misional = models.CharField(max_length=150)
    clasificacion_ips = models.CharField(max_length=50)
    clasificacion_riesgo = models.CharField(max_length=50)

    registro_invima = models.CharField(max_length=150)

    # 2. REGISTRO HISTÓRICO
    tiempo_vida_util = models.CharField(max_length=50)
    fecha_adquisicion = models.CharField(max_length=20)
    propietario = models.CharField(max_length=100)
    fecha_fabricacion = models.CharField(max_length=20)

    nit = models.CharField(max_length=20)
    proveedor_equipo = models.CharField(max_length=150)

    garantia = models.CharField(max_length=10)  # Si / No
    fecha_fin_garantia = models.CharField(max_length=20)

    forma_adquisicion = models.CharField(max_length=50)
    tipo_documento = models.CharField(max_length=50)
    numero_documento = models.CharField(max_length=50)
    valor_compra= models.CharField(max_length=50)

    # 3. INVENTARIO DE DOCUMENTOS
    hoja_vida = models.CharField(max_length=10)
    registro_importacion = models.CharField(max_length=10)
    manual_operacion = models.CharField(max_length=10)
    manual_servicio = models.CharField(max_length=200)
    guia_rapida_uso = models.CharField(max_length=10)
    instructivo_manejo_rapido = models.CharField(max_length=10)
    protocolo_mantenimiento_preventivo = models.CharField(max_length=10)
    frecuencia_metrologica_fabricante = models.CharField(max_length=100)

    # 4. INFORMACIÓN METROLÓGICA ADMINISTRATIVA
    mantenimiento = models.CharField(max_length=10)
    frecuencia_mantenimiento = models.CharField(max_length=10)

    calibracion = models.CharField(max_length=10)
    frecuencia_calibracion = models.CharField(max_length=50)

    # 5. INFORMACIÓN METROLÓGICA TÉCNICA
    magnitud = models.CharField(max_length=100)
    rango_equipo = models.CharField(max_length=150)
    resolucion = models.CharField(max_length=100)
    rango_trabajo = models.CharField(max_length=150)
    error_max_permitido = models.CharField(max_length=100)

    # 6. CONDICIONES DE FUNCIONAMIENTO
    voltaje = models.CharField(max_length=50)
    corriente = models.CharField(max_length=50)
    humedad_relativa = models.CharField(max_length=50)
    temperatura_maxima = models.CharField(max_length=50)

    dimensiones = models.CharField(max_length=150)
    peso = models.CharField(max_length=50)
    otros = models.CharField(max_length=150)

    # Informacion extra del equipo
    estado = models.CharField(max_length=10) 
    motivo_baja = models.CharField(max_length=300)
    fecha_baja = models.CharField(max_length=20)

    justificacion_traslado = models.CharField(max_length=300)
    justificacion_baja = models.CharField(max_length=300)

