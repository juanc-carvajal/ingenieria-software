<template>
  <div class="form-container">
    <h2>Nueva Ubicación</h2>
    <form @submit.prevent="enviarUbicacion">
      <div class="form-group">
        <label for="codigo">Código:</label>
        <input type="text" id="codigo" v-model="form.codigo" required />
      </div>

      <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" v-model="form.nombre" required />
      </div>

      <div class="form-group">
        <label for="ubicacion">Ubicación:</label>
        <input type="text" id="ubicacion" v-model="form.ubicacion" required />
      </div>

      <div class="form-group">
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" v-model="form.telefono" required />
      </div>

      <button type="submit" class="btn btn-primary">Guardar Ubicación</button>
    </form>

    <p v-if="mensaje" :class="{ 'success': exito, 'error': !exito }">
      {{ mensaje }}
    </p>
  </div>
</template>

<script>
export default {
  name: 'NuevaUbicacion',
  data() {
    return {
      form: {
        codigo: '',
        nombre: '',
        ubicacion: '',
        telefono: ''
      },
      mensaje: '',
      exito: false
    }
  },
  methods: {
    async enviarUbicacion() {
      try {
        const respuesta = await fetch('http://localhost/pacientes/ubicaciones.php?insertar=1', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.form)
        });

        const datos = await respuesta.json();
        this.mensaje = datos.message || 'Sin mensaje';
        this.exito = datos.success === 1;

        if (this.exito) {
          // limpiar formulario
          this.form = { codigo: '', nombre: '', ubicacion: '', telefono: '' };
          // opcional: redirigir al listado de ubicaciones
          // this.$router.push('/ubicacion');
        }
      } catch (error) {
        console.error(error);
        this.mensaje = 'Error al conectar con el servidor';
        this.exito = false;
      }
    }
  }
}
</script>

<style scoped>
.form-container {
  max-width: 500px;
  margin: 0 auto;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #2c3e50;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
  color: #34495e;
}

input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
}

.btn {
  display: inline-block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  background-color: #667eea;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.btn:hover {
  background-color: #556cd6;
}

.success {
  color: green;
  text-align: center;
  margin-top: 10px;
}

.error {
  color: red;
  text-align: center;
  margin-top: 10px;
}
</style>