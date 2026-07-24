<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>📍</span>
          </div>
          <div class="card-title">
            <h3>Buscar Ubicaciones</h3>
            <p>Encuentra y gestiona las ubicaciones registradas</p>
          </div>
        </div>

        <div class="card-body">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Ingrese nombre, área o código de la ubicación"
            class="search-input"
          />
          <button @click="refrescarLista" class="refresh-btn" :disabled="loading">
            {{ loading ? 'Cargando...' : 'Refrescar' }}
          </button>
        </div>

        <div v-if="loading" class="loading-state">
          <p>Cargando ubicaciones...</p>
        </div>

        <div v-if="error" class="error-state">
          <p>{{ error }}</p>
          <button @click="refrescarLista" class="retry-btn">Reintentar</button>
        </div>

        <div v-if="!loading && !error" class="card-body ubicaciones-list">
          <div v-if="ubicacionesFiltradas.length === 0" class="no-results">
            <p>
              {{ searchQuery
                ? 'No se encontraron ubicaciones que coincidan con la búsqueda'
                : 'No hay ubicaciones registradas' }}
            </p>
          </div>

          <div v-else>
            <p class="results-count">
              {{ ubicacionesFiltradas.length }} ubicación(es) encontrada(s)
            </p>
            <div
              v-for="ubicacion in ubicacionesFiltradas"
              :key="ubicacion.id"
              class="ubicacion-item"
            >
              <div class="ubicacion-info">
                <p class="ubicacion-nombre">{{ ubicacion.nombre }}</p>
                <p class="ubicacion-detalle">
                  Código: {{ ubicacion.codigo }} – {{ ubicacion.ubicacion }}
                </p>
                <p class="ubicacion-telefono">📞 {{ ubicacion.telefono }}</p>
              </div>
              <div class="acciones">
                <button class="edit-btn" @click.stop="abrirModalEditar(ubicacion)">EDITAR</button>
                <button class="delete-btn" @click.stop="eliminarUbicacion(ubicacion.id)">ELIMINAR</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal de edición -->
    <div v-if="mostrarModal" class="modal-overlay">
      <div class="modal-content">
        <h3>Editar Ubicación</h3>
        <label>Código</label>
        <input v-model="ubicacionEditando.codigo" />
        <label>Nombre</label>
        <input v-model="ubicacionEditando.nombre" />
        <label>Ubicación</label>
        <input v-model="ubicacionEditando.ubicacion" />
        <label>Teléfono</label>
        <input v-model="ubicacionEditando.telefono" />

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
      ubicaciones: [],
      searchQuery: '',
      loading: false,
      error: null,
      mostrarModal: false,
      ubicacionEditando: null
    }
  },
  created() {
    this.consultarUbicaciones()
  },
  computed: {
    ubicacionesFiltradas() {
      if (!this.searchQuery) return this.ubicaciones
      const q = this.searchQuery.toLowerCase()
      return this.ubicaciones.filter(u =>
        u.nombre.toLowerCase().includes(q) ||
        u.codigo.toLowerCase().includes(q) ||
        u.ubicacion.toLowerCase().includes(q) ||
        u.telefono.includes(q)
      )
    }
  },
  methods: {
    consultarUbicaciones() {
      this.loading = true
      this.error = null
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
          console.error(err)
          this.error = 'Error al cargar las ubicaciones'
          this.ubicaciones = []
        })
        .finally(() => {
          this.loading = false
        })
    },
    refrescarLista() {
      this.consultarUbicaciones()
    },
    eliminarUbicacion(id) {
      if (!confirm('¿Seguro que quieres eliminar esta ubicación?')) return
      fetch(`http://localhost/pacientes/ubicaciones.php?borrar=${id}`)
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Ubicación eliminada correctamente')
            this.consultarUbicaciones()
          } else {
            alert(resp.message || 'Error al eliminar ubicación')
          }
        })
        .catch(err => {
          console.error('Error al eliminar:', err)
          alert('Error al eliminar la ubicación')
        })
    },
    abrirModalEditar(ubicacion) {
      this.ubicacionEditando = { ...ubicacion } // copia para editar
      this.mostrarModal = true
    },
    cerrarModal() {
      this.mostrarModal = false
      this.ubicacionEditando = null
    },
    guardarCambios() {
      if (!this.ubicacionEditando) return
      fetch(`http://localhost/pacientes/ubicaciones.php?actualizar=${this.ubicacionEditando.id}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(this.ubicacionEditando)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Ubicación actualizada correctamente')
            this.cerrarModal()
            this.consultarUbicaciones()
          } else {
            alert(resp.message || 'Error al actualizar ubicación')
          }
        })
        .catch(err => {
          console.error('Error al actualizar:', err)
          alert('Error al actualizar la ubicación')
        })
    }
  }
}
</script>

<style scoped>
/* Tus estilos originales aquí */
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
  transition: all 0.3s ease;
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
.card-body {
  margin-bottom: 20px;
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
.refresh-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
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
  margin: 0 0 5px 0;
  font-size: 16px;
}
.ubicacion-detalle {
  font-size: 13px;
  color: #7f8c8d;
  margin: 0 0 5px 0;
}
.ubicacion-telefono {
  font-size: 12px;
  color: #667eea;
  margin: 0;
  font-weight: 500;
}

/* botones */
.edit-btn {
  background: #3498db;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
  margin-right: 6px;
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
  width: 350px;
  max-width: 90%;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}
.modal-content h3 {
  margin-top: 0;
}
.modal-content label {
  font-size: 13px;
  color: #7f8c8d;
  margin-top: 10px;
  display: block;
}
.modal-content input {
  width: 100%;
  padding: 8px;
  margin-top: 4px;
  border: 1px solid #dee2e6;
  border-radius: 6px;
}
.modal-buttons {
  margin-top: 15px;
  display: flex;
  justify-content: flex-end;
  gap: 8px;
}
.save-btn {
  background: #3498db;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.cancel-btn {
  background: #bdc3c7;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
</style>