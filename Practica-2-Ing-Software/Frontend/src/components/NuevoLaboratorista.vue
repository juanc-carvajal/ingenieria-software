<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>🧪</span>
          </div>
          <div class="card-title">
            <h3>{{ isEdit ? 'Editar Laboratorista' : 'Nuevo Laboratorista' }}</h3>
            <p>{{ isEdit ? 'Actualizar información del laboratorista' : 'Registrar un nuevo laboratorista' }}</p>
          </div>
        </div>

        <div class="card-body">
          <form @submit.prevent="guardarEquipo">
            <label>Código Interno</label>
            <input v-model="codigo" type="text" placeholder="Código" required />

            <label>Nombres</label>
            <input v-model="nombreombre" type="text" placeholder="Nombre" required />

            <label>Apellidos</label>
            <input v-model="apellido" type="text" placeholder="apellido" required />

            <label>Titulo o cargo</label>
            <input v-model="titulo" type="text" placeholder="titulo" required />

            <label>Telefono</label>
            <input v-model="telefono" type="text" placeholder="telefono" required />            

            <button type="submit" class="save-btn">{{ isEdit ? 'Actualizar' : 'Guardar' }}</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['id'], // Para recibir el id si es edición
  data() {
    return {
      codigo: '',
      marca: '',
      modelo: '',
      ubicacion: '',
      responsable: '',
      ubicaciones: [],
      responsables: [],
      isEdit: false
    }
  },
  created() {
    // Cargar ubicaciones y responsables
    fetch('http://localhost/pacientes/ubicaciones.php')
      .then(res => res.json())
      .then(data => { this.ubicaciones = data })

    fetch('http://localhost/pacientes/responsables.php')
      .then(res => res.json())
      .then(data => { this.responsables = data })

    // Verificar si es edición
    const equipoId = this.$route.params.id
    if (equipoId) {
      this.isEdit = true
      fetch(`http://localhost/pacientes/equipos_medicos.php?consultar=${equipoId}`)
        .then(res => res.json())
        .then(data => {
          if (Array.isArray(data) && data.length > 0) {
            const equipo = data[0]
            this.codigo = equipo.codigo
            this.marca = equipo.marca
            this.modelo = equipo.modelo
            this.ubicacion = equipo.ubicacion
            this.responsable = equipo.responsable
          }
        })
    }
  },
  methods: {
    guardarEquipo() {
      const datos = {
        codigo: this.codigo,
        marca: this.marca,
        modelo: this.modelo,
        ubicacion: this.ubicacion,
        responsable: this.responsable
      }

      let url = 'http://localhost/pacientes/equipos_medicos.php?insertar=1'
      if (this.isEdit) {
        url = `http://localhost/pacientes/equipos_medicos.php?actualizar=${this.$route.params.id}`
      }

      fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datos)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert(this.isEdit ? 'Equipo actualizado correctamente' : 'Equipo creado correctamente')
            this.$router.push('/equipos')
          } else {
            alert(resp.message || 'Error al guardar equipo')
          }
        })
        .catch(err => {
          console.error('Error al guardar equipo:', err)
          alert('Error al guardar equipo')
        })
    }
  }
}
</script>

<style scoped>
/* === Contenedor general === */
.page-container {
  display: flex;
  justify-content: center;
  align-items: first baseline;
  min-height: 100vh;
  padding: 20px;
  background: none;
}

/* === Layout de tarjeta === */
.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 600px;
  width: 100%;
}

.card {
  background: rgba(255, 255, 255, 0.85);
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.06);
  border: 1px solid rgba(198,163,79,0.25); /* borde suave acorde a paleta */
  transition: transform 0.18s ease, box-shadow 0.18s ease;
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 48px rgba(0,0,0,0.08);
}

/* === Header de la tarjeta === */
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
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
  box-shadow: 0 4px 12px rgba(163,130,47,0.12);
}
.card-title h3 {
  font-size: 18px;
  font-weight: 700;
  margin: 0 0 5px 0;
  color: #2c3e50;
}
.card-title p {
  font-size: 13px;
  color: #7f8c8d;
  margin: 0;
  line-height: 1.3;
}

/* === Labels & campos del formulario === */
.card-body label {
  font-size: 14px;
  font-weight: 700;
  color: #3b341b; /* oscuro suave para texto sobre dorado */
  margin-top: 12px;
  margin-bottom: 6px;
  display: block;
}

.card-body input,
.card-body select,
.card-body textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid rgba(198,163,79,0.25);
  border-radius: 8px;
  font-size: 14px;
  margin-bottom: 10px;
  background: #fffef8;
  color: #2c3e50;
  transition: box-shadow 0.15s ease, border-color 0.15s ease;
  box-sizing: border-box;
}

/* focus accesible y acorde a la paleta */
.card-body input:focus,
.card-body select:focus,
.card-body textarea:focus {
  border-color: #A3822F;
  outline: none;
  box-shadow: 0 0 0 4px rgba(198,163,79,0.12);
}

/* helper text / hint */
.card-body .help-text {
  font-size: 12px;
  color: #8a6d2f;
  margin-top: -6px;
  margin-bottom: 8px;
}

/* === Botones === */
.save-btn {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: #fffef5;
  border: none;
  padding: 10px 16px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 700;
  box-shadow: 0 8px 20px rgba(163,130,47,0.12);
  transition: transform 0.12s ease, box-shadow 0.12s ease;
}
.save-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 28px rgba(163,130,47,0.16);
}
.save-btn:active {
  transform: translateY(0);
}

/* boton secundario / cancelar */
.cancel-btn {
  background: transparent;
  color: #4b3d09;
  border: 1px solid rgba(163,130,47,0.18);
  padding: 10px 14px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 700;
  margin-left: 8px;
}
.cancel-btn:hover {
  background: rgba(198,163,79,0.06);
}

/* agrupador de botones para alineación */
.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  margin-top: 12px;
}

/* === Responsive tweaks === */
@media (max-width: 520px) {
  .card {
    padding: 18px;
    border-radius: 12px;
  }
  .card-icon {
    width: 44px;
    height: 44px;
  }
  .card-body input,
  .card-body select,
  .card-body textarea {
    padding: 10px;
  }
  .save-btn, .cancel-btn {
    padding: 10px 12px;
    font-size: 13px;
  }
}
</style>
