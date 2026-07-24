<template>
  <div class="app-container">
    <div class="top-section">
      <!-- Logo y botones de sedes en la misma fila -->
      <div class="header-row">
        <div class="logo-container">
          <img src="../assets/lime.png" alt="Logo LIME" class="main-logo" />
        </div>
        
        <div class="sedes-row">
          <button 
            class="sede-btn" 
            :class="{ 'sede-activa': sedeActual === 'Prado' }"
            @click="sedeActual = 'Prado'">
            Prado
          </button>
          <button 
            class="sede-btn" 
            :class="{ 'sede-activa': sedeActual === 'SIU' }"
            @click="sedeActual = 'SIU'">
            SIU
          </button>
          <button 
            class="sede-btn" 
            :class="{ 'sede-activa': sedeActual === 'San Vicente' }"
            @click="sedeActual = 'San Vicente'">
            San Vicente
          </button>
        </div>
      </div>

      <!-- Dashboard principal -->
      <div class="dashboard-card">
        <h2 class="dashboard-title"> Sede {{ sedeActual }}</h2>
        
        <div class="dashboard-grid">
          <!-- Columna 1: Gráfico de torta -->
          <div class="chart-container">
            <h3 class="chart-title">Distribución de Equipos</h3>
            
            <div class="chart-content-wrapper">
              <div class="pie-chart">
                <svg viewBox="0 0 200 200" class="pie-svg">
                  <!-- Círculo de fondo -->
                  <circle cx="100" cy="100" r="80" fill="transparent" />
                  
                  <!-- Segmentos de la torta -->
                  <path 
                    v-for="(segment, index) in pieSegments" 
                    :key="index"
                    :d="segment.path" 
                    :fill="segment.color"
                    class="pie-segment"
                    @mouseenter="hoveredSegment = index"
                    @mouseleave="hoveredSegment = null"
                    :class="{ 'hovered': hoveredSegment === index }"
                  />
                  
                  <!-- Círculo central para hacer efecto donut -->
                  <circle cx="100" cy="100" r="50" fill="#ffffff" />
                  
                  <!-- Texto central -->
                  <text x="100" y="95" text-anchor="middle" class="total-label">Total</text>
                  <text x="100" y="115" text-anchor="middle" class="total-number">{{ totalEquipos }}</text>
                </svg>
              </div>
              
              <div class="chart-legend">
                <div class="legend-item" 
                     @mouseenter="hoveredSegment = 0"
                     @mouseleave="hoveredSegment = null">
                  <span class="legend-color activo"></span>
                  <span>Activos: {{ equiposData.activos }}</span>
                </div>
                <div class="legend-item"
                     @mouseenter="hoveredSegment = 1"
                     @mouseleave="hoveredSegment = null">
                  <span class="legend-color inactivo"></span>
                  <span>Inactivos: {{ equiposData.inactivos }}</span>
                </div>
                <div class="legend-item"
                     @mouseenter="hoveredSegment = 2"
                     @mouseleave="hoveredSegment = null">
                  <span class="legend-color baja"></span>
                  <span>De Baja: {{ equiposData.baja }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Columna 2: Cards de equipos -->
          <div class="equipos-column">
            <div class="equipo-card activo">
              <h3>🟢 Equipos Activos</h3>
              <p>Buscar equipos en funcionamiento</p>
              <button class="equipo-btn" @click="irAEquipos('activo')">Ver Equipos</button>
            </div>

            <div class="equipo-card inactivo">
              <h3>🟠 Equipos Inactivos</h3>
              <p>Buscar equipos fuera de servicio</p>
              <button class="equipo-btn" @click="irAEquipos('inactivo')">Ver Equipos</button>
            </div>

            <div class="equipo-card baja">
              <h3>🔴 Equipos de Baja</h3>
              <p>Buscar equipos dados de baja</p>
              <button class="equipo-btn" @click="irAEquipos('baja')">Ver Equipos</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pie de página -->
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-logos">
          <div class="footer-logo-item">
            <img src="../assets/lime.png" alt="Logo 1" class="footer-logo" />
          </div>
          <div class="footer-logo-item">
            <img src="../assets/facultad.png" alt="Logo 2" class="footer-logo" />
          </div>
          <div class="footer-logo-item">
            <img src="../assets/alma.png" alt="Logo 3" class="footer-logo" />
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

const API_URL = "http://127.0.0.1:8000/api/equipos/";

const sedeActual = ref("Prado");
const router = useRouter();
const hoveredSegment = ref(null);

// Datos que alimentan el gráfico
const equiposData = ref({
  activos: 0,
  inactivos: 0,
  baja: 0
});

// =====================================================
// 🔥 FUNCIÓN PARA CARGAR DATOS DESDE EL BACKEND POR SEDE
// =====================================================
const cargarEquiposPorSede = async () => {
  try {
    const res = await axios.get(API_URL);
    const equipos = res.data;

    // Filtrar por sede actual
    const filtrados = equipos.filter(
      (e) => e.sede && e.sede.toLowerCase() === sedeActual.value.toLowerCase()
    );

    // Contar activos, inactivos y baja
    equiposData.value = {
      activos: filtrados.filter((e) => e.estado === "activo").length,
      inactivos: filtrados.filter((e) => e.estado === "inactivo").length,
      baja: filtrados.filter((e) => e.estado === "baja").length,
    };

    console.log("Equipos por sede:", sedeActual.value, equiposData.value);

  } catch (error) {
    console.error("Error cargando equipos:", error);
  }
};

// Llamar backend al cargar la vista
onMounted(() => {
  cargarEquiposPorSede();
});

// Llamar backend cuando cambia la sede
watch(sedeActual, () => {
  cargarEquiposPorSede();
});

// =====================================================
// TOTAL DE EQUIPOS107550
// =====================================================
const totalEquipos = computed(() => {
  return equiposData.value.activos +
         equiposData.value.inactivos +
         equiposData.value.baja;
});

// =====================================================
// GRÁFICO DE TORTA
// =====================================================
const pieSegments = computed(() => {
  const data = [
    { value: equiposData.value.activos, color: '#107550' },
    { value: equiposData.value.inactivos, color: '#f0b889' },
    { value: equiposData.value.baja, color: '#e89b9b' }
  ];

  const total = totalEquipos.value;

  // Caso especial: si solo un valor es mayor que 0 => círculo completo
  const nonZero = data.filter(d => d.value > 0);
  if (nonZero.length === 1) {
    const item = nonZero[0];

    const path = [
      `M 100 100`,
      `M 100 20`, // mover al borde superior
      `A 80 80 0 1 1 99.9 20`, // círculo completo
      `Z`
    ].join(' ');

    return [
      {
        path,
        color: item.color
      }
    ];
  }

  // Caso general
  let currentAngle = -90;

  return data.map(item => {
    const percentage = item.value / total;
    const angle = percentage * 360;

    const startAngle = currentAngle;
    const endAngle = currentAngle + angle;

    currentAngle = endAngle;

    // Radianes
    const startRad = (startAngle * Math.PI) / 180;
    const endRad = (endAngle * Math.PI) / 180;

    // Coordenadas del arco
    const x1 = 100 + 80 * Math.cos(startRad);
    const y1 = 100 + 80 * Math.sin(startRad);
    const x2 = 100 + 80 * Math.cos(endRad);
    const y2 = 100 + 80 * Math.sin(endRad);

    const largeArc = angle > 180 ? 1 : 0;

    const path = [
      `M 100 100`,
      `L ${x1} ${y1}`,
      `A 80 80 0 ${largeArc} 1 ${x2} ${y2}`,
      `Z`
    ].join(' ');

    return {
      path,
      color: item.color
    };
  });
});


// Navegar al listado con la categoría y sede seleccionadas
const irAEquipos = (categoria) => {
  router.push({
    name: "equipos",
    query: { sede: sedeActual.value, categoria }
  });
};
</script>


<style>
/* Estilos globales (sin scoped) */
html, body {
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.app-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  background: #244652;
  overflow: hidden;
}

.top-section {
  display: flex;
  flex-direction: column;
  gap: 15px;
  flex: 1;
  padding: 30px 40px 15px 40px;
  box-sizing: border-box;
  overflow: hidden;
}

/* Header con logo y botones */
.header-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  gap: 15px;
}

.main-logo {
  height: 80px;
  width: auto;
  object-fit: contain;
  filter: brightness(0) invert(1);
}

/* Botones de sedes en fila horizontal - alineados a la derecha */
.sedes-row {
  display: flex;
  gap: 20px;
  justify-content: flex-end;
  align-items: center;
  flex-wrap: wrap;
}

.sede-btn {
  background: rgba(255, 255, 255, 0.95);
  border: none;
  padding: 10px 30px;
  border-radius: 14px;
  box-shadow: none;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #244652;
  font-weight: 600;
  font-size: 20px;
  white-space: nowrap;
}

.sede-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
  background: #ffffff;
}

.sede-btn:active {
  transform: translateY(-1px);
}

/* Estilo para la sede activa */
.sede-activa {
  background: #00bab3 !important;
  color: white !important;
  box-shadow: 0 4px 16px rgba(0, 186, 179, 0.4) !important;
  transform: translateY(-3px);
}

.sede-activa:hover {
  background: #009a94 !important;
  box-shadow: 0 6px 20px rgba(0, 186, 179, 0.5) !important;
}

.dashboard-card {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 28px;
  padding: 25px;
  box-shadow: none;
  backdrop-filter: blur(10px);
  width: 100%;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 18px;
  box-sizing: border-box;
  overflow: auto;
}

.dashboard-title {
  margin: 0;
  font-size: 24px;
  font-weight: 700;
  color: #244652;
}

/* Grid principal: 2 columnas */
.dashboard-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 18px;
  flex: 1;
  overflow: hidden;
  min-height: 0;
}

/* Contenedor del gráfico (columna 1) */
.chart-container {
  background: #ffffff;
  border-radius: 18px;
  padding: 20px;
  box-shadow: none;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 15px;
  border-left: 4px solid #00bab3;
  min-height: 0;
}

.chart-content-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 30px;
  width: 100%;
  max-width: 420px;
  margin: 0 auto;
}

.chart-title {
  margin: 0;
  font-size: 18px;
  font-weight: 700;
  color: #212a31;
  text-align: center;
}

.pie-chart {
  width: 100%;
  max-width: 100%;
  aspect-ratio: 1;
  flex-shrink: 0;
}

.pie-svg {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 2px 8px rgba(0, 0, 0, 0.1));
}

.pie-segment {
  cursor: pointer;
  transition: all 0.3s ease;
  transform-origin: center;
}

.pie-segment:hover,
.pie-segment.hovered {
  opacity: 0.85;
  filter: brightness(1.1);
}

.total-label {
  font-size: 11px;
  fill: #5a6c7d;
  font-weight: 500;
}

.total-number {
  font-size: 20px;
  fill: #212a31;
  font-weight: 700;
}

.chart-legend {
  display: flex;
  flex-direction: column;
  gap: 12px;
  width: auto;
  min-width: 150px;
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: #5a6c7d;
  font-weight: 500;
  cursor: pointer;
  padding: 6px;
  border-radius: 6px;
  transition: all 0.2s ease;
}

.legend-item:hover {
  background: #f5f5f5;
}

.legend-color {
  width: 16px;
  height: 16px;
  border-radius: 4px;
  flex-shrink: 0;
}

.legend-color.activo {
  background: #107550;
}

.legend-color.inactivo {
  background: #f0b889;
}

.legend-color.baja {
  background: #e89b9b;
}

/* Columna de equipos (columna 2) */
.equipos-column {
  display: flex;
  flex-direction: column;
  gap: 15px;
  overflow: auto;
}

.equipo-card {
  background: #ffffff;
  border-radius: 18px;
  padding: 20px;
  box-shadow: none;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: all 0.3s ease;
  border-left: 4px solid;
  flex: 1;
  min-height: 120px;
}

.equipo-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.equipo-card.activo {
  border-left-color: #81d742;
  background: #f8fff3;
}

.equipo-card.inactivo {
  border-left-color: #f0b889;
  background: #fff9f3;
}

.equipo-card.baja {
  border-left-color: #e89b9b;
  background: #fff5f5;
}

.equipo-card h3 {
  margin: 0 0 8px 0;
  font-size: 18px;
  font-weight: 700;
  color: #212a31;
}

.equipo-card p {
  margin: 0 0 16px 0;
  color: #5a6c7d;
  font-size: 13px;
  line-height: 1.4;
}

.equipo-btn {
  background: #00bab3;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 10px;
  cursor: pointer;
  font-size: 13px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: none;
}

.equipo-btn:hover {
  background: #009a94;
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 186, 179, 0.3);
}

.equipo-btn:active {
  transform: translateY(0);
}

/* Footer / Pie de página */
.footer-content {
  display: flex;
  justify-content: center;
  align-items: center;
}

.footer-logos {
  display: flex;
  gap: 40px;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
}

.footer {
  background: #212a31;
  padding: 2px 0;
  box-shadow: none;
}

.footer-logo-item {
  background: transparent;
  padding: 5px 15px;
  border-radius: 8px;
  box-shadow: none;
  transition: all 0.3s ease;
}

.footer-logo {
  height: 30px;
  width: auto;
  object-fit: contain;
  filter: brightness(0) invert(1);
}

/* ============================================
   MEDIA QUERIES PARA RESPONSIVIDAD
   ============================================ */

/* Tablets y pantallas medianas (hasta 1024px) */
@media (max-width: 1024px) {
  .top-section {
    padding: 20px 25px 10px 25px;
  }

  .main-logo {
    height: 60px;
  }

  .sede-btn {
    padding: 8px 20px;
    font-size: 16px;
  }

  .dashboard-card {
    padding: 20px;
  }

  .dashboard-title {
    font-size: 20px;
  }

  .chart-title {
    font-size: 16px;
  }

  .equipo-card h3 {
    font-size: 16px;
  }
}

/* Rango específico: Leyendas debajo del gráfico (1100px a 700px) */
@media (max-width: 1100px) and (min-width: 700px) {
  .chart-content-wrapper {
    flex-direction: column;
    gap: 20px;
    max-width: 100%;
  }

  .pie-chart {
    max-width: 260px;
  }

  .chart-legend {
    flex-direction: row;
    justify-content: center;
    gap: 20px;
    width: 100%;
    min-width: auto;
  }

  .legend-item {
    flex-direction: row;
  }
}

/* Tablets pequeños y móviles horizontales (hasta 768px) */
@media (max-width: 768px) {
  .top-section {
    padding: 15px 15px 10px 15px;
    gap: 10px;
  }

  .header-row {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }

  .main-logo {
    height: 50px;
  }

  .sedes-row {
    width: 100%;
    justify-content: center;
    gap: 10px;
  }

  .sede-btn {
    padding: 8px 16px;
    font-size: 14px;
    flex: 1;
    min-width: 80px;
  }

  .dashboard-card {
    padding: 15px;
    border-radius: 20px;
  }

  .dashboard-title {
    font-size: 18px;
  }

  /* El grid se convierte en una sola columna */
  .dashboard-grid {
    grid-template-columns: 1fr;
    gap: 15px;
    overflow-y: auto;
  }

  .chart-container {
    padding: 15px;
  }

  .chart-content-wrapper {
    gap: 20px;
    max-width: 350px;
  }

  .chart-legend {
    width: auto;
    min-width: 140px;
  }

  .equipos-column {
    gap: 12px;
  }

  .equipo-card {
    padding: 15px;
    min-height: 100px;
  }

  .equipo-card h3 {
    font-size: 15px;
  }

  .equipo-card p {
    font-size: 12px;
  }

  .footer-logos {
    gap: 20px;
  }

  .footer-logo {
    height: 25px;
  }
}

/* Móviles pequeños (hasta 480px) */
@media (max-width: 480px) {
  .top-section {
    padding: 10px 10px 8px 10px;
  }

  .main-logo {
    height: 40px;
  }

  .sedes-row {
    gap: 8px;
  }

  .sede-btn {
    padding: 6px 12px;
    font-size: 12px;
    border-radius: 10px;
  }

  .dashboard-card {
    padding: 12px;
    border-radius: 16px;
    gap: 12px;
  }

  .dashboard-title {
    font-size: 16px;
  }

  .chart-container {
    padding: 12px;
  }

  .chart-title {
    font-size: 14px;
  }

  .chart-content-wrapper {
    gap: 15px;
    max-width: 240px;
  }

  .chart-legend {
    min-width: 120px;
  }

  .legend-item {
    font-size: 11px;
  }

  .total-label {
    font-size: 10px;
  }

  .total-number {
    font-size: 16px;
  }

  .chart-content-wrapper {
    gap: 10px;
    max-width: 200px;
  }

  .chart-legend {
    min-width: 100px;
  }

  .legend-item {
    font-size: 10px;
    padding: 4px;
    gap: 6px;
  }

  .legend-color {
    width: 12px;
    height: 12px;
  }

  .equipos-column {
    gap: 10px;
  }

  .equipo-card {
    padding: 12px;
    border-radius: 14px;
  }

  .equipo-card h3 {
    font-size: 14px;
    margin-bottom: 6px;
  }

  .equipo-card p {
    font-size: 11px;
    margin-bottom: 12px;
  }

  .equipo-btn {
    padding: 8px 16px;
    font-size: 12px;
    border-radius: 8px;
  }

  .footer-logos {
    gap: 15px;
  }

  .footer-logo-item {
    padding: 3px 10px;
  }

  .footer-logo {
    height: 20px;
  }
}

/* Móviles extra pequeños (hasta 360px) */
@media (max-width: 360px) {
  .sede-btn {
    font-size: 11px;
    padding: 5px 10px;
  }

  .dashboard-title {
    font-size: 14px;
  }

  .chart-content-wrapper {
    gap: 8px;
    max-width: 180px;
  }

  .chart-legend {
    min-width: 90px;
  }

  .legend-item {
    font-size: 9px;
    gap: 4px;
  }
}
</style>