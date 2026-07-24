<template>
  <div class="page-container">
    <button @click="volverDashboard" class="btn-home">🏠</button>

    <div class="detalles-container">
      <!-- Columna Izquierda: Botones de Acción -->
      <div class="columna-izquierda">
        <button class="action-btn edit-btn" @click="editarEquipo">
          ✏️ Editar Info
        </button>

        <button class="action-btn volver-btn" @click="volverAtras">
          ⬅️ Volver al menú
        </button>
      </div>

      <!-- Columna Derecha: Dashboard Scrolleable -->
      <div class="columna-derecha">
        <div class="dashboard-card">
          
          <!-- Estado de Carga -->
          <div v-if="loading" class="loading-state">
            <p>Cargando información del equipo...</p>
          </div>

          <!-- Estado de Error -->
          <div v-else-if="error" class="error-state">
            <p>{{ error }}</p>
            <button @click="cargarEquipo" class="retry-btn">Reintentar</button>
          </div>

          <!-- Contenido del Equipo -->
          <template v-else>
            <h2 class="dashboard-title">{{ equipoDetalle.nombre_equipo || 'Sin nombre' }}</h2>
            <p class="codigo-principal">{{ equipoDetalle.codigo_inventario || 'Sin código' }}</p>
            <span :class="['badge-estado', 
                          equipoDetalle.estado === 'activo' ? 'badge-activo' : 
                          equipoDetalle.estado === 'baja' ? 'badge-baja' : 'badge-inactivo']">
              {{ equipoDetalle.estado === 'activo' ? '● Activo' : 
                 equipoDetalle.estado === 'baja' ? '● De baja' : '● Inactivo' }}
            </span>

            <div class="info-scrolleable">

            <!-- 1. INFORMACIÓN GENERAL -->
            <div class="info-section">
              <h3 class="section-title">📋 Información General</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Servicio:</label>
                  <p>{{ equipoDetalle.servicio }}</p>
                </div>
                <div class="info-item">
                  <label>Sede:</label>
                  <p>{{ equipoDetalle.sede }}</p>
                </div>
                <div class="info-item">
                  <label>Código de inventario:</label>
                  <p class="destacado">{{ equipoDetalle.codigo_inventario }}</p>
                </div>
                <div class="info-item">
                  <label>Código IPS:</label>
                  <p>{{ equipoDetalle.codigo_ips }}</p>
                </div>
                <div class="info-item">
                  <label>Código ECRI:</label>
                  <p>{{ equipoDetalle.codigo_ecri }}</p>
                </div>
                <div class="info-item">
                  <label>Responsable del proceso:</label>
                  <p>{{ equipoDetalle.responsable_proceso }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Ubicación física:</label>
                  <p>{{ equipoDetalle.ubicacion_fisica }}</p>
                </div>
                <div class="info-item">
                  <label>Marca:</label>
                  <p>{{ equipoDetalle.marca }}</p>
                </div>
                <div class="info-item">
                  <label>Modelo:</label>
                  <p>{{ equipoDetalle.modelo }}</p>
                </div>
                <div class="info-item">
                  <label>Serie:</label>
                  <p>{{ equipoDetalle.serie }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Clasificación eje misional:</label>
                  <p>{{ equipoDetalle.clasificacion_eje_misional }}</p>
                </div>
                <div class="info-item">
                  <label>Clasificación IPS:</label>
                  <p>{{ equipoDetalle.clasificacion_ips }}</p>
                </div>
                <div class="info-item">
                  <label>Clasificación por riesgo:</label>
                  <p>{{ equipoDetalle.clasificacion_riesgo }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Registro Invima:</label>
                  <p>{{ equipoDetalle.registro_invima }}</p>
                </div>
              </div>
            </div>

            <!-- 2. REGISTRO HISTÓRICO -->
            <div class="info-section">
              <h3 class="section-title">📅 Registro Histórico</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Tiempo de vida útil:</label>
                  <p>{{ equipoDetalle.tiempo_vida_util }}</p>
                </div>
                <div class="info-item">
                  <label>Fecha de adquisición:</label>
                  <p>{{ equipoDetalle.fecha_adquisicion }}</p>
                </div>
                <div class="info-item">
                  <label>Propietario:</label>
                  <p>{{ equipoDetalle.propietario }}</p>
                </div>
                <div class="info-item">
                  <label>Fecha de fabricación:</label>
                  <p>{{ equipoDetalle.fecha_fabricacion }}</p>
                </div>
                <div class="info-item">
                  <label>NIT:</label>
                  <p>{{ equipoDetalle.nit }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Proveedor del equipo:</label>
                  <p>{{ equipoDetalle.proveedor_equipo }}</p>
                </div>
                <div class="info-item">
                  <label>¿En garantía?:</label>
                  <p :class="equipoDetalle.garantia === 'Sí' ? 'estado-activo' : 'estado-inactivo'">
                    {{ equipoDetalle.garantia }}
                  </p>
                </div>
                <div class="info-item">
                  <label>Fin de garantía:</label>
                  <p>{{ equipoDetalle.fecha_fin_garantia }}</p>
                </div>
                <div class="info-item">
                  <label>Forma de adquisición:</label>
                  <p>{{ equipoDetalle.forma_adquisicion }}</p>
                </div>
                <div class="info-item">
                  <label>Tipo de documento:</label>
                  <p>{{ equipoDetalle.tipo_documento }}</p>
                </div>
                <div class="info-item">
                  <label>Número de documento:</label>
                  <p>{{ equipoDetalle.numero_documento }}</p>
                </div>
                <div class="info-item">
                  <label>Valor de compra:</label>
                  <p>{{ equipoDetalle.valor_compra }}</p>
                </div>
              </div>
            </div>

            <!-- 3. INVENTARIO DE DOCUMENTOS -->
            <div class="info-section">
              <h3 class="section-title">📄 Inventario de Documentos</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Hoja de vida:</label>
                  <p>{{ equipoDetalle.hoja_vida }}</p>
                </div>
                <div class="info-item">
                  <label>Registro de importación:</label>
                  <p>{{ equipoDetalle.registro_importacion }}</p>
                </div>
                <div class="info-item">
                  <label>Manual de operación:</label>
                  <p>{{ equipoDetalle.manual_operacion }}</p>
                </div>
                <div class="info-item">
                  <label>Manual de servicio:</label>
                  <p>{{ equipoDetalle.manual_servicio }}</p>
                </div>
                <div class="info-item">
                  <label>Guía rápida de uso:</label>
                  <p>{{ equipoDetalle.guia_rapida_uso }}</p>
                </div>
                <div class="info-item">
                  <label>Instructivo de manejo rápido:</label>
                  <p>{{ equipoDetalle.instructivo_manejo_rapido }}</p>
                </div>
                <div class="info-item">
                  <label>Protocolo Mto. Preventivo:</label>
                  <p>{{ equipoDetalle.protocolo_mantenimiento_preventivo }}</p>
                </div>
                <div class="info-item">
                  <label>Frecuencia metrológica fabricante:</label>
                  <p>{{ equipoDetalle.frecuencia_metrologica_fabricante }}</p>
                </div>
              </div>
            </div>

            <!-- 4. INFORMACIÓN METROLÓGICA ADMINISTRATIVA -->
            <div class="info-section">
              <h3 class="section-title">🔧 Información Metrológica Administrativa</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Requiere mantenimiento:</label>
                  <p :class="equipoDetalle.mantenimiento === 'Sí' ? 'estado-activo' : 'estado-inactivo'">
                    {{ equipoDetalle.mantenimiento }}
                  </p>
                </div>
                <div class="info-item">
                  <label>Frecuencia mantenimiento:</label>
                  <p>{{ equipoDetalle.frecuencia_mantenimiento }}</p>
                </div>
                <div class="info-item">
                  <label>Requiere calibración:</label>
                  <p :class="equipoDetalle.calibracion === 'Sí' ? 'estado-activo' : 'estado-inactivo'">
                    {{ equipoDetalle.calibracion }}
                  </p>
                </div>
                <div class="info-item">
                  <label>Frecuencia calibración:</label>
                  <p>{{ equipoDetalle.frecuencia_calibracion }}</p>
                </div>
              </div>
            </div>

            <!-- 5. INFORMACIÓN METROLÓGICA TÉCNICA -->
            <div class="info-section">
              <h3 class="section-title">📐 Información Metrológica Técnica</h3>
              <div class="info-grid">
                <div class="info-item full-width">
                  <label>Magnitud:</label>
                  <p>{{ equipoDetalle.magnitud }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Rango del equipo:</label>
                  <p>{{ equipoDetalle.rango_equipo }}</p>
                </div>
                <div class="info-item">
                  <label>Resolución:</label>
                  <p>{{ equipoDetalle.resolucion }}</p>
                </div>
                <div class="info-item">
                  <label>Rango de trabajo:</label>
                  <p>{{ equipoDetalle.rango_trabajo }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Error máximo permitido:</label>
                  <p>{{ equipoDetalle.error_max_permitido }}</p>
                </div>
              </div>
            </div>

            <!-- 6. CONDICIONES DE FUNCIONAMIENTO -->
            <div class="info-section">
              <h3 class="section-title">⚡ Condiciones de Funcionamiento</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Voltaje:</label>
                  <p>{{ equipoDetalle.voltaje }}</p>
                </div>
                <div class="info-item">
                  <label>Corriente:</label>
                  <p>{{ equipoDetalle.corriente }}</p>
                </div>
                <div class="info-item">
                  <label>Humedad relativa:</label>
                  <p>{{ equipoDetalle.humedad_relativa }}</p>
                </div>
                <div class="info-item">
                  <label>Temperatura máxima:</label>
                  <p>{{ equipoDetalle.temperatura_maxima }}</p>
                </div>
                <div class="info-item">
                  <label>Dimensiones:</label>
                  <p>{{ equipoDetalle.dimensiones }}</p>
                </div>
                <div class="info-item">
                  <label>Peso:</label>
                  <p>{{ equipoDetalle.peso }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Otros:</label>
                  <p>{{ equipoDetalle.otros }}</p>
                </div>
              </div>
            </div>

            <!-- 7. INFORMACIÓN DE BAJA (solo si el estado es "baja") -->
            <div class="info-section" v-if="equipoDetalle.estado === 'baja'">
              <h3 class="section-title">⚠️ Información de Baja</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Fecha de baja:</label>
                  <p>{{ equipoDetalle.fecha_baja || 'No registrada' }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Motivo de baja:</label>
                  <p>{{ equipoDetalle.motivo_baja || 'No especificado' }}</p>
                </div>
                <div class="info-item full-width">
                  <label>Justificación de baja:</label>
                  <p>{{ equipoDetalle.justificacion_baja || 'No especificada' }}</p>
                </div>
              </div>
            </div>

            <!-- 8. INFORMACIÓN DE TRASLADO (si aplica) -->
            <div class="info-section" v-if="equipoDetalle.justificacion_traslado">
              <h3 class="section-title">🚚 Información de Traslado</h3>
              <div class="info-grid">
                <div class="info-item full-width">
                  <label>Justificación de traslado:</label>
                  <p>{{ equipoDetalle.justificacion_traslado }}</p>
                </div>
              </div>
            </div>

            </div>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { useRouter, useRoute } from 'vue-router';
import { ref, onMounted } from 'vue';
import axios from 'axios';

export default {
  setup() {
    const API_URL = "http://127.0.0.1:8000/api/equipos/";
    
    const router = useRouter();
    const route = useRoute();

    const equipoId = ref(route.params.id || null);
    const equipoDetalle = ref({});
    const loading = ref(false);
    const error = ref(null);

    // =============================
    // 🔥 CARGAR EQUIPO DESDE BACKEND
    // =============================
    const cargarEquipo = async () => {
      if (!equipoId.value) {
        error.value = "No se proporcionó un ID de equipo";
        return;
      }

      loading.value = true;
      error.value = null;

      try {
        const response = await axios.get(`${API_URL}${equipoId.value}/`);
        equipoDetalle.value = response.data;
        console.log('Equipo cargado:', response.data);
        console.log('Estado del equipo:', response.data.estado);
      } catch (e) {
        console.error('Error al cargar equipo:', e);
        error.value = "No se pudo cargar la información del equipo";
      } finally {
        loading.value = false;
      }
    };

    const editarEquipo = () => {
      router.push({ name: "editarEquipo", params: { id: equipoId.value } });
    };

    const volverAtras = () => {
      router.push({
        name: 'equipos',
        query: {
          sede: route.query.sede,
          categoria: route.query.categoria
        }
      });
    };

    const volverDashboard = () => {
      router.push({ name: 'home' });
    };

    // Cargar equipo al montar el componente
    onMounted(() => {
      cargarEquipo();
    });

    return {
      equipoId,
      equipoDetalle,
      loading,
      error,
      editarEquipo,
      volverAtras,
      volverDashboard,
      cargarEquipo
    };
  }
};
</script>
<style scoped>
.page-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 40px;
  background: #244652;
  box-sizing: border-box;
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

/* CONTENEDOR PRINCIPAL */
.detalles-container {
  display: grid;
  grid-template-columns: 280px 1fr;
  gap: 25px;
  max-width: 1400px;
  width: 100%;
  height: 85vh;
}

/* COLUMNA IZQUIERDA */
.columna-izquierda {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

/* BOTONES DE ACCIÓN */
.action-btn {
  background: white;
  color: #244652;
  border: 2px solid #244652;
  padding: 14px 20px;
  border-radius: 16px;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.action-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.action-btn:active {
  transform: translateY(-1px);
}

.edit-btn:hover {
  background: #00bab3;
  color: white;
  border-color: #00bab3;
}

.baja-btn:hover {
  background: #e74c3c;
  color: white;
  border-color: #e74c3c;
}

.volver-btn:hover {
  background: #244652;
  color: white;
}

/* COLUMNA DERECHA */
.columna-derecha {
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.dashboard-card {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 24px;
  padding: 30px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  height: 100%;
  overflow: hidden;
}

.dashboard-title {
  margin: 0;
  font-size: 26px;
  font-weight: 700;
  color: #244652;
}

.codigo-principal {
  font-size: 14px;
  color: #00bab3;
  font-weight: 600;
  margin: 5px 0 20px 0;
  padding: 8px 12px;
  background: #f0fffe;
  border-radius: 8px;
  display: inline-block;
  border-left: 3px solid #00bab3;
}

/* ÁREA SCROLLEABLE */
.info-scrolleable {
  flex: 1;
  overflow-y: auto;
  padding-right: 15px;
}

.info-scrolleable::-webkit-scrollbar {
  width: 8px;
}

.info-scrolleable::-webkit-scrollbar-track {
  background: #f0f0f0;
  border-radius: 6px;
}

.info-scrolleable::-webkit-scrollbar-thumb {
  background: #244652;
  border-radius: 6px;
}

.info-scrolleable::-webkit-scrollbar-thumb:hover {
  background: #212a31;
}

/* SECCIONES DE INFORMACIÓN */
.info-section {
  margin-bottom: 30px;
  padding-bottom: 20px;
  border-bottom: 2px solid #f0f0f0;
}

.info-section:last-child {
  border-bottom: none;
}

.section-title {
  font-size: 18px;
  font-weight: 700;
  color: #212a31;
  margin: 0 0 15px 0;
  padding-bottom: 10px;
  border-bottom: 2px solid #00bab3;
  display: flex;
  align-items: center;
  gap: 8px;
}

.info-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 15px;
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
  font-size: 12px;
  font-weight: 600;
  color: #5a6c7d;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.info-item p {
  font-size: 14px;
  color: #212a31;
  margin: 0;
  padding: 8px 12px;
  background: #f8f9fa;
  border-radius: 8px;
  border-left: 3px solid #e0e0e0;
}

.info-item p.destacado {
  background: #fff9e6;
  border-left-color: #ffc107;
  font-weight: 600;
  color: #856404;
}

.info-item p.estado-activo {
  background: #e8f5e9;
  border-left-color: #81d742;
  color: #2e7d32;
  font-weight: 600;
}

.info-item p.estado-inactivo {
  background: #ffebee;
  border-left-color: #e74c3c;
  color: #c62828;
  font-weight: 600;
}

/* BADGES DE ESTADO */
.badge-estado {
  font-size: 11px;
  font-weight: 700;
  padding: 8px 16px;
  border-radius: 20px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 15px;
  margin-top: -5px;
  display: inline-block;
  width: fit-content;
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
  background: #fff3e0;
  color: #e65100;
  border: 1px solid #ff9800;
}

/* ESTADOS DE CARGA Y ERROR */
.loading-state,
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 40px;
  text-align: center;
  gap: 20px;
}

.loading-state p {
  font-size: 16px;
  color: #5a6c7d;
  margin: 0;
}

.error-state p {
  font-size: 16px;
  color: #e74c3c;
  margin: 0;
}

.retry-btn {
  background: #00bab3;
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 12px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  transition: all 0.3s ease;
}

.retry-btn:hover {
  background: #008f8a;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 186, 179, 0.3);
}

/* RESPONSIVE */
@media (max-width: 1024px) {
  .detalles-container {
    grid-template-columns: 1fr;
    height: auto;
  }

  .columna-izquierda {
    flex-direction: row;
    flex-wrap: wrap;
  }

  .action-btn {
    flex: 1;
    min-width: 150px;
  }
}

@media (max-width: 768px) {
  .page-container {
    padding: 20px;
  }

  .info-grid {
    grid-template-columns: 1fr;
  }

  .columna-izquierda {
    flex-direction: column;
  }

  .dashboard-title {
    font-size: 22px;
  }

  .section-title {
    font-size: 16px;
  }
}
</style>