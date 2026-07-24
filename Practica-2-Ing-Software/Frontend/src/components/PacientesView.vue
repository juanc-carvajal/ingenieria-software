<template>
  <div class="page-container">
    <div class="dashboard-cards">
      <div class="card pacientes-card">
        <div class="card-header">
          <div class="card-icon pacientes-icon">
            <span>😷</span>
          </div>
          <div class="card-title">
            <h3>Buscar paciente</h3>
            <p>Encuentra y gestiona los pacientes registrados</p>
          </div>
        </div>

        <div class="card-body">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Ingrese documento del paciente"
            class="search-input"
          />
          <button @click="refrescarLista" class="refresh-btn" :disabled="loading">
            {{ loading ? "Cargando..." : "Refrescar" }}
          </button>

          <router-link to="/paciente/nuevo" class="btn btn-primary">
            <span class="btn-icon">+</span> Nuevo Paciente
          </router-link>
        </div>

        <div v-if="loading" class="loading-state">
          <p>Cargando pacientes...</p>
        </div>

        <div v-if="error" class="error-state">
          <p>{{ error }}</p>
          <button @click="refrescarLista" class="retry-btn">Reintentar</button>
        </div>

        <div v-if="!loading && !error" class="card-body pacientes-list">
          <div v-if="pacientesFiltrados.length === 0" class="no-results">
            <p>
              {{
                searchQuery
                  ? "No se encontraron pacientes que coincidan con la búsqueda"
                  : "No hay pacientes registrados"
              }}
            </p>
          </div>

          <div
              v-if="pacienteSeleccionado && resultados[pacienteSeleccionado]"
              class="resultados-container"
            >
              <h4>Resultados de laboratorio</h4>
              
              <ul>
                <li
                  v-for="(r, index) in resultados[pacienteSeleccionado]"
                  :key="index"
                  class="resultado-item"
                >
                  <strong>Código ingreso:</strong> {{ r.cod_ing_r }}<br />
                  <strong>Total:</strong> {{ r.col_tot }} |
                  <strong>HDL:</strong> {{ r.col_hdl }} |
                  <strong>LDL:</strong> {{ r.col_ldl }} |
                  <strong>Triglicéridos:</strong> {{ r.trig }}
                </li>
              </ul>
              <p v-if="resultados[pacienteSeleccionado].length === 0">
                No hay resultados registrados.
              </p>

              <!-- ✅ Botón debajo -->
              <div style="text-align: center; margin-top: 15px;">
                <button class="results-btn" @click="pacienteSeleccionado = null">
                  OCULTAR RESULTADOS
                </button>
              </div>
            </div>

          <div v-else>
            <p class="results-count">
              {{ pacientesFiltrados.length }} paciente(s) encontrado(s)
            </p>

            <div
              v-for="paciente in pacientesFiltrados"
              :key="paciente.id"
              class="paciente-item"
            >
              <div class="paciente-info">
                <p class="paciente-nombre">
                  {{ paciente.name }} {{ paciente.lastname }}
                </p>
                <p class="paciente-detalle">
                  Cédula: {{ paciente.documento }}
                </p>
                <p class="paciente-detalle">
                  Dirección: {{ paciente.direccion }}
                </p>
                <p class="paciente-telefono">📞 {{ paciente.telefono }}</p>
              </div>

              <div class="acciones">
                <button class="edit-btn" @click.stop="abrirModalEditar(paciente)">
                  EDITAR
                </button>
                <button class="delete-btn" @click.stop="eliminarPaciente(paciente.id)">
                  ELIMINAR
                </button>
                <button class="results-btn" @click="toggleResultados(paciente)">
                  {{ pacienteSeleccionado === paciente.id ? "OCULTAR" : "VER RESULTADOS" }}
                </button>
              </div>
            </div>

            <!-- 🔽 Ventana de resultados del paciente -->
            
          </div>
        </div>
      </div>
    </div>

    <!-- 🟩 Modal de edición -->
    <div v-if="mostrarModal" class="modal-overlay">
      <div class="modal-content">
        <h3>Editar Paciente</h3>
        <label>Nombre</label>
        <input v-model="pacienteEditando.name" />
        <label>Apellido</label>
        <input v-model="pacienteEditando.lastname" />
        <label>Documento</label>
        <input v-model="pacienteEditando.documento" />
        <label>Código de Ingreso</label>
        <input v-model="pacienteEditando.cod_ing" />
        <label>Dirección</label>
        <input v-model="pacienteEditando.direccion" />
        <label>Teléfono</label>
        <input v-model="pacienteEditando.telefono" />

        <div class="modal-buttons">
          <button @click="guardarCambios" class="save-btn">Guardar Cambios</button>
          <button @click="cerrarModal" class="cancel-btn">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      pacientes: [],
      resultados: {},
      pacienteSeleccionado: null,
      searchQuery: "",
      loading: false,
      error: null,
      mostrarModal: false,
      pacienteEditando: null,
      apiUrl: "http://localhost:8000/api/pacientes/",
      resultadosUrl: "http://localhost:8000/api/resultados/",
    };
  },
  created() {
    this.consultarPacientes();
  },
  computed: {
    pacientesFiltrados() {
      if (!this.searchQuery) return this.pacientes;
      const q = this.searchQuery.toLowerCase();
      return this.pacientes.filter(
        (p) =>
          p.name.toLowerCase().includes(q) ||
          p.lastname.toLowerCase().includes(q) ||
          p.documento.toString().includes(q) ||
          p.cod_ing.toLowerCase().includes(q) ||
          p.telefono.includes(q)
      );
    },
  },
  methods: {
    async consultarPacientes() {
      this.loading = true;
      this.error = null;
      try {
        const response = await axios.get(this.apiUrl);
        this.pacientes = Array.isArray(response.data) ? response.data : [];
      } catch (err) {
        this.error = "No se pudo cargar la lista de pacientes.";
      } finally {
        this.loading = false;
      }
    },
    refrescarLista() {
      this.consultarPacientes();
    },
    async eliminarPaciente(id) {
      if (!confirm("¿Seguro que quieres eliminar este paciente?")) return;
      try {
        await axios.delete(`${this.apiUrl}${id}/`);
        alert("Paciente eliminado correctamente");
        this.consultarPacientes();
      } catch {
        alert("Error al eliminar el paciente");
      }
    },
    abrirModalEditar(paciente) {
      this.pacienteEditando = { ...paciente };
      this.mostrarModal = true;
    },
    cerrarModal() {
      this.mostrarModal = false;
      this.pacienteEditando = null;
    },
    async guardarCambios() {
      try {
        await axios.put(
          `${this.apiUrl}${this.pacienteEditando.id}/`,
          this.pacienteEditando
        );
        alert("Paciente actualizado correctamente");
        this.cerrarModal();
        this.consultarPacientes();
      } catch {
        alert("Error al actualizar el paciente");
      }
    },
    async toggleResultados(paciente) {
      if (this.pacienteSeleccionado === paciente.id) {
        this.pacienteSeleccionado = null;
      } else {
        this.pacienteSeleccionado = paciente.id;
        if (!this.resultados[paciente.id]) {
          try {
            const res = await axios.get(`${this.resultadosUrl}?cedula=${paciente.documento}`);
            this.resultados[paciente.id] = res.data;
          } catch {
            this.resultados[paciente.id] = [];
          }
        }
      }
    },
  },
};
</script>



<style scoped>
/* === Contenedor general y estilos se mantienen igual === */

/* 🔽 Resultados desplegables */
.resultados-container {
  margin: 10px 0 20px 0;
  padding: 15px;
  background: #fffdf6;
  border-radius: 8px;
  border: 1px solid #e0e0e0;
}

.resultado-item {
  padding: 6px 0;
  font-size: 13px;
  color: #2c3e50;
  border-bottom: 1px dashed #ddd;
}
.resultado-item:last-child {
  border-bottom: none;
}

.results-btn {
  background: #3498db;
  color: white;
  border: none;
  padding: 6px 10px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}
.results-btn:hover {
  background: #2980b9;
}

/* === Contenedor general === */
.page-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  height: 100vh;
  overflow: hidden;
  padding: 0;
  background: none;
}

/* === Tarjetas del Dashboard === */
.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 600px;
  width: 100%;
}

.card {
  background: rgba(255, 255, 255, 0.6);
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
  background: linear-gradient(135deg, #C6A34F, #A3822F);
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

/* === Buscador y botones === */
.search-input {
  width: 95%;
  padding: 12px;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  font-size: 14px;
  transition: all 0.2s ease;
  margin-bottom: 10px;
}

.search-input:focus {
  border-color: #C6A34F;
  outline: none;
  box-shadow: 0 0 0 2px rgba(198, 163, 79, 0.3);
}

.refresh-btn,
.retry-btn {
  padding: 8px 16px;
  border: 1px solid #C6A34F;
  border-radius: 6px;
  background: white;
  color: #C6A34F;
  cursor: pointer;
  font-size: 13px;
  transition: all 0.2s ease;
}

.refresh-btn:hover,
.retry-btn:hover {
  background: #C6A34F;
  color: white;
}

.refresh-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* === Estados === */
.loading-state,
.error-state {
  text-align: center;
  padding: 20px;
  color: #7f8c8d;
}

.error-state {
  color: #e74c3c;
}

/* === Lista scrollable === */
.pacientes-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  max-height: 60vh;
  overflow-y: auto;
  padding-right: 8px;
}

/* Scrollbar consistente con ResultadosView.vue */
.pacientes-list::-webkit-scrollbar {
  width: 8px;
}
.pacientes-list::-webkit-scrollbar-thumb {
  background: rgba(198, 163, 79, 0.4);
  border-radius: 4px;
}
.pacientes-list::-webkit-scrollbar-thumb:hover {
  background: rgba(198, 163, 79, 0.7);
}

/* === Elementos de la lista === */
.results-count {
  font-size: 12px;
  color: #C6A34F;
  margin-bottom: 15px;
  font-weight: 500;
}

.no-results {
  text-align: center;
  padding: 30px;
  color: #7f8c8d;
}

.paciente-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fffdf6;
  border-radius: 10px;
  padding: 15px;
  transition: all 0.3s ease;
  border-left: 4px solid #C6A34F;
}

.paciente-item:hover {
  background: #f0f0f0;
  transform: translateX(5px);
}

.paciente-info {
  flex: 1;
}

.paciente-nombre {
  font-weight: 600;
  color: #2c3e50;
  margin: 0 0 5px 0;
  font-size: 16px;
}

.paciente-detalle {
  font-size: 13px;
  color: #7f8c8d;
  margin: 0 0 5px 0;
}

.paciente-telefono {
  font-size: 12px;
  color: #C6A34F;
  margin: 0;
  font-weight: 500;
}

/* === Botones de acción === */
.edit-btn {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
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

/* === Modal === */
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

/* === Botones generales === */
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
  align-items: center;
  justify-content: center;
  gap: 6px;
  text-decoration: none;
}

.btn-primary {
  background: linear-gradient(135deg, #C6A34F, #A3822F);
  color: white;
}
</style>
