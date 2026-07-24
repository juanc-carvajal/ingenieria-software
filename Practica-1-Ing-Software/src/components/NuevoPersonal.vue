<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>👤</span>
          </div>
          <div class="card-title">
            <h3>Nuevo Responsable</h3>
            <p>Registrar un nuevo responsable en el sistema</p>
          </div>
        </div>

        <div class="card-body">
          <form @submit.prevent="crearResponsable">
            <label>Código</label>
            <input v-model="codigo" type="text" placeholder="Código" required />

            <label>Documento</label>
            <input v-model="documento" type="text" placeholder="Documento" required />

            <label>Nombre</label>
            <input v-model="nombre" type="text" placeholder="Nombre" required />

            <label>Apellido</label>
            <input v-model="apellido" type="text" placeholder="Apellido" required />

            <label>Cargo</label>
            <input v-model="cargo" type="text" placeholder="Cargo" required />

            <label>Teléfono</label>
            <input v-model="telefono" type="text" placeholder="Teléfono" required />

            <button type="submit" class="save-btn">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      codigo: '',
      documento: '',
      nombre: '',
      apellido: '',
      cargo: '',
      telefono: ''
    }
  },
  methods: {
    crearResponsable() {
      const datos = {
        codigo: this.codigo,
        documento: this.documento,
        nombre: this.nombre,
        apellido: this.apellido,
        cargo: this.cargo,
        telefono: this.telefono
      }

      fetch('http://localhost/pacientes/responsables.php?insertar=1', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datos)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Responsable creado correctamente')
            this.codigo = ''
            this.documento = ''
            this.nombre = ''
            this.apellido = ''
            this.cargo = ''
            this.telefono = ''
          } else {
            alert(resp.message || 'Error al crear responsable')
          }
        })
        .catch(err => {
          console.error('Error al crear responsable:', err)
          alert('Error al crear responsable')
        })
    }
  }
}
</script>

<style scoped>
/* Igual estilo de NuevoUbicacion.vue */
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
.card-body input {
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