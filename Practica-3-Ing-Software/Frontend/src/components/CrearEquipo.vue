<template>
  <div class="page-container">
    <button @click="mostrarConfirmacion = true" class="btn-home">🏠</button>

    <div class="detalles-container">
      <!-- COLUMNA IZQUIERDA: BOTONES -->
      <div class="columna-izquierda">
        <button class="action-btn save-btn" @click="guardarEquipo">💾 Guardar Equipo</button>
        <button class="action-btn cancel-btn" @click="mostrarConfirmacion = true">❌ Cancelar</button>
      </div>

      <!-- COLUMNA DERECHA: FORM -->
      <div class="columna-derecha">
        <div class="dashboard-card">
          <h2 class="dashboard-title">Agregar Nuevo Equipo Médico</h2>
          <p class="subtitulo">Complete la información del equipo</p>

          <div class="info-scrolleable">

            <!-- 1. INFORMACIÓN GENERAL -->
            <div class="info-section">
              <h3 class="section-title">📋 Información General</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Servicio / Proceso: <span class="required">*</span></label>
                  <input type="text" v-model="nuevoEquipo.servicio" placeholder="Ej: Diagnóstico por Imágenes" />
                </div>

                <div class="info-item">
                  <label>Sede: <span class="required">*</span></label>
                  <select v-model="nuevoEquipo.sede">
                    <option value="">Seleccionar sede</option>
                    <option value="Prado">Prado</option>
                    <option value="SIU">SIU</option>
                    <option value="San Vicente">San Vicente</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Nombre del equipo: <span class="required">*</span></label>
                  <input type="text" v-model="nuevoEquipo.nombre_equipo" placeholder="Ej: Rayos X Digital" />
                </div>

                <div class="info-item">
                  <label>Código de inventario: <span class="required">*</span></label>
                  <input type="text" v-model="nuevoEquipo.codigo_inventario" placeholder="Ej: RX-001-LIME-2023" />
                </div>

                <div class="info-item">
                  <label>Código IPS:</label>
                  <input type="text" v-model="nuevoEquipo.codigo_ips" placeholder="Ej: IPS-RX-2023-045" />
                </div>

                <div class="info-item">
                  <label>Código ECRI:</label>
                  <input type="text" v-model="nuevoEquipo.codigo_ecri" placeholder="Ej: 16-725" />
                </div>

                <div class="info-item">
                  <label>Responsable:</label>
                  <input type="text" v-model="nuevoEquipo.responsable_proceso" placeholder="Ej: Dr. Carlos Martínez" />
                </div>

                <div class="info-item full-width">
                  <label>Ubicación física:</label>
                  <input type="text" v-model="nuevoEquipo.ubicacion_fisica" placeholder="Ej: Sala de Radiología 1 - Piso 2" />
                </div>

                <div class="info-item">
                  <label>Marca: <span class="required">*</span></label>
                  <input type="text" v-model="nuevoEquipo.marca" placeholder="Ej: Siemens" />
                </div>

                <div class="info-item">
                  <label>Modelo: <span class="required">*</span></label>
                  <input type="text" v-model="nuevoEquipo.modelo" placeholder="Ej: Luminos Agile Max" />
                </div>

                <div class="info-item">
                  <label>Serie:</label>
                  <input type="text" v-model="nuevoEquipo.serie" placeholder="Ej: SN-2023-RX-8947" />
                </div>

                <div class="info-item full-width">
                  <label>Clasificación eje misional:</label>
                  <input type="text" v-model="nuevoEquipo.clasificacion_eje_misional" placeholder="Ej: Docencia, Investigación, Extensión" />
                </div>

                <div class="info-item">
                  <label>Clasificación IPS:</label>
                  <input type="text" v-model="nuevoEquipo.clasificacion_ips" placeholder="Ej: IND" />
                </div>

                <div class="info-item">
                  <label>Clasificación por riesgo:</label>
                  <input type="text" v-model="nuevoEquipo.clasificacion_riesgo" placeholder="Ej: Clase IIB - Riesgo Alto" />
                </div>

                <div class="info-item full-width">
                  <label>Registro Invima:</label>
                  <input type="text" v-model="nuevoEquipo.registro_invima" placeholder="Ej: 2023DM-0012345" />
                </div>
              </div>
            </div>

            <!-- 2. REGISTRO HISTÓRICO -->
            <div class="info-section">
              <h3 class="section-title">📅 Registro Histórico</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Vida útil:</label>
                  <input type="text" v-model="nuevoEquipo.tiempo_vida_util" placeholder="Ej: 10 años" />
                </div>
                <div class="info-item">
                  <label>Fecha de adquisición:</label>
                  <input type="date" v-model="nuevoEquipo.fecha_adquisicion" />
                </div>
                <div class="info-item">
                  <label>Propietario:</label>
                  <input type="text" v-model="nuevoEquipo.propietario" placeholder="Ej: Universidad de Antioquia" />
                </div>
                <div class="info-item">
                  <label>Fecha de fabricación:</label>
                  <input type="text" v-model="nuevoEquipo.fecha_fabricacion" placeholder="Ej: 01/2023" />
                </div>
                <div class="info-item">
                  <label>NIT:</label>
                  <input type="text" v-model="nuevoEquipo.nit" placeholder="Ej: 890980040-8" />
                </div>
                <div class="info-item full-width">
                  <label>Proveedor:</label>
                  <input type="text" v-model="nuevoEquipo.proveedor_equipo" placeholder="Ej: Siemens Healthineers Colombia S.A.S." />
                </div>
                <div class="info-item">
                  <label>¿En garantía?:</label>
                  <select v-model="nuevoEquipo.garantia">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>
                <div class="info-item">
                  <label>Fin de garantía:</label>
                  <input type="date" v-model="nuevoEquipo.fecha_fin_garantia" />
                </div>
                <div class="info-item">
                  <label>Forma de adquisición:</label>
                  <input type="text" v-model="nuevoEquipo.forma_adquisicion" placeholder="Ej: Compra directa" />
                </div>
                <div class="info-item">
                  <label>Tipo de documento:</label>
                  <input type="text" v-model="nuevoEquipo.tipo_documento" placeholder="Ej: Factura" />
                </div>
                <div class="info-item">
                  <label>Número de documento:</label>
                  <input type="text" v-model="nuevoEquipo.numero_documento" placeholder="Ej: FV-2023-001234" />
                </div>
                <div class="info-item">
                  <label>Valor de compra:</label>
                  <input type="text" v-model="nuevoEquipo.valor_compra" placeholder="Ej: 150000000" />
                </div>
              </div>
            </div>

            <!-- 3. INVENTARIO DE DOCUMENTOS -->
            <div class="info-section">
              <h3 class="section-title">📄 Inventario de Documentos</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Hoja de vida:</label>
                  <select v-model="nuevoEquipo.hoja_vida">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Registro de importación:</label>
                  <input type="text" v-model="nuevoEquipo.registro_importacion" placeholder="Ej: RI-2023-0456" />
                </div>

                <div class="info-item">
                  <label>Manual de operación:</label>
                  <select v-model="nuevoEquipo.manual_operacion">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Manual de servicio:</label>
                  <input type="text" v-model="nuevoEquipo.manual_servicio" placeholder="Ej: Sí - Español" />
                </div>

                <div class="info-item">
                  <label>Guía rápida de uso:</label>
                  <select v-model="nuevoEquipo.guia_rapida_uso">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Instructivo manejo rápido:</label>
                  <select v-model="nuevoEquipo.instructivo_manejo_rapido">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Protocolo Mto. Preventivo:</label>
                  <input type="text" v-model="nuevoEquipo.protocolo_mantenimiento_preventivo" placeholder="Ej: Semestral" />
                </div>

                <div class="info-item">
                  <label>Frecuencia metrológica fabricante:</label>
                  <input type="text" v-model="nuevoEquipo.frecuencia_metrologica_fabricante" placeholder="Ej: Anual" />
                </div>
              </div>
            </div>

            <!-- 4. INFORMACIÓN METROLÓGICA ADMINISTRATIVA -->
            <div class="info-section">
              <h3 class="section-title">🔧 Información Metrológica Administrativa</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Requiere mantenimiento:</label>
                  <select v-model="nuevoEquipo.mantenimiento">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>
                <div class="info-item">
                  <label>Frecuencia mantenimiento:</label>
                  <input type="text" v-model="nuevoEquipo.frecuencia_mantenimiento" placeholder="Ej: 2 veces al año" />
                </div>
                <div class="info-item">
                  <label>Requiere calibración:</label>
                  <select v-model="nuevoEquipo.calibracion">
                    <option value="">Seleccionar</option>
                    <option value="Si">Sí</option>
                    <option value="No">No</option>
                  </select>
                </div>
                <div class="info-item">
                  <label>Frecuencia calibración:</label>
                  <input type="text" v-model="nuevoEquipo.frecuencia_calibracion" placeholder="Ej: 1 vez al año" />
                </div>
              </div>
            </div>

            <!-- 5. INFORMACIÓN METROLÓGICA TÉCNICA -->
            <div class="info-section">
              <h3 class="section-title">📐 Información Metrológica Técnica</h3>
              <div class="info-grid">
                <div class="info-item full-width">
                  <label>Magnitud:</label>
                  <input type="text" v-model="nuevoEquipo.magnitud" placeholder="Ej: Radiación ionizante (kV, mAs)" />
                </div>
                <div class="info-item full-width">
                  <label>Rango del equipo:</label>
                  <input type="text" v-model="nuevoEquipo.rango_equipo" placeholder="Ej: 40-150 kV, 1-500 mAs" />
                </div>
                <div class="info-item">
                  <label>Resolución:</label>
                  <input type="text" v-model="nuevoEquipo.resolucion" placeholder="Ej: 0.1 kV, 0.1 mAs" />
                </div>
                <div class="info-item">
                  <label>Rango de trabajo:</label>
                  <input type="text" v-model="nuevoEquipo.rango_trabajo" placeholder="Ej: 50-125 kV, 5-320 mAs" />
                </div>
                <div class="info-item full-width">
                  <label>Error máximo permitido:</label>
                  <input type="text" v-model="nuevoEquipo.error_max_permitido" placeholder="Ej: ±5% en kV, ±10% en mAs" />
                </div>
              </div>
            </div>

            <!-- 6. CONDICIONES DE FUNCIONAMIENTO -->
            <div class="info-section">
              <h3 class="section-title">⚡ Condiciones de Funcionamiento</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Voltaje:</label>
                  <input type="text" v-model="nuevoEquipo.voltaje" placeholder="Ej: 220V AC ± 10%" />
                </div>
                <div class="info-item">
                  <label>Corriente:</label>
                  <input type="text" v-model="nuevoEquipo.corriente" placeholder="Ej: 50/60 Hz, 32A máx." />
                </div>
                <div class="info-item">
                  <label>Humedad relativa:</label>
                  <input type="text" v-model="nuevoEquipo.humedad_relativa" placeholder="Ej: 30% - 75% sin condensación" />
                </div>
                <div class="info-item">
                  <label>Temperatura máxima:</label>
                  <input type="text" v-model="nuevoEquipo.temperatura_maxima" placeholder="Ej: 30°C" />
                </div>
                <div class="info-item">
                  <label>Dimensiones:</label>
                  <input type="text" v-model="nuevoEquipo.dimensiones" placeholder="Ej: 210 x 180 x 150 cm" />
                </div>
                <div class="info-item">
                  <label>Peso:</label>
                  <input type="text" v-model="nuevoEquipo.peso" placeholder="Ej: 650 kg" />
                </div>
                <div class="info-item full-width">
                  <label>Otros:</label>
                  <textarea v-model="nuevoEquipo.otros" placeholder="Información adicional" rows="3"></textarea>
                </div>
              </div>
            </div>

            <!-- 7. INFORMACIÓN EXTRA -->
            <div class="info-section">
              <h3 class="section-title">📌 Información Extra del Equipo</h3>
              <div class="info-grid">
                <div class="info-item">
                  <label>Estado:</label>
                  <select v-model="nuevoEquipo.estado">
                    <option value="">Seleccionar</option>
                    <option value="activo">Activo</option>
                    <option value="inactivo">Inactivo</option>
                    <option value="baja">De baja</option>
                  </select>
                </div>

                <div class="info-item">
                  <label>Motivo de baja:</label>
                  <input type="text" v-model="nuevoEquipo.motivo_baja" placeholder="Motivo de baja" />
                </div>

                <div class="info-item">
                  <label>Fecha de baja:</label>
                  <input type="date" v-model="nuevoEquipo.fecha_baja" />
                </div>

                <div class="info-item">
                  <label>Justificación traslado:</label>
                  <input type="text" v-model="nuevoEquipo.justificacion_traslado" placeholder="Ej: Cambio de área" />
                </div>

                <div class="info-item">
                  <label>Justificación baja:</label>
                  <input type="text" v-model="nuevoEquipo.justificacion_baja" placeholder="Ej: Obsoleto" />
                </div>
              </div>
            </div>

          </div>
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
        <p>El equipo <strong>{{ nuevoEquipo.nombre_equipo }}</strong> se creó correctamente.</p>
        <div class="modal-buttons" style="justify-content: center;">
          <button class="success-btn" @click="cerrarModalGuardado">Aceptar</button>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

export default {
  setup() {
    const router = useRouter();

    const API_URL = "http://127.0.0.1:8000/api/equipos/";
    
    const mostrarConfirmacion = ref(false);
    const mostrarGuardado = ref(false);

    // Objeto con nombres EXACTOS del modelo
    const nuevoEquipo = ref({
      // 1. INFORMACIÓN GENERAL
      servicio: "",
      sede: "",
      nombre_equipo: "",
      codigo_inventario: "",
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

      // 2. REGISTRO HISTÓRICO
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

      // 3. INVENTARIO DE DOCUMENTOS
      hoja_vida: "",
      registro_importacion: "",
      manual_operacion: "",
      manual_servicio: "",
      guia_rapida_uso: "",
      instructivo_manejo_rapido: "",
      protocolo_mantenimiento_preventivo: "",
      frecuencia_metrologica_fabricante: "",

      // 4. INFORMACIÓN METROLÓGICA ADMINISTRATIVA
      mantenimiento: "",
      frecuencia_mantenimiento: "",
      calibracion: "",
      frecuencia_calibracion: "",

      // 5. INFORMACIÓN METROLÓGICA TÉCNICA
      magnitud: "",
      rango_equipo: "",
      resolucion: "",
      rango_trabajo: "",
      error_max_permitido: "",

      // 6. CONDICIONES DE FUNCIONAMIENTO
      voltaje: "",
      corriente: "",
      humedad_relativa: "",
      temperatura_maxima: "",
      dimensiones: "",
      peso: "",
      otros: "",

      // EXTRA / ESTADO
      estado: "",
      motivo_baja: "",
      fecha_baja: "",
      justificacion_traslado: "",
      justificacion_baja: ""
    });

    const camposObligatorios = [
      "servicio",
      "sede",
      "nombre_equipo",
      "codigo_inventario",
      "responsable_proceso",
      "marca",
      "modelo",
      "estado"
    ];

    const llenarNI = (obj) => {
      const payload = {};
      for (const key in obj) {
        const val = obj[key];
        if (val === null || val === undefined) {
          payload[key] = "NI";
        } else if (typeof val === "string") {
          payload[key] = val.trim() === "" ? "NI" : val;
        } else {
          payload[key] = val;
        }
      }
      return payload;
    };

    const guardarEquipo = async () => {
      // 1) validar obligatorios
      for (const campo of camposObligatorios) {
        const val = nuevoEquipo.value[campo];
        if (!val || (typeof val === "string" && val.trim() === "")) {
          alert(`El campo obligatorio "${campo}" está vacío.`);
          return;
        }
      }

      // 2) preparar payload
      const payloadRaw = { ...nuevoEquipo.value };
      const payload = llenarNI(payloadRaw);

      // 3) enviar al backend
      try {
        const res = await axios.post(API_URL, payload);
        console.log("Respuesta backend:", res.data);
        mostrarGuardado.value = true;
      } catch (error) {
        console.error("Error al guardar equipo:", error);
        if (error.response && error.response.data) {
          const backendMsg = typeof error.response.data === "object"
            ? JSON.stringify(error.response.data, null, 2)
            : error.response.data;
          alert("Error desde backend:\n" + backendMsg);
        } else {
          alert("Ocurrió un error al guardar el equipo.");
        }
      }
    };

    const confirmarCancelacion = () => {
      mostrarConfirmacion.value = false;
      router.push({ name: "home" });
    };

    const cerrarModalGuardado = () => {
      mostrarGuardado.value = false;
      router.push({ name: "home" });
    };

    const volverDashboard = () => {
      mostrarConfirmacion.value = true;
    };

    return {
      nuevoEquipo,
      mostrarConfirmacion,
      mostrarGuardado,
      guardarEquipo,
      confirmarCancelacion,
      cerrarModalGuardado,
      volverDashboard
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
}

.cancel-btn:hover {
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

.subtitulo {
  font-size: 14px;
  color: #5a6c7d;
  margin: 5px 0 20px 0;
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

/* SECCIONES */
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

.required {
  color: #e74c3c;
  font-weight: 700;
}

.info-item input,
.info-item select,
.info-item textarea {
  font-size: 14px;
  color: #212a31;
  padding: 10px 12px;
  background: #f8f9fa;
  border: 2px solid #e0e0e0;
  border-radius: 8px;
  transition: all 0.3s ease;
  font-family: inherit;
}

.info-item input:focus,
.info-item select:focus,
.info-item textarea:focus {
  outline: none;
  border-color: #00bab3;
  background: white;
  box-shadow: 0 0 0 3px rgba(0, 186, 179, 0.1);
}

.info-item textarea {
  resize: vertical;
  min-height: 80px;
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

  .action-btn {
    min-width: unset;
  }
  
  .dashboard-title {
    font-size: 22px;
  }
  
  .section-title {
    font-size: 16px;
  }

  .btn-home {
    width: 45px;
    height: 45px;
    font-size: 22px;
  }

  .modal-content {
    padding: 24px 20px;
  }
}
</style>