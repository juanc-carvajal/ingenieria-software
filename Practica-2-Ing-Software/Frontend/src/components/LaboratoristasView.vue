<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <span>🧪</span>
          </div>
          <div class="card-title">
            <h3>Laboratoristas</h3>
            <p>Buscar, editar o eliminar personal de laboratorio</p>
          </div>
        </div>

        <div class="card-body">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Buscar por nombre, documento o código"
            class="search-input"
          />
          <button @click="refrescarLista" class="refresh-btn" :disabled="loading">
            {{ loading ? 'Cargando...' : 'Refrescar' }}
          </button>

          <router-link to="/laboratorista/nuevo" class="btn btn-primary">
            <span class="btn-icon">+</span> Nuevo Laboratorista
          </router-link>
        </div>

        <div v-if="loading" class="loading-state">
          <p>Cargando laboratoristas...</p>
        </div>

        <div v-if="error" class="error-state">
          <p>{{ error }}</p>
          <button @click="refrescarLista" class="retry-btn">Reintentar</button>
        </div>

        <div v-if="!loading && !error" class="card-body ubicaciones-list">
          <div v-if="laboratoristasFiltrados.length === 0" class="no-results">
            <p>
              {{ searchQuery
                ? 'No se encontraron laboratoristas que coincidan con la búsqueda'
                : 'No hay laboratoristas registrados' }}
            </p>
          </div>

          <div v-else>
            <p class="results-count">
              {{ laboratoristasFiltrados.length }} laboratorista(s) encontrado(s)
            </p>
            <div
              v-for="lab in laboratoristasFiltrados"
              :key="lab.id"
              class="ubicacion-item"
            >
              <div class="ubicacion-info">
                <p class="ubicacion-nombre">{{ lab.name }} {{ lab.lastname }}</p>
                <p class="ubicacion-detalle">
                  Código: {{ lab.cod_int }} – Título: {{ lab.titulo }}
                </p>
                <p class="ubicacion-telefono">📞 {{ lab.telefono }}</p>
              </div>
              <div class="acciones">
                <button class="edit-btn" @click.stop="abrirModalEditar(lab)">EDITAR</button>
                <button class="delete-btn" @click.stop="eliminarLaboratorista(lab.id)">ELIMINAR</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal de edición -->
    <div v-if="mostrarModal" class="modal-overlay">
      <div class="modal-content">
        <h3>Editar laboratorista</h3>
        <label>Nombre</label>
        <input v-model="laboratoristaEditando.name" />
        <label>Apellido</label>
        <input v-model="laboratoristaEditando.lastname" />
        <label>Código interno</label>
        <input v-model="laboratoristaEditando.cod_int" />
        <label>Título</label>
        <input v-model="laboratoristaEditando.titulo" />
        <label>Teléfono</label>
        <input v-model="laboratoristaEditando.telefono" />

        <div class="modal-buttons">
          <button @click="guardarCambios" class="save-btn">Guardar Cambios</button>
          <button @click="cerrarModal" class="cancel-btn">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      laboratoristas: [],
      searchQuery: '',
      loading: false,
      error: null,
      mostrarModal: false,
      laboratoristaEditando: null
    }
  },
  created() {
    this.consultarLaboratoristas()
  },
  computed: {
    laboratoristasFiltrados() {
      if (!this.searchQuery) return this.laboratoristas
      const q = this.searchQuery.toLowerCase()
      return this.laboratoristas.filter(l =>
        l.name.toLowerCase().includes(q) ||
        l.lastname.toLowerCase().includes(q) ||
        l.cod_int.toLowerCase().includes(q) ||
        l.titulo.toLowerCase().includes(q)
      )
    }
  },
  methods: {
    async consultarLaboratoristas() {
      this.loading = true
      this.error = null
      try {
        const response = await axios.get('http://127.0.0.1:8000/api/laboratoristas/')
        this.laboratoristas = response.data.laboratorists || []
      } catch (err) {
        console.error(err)
        this.error = 'Error al cargar los laboratoristas'
      } finally {
        this.loading = false
      }
    },

    refrescarLista() {
      this.consultarLaboratoristas()
    },

    async eliminarLaboratorista(id) {
      if (!confirm('¿Seguro que quieres eliminar este laboratorista?')) return
      try {
        await axios.delete(`http://127.0.0.1:8000/api/laboratoristas/${id}`)
        alert('Laboratorista eliminado correctamente')
        this.consultarLaboratoristas()
      } catch (err) {
        console.error(err)
        alert('Error al eliminar el laboratorista')
      }
    },

    abrirModalEditar(lab) {
      this.laboratoristaEditando = { ...lab }
      this.mostrarModal = true
    },

    cerrarModal() {
      this.mostrarModal = false
      this.laboratoristaEditando = null
    },

    async guardarCambios() {
      if (!this.laboratoristaEditando) return
      try {
        await axios.put(
          `http://127.0.0.1:8000/api/laboratoristas/${this.laboratoristaEditando.id}`,
          { body: JSON.stringify(this.laboratoristaEditando) }
        )
        alert('Laboratorista actualizado correctamente')
        this.cerrarModal()
        this.consultarLaboratoristas()
      } catch (err) {
        console.error(err)
        alert('Error al actualizar el laboratorista')
      }
    }
  }
}
</script>

<style scoped>
/* Mismos estilos que en PersonalView.vue/UbicacionesView.vue (paleta dorada unificada) */
.page-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  height: 100vh;        /* fuerza altura exacta, no más */
  overflow: hidden;     /* evita scroll global */
  padding: 0;           /* quita padding que hacía desbordar el alto */
  background: none;
}

.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 600px;
  width: 100%;
}

.card {
  background: rgba(255, 255, 255, 0.7);
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
  border: 1px solid #e9d8a6; /* borde suave dorado */
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

/* Icono con degradado dorado */
.ubicaciones-icon {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: #fff;
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

/* Input buscador */
.search-input {
  width: 95%;
  padding: 12px;
  border: 1px solid #C6A34F;
  border-radius: 8px;
  font-size: 14px;
  transition: all 0.2s ease;
  margin-bottom: 10px;
  background: #fffdf6;
}
.search-input:focus {
  border-color: #A3822F;
  outline: none;
  box-shadow: 0 0 0 2px rgba(198, 163, 79, 0.2);
}

/* Botones refrescar / reintentar */
.refresh-btn,
.retry-btn {
  padding: 8px 16px;
  border: 1px solid #C6A34F;
  border-radius: 6px;
  background: white;
  color: #A3822F;
  cursor: pointer;
  font-size: 13px;
  transition: all 0.2s ease;
}
.refresh-btn:hover,
.retry-btn:hover {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: #fff;
}

/* Estados */
.loading-state,
.error-state {
  text-align: center;
  padding: 20px;
  color: #7f8c8d;
}
.error-state {
  color: #e74c3c;
}

/* === Lista (misma clase) === */
.ubicaciones-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  max-height: 60vh;
  overflow-y: auto;
  padding-right: 8px;
  scrollbar-gutter: stable;
  scroll-behavior: smooth;
}

/* Scrollbar dorado */
.ubicaciones-list::-webkit-scrollbar {
  width: 8px;
}
.ubicaciones-list::-webkit-scrollbar-thumb {
  background: #C6A34F;
  border-radius: 6px;
  border: 2px solid rgba(255,255,255,0.15);
}
.ubicaciones-list::-webkit-scrollbar-thumb:hover {
  background: #A3822F;
}

/* Results count accent */
.results-count {
  font-size: 12px;
  color: #A3822F;
  margin-bottom: 15px;
  font-weight: 500;
}

.no-results {
  text-align: center;
  padding: 30px;
  color: #7f8c8d;
}

/* Item */
.ubicacion-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fffdf6;
  border-radius: 10px;
  padding: 15px;
  transition: all 0.3s ease;
  border-left: 4px solid #C6A34F;
}
.ubicacion-item:hover {
  background: #fff8e6;
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
  color: #A3822F;
  margin: 0;
  font-weight: 500;
}

/* Botones de acción */
.edit-btn {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: #fff;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
  margin-right: 6px;
}
.edit-btn:hover {
  background: linear-gradient(135deg, #d8b45f, #a8883a);
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
  background: #fffef5;
  padding: 20px;
  border-radius: 12px;
  width: 350px;
  max-width: 90%;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
}
.modal-content h3 {
  margin-top: 0;
  color: #4b3d09;
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
  border: 1px solid #C6A34F;
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
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.save-btn:hover {
  background: linear-gradient(135deg, #d8b45f, #a8883a);
}

/* Botón principal */
.btn {
  flex: 1;
  padding: 10px 14px;
  margin: 10px 50px;
  border: none;
  border-radius: 10px;
  font-weight: 600;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items:center;
  justify-content: center;
  gap: 6px;
  text-decoration: none;
}
.btn-primary {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
}
</style>
