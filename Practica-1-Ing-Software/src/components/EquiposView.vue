<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>🩺</span>
          </div>
          <div class="card-title">
            <h3>Equipos Médicos</h3>
            <p>Buscar, editar o eliminar equipos médicos</p>
          </div>
        </div>

        <div class="card-body">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Ingrese código, nombre, marca, modelo, serial, ubicación o responsable"
            class="search-input"
          />
          <button @click="refrescarLista" class="refresh-btn" :disabled="loading">
            {{ loading ? 'Cargando...' : 'Refrescar' }}
          </button>
        </div>

        <div v-if="loading" class="loading-state">
          <p>Cargando equipos...</p>
        </div>

        <div v-if="error" class="error-state">
          <p>{{ error }}</p>
          <button @click="refrescarLista" class="retry-btn">Reintentar</button>
        </div>

        <div v-if="!loading && !error" class="card-body ubicaciones-list">
          <div v-if="equiposFiltrados.length === 0" class="no-results">
            <p>
              {{ searchQuery
                ? 'No se encontraron equipos que coincidan con la búsqueda'
                : 'No hay equipos registrados' }}
            </p>
          </div>

          <div v-else>
            <p class="results-count">
              {{ equiposFiltrados.length }} equipo(s) encontrado(s)
            </p>
            <div
              v-for="equipo in equiposFiltrados"
              :key="equipo.id"
              class="ubicacion-item"
            >
              <div class="ubicacion-info">
                <p class="ubicacion-nombre">{{ equipo.nombre }}</p>
                <p class="ubicacion-detalle"><strong>Marca:</strong> {{ equipo.marca }} | <strong>Modelo:</strong> {{ equipo.modelo }}</p>
                <p class="ubicacion-detalle"><strong>Código:</strong> {{ equipo.codigo }} | <strong>Serial:</strong> {{ equipo.serial }}</p>
                <p class="ubicacion-detalle"><strong>Ubicación:</strong> {{ equipo.ubicacion_nombre }}</p>
                <p class="ubicacion-detalle"><strong>Responsable:</strong> {{ equipo.responsable_nombre }}</p>
              </div>
              <div class="acciones">
                <button class="edit-btn" @click.stop="abrirModalEditar(equipo)">EDITAR</button>
                <button class="delete-btn" @click.stop="eliminarEquipo(equipo.id)">ELIMINAR</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal de edición -->
    <div v-if="mostrarModal" class="modal-overlay">
      <div class="modal-content">
        <h3>Editar Equipo Médico</h3>
        
        <label>Código</label>
        <input v-model="equipoEditando.codigo" placeholder="Ej: EQ-001" />
        
        <label>Nombre del Equipo</label>
        <input v-model="equipoEditando.nombre" placeholder="Ej: Monitor de Signos Vitales" />
        
        <label>Marca</label>
        <input v-model="equipoEditando.marca" placeholder="Ej: Philips" />
        
        <label>Modelo</label>
        <input v-model="equipoEditando.modelo" placeholder="Ej: IntelliVue MX40" />
        
        <label>Serial</label>
        <input v-model="equipoEditando.serial" placeholder="Ej: SN123456789" />
        
        <label>Ubicación</label>
        <select v-model="equipoEditando.ubicacion" required>
          <option disabled value="">Seleccione una ubicación</option>
          <option 
            v-for="ubicacion in ubicaciones" 
            :key="ubicacion.id" 
            :value="ubicacion.id"
          >
            {{ ubicacion.nombre }}
          </option>
        </select>
        
        <label>Responsable</label>
        <select v-model="equipoEditando.responsable" required>
          <option disabled value="">Seleccione un responsable</option>
          <option 
            v-for="responsable in responsables" 
            :key="responsable.id" 
            :value="responsable.id"
          >
            {{ responsable.nombre }} {{ responsable.apellido }}
          </option>
        </select>

        <div class="modal-buttons">
          <button @click="guardarCambios" class="save-btn">Guardar Cambios</button>
          <button @click="cerrarModal" class="cancel-btn">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      equipos: [],
      searchQuery: '',
      loading: false,
      error: null,
      mostrarModal: false,
      equipoEditando: null,
      ubicaciones: [],
      responsables: []
    }
  },
  created() {
    this.consultarEquipos()
    this.consultarUbicaciones()
    this.consultarResponsables()
  },
  computed: {
    equiposFiltrados() {
      if (!this.searchQuery) return this.equipos
      const q = this.searchQuery.toLowerCase()
      return this.equipos.filter(e =>
        e.codigo.toLowerCase().includes(q) ||
        (e.nombre && e.nombre.toLowerCase().includes(q)) ||
        e.marca.toLowerCase().includes(q) ||
        e.modelo.toLowerCase().includes(q) ||
        (e.serial && e.serial.toLowerCase().includes(q)) ||
        (e.ubicacion_nombre && e.ubicacion_nombre.toLowerCase().includes(q)) ||
        (e.responsable_nombre && e.responsable_nombre.toLowerCase().includes(q))
      )
    }
  },
  methods: {
    consultarEquipos() {
      this.loading = true
      this.error = null
      fetch('http://localhost/pacientes/equipos_medicos.php')
        .then(r => {
          if (!r.ok) throw new Error('Error en la respuesta del servidor')
          return r.json()
        })
        .then(datos => {
          if (Array.isArray(datos)) this.equipos = datos
          else this.equipos = []
        })
        .catch(err => {
          console.error(err)
          this.error = 'Error al cargar los equipos'
          this.equipos = []
        })
        .finally(() => {
          this.loading = false
        })
    },
    consultarUbicaciones() {
      fetch('http://localhost/pacientes/ubicaciones.php')
        .then(r => {
          if (!r.ok) throw new Error('Error en la respuesta del servidor')
          return r.json()
        })
        .then(datos => {
          if (Array.isArray(datos)) this.ubicaciones = datos
          else this.ubicaciones = []
        })
        .catch(err => {
          console.error('Error al cargar ubicaciones:', err)
          this.ubicaciones = []
        })
    },
    consultarResponsables() {
      fetch('http://localhost/pacientes/responsables.php')
        .then(r => {
          if (!r.ok) throw new Error('Error en la respuesta del servidor')
          return r.json()
        })
        .then(datos => {
          if (Array.isArray(datos)) this.responsables = datos
          else this.responsables = []
        })
        .catch(err => {
          console.error('Error al cargar responsables:', err)
          this.responsables = []
        })
    },
    refrescarLista() {
      this.consultarEquipos()
    },
    eliminarEquipo(id) {
      if (!confirm('¿Seguro que quieres eliminar este equipo?')) return
      fetch(`http://localhost/pacientes/equipos_medicos.php?borrar=${id}`)
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Equipo eliminado correctamente')
            this.consultarEquipos()
          } else {
            alert(resp.message || 'Error al eliminar equipo')
          }
        })
        .catch(err => {
          console.error('Error al eliminar:', err)
          alert('Error al eliminar el equipo')
        })
    },
    abrirModalEditar(equipo) {
      this.equipoEditando = { 
        ...equipo,
        ubicacion: equipo.ubicacion || '',
        responsable: equipo.responsable || ''
      }
      this.mostrarModal = true
    },
    cerrarModal() {
      this.mostrarModal = false
      this.equipoEditando = null
    },
    guardarCambios() {
      if (!this.equipoEditando) return
      
      const datos = {
        codigo: this.equipoEditando.codigo,
        nombre: this.equipoEditando.nombre,
        marca: this.equipoEditando.marca,
        modelo: this.equipoEditando.modelo,
        serial: this.equipoEditando.serial,
        ubicacion: this.equipoEditando.ubicacion,
        responsable: this.equipoEditando.responsable
      }
      
      fetch(`http://localhost/pacientes/equipos_medicos.php?actualizar=${this.equipoEditando.id}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datos)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Equipo actualizado correctamente')
            this.cerrarModal()
            this.consultarEquipos()
          } else {
            alert(resp.message || 'Error al actualizar equipo')
          }
        })
        .catch(err => {
          console.error('Error al actualizar:', err)
          alert('Error al actualizar el equipo')
        })
    }
  }
}
</script>

<style scoped>
/* Copiar estilos de PersonalView.vue */
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
.search-input {
  width: 100%;
  padding: 12px;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  font-size: 14px;
  transition: all 0.2s ease;
  margin-bottom: 10px;
}
.search-input:focus {
  border-color: #667eea;
  outline: none;
  box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.3);
}
.refresh-btn,
.retry-btn {
  padding: 8px 16px;
  border: 1px solid #667eea;
  border-radius: 6px;
  background: white;
  color: #667eea;
  cursor: pointer;
  font-size: 13px;
  transition: all 0.2s ease;
}
.refresh-btn:hover,
.retry-btn:hover {
  background: #667eea;
  color: white;
}
.loading-state,
.error-state {
  text-align: center;
  padding: 20px;
  color: #7f8c8d;
}
.error-state {
  color: #e74c3c;
}
.ubicaciones-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.results-count {
  font-size: 12px;
  color: #667eea;
  margin-bottom: 15px;
  font-weight: 500;
}
.no-results {
  text-align: center;
  padding: 30px;
  color: #7f8c8d;
}
.ubicacion-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #f8f9fa;
  border-radius: 10px;
  padding: 15px;
  transition: all 0.3s ease;
  border-left: 4px solid #667eea;
}
.ubicacion-item:hover {
  background: #e9ecef;
  transform: translateX(5px);
}
.ubicacion-info {
  flex: 1;
}
.ubicacion-nombre {
  font-weight: 600;
  color: #2c3e50;
  margin: 0 0 8px 0;
  font-size: 16px;
}
.ubicacion-detalle {
  font-size: 13px;
  color: #7f8c8d;
  margin: 0 0 5px 0;
}
.ubicacion-detalle strong {
  color: #667eea;
}
.acciones {
  display: flex;
  gap: 6px;
}
.edit-btn {
  background: #3498db;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.edit-btn:hover {
  background: #2980b9;
}
.delete-btn {
  background: #e74c3c;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.delete-btn:hover {
  background: #c0392b;
}

/* Modal */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
}
.modal-content {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
  width: 400px;
  max-width: 90%;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  max-height: 90vh;
  overflow-y: auto;
}
.modal-content h3 {
  margin-top: 0;
  color: #2c3e50;
}
.modal-content label {
  font-size: 13px;
  color: #7f8c8d;
  margin-top: 10px;
  display: block;
  font-weight: 500;
}
.modal-content input,
.modal-content select {
  width: 100%;
  padding: 8px;
  margin-top: 4px;
  border: 1px solid #dee2e6;
  border-radius: 6px;
  font-size: 14px;
  box-sizing: border-box;
}
.modal-content input:focus,
.modal-content select:focus {
  border-color: #667eea;
  outline: none;
  box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
}
.modal-buttons {
  margin-top: 15px;
  display: flex;
  justify-content: flex-end;
  gap: 8px;
}
.cancel-btn {
  background: #95a5a6;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
}
.cancel-btn:hover {
  background: #7f8c8d;
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