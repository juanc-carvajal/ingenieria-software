<template>
  <div class="page-container">
    <button @click="volverDashboard" class="btn-home">🏠</button>

    <div class="dashboard-cards">
      <div class="card ubicaciones-card">
        <div class="card-header">
          <div class="card-icon ubicaciones-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
              <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
            </svg>
          </div>

          <div class="card-title">
            <h3>Equipos Médicos - {{ categoriaActual }}</h3>
            <p>Sede: {{ sedeActual }}</p>
          </div>
        </div>

        <div class="card-body">
          <div class="search-container">
            <input
              type="text"
              v-model="searchQuery"
              placeholder="Buscar por nombre, código o marca"
              class="search-input"
            />
            <button @click="agregarEquipo" class="add-btn">
              + AGREGAR EQUIPO
            </button>
          </div>
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
                : 'No hay equipos registrados en esta categoría' }}
            </p>
          </div>

          <div v-else>
            <p class="results-count">
              {{ equiposFiltrados.length }} equipo(s) encontrado(s)
            </p>

            <div
              v-for="equipo in equiposFiltrados"
              :key="equipo.id"
              class="equipo-card"
            >

              <!-- Header del Equipo -->
              <div class="equipo-header">
                <div class="equipo-header-info">
                  <h3 class="equipo-nombre">{{ equipo.nombre_equipo }}</h3>
                  <p class="equipo-codigo">{{ equipo.codigo_inventario }}</p>
                </div>
                <div class="header-actions">
                  <span
                    :class="[
                      'badge-estado',
                      equipo.estado === 'activo'
                        ? 'badge-activo'
                        : equipo.estado === 'inactivo'
                        ? 'badge-inactivo'
                        : 'badge-baja'
                    ]"
                  >
                    {{ 
                      equipo.estado === 'activo'
                        ? '● Activo'
                        : equipo.estado === 'inactivo'
                        ? '● Inactivo'
                        : '● De Baja'
                    }}
                  </span>

                  <button class="edit-btn" @click="verDetalles(equipo.id)">
                    MÁS INFORMACIÓN
                  </button>
                </div>
              </div>

              <!-- Información General -->
              <div class="info-section">
                <h4 class="section-title">📋 Información General</h4>
                <div class="info-grid">
                  
                  <div class="info-item">
                    <label>Proceso:</label>
                    <p>{{ equipo.servicio }}</p>
                  </div>

                  <div class="info-item">
                    <label>Nombre del equipo:</label>
                    <p>{{ equipo.nombre_equipo }}</p>
                  </div>

                  <div class="info-item">
                    <label>Código de inventario:</label>
                    <p class="destacado">{{ equipo.codigo_inventario }}</p>
                  </div>

                  <div class="info-item">
                    <label>Código IPS:</label>
                    <p>{{ equipo.codigo_ips }}</p>
                  </div>

                  <div class="info-item">
                    <label>Código ECRI:</label>
                    <p>{{ equipo.codigo_ecri }}</p>
                  </div>

                  <div class="info-item">
                    <label>Responsable:</label>
                    <p>{{ equipo.responsable_proceso }}</p>
                  </div>

                  <div class="info-item full-width">
                    <label>Ubicación física:</label>
                    <p>{{ equipo.ubicacion_fisica }}</p>
                  </div>

                  <div class="info-item">
                    <label>Marca:</label>
                    <p>{{ equipo.marca }}</p>
                  </div>

                  <div class="info-item">
                    <label>Modelo:</label>
                    <p>{{ equipo.modelo }}</p>
                  </div>

                  <div class="info-item">
                    <label>Serie:</label>
                    <p>{{ equipo.serie }}</p>
                  </div>

                </div>
              </div>

            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import { useRoute, useRouter } from "vue-router";
import { ref, computed, onMounted } from "vue";
import axios from "axios";

export default {
  setup() {
    const API_URL = "http://127.0.0.1:8000/api/equipos/";

    const route = useRoute();
    const router = useRouter();

    const sedeActual = ref(route.query.sede || "Sede desconocida");
    const categoriaActual = ref(route.query.categoria || "todos");

    const searchQuery = ref("");

    const loading = ref(false);
    const error = ref(null);

    const equipos = ref([]);

    // =============================
    // 🔥 CARGAR DESDE BACKEND DJANGO
    // =============================
    const cargarEquipos = async () => {
      loading.value = true;
      error.value = null;

      try {
        const res = await axios.get(API_URL);
        equipos.value = res.data;
        console.log('Equipos cargados:', res.data); // Para debug
      } catch (e) {
        console.error('Error al cargar equipos:', e);
        error.value = "No se pudieron cargar los equipos desde el servidor.";
      } finally {
        loading.value = false;
      }
    };

    // =============================
    // 🔥 FILTRADO EN VIVO
    // =============================
    const equiposFiltrados = computed(() => {
      let resultado = equipos.value;

      // 🔥 FILTRAR POR SEDE
      if (sedeActual.value && sedeActual.value !== "todas") {
        resultado = resultado.filter((e) =>
          (e.sede || "").toLowerCase() === sedeActual.value.toLowerCase()
        );
      }

      // 🔥 FILTRAR POR CATEGORÍA
      if (categoriaActual.value !== "todos") {
        resultado = resultado.filter(
          (e) =>
            (e.estado || "").toLowerCase() ===
            categoriaActual.value.toLowerCase()
        );
      }

      // 🔥 BUSCADOR
      if (searchQuery.value.trim() !== "") {
        const q = searchQuery.value.toLowerCase();

        resultado = resultado.filter((e) =>
          Object.values(e).some(
            (v) => typeof v === "string" && v.toLowerCase().includes(q)
          )
        );
      }

      return resultado;
    });

    const refrescarLista = () => cargarEquipos();

    // =============================
    // 🔥 NAVEGACIÓN A DETALLES
    // =============================
    const verDetalles = (equipoId) => {
      console.log('Navegando a detalles del equipo ID:', equipoId); // Para debug
      
      if (!equipoId) {
        console.error('ERROR: No se proporcionó un ID de equipo');
        return;
      }

      router.push({
        name: "detalles",
        params: { id: equipoId },
        query: {
          sede: sedeActual.value,
          categoria: categoriaActual.value,
        },
      });
    };

    const agregarEquipo = () => {
      router.push({
        name: "crear-equipo",
        query: {
          sede: sedeActual.value,
          categoria: categoriaActual.value,
        },
      });
    };

    const volverDashboard = () => {
      router.push({ name: "home" });
    };

    onMounted(() => cargarEquipos());

    return {
      sedeActual,
      categoriaActual,
      searchQuery,
      loading,
      error,
      equipos,
      equiposFiltrados,
      refrescarLista,
      verDetalles,
      agregarEquipo,
      volverDashboard,
    };
  },
};
</script>

<style scoped>
.page-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: 100vh;
  padding: 50px 20px;
  background: #244652;
  box-sizing: border-box;
}

.dashboard-cards {
  display: grid;
  grid-template-columns: 1fr;
  max-width: 1200px;
  width: 100%;
}

.card {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 24px;
  padding: 25px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
}

.card-header {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
  gap: 15px;
}

.card-icon {
  width: 55px;
  height: 55px;
  border-radius: 14px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #244652;
  flex-shrink: 0;
}

.icon {
  width: 28px;
  height: 28px;
  color: white;
}

.card-title {
  flex: 1;
  min-width: 0;
}

.card-title h3 {
  font-size: 20px;
  font-weight: 700;
  margin: 0 0 5px 0;
  color: #212a31;
}

.card-title p {
  font-size: 14px;
  color: #5a6c7d;
  margin: 0;
}

/* CONTENEDOR DE BÚSQUEDA */
.search-container {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
  align-items: stretch;
}

/* INPUT BUSCADOR */
.search-input {
  flex: 1;
  padding: 12px;
  border: 1px solid #244652;
  border-radius: 10px;
  font-size: 14px;
  transition: 0.2s ease;
  background: rgba(255, 255, 255, 0.9);
  min-width: 0;
}

.search-input:focus {
  border-color: #212a31;
  outline: none;
  box-shadow: 0 0 0 2px rgba(36, 70, 82, 0.2);
}

/* BOTÓN AGREGAR */
.add-btn {
  padding: 12px 20px;
  border: none;
  border-radius: 10px;
  background: #6fc232;
  color: white;
  cursor: pointer;
  font-size: 13px;
  font-weight: 700;
  transition: all 0.3s ease;
  white-space: nowrap;
  box-shadow: 0 4px 12px rgba(111, 194, 50, 0.3);
}

.add-btn:hover {
  background: #5da829;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(111, 194, 50, 0.4);
}

.add-btn:active {
  transform: translateY(0);
}

/* BOTONES */
.refresh-btn,
.retry-btn {
  padding: 8px 16px;
  border: 1px solid #244652;
  border-radius: 8px;
  background: white;
  color: #244652;
  cursor: pointer;
  font-size: 13px;
  transition: 0.2s ease;
  font-weight: 600;
}

.refresh-btn:hover,
.retry-btn:hover {
  background: #244652;
  color: white;
}

.refresh-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

/* ESTADOS */
.loading-state,
.error-state,
.no-results {
  text-align: center;
  padding: 30px;
  color: #5a6c7d;
}

.error-state {
  color: #e74c3c;
}

.results-count {
  font-size: 12px;
  color: #244652;
  margin-bottom: 15px;
  font-weight: 600;
}

/* LISTA */
.ubicaciones-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
  max-height: 70vh;
  overflow-y: auto;
  padding-right: 8px;
}

.ubicaciones-list::-webkit-scrollbar {
  width: 8px;
}

.ubicaciones-list::-webkit-scrollbar-track {
  background: #f0f0f0;
  border-radius: 6px;
}

.ubicaciones-list::-webkit-scrollbar-thumb {
  background: #244652;
  border-radius: 6px;
}

.ubicaciones-list::-webkit-scrollbar-thumb:hover {
  background: #212a31;
}

/* TARJETA DE EQUIPO */
.equipo-card {
  background: #ffffff;
  border-radius: 16px;
  padding: 24px;
  border-left: 5px solid #244652;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
}

.equipo-card:hover {
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.12);
  transform: translateY(-2px);
}

/* HEADER DEL EQUIPO */
.equipo-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 2px solid #f0f0f0;
  gap: 15px;
}

.equipo-header-info {
  flex: 1;
  min-width: 0;
}

.equipo-nombre {
  font-size: 22px;
  font-weight: 700;
  color: #212a31;
  margin: 0 0 5px 0;
  word-wrap: break-word;
}

.equipo-codigo {
  font-size: 13px;
  color: #00bab3;
  font-weight: 600;
  margin: 0;
  word-wrap: break-word;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 12px;
  flex-shrink: 0;
}

.badge-estado {
  font-size: 11px;
  font-weight: 700;
  padding: 8px 16px;
  border-radius: 20px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  white-space: nowrap;
}

.badge-activo {
  background: #e8f5e9;
  color: #2e7d32;
  border: 1px solid #81d742;
}

.badge-inactivo {
  background: #ffebee;
  color: #c62828;
  border: 1px solid #e74c3c;
}

.badge-baja {
  background: #fff4e5;
  color: #e67e22;
  border: 1px solid #f39c12;
}

/* SECCIÓN DE INFORMACIÓN */
.info-section {
  margin-bottom: 20px;
}

.section-title {
  font-size: 16px;
  font-weight: 700;
  color: #212a31;
  margin: 0 0 15px 0;
  display: flex;
  align-items: center;
  gap: 8px;
}

.info-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
}

.info-item {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.info-item.full-width {
  grid-column: 1 / -1;
}

.info-item label {
  font-size: 11px;
  font-weight: 600;
  color: #5a6c7d;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.info-item p {
  font-size: 13px;
  color: #212a31;
  margin: 0;
  padding: 8px 12px;
  background: #f8f9fa;
  border-radius: 8px;
  border-left: 3px solid #e0e0e0;
  word-wrap: break-word;
}

.info-item p.destacado {
  background: #fff9e6;
  border-left-color: #ffc107;
  font-weight: 600;
  color: #856404;
}

.info-item p.riesgo {
  background: #fff3e0;
  border-left-color: #ff9800;
  color: #e65100;
  font-weight: 600;
}

.info-item p.invima {
  background: #e3f2fd;
  border-left-color: #2196f3;
  color: #1565c0;
  font-weight: 600;
}

/* BOTÓN EDITAR */
.edit-btn {
  background: #00bab3;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 10px;
  cursor: pointer;
  font-size: 13px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0, 186, 179, 0.3);
  white-space: nowrap;
}

.edit-btn:hover {
  background: #009991;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 186, 179, 0.4);
}

/* BOTÓN HOME */
.btn-home {
  position: fixed;
  top: 20px;
  left: 20px;
  width: 55px;
  height: 55px;
  border-radius: 50%;
  background: white;
  color: white;
  border: none;
  font-size: 26px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 16px rgba(129, 215, 66, 0.3);
  transition: 0.3s ease;
  z-index: 1000;
  padding-bottom: 7px;
}

.btn-home:hover {
  transform: scale(1.1);
  background: #00bab3;
  box-shadow: 0 6px 20px rgba(129, 215, 66, 0.4);
}

.btn-home:active {
  transform: scale(0.95);
}

/* ============================================
   MEDIA QUERIES PARA RESPONSIVIDAD
   ============================================ */

/* Tablets grandes (hasta 1024px) */
@media (max-width: 1024px) {
  .page-container {
    padding: 40px 20px;
  }

  .card {
    padding: 20px;
  }

  .card-title h3 {
    font-size: 18px;
  }

  .equipo-nombre {
    font-size: 20px;
  }
}

/* Tablets pequeños (hasta 768px) */
@media (max-width: 768px) {
  .page-container {
    padding: 80px 15px 20px;
  }

  .card {
    padding: 18px;
    border-radius: 20px;
  }

  .card-header {
    flex-direction: row;
    gap: 12px;
  }

  .card-icon {
    width: 45px;
    height: 45px;
  }

  .icon {
    width: 24px;
    height: 24px;
  }

  .card-title h3 {
    font-size: 16px;
  }

  .card-title p {
    font-size: 12px;
  }

  /* Búsqueda en columna */
  .search-container {
    flex-direction: column;
    gap: 8px;
  }

  .search-input {
    width: 100%;
  }

  .add-btn {
    width: 100%;
    padding: 12px;
  }

  /* Header de equipo en columna */
  .equipo-header {
    flex-direction: column;
    gap: 12px;
  }

  .header-actions {
    align-self: stretch;
    flex-direction: column;
    gap: 8px;
  }

  .badge-estado,
  .edit-btn {
    width: 100%;
    text-align: center;
    justify-content: center;
  }

  .equipo-card {
    padding: 18px;
  }

  .equipo-nombre {
    font-size: 18px;
  }

  /* Grid de información en 1 columna */
  .info-grid {
    grid-template-columns: 1fr;
  }

  .info-item.full-width {
    grid-column: 1;
  }

  .section-title {
    font-size: 14px;
  }

  .ubicaciones-list {
    max-height: 60vh;
  }

  /* Botón home más pequeño */
  .btn-home {
    width: 50px;
    height: 50px;
    font-size: 22px;
    top: 15px;
    left: 15px;
  }
}

/* Móviles (hasta 480px) */
@media (max-width: 480px) {
  .page-container {
    padding: 70px 10px 15px;
  }

  .card {
    padding: 15px;
    border-radius: 18px;
  }

  .card-header {
    margin-bottom: 15px;
  }

  .card-icon {
    width: 40px;
    height: 40px;
  }

  .icon {
    width: 20px;
    height: 20px;
  }

  .card-title h3 {
    font-size: 14px;
  }

  .card-title p {
    font-size: 11px;
  }

  .search-input {
    padding: 10px;
    font-size: 13px;
  }

  .add-btn {
    padding: 10px;
    font-size: 12px;
  }

  .refresh-btn {
    padding: 8px 12px;
    font-size: 12px;
  }

  .equipo-card {
    padding: 15px;
    border-radius: 14px;
  }

  .equipo-nombre {
    font-size: 16px;
  }

  .equipo-codigo {
    font-size: 11px;
  }

  .badge-estado {
    font-size: 10px;
    padding: 6px 12px;
  }

  .edit-btn {
    padding: 8px 16px;
    font-size: 11px;
  }

  .section-title {
    font-size: 13px;
    margin-bottom: 12px;
  }

  .info-item label {
    font-size: 10px;
  }

  .info-item p {
    font-size: 12px;
    padding: 7px 10px;
  }

  .results-count {
    font-size: 11px;
  }

  .ubicaciones-list {
    gap: 15px;
  }

  /* Botón home aún más pequeño */
  .btn-home {
    width: 45px;
    height: 45px;
    font-size: 20px;
    top: 12px;
    left: 12px;
  }
}

/* Móviles pequeños (hasta 360px) */
@media (max-width: 360px) {
  .page-container {
    padding: 65px 8px 12px;
  }

  .card {
    padding: 12px;
    border-radius: 16px;
  }

  .card-title h3 {
    font-size: 13px;
  }

  .equipo-nombre {
    font-size: 15px;
  }

  .add-btn {
    font-size: 11px;
  }

  .info-item p {
    font-size: 11px;
    padding: 6px 8px;
  }

  .btn-home {
    width: 42px;
    height: 42px;
    font-size: 18px;
    top: 10px;
    left: 10px;
  }
}
</style>