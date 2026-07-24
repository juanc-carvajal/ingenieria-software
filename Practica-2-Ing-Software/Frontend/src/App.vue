<template>
  <div id="app">
    <!-- Contenedor principal con sidebar y contenido -->
    <div class="app-layout">
      <!-- 🔸 Sidebar lateral fijo -->
      <aside class="sidebar">
        <div class="sidebar-header">
          <!-- Ícono personalizado -->
          <img src="@/assets/logo.png" alt="Logo Fedora" class="sidebar-logo" />
        </div>
        <nav class="sidebar-menu">
          <router-link to="/" class="menu-item">
            🏠 Home
          </router-link>
          <router-link to="/pacientes" class="menu-item">
            😷 Pacientes
          </router-link>
          <router-link to="/laboratoristas" class="menu-item">
            🧪 Laboratoristas
          </router-link>
          <router-link to="/resultados" class="menu-item">
            📊 Resultados
          </router-link>

        </nav>
      </aside>

      <!-- 🔹 Contenido dinámico (todas las vistas) -->
      <main class="main-content">
        <router-view />
      </main>
    </div>
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
/* --- RESET GLOBAL --- */
html,
body,
#app {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  font-family: "Inter", sans-serif;
  background: linear-gradient(135deg, #7e5bef 0%, #10b981 100%);
  background-attachment: fixed;
  overflow: hidden;
}

/* --- LAYOUT PRINCIPAL --- */
.app-layout {
  display: flex;
  height: 100vh;
  width: 100vw;
}

/* --- SIDEBAR --- */
.sidebar {
  width: 250px;
  background: linear-gradient(180deg, #f8d57e 0%, #ffffff 100%);
  color: #333;
  display: flex;
  flex-direction: column;
  padding: 24px 16px;
  box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
  border-right: 1px solid rgba(0, 0, 0, 0.05);
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  overflow-y: auto;
}

.sidebar::-webkit-scrollbar {
  width: 6px;
}
.sidebar::-webkit-scrollbar-thumb {
  background: rgba(0, 0, 0, 0.2);
  border-radius: 3px;
}

/* --- HEADER DEL SIDEBAR --- */
.sidebar-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 30px;
}

.sidebar-icon {
  font-size: 24px;
}

.sidebar-title {
  font-size: 18px;
  font-weight: 700;
  color: #444;
  margin: 0;
}

/* --- MENÚ DEL SIDEBAR --- */
.sidebar-menu {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.menu-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 14px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 500;
  color: #333;
  transition: all 0.2s ease;
}

.menu-item:hover {
  background: rgba(255, 255, 255, 0.8);
  transform: translateX(4px);
}

.menu-item.active {
  background: #f4c542;
  color: #fff;
  font-weight: 600;
  box-shadow: 0 2px 8px rgba(244, 197, 66, 0.4);
}

.menu-icon {
  font-size: 18px;
}

/* --- CONTENIDO PRINCIPAL --- */
.main-content {
  margin-left: 250px; /* mismo ancho del sidebar */
  padding: 30px;
  width: calc(100vw - 250px);
  height: 100vh;
  overflow-y: auto;
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(10px);
  border-top-left-radius: 16px;
}

/* --- SCROLL SUAVE EN CONTENIDO --- */
.main-content::-webkit-scrollbar {
  width: 8px;
}
.main-content::-webkit-scrollbar-thumb {
  background: rgba(0, 0, 0, 0.2);
  border-radius: 4px;
}

/* --- RESPONSIVE --- */
@media (max-width: 768px) {
  .sidebar {
    width: 200px;
    padding: 16px;
  }

  .main-content {
    margin-left: 200px;
    padding: 20px;
  }
}
.sidebar-logo {
  width: 80%;
  height: auto;
  filter: brightness(0) invert(1);
}
</style>
