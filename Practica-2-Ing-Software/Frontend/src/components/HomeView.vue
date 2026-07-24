<template>
  <div class="dashboard-container">
    <h2 class="dashboard-title">Panel de Control</h2>

    <!-- Tarjeta: Pacientes -->
    <div class="dashboard-card">
      <div class="card-header">
        <div class="card-icon paciente-icon">😷</div>
        <div class="card-info">
          <h3>Pacientes</h3>
          <p>Registro y control de pacientes</p>
        </div>
      </div>
      <div class="card-body">
        <h2 class="cantidad">{{ counts.pacientes }}</h2>
        <p class="total">TOTAL</p>
      </div>
      <div class="card-actions">
        <router-link to="/paciente/nuevo/" class="btn-primary">+ Nuevo</router-link>
        <router-link to="/pacientes" class="btn-secondary">Ver Todos</router-link>
      </div>
    </div>

    <!-- Tarjeta: Laboratoristas -->
    <div class="dashboard-card">
      <div class="card-header">
        <div class="card-icon laboratorista-icon">🧪</div>
        <div class="card-info">
          <h3>Laboratoristas</h3>
          <p>Gestión del personal</p>
        </div>
      </div>
      <div class="card-body">
        <h2 class="cantidad">{{ counts.laboratoristas }}</h2>
        <p class="total">TOTAL</p>
      </div>
      <div class="card-actions">
        <router-link to="/laboratorista/nuevo" class="btn-primary">+ Nuevo</router-link>
        <router-link to="/laboratoristas" class="btn-secondary">Ver Todos</router-link>
      </div>
    </div>

    <!-- Tarjeta: Resultados -->
    <div class="dashboard-card">
      <div class="card-header">
        <div class="card-icon resultado-icon">📊</div>
        <div class="card-info">
          <h3>Resultados</h3>
          <p>Consulta de resultados clínicos</p>
        </div>
      </div>
      <div class="card-body">
        <h2 class="cantidad">{{ counts.resultados }}</h2>
        <p class="total">TOTAL</p>
      </div>
      <div class="card-actions">
        <router-link to="/resultados/nuevo" class="btn-primary">+ Nuevo</router-link>
        <router-link to="/resultados" class="btn-secondary">Ver Todos</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HomeView",
  data() {
    return {
      counts: {
        pacientes: 0,
        laboratoristas: 0,
        resultados: 0,
      },
    };
  },
  methods: {
    async fetchCounts() {
      try {
        const response = await axios.get("http://localhost:8000/api/dashboard/counts/");
        this.counts = response.data;
      } catch (error) {
        console.error("Error al obtener los conteos:", error);
      }
    },
  },
  mounted() {
    this.fetchCounts();
  },
};
</script>

<style scoped>
.dashboard-container {
  display: flex;
  flex-direction: column;
  align-items: start;
  gap: 24px;
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
}

.dashboard-title {
  font-size: 24px;
  font-weight: 700;
  color: #1f2937;
  margin-bottom: 10px;
}

.dashboard-card {
  background: #ffffff;
  border-radius: 16px;
  padding: 20px 24px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
  width: 100%;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.dashboard-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
}

.card-header {
  display: flex;
  align-items: center;
  gap: 14px;
  margin-bottom: 10px;
}

.card-icon {
  width: 45px;
  height: 45px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
}

.paciente-icon {
  background: #7c3aed;
  color: #fff;
}

.laboratorista-icon {
  background: #10b981;
  color: #fff;
}

.resultado-icon {
  background: #f59e0b;
  color: #fff;
}

.card-info h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.card-info p {
  margin: 0;
  font-size: 14px;
  color: #6b7280;
}

.card-body {
  text-align: center;
  margin: 16px 0;
}

.cantidad {
  font-size: 24px;
  font-weight: 700;
  color: #1f2937;
}

.total {
  color: #6b7280;
  font-size: 14px;
}

.card-actions {
  display: flex;
  gap: 10px;
  justify-content: center;
}

.btn-primary,
.btn-secondary {
  text-decoration: none;
  padding: 8px 16px;
  border-radius: 10px;
  font-weight: 600;
  font-size: 14px;
  transition: all 0.3s ease;
}

.btn-primary {
  background: #f4c542;
  color: #fff;
  border: none;
}

.btn-primary:hover {
  background: #eab308;
}

.btn-secondary {
  background: #f3f4f6;
  color: #111827;
}

.btn-secondary:hover {
  background: #e5e7eb;
}

.label {
  font-size: 14px;
  font-weight: 500;
  color: #374151;
}

.input-group {
  display: flex;
  margin-top: 8px;
}

.input {
  flex: 1;
  padding: 8px 12px;
  border: 1px solid #d1d5db;
  border-radius: 8px 0 0 8px;
  outline: none;
  font-size: 14px;
}

.input:focus {
  border-color: #f4c542;
}

.input-group .btn-primary {
  border-radius: 0 8px 8px 0;
}

@media (max-width: 768px) {
  .dashboard-container {
    padding: 10px;
  }

  .card-actions {
    flex-direction: column;
    gap: 8px;
  }

  .input-group {
    flex-direction: column;
  }

  .input-group .btn-primary {
    border-radius: 8px;
    margin-top: 6px;
  }
}
</style>
