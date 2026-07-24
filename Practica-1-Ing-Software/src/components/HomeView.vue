<template>
  <!-- Dashboard Cards -->
  <div class="dashboard-cards">
    <!-- Estado de error global -->
    <div v-if="error" class="error-banner">
      <p>{{ error }}</p>
      <button @click="refrescarDashboard" class="btn-refresh">Reintentar</button>
    </div>

    <!-- Ubicaciones Card -->
    <div class="card ubicaciones-card" :class="{ 'loading': loading.ubicaciones }">
      <div class="card-header">
        <div class="card-icon ubicaciones-icon">
          <span>📍</span>
        </div>
        <div class="card-title">
          <h3>Ubicaciones</h3>
          <p>Gestión de ubicaciones del centro médico</p>
        </div>
      </div>
      
      <div class="card-body">
        <div class="card-number">{{ ubicacionesTotal }}</div>
        <div class="card-label">Total</div>
      </div>

      <div class="card-actions">
        <button @click="nuevaUbicacion" class="btn btn-primary">
          <span class="btn-icon">+</span>
          Nueva Ubicación
        </button>
        <button @click="irAUbicaciones" class="btn btn-secondary">
          <span class="btn-icon">📋</span>
          Ver Todas
        </button>
      </div>
    </div>

    <!-- Responsables Card -->
    <div class="card responsables-card" :class="{ 'loading': loading.responsables }">
      <div class="card-header">
        <div class="card-icon responsables-icon">
          <span>👥</span>
        </div>
        <div class="card-title">
          <h3>Responsables</h3>
          <p>Personal responsable de equipos</p>
        </div>
      </div>
      
      <div class="card-body">
        <div class="card-number">{{ responsablesTotal }}</div>
        <div class="card-label">Total</div>
      </div>

      <div class="card-actions">
        <button @click="nuevoResponsable" class="btn btn-primary">
          <span class="btn-icon">+</span>
          Nuevo Responsable
        </button>
        <button @click="irAResponsables" class="btn btn-secondary">
          <span class="btn-icon">📋</span>
          Ver Todos
        </button>
      </div>
    </div>

    <!-- Equipos Médicos Card -->
    <div class="card equipos-card" :class="{ 'loading': loading.equipos }">
      <div class="card-header">
        <div class="card-icon equipos-icon">
          <span>🩺</span>
        </div>
        <div class="card-title">
          <h3>Equipos Médicos</h3>
          <p>Inventario de equipos médicos</p>
        </div>
      </div>
      
      <div class="card-body">
        <div class="card-number">{{ equiposTotal }}</div>
        <div class="card-label">Total</div>
      </div>

      <div class="card-actions">
        <button @click="nuevoEquipo" class="btn btn-primary">
          <span class="btn-icon">+</span>
          Nuevo Equipo
        </button>
        <button @click="irAEquipos" class="btn btn-secondary">
          <span class="btn-icon">📋</span>
          Ver Todos
        </button>
      </div>
    </div>

    <!-- Botón para refrescar dashboard -->
    <!-- <div class="refresh-section">
      <button 
        @click="refrescarDashboard" 
        class="btn btn-refresh"
        :disabled="todosCargando"
      >
        <span class="btn-icon">🔄</span>
        {{ todosCargando ? 'Actualizando...' : 'Actualizar Dashboard' }}
      </button>
    </div> -->
  </div>
</template>

<script>
export default {
  name: 'HospitalHome',
  data() {
    return {
      sidebarOpen: true,
      activeRoute: 'home',
      loading: {
        ubicaciones: false,
        responsables: false,
        equipos: false
      },
      ubicaciones: {
        total: 0
      },
      responsables: {
        total: 0
      },
      equipos: {
        total: 0
      },
      error: null
    }
  },
  created() {
    // Cargar datos al crear el componente
    this.cargarDashboard();
  },
  methods: {
    toggleSidebar() {
      this.sidebarOpen = !this.sidebarOpen;
    },
    
    setActiveRoute(route) {
      this.activeRoute = route;
    },

    // Cargar todos los datos del dashboard
    async cargarDashboard() {
      try {
        // Ejecutar todas las consultas en paralelo para mejor rendimiento
        await Promise.all([
          this.cargarUbicaciones(),
          this.cargarResponsables(),
          this.cargarEquipos()
        ]);
        console.log('Dashboard cargado exitosamente');
      } catch (error) {
        console.error('Error cargando dashboard:', error);
        this.error = 'Error al cargar los datos del dashboard';
      }
    },

    // Cargar cantidad de ubicaciones
    async cargarUbicaciones() {
      this.loading.ubicaciones = true;
      try {
        const respuesta = await fetch('http://localhost/pacientes/ubicaciones.php');
        if (!respuesta.ok) {
          throw new Error('Error en la respuesta del servidor');
        }
        const datos = await respuesta.json();
        
        if (Array.isArray(datos)) {
          this.ubicaciones.total = datos.length;
        } else {
          this.ubicaciones.total = 0;
        }
        
        console.log('Ubicaciones cargadas:', this.ubicaciones.total);
      } catch (error) {
        console.error('Error cargando ubicaciones:', error);
        this.ubicaciones.total = 'Error';
      } finally {
        this.loading.ubicaciones = false;
      }
    },

    // Cargar cantidad de responsables
    async cargarResponsables() {
      this.loading.responsables = true;
      try {
        const respuesta = await fetch('http://localhost/pacientes/responsables.php');
        if (!respuesta.ok) {
          throw new Error('Error en la respuesta del servidor');
        }
        const datos = await respuesta.json();
        
        if (Array.isArray(datos)) {
          this.responsables.total = datos.length;
        } else {
          this.responsables.total = 0;
        }
        
        console.log('Responsables cargados:', this.responsables.total);
      } catch (error) {
        console.error('Error cargando responsables:', error);
        this.responsables.total = 'Error';
      } finally {
        this.loading.responsables = false;
      }
    },

    // Cargar cantidad de equipos médicos
    async cargarEquipos() {
      this.loading.equipos = true;
      try {
        const respuesta = await fetch('http://localhost/pacientes/equipos_medicos.php');
        if (!respuesta.ok) {
          throw new Error('Error en la respuesta del servidor');
        }
        const datos = await respuesta.json();
        
        if (Array.isArray(datos)) {
          this.equipos.total = datos.length;
        } else {
          this.equipos.total = 0;
        }
        
        console.log('Equipos médicos cargados:', this.equipos.total);
      } catch (error) {
        console.error('Error cargando equipos médicos:', error);
        this.equipos.total = 'Error';
      } finally {
        this.loading.equipos = false;
      }
    },

    // Método para refrescar todos los datos
    refrescarDashboard() {
      this.error = null;
      this.cargarDashboard();
    },

    // Métodos para navegar a cada sección (opcional)
    irAUbicaciones() {
      // Aquí puedes agregar la lógica para navegar a la página de ubicaciones
      console.log('Navegando a ubicaciones...');
      this.$router.push('/ubicacion');
      // Ejemplo: this.$router.push('/ubicaciones');
    },

    irAResponsables() {
      // Aquí puedes agregar la lógica para navegar a la página de responsables
      console.log('Navegando a responsables...');
      this.$router.push('/personal');
      // Ejemplo: this.$router.push('/responsables');
    },

    irAEquipos() {
      // Aquí puedes agregar la lógica para navegar a la página de equipos
      console.log('Navegando a equipos médicos...');
      this.$router.push('/equipos');
      // Ejemplo: this.$router.push('/equipos');
    },

    // Métodos para crear nuevos registros (opcional)
    nuevaUbicacion() {
      this.$router.push('/ubicacion/nueva');
    },

    nuevoResponsable() {
      console.log('Creando nuevo responsable...');
      this.$router.push('/personal/nuevo');
    },

    nuevoEquipo() {
      console.log('Creando nuevo equipo médico...');
      this.$router.push('/equipo/nuevo');
    }
  },

  // Computed properties para mostrar estados de carga
  computed: {
    todosCargando() {
      return this.loading.ubicaciones || this.loading.responsables || this.loading.equipos;
    },

    // Formatear números para mostrar
    ubicacionesTotal() {
      if (this.loading.ubicaciones) return '...';
      if (this.ubicaciones.total === 'Error') return '⚠️';
      return this.ubicaciones.total;
    },

    responsablesTotal() {
      if (this.loading.responsables) return '...';
      if (this.responsables.total === 'Error') return '⚠️';
      return this.responsables.total;
    },

    equiposTotal() {
      if (this.loading.equipos) return '...';
      if (this.equipos.total === 'Error') return '⚠️';
      return this.equipos.total;
    }
  }
};
</script>


<style scoped>
/* Dashboard Cards */
.dashboard-cards {
  margin: 0 auto; 
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 30px;
  max-width: 1200px;
}

/* Error banner */
.error-banner {
  grid-column: 1 / -1;
  background: #fee;
  border: 1px solid #fcc;
  border-radius: 8px;
  padding: 15px;
  text-align: center;
  color: #c33;
}

.btn-refresh {
  background: #ff6b6b;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
  margin-top: 10px;
}

.btn-refresh:hover {
  background: #ff5252;
}

.card {
  background: white;
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  border: 1px solid #e8ecf0;
  position: relative;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

/* Estado de carga */
.card.loading {
  opacity: 0.7;
}

.card.loading::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 20px;
  height: 20px;
  margin: -10px 0 0 -10px;
  border: 2px solid #f3f3f3;
  border-top: 2px solid #667eea;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
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
  font-size: 20px;
  margin-right: 15px;
}

.ubicaciones-icon {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
}

.responsables-icon {
  background: linear-gradient(135deg, #11998e, #38ef7d);
  color: white;
}

.equipos-icon {
  background: linear-gradient(135deg, #fc7c7c, #ffb347);
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
  text-align: center;
  margin: 25px 0;
}

.card-number {
  font-size: 48px;
  font-weight: 700;
  color: #2c3e50;
  margin-bottom: 8px;
  transition: all 0.3s ease;
}

.card-label {
  font-size: 14px;
  color: #7f8c8d;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.card-actions {
  display: flex;
  gap: 12px;
}

.btn {
  flex: 1;
  padding: 12px 16px;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-primary {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
}

.btn-primary:hover:not(:disabled) {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
}

.btn-secondary {
  background: #f8f9fa;
  color: #6c757d;
  border: 1px solid #dee2e6;
}

.btn-secondary:hover:not(:disabled) {
  background: #e9ecef;
  color: #495057;
}

.btn-icon {
  font-size: 12px;
}

/* Sección de refresh */
.refresh-section {
  grid-column: 1 / -1;
  text-align: center;
  margin-top: 20px;
}

.btn-refresh {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-refresh:hover:not(:disabled) {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
}

/* Responsive Design */
@media (max-width: 768px) {
  .header {
    padding: 15px 20px;
    flex-direction: column;
    text-align: center;
    gap: 15px;
  }

  .header-right {
    text-align: center;
  }

  .company-name {
    font-size: 20px;
  }

  .sidebar {
    width: 70px;
  }

  .sidebar-collapsed {
    width: 70px;
  }

  .nav-text {
    display: none;
  }

  .main-content {
    padding: 40px 0 0 0;
  }

  .dashboard-cards {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .card-actions {
    flex-direction: column;
  }
}

@media (max-width: 480px) {
  .card {
    padding: 20px;
  }

  .card-number {
    font-size: 36px;
  }
}
</style>