<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>👥</span>
          </div>
          <div class="card-title">
            <h3>Responsables</h3>
            <p>Buscar, editar o eliminar responsables</p>
          </div>
        </div>

        <div class="card-body">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Ingrese nombre, documento, cargo o código"
            class="search-input"
          />
          <button @click="refrescarLista" class="refresh-btn" :disabled="loading">
            {{ loading ? 'Cargando...' : 'Refrescar' }}
          </button>
        </div>

        <div v-if="loading" class="loading-state">
          <p>Cargando responsables...</p>
        </div>

        <div v-if="error" class="error-state">
          <p>{{ error }}</p>
          <button @click="refrescarLista" class="retry-btn">Reintentar</button>
        </div>

        <div v-if="!loading && !error" class="card-body ubicaciones-list">
          <div v-if="responsablesFiltrados.length === 0" class="no-results">
            <p>
              {{ searchQuery
                ? 'No se encontraron responsables que coincidan con la búsqueda'
                : 'No hay responsables registrados' }}
            </p>
          </div>

          <div v-else>
            <p class="results-count">
              {{ responsablesFiltrados.length }} responsable(s) encontrado(s)
            </p>
            <div
              v-for="responsable in responsablesFiltrados"
              :key="responsable.id"
              class="ubicacion-item"
            >
              <div class="ubicacion-info">
                <p class="ubicacion-nombre">{{ responsable.nombre }} {{ responsable.apellido }}</p>
                <p class="ubicacion-detalle">
                  Código: {{ responsable.codigo }} – Documento: {{ responsable.documento }}
                </p>
                <p class="ubicacion-detalle">Cargo: {{ responsable.cargo }}</p>
                <p class="ubicacion-telefono">📞 {{ responsable.telefono }}</p>
              </div>
              <div class="acciones">
                <button class="edit-btn" @click.stop="abrirModalEditar(responsable)">EDITAR</button>
                <button class="delete-btn" @click.stop="eliminarResponsable(responsable.id)">ELIMINAR</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal de edición -->
    <div v-if="mostrarModal" class="modal-overlay">
      <div class="modal-content">
        <h3>Editar Responsable</h3>
        <label>Código</label>
        <input v-model="responsableEditando.codigo" />
        <label>Documento</label>
        <input v-model="responsableEditando.documento" />
        <label>Nombre</label>
        <input v-model="responsableEditando.nombre" />
        <label>Apellido</label>
        <input v-model="responsableEditando.apellido" />
        <label>Cargo</label>
        <input v-model="responsableEditando.cargo" />
        <label>Teléfono</label>
        <input v-model="responsableEditando.telefono" />

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
      responsables: [],
      searchQuery: '',
      loading: false,
      error: null,
      mostrarModal: false,
      responsableEditando: null
    }
  },
  created() {
    this.consultarResponsables()
  },
  computed: {
    responsablesFiltrados() {
      if (!this.searchQuery) return this.responsables
      const q = this.searchQuery.toLowerCase()
      return this.responsables.filter(r =>
        r.nombre.toLowerCase().includes(q) ||
        r.apellido.toLowerCase().includes(q) ||
        r.codigo.toLowerCase().includes(q) ||
        r.documento.toLowerCase().includes(q) ||
        r.cargo.toLowerCase().includes(q) ||
        r.telefono.includes(q)
      )
    }
  },
  methods: {
    consultarResponsables() {
      this.loading = true
      this.error = null
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
          console.error(err)
          this.error = 'Error al cargar los responsables'
          this.responsables = []
        })
        .finally(() => {
          this.loading = false
        })
    },
    refrescarLista() {
      this.consultarResponsables()
    },
    eliminarResponsable(id) {
      if (!confirm('¿Seguro que quieres eliminar este responsable?')) return
      fetch(`http://localhost/pacientes/responsables.php?borrar=${id}`)
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Responsable eliminado correctamente')
            this.consultarResponsables()
          } else {
            alert(resp.message || 'Error al eliminar responsable')
          }
        })
        .catch(err => {
          console.error('Error al eliminar:', err)
          alert('Error al eliminar el responsable')
        })
    },
    abrirModalEditar(responsable) {
      this.responsableEditando = { ...responsable }
      this.mostrarModal = true
    },
    cerrarModal() {
      this.mostrarModal = false
      this.responsableEditando = null
    },
    guardarCambios() {
      if (!this.responsableEditando) return
      fetch(`http://localhost/pacientes/responsables.php?actualizar=${this.responsableEditando.id}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(this.responsableEditando)
      })
        .then(r => r.json())
        .then(resp => {
          if (resp.success === 1) {
            alert('Responsable actualizado correctamente')
            this.cerrarModal()
            this.consultarResponsables()
          } else {
            alert(resp.message || 'Error al actualizar responsable')
          }
        })
        .catch(err => {
          console.error('Error al actualizar:', err)
          alert('Error al actualizar el responsable')
        })
    }
  }
}
</script>

<style scoped>
/* Mismos estilos que en PersonalView.vue/UbicacionesView.vue */
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
.cancel-btn {
  background: #95a5a6;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.cancel-btn:hover {
  background: #7f8c8d;
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
.save-btn:hover {
  background: #2980b9;
}
</style>