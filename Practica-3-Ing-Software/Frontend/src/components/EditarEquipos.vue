<template>
  <div class="page-container">
    <button @click="volverAtras" class="btn-home">🏠</button>

    <div class="detalles-container">
      <!-- Columna Izquierda: Botones de Acción -->
      <div class="columna-izquierda">
        <button class="action-btn save-btn" @click="actualizarEquipo">💾 Guardar Cambios</button>
        <button class="action-btn cancel-btn" @click="mostrarConfirmacion = true">❌ Cancelar</button>
        <button class="action-btn baja-btn" @click="darBaja">❌ Dar de baja</button>
      </div>

      <!-- Columna Derecha: Dashboard Scrolleable -->
      <div class="columna-derecha">
        <div class="dashboard-card">

          <div v-if="loading" class="loading-state">
            <p>Cargando información del equipo...</p>
          </div>

          <div v-else-if="error" class="error-state">
            <p>{{ error }}</p>
            <button @click="cargarEquipo" class="retry-btn">Reintentar</button>
          </div>

          <template v-else>
            <h2 class="dashboard-title">
              <input class="input-edit title-input" v-model="equipo.nombre_equipo" placeholder="Sin nombre" />
            </h2>

            <p class="codigo-principal">
              <input class="input-edit inline-input" v-model="equipo.codigo_inventario" placeholder="Sin código" />
            </p>

            <span :class="['badge-estado', 
              equipo.estado === 'activo' ? 'badge-activo' : 
              equipo.estado === 'baja' ? 'badge-baja' : 
              'badge-inactivo']">
              <select v-model="equipo.estado" class="select-estado">
                <option value="activo">● Activo</option>
                <option value="inactivo">● Inactivo</option>
                <option value="baja">● De baja</option>
              </select>
            </span>

            <div class="info-scrolleable">

              <!-- 1. INFORMACIÓN GENERAL -->
              <div class="info-section">
                <h3 class="section-title">📋 Información General</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Servicio:</label>
                    <input class="input-edit" v-model="equipo.servicio" type="text" />
                  </div>
                  <div class="info-item">
                    <label>Sede:</label>
                    <input class="input-edit" v-model="equipo.sede" type="text" />
                  </div>
                  <div class="info-item">
                    <label>Código de inventario:</label>
                    <input class="input-edit destacado" v-model="equipo.codigo_inventario" />
                  </div>
                  <div class="info-item">
                    <label>Código IPS:</label>
                    <input class="input-edit" v-model="equipo.codigo_ips" />
                  </div>
                  <div class="info-item">
                    <label>Código ECRI:</label>
                    <input class="input-edit" v-model="equipo.codigo_ecri" />
                  </div>
                  <div class="info-item">
                    <label>Responsable del proceso:</label>
                    <input class="input-edit" v-model="equipo.responsable_proceso" />
                  </div>
                  <div class="info-item full-width">
                    <label>Ubicación física:</label>
                    <input class="input-edit" v-model="equipo.ubicacion_fisica" />
                  </div>
                  <div class="info-item">
                    <label>Marca:</label>
                    <input class="input-edit" v-model="equipo.marca" />
                  </div>
                  <div class="info-item">
                    <label>Modelo:</label>
                    <input class="input-edit" v-model="equipo.modelo" />
                  </div>
                  <div class="info-item">
                    <label>Serie:</label>
                    <input class="input-edit" v-model="equipo.serie" />
                  </div>
                  <div class="info-item full-width">
                    <label>Clasificación eje misional:</label>
                    <input class="input-edit" v-model="equipo.clasificacion_eje_misional" />
                  </div>
                  <div class="info-item">
                    <label>Clasificación IPS:</label>
                    <input class="input-edit" v-model="equipo.clasificacion_ips" />
                  </div>
                  <div class="info-item">
                    <label>Clasificación por riesgo:</label>
                    <input class="input-edit" v-model="equipo.clasificacion_riesgo" />
                  </div>
                  <div class="info-item full-width">
                    <label>Registro Invima:</label>
                    <input class="input-edit" v-model="equipo.registro_invima" />
                  </div>
                </div>
              </div>

              <!-- 2. REGISTRO HISTÓRICO -->
              <div class="info-section">
                <h3 class="section-title">📅 Registro Histórico</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Tiempo de vida útil:</label>
                    <input class="input-edit" v-model="equipo.tiempo_vida_util" />
                  </div>
                  <div class="info-item">
                    <label>Fecha de adquisición:</label>
                    <input class="input-edit" type="date" v-model="equipo.fecha_adquisicion" />
                  </div>
                  <div class="info-item">
                    <label>Propietario:</label>
                    <input class="input-edit" v-model="equipo.propietario" />
                  </div>
                  <div class="info-item">
                    <label>Fecha de fabricación:</label>
                    <input class="input-edit" type="date" v-model="equipo.fecha_fabricacion" />
                  </div>
                  <div class="info-item">
                    <label>NIT:</label>
                    <input class="input-edit" v-model="equipo.nit" />
                  </div>
                  <div class="info-item full-width">
                    <label>Proveedor del equipo:</label>
                    <input class="input-edit" v-model="equipo.proveedor_equipo" />
                  </div>
                  <div class="info-item">
                    <label>¿En garantía?:</label>
                    <select class="input-edit" v-model="equipo.garantia">
                      <option value="">Seleccionar</option>
                      <option value="Sí">Sí</option>
                      <option value="No">No</option>
                    </select>
                  </div>
                  <div class="info-item">
                    <label>Fin de garantía:</label>
                    <input class="input-edit" type="date" v-model="equipo.fecha_fin_garantia" />
                  </div>
                  <div class="info-item">
                    <label>Forma de adquisición:</label>
                    <input class="input-edit" v-model="equipo.forma_adquisicion" />
                  </div>
                  <div class="info-item">
                    <label>Tipo de documento:</label>
                    <input class="input-edit" v-model="equipo.tipo_documento" />
                  </div>
                  <div class="info-item">
                    <label>Número de documento:</label>
                    <input class="input-edit" v-model="equipo.numero_documento" />
                  </div>
                  <div class="info-item">
                    <label>Valor de compra:</label>
                    <input class="input-edit" v-model="equipo.valor_compra" />
                  </div>
                </div>
              </div>

              <!-- 3. INVENTARIO DE DOCUMENTOS -->
              <div class="info-section">
                <h3 class="section-title">📄 Inventario de Documentos</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Hoja de vida:</label>
                    <input class="input-edit" v-model="equipo.hoja_vida" />
                  </div>
                  <div class="info-item">
                    <label>Registro de importación:</label>
                    <input class="input-edit" v-model="equipo.registro_importacion" />
                  </div>
                  <div class="info-item">
                    <label>Manual de operación:</label>
                    <input class="input-edit" v-model="equipo.manual_operacion" />
                  </div>
                  <div class="info-item">
                    <label>Manual de servicio:</label>
                    <input class="input-edit" v-model="equipo.manual_servicio" />
                  </div>
                  <div class="info-item">
                    <label>Guía rápida de uso:</label>
                    <input class="input-edit" v-model="equipo.guia_rapida_uso" />
                  </div>
                  <div class="info-item">
                    <label>Instructivo de manejo rápido:</label>
                    <input class="input-edit" v-model="equipo.instructivo_manejo_rapido" />
                  </div>
                  <div class="info-item">
                    <label>Protocolo Mto. Preventivo:</label>
                    <input class="input-edit" v-model="equipo.protocolo_mantenimiento_preventivo" />
                  </div>
                  <div class="info-item">
                    <label>Frecuencia metrológica fabricante:</label>
                    <input class="input-edit" v-model="equipo.frecuencia_metrologica_fabricante" />
                  </div>
                </div>
              </div>

              <!-- 4. INFORMACIÓN METROLÓGICA ADMINISTRATIVA -->
              <div class="info-section">
                <h3 class="section-title">🔧 Información Metrológica Administrativa</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Requiere mantenimiento:</label>
                    <select class="input-edit" v-model="equipo.mantenimiento">
                      <option value="">Seleccionar</option>
                      <option value="Sí">Sí</option>
                      <option value="No">No</option>
                    </select>
                  </div>
                  <div class="info-item">
                    <label>Frecuencia mantenimiento:</label>
                    <input class="input-edit" v-model="equipo.frecuencia_mantenimiento" />
                  </div>
                  <div class="info-item">
                    <label>Requiere calibración:</label>
                    <select class="input-edit" v-model="equipo.calibracion">
                      <option value="">Seleccionar</option>
                      <option value="Sí">Sí</option>
                      <option value="No">No</option>
                    </select>
                  </div>
                  <div class="info-item">
                    <label>Frecuencia calibración:</label>
                    <input class="input-edit" v-model="equipo.frecuencia_calibracion" />
                  </div>
                </div>
              </div>

              <!-- 5. INFORMACIÓN METROLÓGICA TÉCNICA -->
              <div class="info-section">
                <h3 class="section-title">📐 Información Metrológica Técnica</h3>
                <div class="info-grid">
                  <div class="info-item full-width">
                    <label>Magnitud:</label>
                    <input class="input-edit" v-model="equipo.magnitud" />
                  </div>
                  <div class="info-item full-width">
                    <label>Rango del equipo:</label>
                    <input class="input-edit" v-model="equipo.rango_equipo" />
                  </div>
                  <div class="info-item">
                    <label>Resolución:</label>
                    <input class="input-edit" v-model="equipo.resolucion" />
                  </div>
                  <div class="info-item">
                    <label>Rango de trabajo:</label>
                    <input class="input-edit" v-model="equipo.rango_trabajo" />
                  </div>
                  <div class="info-item full-width">
                    <label>Error máximo permitido:</label>
                    <input class="input-edit" v-model="equipo.error_max_permitido" />
                  </div>
                </div>
              </div>

              <!-- 6. CONDICIONES DE FUNCIONAMIENTO -->
              <div class="info-section">
                <h3 class="section-title">⚡ Condiciones de Funcionamiento</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Voltaje:</label>
                    <input class="input-edit" v-model="equipo.voltaje" />
                  </div>
                  <div class="info-item">
                    <label>Corriente:</label>
                    <input class="input-edit" v-model="equipo.corriente" />
                  </div>
                  <div class="info-item">
                    <label>Humedad relativa:</label>
                    <input class="input-edit" v-model="equipo.humedad_relativa" />
                  </div>
                  <div class="info-item">
                    <label>Temperatura máxima:</label>
                    <input class="input-edit" v-model="equipo.temperatura_maxima" />
                  </div>
                  <div class="info-item">
                    <label>Dimensiones:</label>
                    <input class="input-edit" v-model="equipo.dimensiones" />
                  </div>
                  <div class="info-item">
                    <label>Peso:</label>
                    <input class="input-edit" v-model="equipo.peso" />
                  </div>
                  <div class="info-item full-width">
                    <label>Otros:</label>
                    <textarea class="textarea-edit" v-model="equipo.otros"></textarea>
                  </div>
                </div>
              </div>

              <!-- 7. INFORMACIÓN DE BAJA -->
              <div class="info-section" v-if="equipo.estado === 'baja'">
                <h3 class="section-title">⚠️ Información de Baja</h3>
                <div class="info-grid">
                  <div class="info-item">
                    <label>Fecha de baja:</label>
                    <input class="input-edit" type="date" v-model="equipo.fecha_baja" />
                  </div>
                  <div class="info-item full-width">
                    <label>Motivo de baja:</label>
                    <textarea class="textarea-edit" v-model="equipo.motivo_baja"></textarea>
                  </div>
                  <div class="info-item full-width">
                    <label>Justificación de baja:</label>
                    <textarea class="textarea-edit" v-model="equipo.justificacion_baja"></textarea>
                  </div>
                </div>
              </div>

              <!-- 8. INFORMACIÓN DE TRASLADO -->
              <div class="info-section" v-if="equipo.justificacion_traslado">
                <h3 class="section-title">🚚 Información de Traslado</h3>
                <div class="info-grid">
                  <div class="info-item full-width">
                    <label>Justificación de traslado:</label>
                    <textarea class="textarea-edit" v-model="equipo.justificacion_traslado"></textarea>
                  </div>
                </div>
              </div>

            </div>
          </template>
        </div>
      </div>
    </div>

    <!-- MODAL DE CONFIRMACIÓN -->
    <div v-if="mostrarConfirmacion" class="modal-overlay">
      <div class="modal-content">
        <h3>⚠️ Atención</h3>
        <p>Todos los datos no guardados se perderán.<br>¿Estás seguro que deseas volver?</p>
        <div class="modal-buttons">
          <button class="confirm-btn" @click="confirmarCancelacion">Aceptar</button>
          <button class="close-btn" @click="mostrarConfirmacion = false">Cancelar</button>
        </div>
      </div>
    </div>

    <!-- MODAL DE GUARDADO EXITOSO -->
    <div v-if="mostrarGuardado" class="modal-overlay">
      <div class="modal-content modal-success">
        <div class="modal-icon">✅</div>
        <h3>Guardado exitoso</h3>
        <p>El equipo <strong>{{ equipo.nombre_equipo }}</strong> se actualizó correctamente.</p>
        <div class="modal-buttons" style="justify-content: center;">
          <button class="success-btn" @click="cerrarModalGuardado">Aceptar</button>
        </div>
      </div>
    </div>

    <!-- MODAL DE DAR DE BAJA -->
    <div v-if="mostrarModalBaja" class="modal-overlay">
      <div class="modal-content modal-baja">
        <div class="modal-icon-warning">⚠️</div>
        <h3>Dar de baja equipo</h3>
        <p>Estás a punto de dar de baja el equipo <strong>{{ equipo.nombre_equipo }}</strong></p>
        
        <div class="form-group">
          <label for="motivo-baja">Motivo de baja *</label>
          <textarea 
            id="motivo-baja"
            v-model="motivoBaja" 
            class="textarea-modal"
            placeholder="Describe el motivo por el cual se da de baja este equipo..."
            rows="4"
          ></textarea>
          <p v-if="errorMotivo" class="error-text">{{ errorMotivo }}</p>
        </div>

        <div class="form-group">
          <label for="justificacion-baja">Justificación de baja (opcional)</label>
          <textarea 
            id="justificacion-baja"
            v-model="justificacionBaja" 
            class="textarea-modal"
            placeholder="Justificación adicional..."
            rows="3"
          ></textarea>
        </div>
        
        <div class="modal-buttons">
          <button class="confirm-btn" @click="confirmarBaja">Confirmar baja</button>
          <button class="close-btn" @click="cancelarBaja">Cancelar</button>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
import { ref, reactive, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";

export default {
  setup() {
    const router = useRouter();
    const route = useRoute();
    const API_URL = "http://127.0.0.1:8000/api/equipos/";
    const mostrarGuardado = ref(false);

    /* ------------------------------------------------------
       🟡 MODAL DE CONFIRMACIÓN DE CANCELAR EDICIÓN
       ------------------------------------------------------ */
    const mostrarConfirmacion = ref(false);

    const confirmarCancelacion = () => {
      mostrarConfirmacion.value = false;
      router.push({ name: "home" });
    };

    /* ------------------------------------------------------
       🔴 MODAL DE DAR DE BAJA
       ------------------------------------------------------ */
    const mostrarModalBaja = ref(false);
    const motivoBaja = ref("");
    const justificacionBaja = ref("");
    const errorMotivo = ref("");

    /* ------------------------------------------------------
       🟢 DATOS DEL EQUIPO
       ------------------------------------------------------ */
    const equipo = reactive({
      id: null,
      nombre_equipo: "",
      codigo_inventario: "",
      estado: "activo",

      servicio: "",
      sede: "",
      codigo_ips: "",
      codigo_ecri: "",
      responsable_proceso: "",
      ubicacion_fisica: "",
      marca: "",
      modelo: "",
      serie: "",
      clasificacion_eje_misional: "",
      clasificacion_ips: "",
      clasificacion_riesgo: "",
      registro_invima: "",

      tiempo_vida_util: "",
      fecha_adquisicion: "",
      propietario: "",
      fecha_fabricacion: "",
      nit: "",
      proveedor_equipo: "",
      garantia: "",
      fecha_fin_garantia: "",
      forma_adquisicion: "",
      tipo_documento: "",
      numero_documento: "",
      valor_compra: "",

      hoja_vida: "",
      registro_importacion: "",
      manual_operacion: "",
      manual_servicio: "",
      guia_rapida_uso: "",
      instructivo_manejo_rapido: "",
      protocolo_mantenimiento_preventivo: "",
      frecuencia_metrologica_fabricante: "",

      mantenimiento: "",
      frecuencia_mantenimiento: "",
      calibracion: "",
      frecuencia_calibracion: "",

      magnitud: "",
      rango_equipo: "",
      resolucion: "",
      rango_trabajo: "",
      error_max_permitido: "",

      voltaje: "",
      corriente: "",
      humedad_relativa: "",
      temperatura_maxima: "",
      dimensiones: "",
      peso: "",
      otros: "",

      fecha_baja: "",
      motivo_baja: "",
      justificacion_baja: "",
      justificacion_traslado: "",
    });

    const loading = ref(false);
    const error = ref(null);

    const equipoId = route.params.id;

    /* ------------------------------------------------------
       🟣 Cargar datos del equipo
       ------------------------------------------------------ */
    const cargarEquipo = async () => {
      loading.value = true;
      error.value = null;

      try {
        const res = await axios.get(`${API_URL}${equipoId}/`);
        Object.assign(equipo, res.data);
      } catch (e) {
        error.value = "No se pudo cargar la información del equipo";
      } finally {
        loading.value = false;
      }
    };

    onMounted(cargarEquipo);

    /* ------------------------------------------------------
       🔄 Reemplazar valores vacíos por "NI"
       ------------------------------------------------------ */
    const llenarNI = (data) => {
      const out = {};
      for (const key in data) {
        const val = data[key];
        out[key] =
          val === null || val === undefined || val === ""
            ? "NI"
            : val;
      }
      return out;
    };

    /* ------------------------------------------------------
       💾 Actualizar equipo
       ------------------------------------------------------ */
    const actualizarEquipo = async () => {
      try {
        if (!equipo.nombre_equipo || !equipo.codigo_inventario) {
          alert("Los campos obligatorios no pueden estar vacíos.");
          return;
        }

        await axios.put(`${API_URL}${equipoId}/`, llenarNI(equipo));
        mostrarGuardado.value = true;

      } catch (e) {
        console.error(e);
        alert("Error al actualizar el equipo.");
      }
    };

    /* ------------------------------------------------------
       ✅ Cerrar modal de guardado
       ------------------------------------------------------ */
    const cerrarModalGuardado = () => {
      mostrarGuardado.value = false;
      router.push({ name: "home" });
    };

    /* ------------------------------------------------------
       🟥 Abrir modal de baja
       ------------------------------------------------------ */
    const darBaja = () => {
      mostrarModalBaja.value = true;
      motivoBaja.value = "";
      justificacionBaja.value = "";
      errorMotivo.value = "";
    };

    /* ------------------------------------------------------
       ✅ Confirmar baja del equipo
       ------------------------------------------------------ */
    const confirmarBaja = async () => {
      // Validar que se haya ingresado un motivo
      if (!motivoBaja.value.trim()) {
        errorMotivo.value = "Debes ingresar un motivo para dar de baja el equipo";
        return;
      }

      try {
        // Cambiar estado a "De baja"
        equipo.estado = "baja";
        equipo.motivo_baja = motivoBaja.value.trim();
        equipo.justificacion_baja = justificacionBaja.value.trim();
        equipo.fecha_baja = new Date().toISOString().split('T')[0]; // Fecha actual

        // Guardar cambios
        await actualizarEquipo();

        // Cerrar modal
        mostrarModalBaja.value = false;
      } catch (e) {
        console.error("Error al dar de baja:", e);
        errorMotivo.value = "Error al procesar la baja del equipo";
      }
    };

    /* ------------------------------------------------------
       ❌ Cancelar baja
       ------------------------------------------------------ */
    const cancelarBaja = () => {
      mostrarModalBaja.value = false;
      motivoBaja.value = "";
      justificacionBaja.value = "";
      errorMotivo.value = "";
    };

    /* ------------------------------------------------------
       🔙 Volver (botón principal)
       ------------------------------------------------------ */
    const volverAtras = () => {
      mostrarConfirmacion.value = true;
    };

    return {
      equipo,
      loading,
      error,

      cargarEquipo,
      actualizarEquipo,
      darBaja,
      volverAtras,

      /* Modales */
      mostrarConfirmacion,
      confirmarCancelacion,
      mostrarGuardado,
      cerrarModalGuardado,
      
      /* Modal de baja */
      mostrarModalBaja,
      motivoBaja,
      justificacionBaja,
      errorMotivo,
      confirmarBaja,
      cancelarBaja,
    };
  },
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
  transform: scale(1.05);
  background: #00bab3;
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

.save-btn {
  background: #6fc232;
  color: white;
  border-color: #6fc232;
}

.save-btn:hover {
  background: #5da828;
  transform: translateY(-2px);
}

.cancel-btn:hover {
  background: #e74c3c;
  color: white;
  border-color: #e74c3c;
}

.baja-btn:hover {
  background: #e74c3c;
  color: white;
  border-color: #e74c3c;
}

/* COLUMNA DERECHA */
.columna-derecha {
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.dashboard-card {
  background: rgba(255, 255, 255, 0.98);
  border-radius: 24px;
  padding: 28px;
  box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
  display: flex;
  flex-direction: column;
  height: 100%;
  overflow: hidden;
}

.dashboard-title {
  margin: 0 0 6px 0;
  font-size: 22px;
  font-weight: 800;
  color: #244652;
}

.codigo-principal {
  margin: 0 0 10px 0;
}

/* INPUTS MODERNOS */
.input-edit {
  font-size: 14px;
  padding: 8px 12px;
  border-radius: 10px;
  border: 1.5px solid #e6eef0;
  background: #fbffff;
  box-shadow: 0 2px 6px rgba(36,70,82,0.03);
  width: 100%;
  box-sizing: border-box;
  transition: all 0.2s ease;
}

.input-edit:focus {
  outline: none;
  border-color: #00bab3;
  box-shadow: 0 0 0 3px rgba(0, 186, 179, 0.1);
}

.title-input {
  font-size: 20px;
  font-weight: 700;
  border: none;
  padding: 6px 8px;
}

.inline-input {
  display: inline-block;
  width: auto;
  padding: 6px 10px;
  border-radius: 8px;
}

.select-estado {
  background: transparent;
  border: none;
  font-weight: 700;
  cursor: pointer;
}

.textarea-edit {
  width: 100%;
  min-height: 80px;
  padding: 10px 12px;
  border-radius: 10px;
  border: 1.5px solid #e6eef0;
  resize: vertical;
  box-sizing: border-box;
  font-family: inherit;
  transition: all 0.2s ease;
}

.textarea-edit:focus {
  outline: none;
  border-color: #00bab3;
  box-shadow: 0 0 0 3px rgba(0, 186, 179, 0.1);
}

/* ÁREA SCROLLEABLE */
.info-scrolleable {
  flex: 1;
  overflow-y: auto;
  padding-right: 12px;
  margin-top: 12px;
}

.info-scrolleable::-webkit-scrollbar {
  width: 8px;
}

.info-scrolleable::-webkit-scrollbar-thumb {
  background: #244652;
  border-radius: 6px;
}

.info-scrolleable::-webkit-scrollbar-track {
  background: #f0f0f0;
  border-radius: 6px;
}

/* SECCIONES */
.info-section {
  margin-bottom: 26px;
  padding-bottom: 18px;
  border-bottom: 2px solid #f0f0f0;
}

.info-section:last-child {
  border-bottom: none;
}

.section-title {
  font-size: 16px;
  font-weight: 700;
  color: #212a31;
  margin: 0 0 12px 0;
  padding-bottom: 8px;
  border-bottom: 2px solid #00bab3;
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
  gap: 6px;
}

.info-item.full-width {
  grid-column: 1 / -1;
}

.info-item label {
  font-size: 12px;
  font-weight: 700;
  color: #5a6c7d;
  text-transform: uppercase;
  margin-bottom: 2px;
}

.info-item .destacado {
  background: #fff9e6;
  border-left: 3px solid #ffc107;
}

/* BADGE ESTADO */
.badge-estado {
  font-size: 11px;
  font-weight: 700;
  padding: 8px 12px;
  border-radius: 20px;
  margin-bottom: 14px;
  display: inline-block;
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

/* ESTADOS DE CARGA */
.loading-state,
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 40px;
  text-align: center;
}

.retry-btn {
  background: #00bab3;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 8px;
  cursor: pointer;
  margin-top: 16px;
}

/* ============================
   MODALES CENTRADOS
   ============================ */
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  backdrop-filter: blur(4px);
}

.modal-content {
  background: white;
  padding: 32px 28px;
  border-radius: 16px;
  max-width: 420px;
  width: 90%;
  text-align: center;
  animation: modal-pop 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
}

.modal-content h3 {
  margin: 0 0 12px 0;
  font-size: 20px;
  color: #244652;
}

.modal-content p {
  margin: 0 0 20px 0;
  color: #5a6c7d;
  line-height: 1.5;
}

/* MODAL DE ÉXITO */
.modal-success {
  border-top: 4px solid #6fc232;
}

.modal-icon {
  font-size: 48px;
  margin-bottom: 12px;
  animation: icon-bounce 0.5s ease-out;
}

/* MODAL DE BAJA */
.modal-baja {
  border-top: 4px solid #e74c3c;
  max-width: 500px;
}

.modal-icon-warning {
  font-size: 48px;
  margin-bottom: 12px;
  animation: icon-bounce 0.5s ease-out;
}

.form-group {
  margin-bottom: 20px;
  text-align: left;
}

.form-group label {
  display: block;
  font-size: 13px;
  font-weight: 700;
  color: #244652;
  margin-bottom: 8px;
  text-transform: uppercase;
}

.textarea-modal {
  width: 100%;
  padding: 12px;
  border-radius: 10px;
  border: 1.5px solid #e6eef0;
  background: #fbffff;
  box-shadow: 0 2px 6px rgba(36, 70, 82, 0.03);
  font-family: inherit;
  font-size: 14px;
  resize: vertical;
  box-sizing: border-box;
  transition: all 0.2s ease;
}

.textarea-modal:focus {
  outline: none;
  border-color: #e74c3c;
  box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.1);
}

.textarea-modal::placeholder {
  color: #a0a0a0;
}

.error-text {
  color: #e74c3c;
  font-size: 12px;
  margin-top: 6px;
  font-weight: 600;
}

.modal-buttons {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  margin-top: 20px;
}

.confirm-btn,
.close-btn,
.success-btn {
  flex: 1;
  padding: 12px 20px;
  border-radius: 10px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  transition: all 0.2s ease;
}

.confirm-btn {
  background: #e74c3c;
  color: white;
}

.confirm-btn:hover {
  background: #c0392b;
  transform: translateY(-1px);
}

.close-btn {
  background: #244652;
  color: white;
}

.close-btn:hover {
  background: #1a3540;
  transform: translateY(-1px);
}

.success-btn {
  background: #6fc232;
  color: white;
}

.success-btn:hover {
  background: #5da828;
  transform: translateY(-1px);
}

@keyframes modal-pop {
  from { 
    transform: scale(0.8); 
    opacity: 0; 
  }
  to { 
    transform: scale(1); 
    opacity: 1; 
  }
}

@keyframes icon-bounce {
  0% { 
    transform: scale(0); 
  }
  50% { 
    transform: scale(1.2); 
  }
  100% { 
    transform: scale(1); 
  }
}

/* RESPONSIVE */
@media (max-width: 1024px) {
  .detalles-container {
    grid-template-columns: 1fr;
    height: auto;
  }
  
  .info-grid {
    grid-template-columns: 1fr;
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
  
  .dashboard-title { 
    font-size: 18px; 
  }
  
  .btn-home {
    width: 45px;
    height: 45px;
    font-size: 22px;
  }
  
  .modal-content {
    padding: 24px 20px;
  }

  .columna-izquierda {
    flex-direction: column;
  }

  .action-btn {
    min-width: unset;
  }
}
</style>