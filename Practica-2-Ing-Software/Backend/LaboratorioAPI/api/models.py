from django.db import models

# Create your models here.
class Patient(models.Model):
    name = models.CharField(max_length=100)
    lastname = models.CharField(max_length=100)
    documento  = models.PositiveIntegerField()
    cod_ing = models.CharField(max_length=100)
    direccion = models.CharField(max_length=100)
    telefono = models.CharField(max_length=100)
    
class Laboratorist(models.Model):
    name = models.CharField(max_length=100)
    lastname = models.CharField(max_length=100)
    cod_int = models.CharField(max_length=100)
    titulo = models.CharField(max_length=100)
    telefono = models.CharField(max_length=100)
    
class LabResults(models.Model):
    cedula = models.CharField(max_length=100)
    cod_ing_r = models.CharField(max_length=100)
    col_tot = models.CharField(max_length=100)
    col_hdl = models.CharField(max_length=100)
    col_ldl  = models.CharField(max_length=100)
    trig = models.CharField(max_length=100)
    