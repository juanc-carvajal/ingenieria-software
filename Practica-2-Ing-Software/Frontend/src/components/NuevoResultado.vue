<template>
  <div class="form-container">

    <div class="card-header">
      <div class="card-icon ubicaciones-icon">
        <span>📊</span>
      </div>
      <div class="card-title">
        <h3>Nuevo resultado laboratorio</h3>
        <p>Ingresar resultados de laboratorio de un paciente</p>
      </div>
    </div>


    <form @submit.prevent="enviarUbicacion">
      <div class="form-group">
        <label for="codigo">Codigo Ingreso:</label>
        <input type="text" id="codigo" v-model="form.codigo" required />
      </div>

      <div class="form-group">
        <label for="cedula">Cedula del paciente:</label>
        <input type="text" id="cedula" v-model="form.cedula" required />
      </div>

      <div class="form-group">
        <label for="col_total">Resultados Colesterol Total:</label>
        <input type="text" id="col_total" v-model="form.col_total" required />
      </div>

      <div class="form-group">
        <label for="col_rhdl">Resultados Colesterol HDL:</label>
        <input type="text" id="col_rhdl" v-model="form.col_rhdl" required />
      </div>

      <div class="form-group">
        <label for="col_rldl">Resultados Colesterol LDL:</label>
        <input type="text" id="col_rldl" v-model="form.col_rldl" required />
      </div>

      <div class="form-group">
        <label for="trigliceridos">Resultados Trigliceridos:</label>
        <input type="text" id="trigliceridos" v-model="form.trigliceridos" required />
      </div>

      <button type="submit" class="btn btn-primary">Guardar resultado</button>
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
/* === CONTENEDOR DEL FORMULARIO === */
.form-container {
  max-width: 500px;
  margin: 40px auto;
  padding: 25px;
  background: rgba(255, 255, 255, 0.85);
  border-radius: 16px;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(198, 163, 79, 0.25);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.form-container:hover {
  transform: translateY(-3px);
  box-shadow: 0 14px 40px rgba(0, 0, 0, 0.1);
}

/* === TÍTULO === */
h2 {
  text-align: center;
  margin-bottom: 25px;
  color: #4b3d09;
  font-size: 22px;
  font-weight: 700;
  position: relative;
}
h2::after {
  content: "";
  display: block;
  width: 50px;
  height: 3px;
  background: linear-gradient(135deg, #f4e37c, #e89c1e);
  margin: 8px auto 0;
  border-radius: 2px;
}

/* === CAMPOS DEL FORMULARIO === */
.form-group {
  margin-bottom: 15px;
}
label {
  display: block;
  font-weight: 600;
  margin-bottom: 6px;
  color: #4b3d09;
  font-size: 14px;
}
input,
select,
textarea {
  width: 95%;
  padding: 10px 12px;
  border: 1px solid rgba(198, 163, 79, 0.3);
  border-radius: 8px;
  font-size: 14px;
  background: #fffef8;
  color: #2c3e50;
  transition: all 0.2s ease;
}
input:focus,
select:focus,
textarea:focus {
  border-color: #c6a34f;
  outline: none;
  box-shadow: 0 0 0 3px rgba(198, 163, 79, 0.18);
}

/* === BOTÓN DE GUARDAR === */
.btn {
  display: inline-block;
  width: 100%;
  padding: 12px;
  font-size: 15px;
  font-weight: 700;
  background: linear-gradient(135deg, #f4e37c, #e89c1e);
  color: #4b3d09;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 8px 18px rgba(163, 130, 47, 0.12);
}
.btn:hover {
  background: linear-gradient(135deg, #edc939, #c77c0a);
  transform: translateY(-2px);
  box-shadow: 0 10px 24px rgba(163, 130, 47, 0.18);
}
.btn:active {
  transform: translateY(0);
}

/* === ESTADOS === */
.success {
  color: #4b3d09;
  background: rgba(244, 227, 124, 0.25);
  border: 1px solid rgba(198, 163, 79, 0.4);
  padding: 8px;
  border-radius: 6px;
  text-align: center;
  margin-top: 10px;
  font-weight: 600;
}
.error {
  color: #c0392b;
  background: rgba(255, 230, 230, 0.5);
  border: 1px solid rgba(192, 57, 43, 0.3);
  padding: 8px;
  border-radius: 6px;
  text-align: center;
  margin-top: 10px;
}

/* === HEADER OPCIONAL (ICONO + TÍTULO) === */
.card-header {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
}
.card-icon {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  margin-right: 15px;
  background: linear-gradient(135deg, #f4e37c, #e89c1e);
  color: #4b3d09;
  box-shadow: 0 4px 12px rgba(163, 130, 47, 0.15);
}
.card-title h3 {
  font-size: 18px;
  font-weight: 600;
  margin: 0 0 5px 0;
  color: #4b3d09;
}
</style>
