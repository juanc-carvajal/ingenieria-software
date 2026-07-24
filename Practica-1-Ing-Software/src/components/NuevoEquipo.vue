<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>🩺</span>
          </div>
          <div class="card-title">
            <h3>{{ isEdit ? 'Editar Equipo Médico' : 'Nuevo Equipo Médico' }}</h3>
            <p>{{ isEdit ? 'Actualizar información del equipo médico' : 'Registrar un nuevo equipo médico' }}</p>
          </div>
        </div>

        <div class="card-body">
          <form @submit.prevent="guardarEquipo">
            <label>Código</label>
            <input v-model="codigo" type="text" placeholder="Código del equipo" required />

            <label>Marca</label>
            <input v-model="marca" type="text" placeholder="Marca" required />

            <label>Modelo</label>
            <input v-model="modelo" type="text" placeholder="Modelo" required />

            <label>Ubicación</label>
            <select v-model="ubicacion" required>
              <option disabled value="">Seleccione una ubicación</option>
              <option v-for="u in ubicaciones" :key="u.id" :value="u.id">
                {{ u.nombre }}
              </option>
            </select>

            <label>Responsable</label>
            <select v-model="responsable" required>
              <option disabled value="">Seleccione un responsable</option>
              <option v-for="r in responsables" :key="r.id" :value="r.id">
                {{ r.nombre }} {{ r.apellido }}
              </option>
            </select>

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
/* Mismos estilos que NuevoPersonal.vue */
.page-container {
  display: flex;
  justify-content: center;
  align-items: first baseline;
  min-height: 100vh;
  background: #f5f7fa;
  padding: 20px;
}

.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 600px;
  width: 100%;
}

.card {
  background: white;
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  border: 1px solid #e8ecf0;
}

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
}
.ubicaciones-icon {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
}
.card-title h3 {
  font-size: 18px;
  font-weight: 600;
  margin: 0 0 5px 0;
  color: #2c3e50;
}
.card-title p {
  font-size: 14px;
  color: #7f8c8d;
  margin: 0;
  line-height: 1.4;
}
.card-body label {
  font-size: 13px;
  color: #7f8c8d;
  margin-top: 10px;
  display: block;
}
.card-body input, .card-body select {
  width: 100%;
  padding: 12px;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  font-size: 14px;
  margin-bottom: 10px;
}
.save-btn {
  background: #3498db;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
}
.save-btn:hover {
  background: #2980b9;
}
</style>