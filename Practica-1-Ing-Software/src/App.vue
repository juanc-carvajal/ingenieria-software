<template>
  <!-- Header -->
  <header class="header">
    <div class="header-left">
      <img src="./assets/logo.png" alt="Logo" class="logo" />
      <div class="company-info">
        <h1 class="company-name">Fedora INC</h1>
        <p class="system-name">Sistema de gestión hospitalaria</p>
      </div>
    </div>

    <nav class="header-nav">
      <router-link to="/">Home</router-link>
      <router-link to="/ubicacion">Ubicaciones</router-link>
      <router-link to="/personal">Personal</router-link>
      <router-link to="/equipos">Equipos</router-link>
    </nav>
  </header>

  <!-- Layout: Sidebar + Main Content -->
  <div class="layout">
    <!-- Sidebar -->
    <nav class="sidebar" :class="{ 'sidebar-collapsed': !sidebarOpen }">
      <div class="sidebar-header">
        <button @click="toggleSidebar" class="sidebar-toggle">
          <span class="hamburger-line"></span>
          <span class="hamburger-line"></span>
          <span class="hamburger-line"></span>
        </button>
      </div>

      <ul class="nav-menu">
        <li class="nav-item">
          <a href="/" @click="setActiveRoute('home')" :class="{ 'active': activeRoute === 'home' }" class="nav-link">
            <span class="nav-icon">🏠</span>
            <span class="nav-text" v-show="sidebarOpen">Home</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="/ubicacion" @click="setActiveRoute('ubicaciones')" :class="{ 'active': activeRoute === 'ubicaciones' }"
            class="nav-link">
            <span class="nav-icon">📍</span>
            <span class="nav-text" v-show="sidebarOpen">Ubicaciones</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="personal" @click="setActiveRoute('responsables')" :class="{ 'active': activeRoute === 'responsables' }"
            class="nav-link">
            <span class="nav-icon">👥</span>
            <span class="nav-text" v-show="sidebarOpen">Responsables</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="equipos" @click="setActiveRoute('equipos')" :class="{ 'active': activeRoute === 'equipos' }"
            class="nav-link">
            <span class="nav-icon">🩺</span>
            <span class="nav-text" v-show="sidebarOpen">Equipos</span>
          </a>
        </li>
      </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
      <router-view />
    </main>
  </div>
</template>

<script>
export default {
  name: 'HospitalHome',
  data() {
    return {
      sidebarOpen: false,
      activeRoute: 'home',
      ubicaciones: { total: 15 },
      responsables: { total: 28 },
      equipos: { total: 142 }
    }
  },
  methods: {
    toggleSidebar() {
      this.sidebarOpen = !this.sidebarOpen;
    },
    setActiveRoute(route) {
      this.activeRoute = route;
    }
  }
}
</script>

<style>
/* Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  color: #2c3e50;
  min-height: 100vh;
  background-color: #f5faf5;
  display: flex;
  flex-direction: column;
}

/* Header */
.header {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 20px 12px 20px 0px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  height: 70px;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 15px;
}

.logo {
  height: 70px;
  width: auto;
  filter: brightness(0) invert(1);
  margin-top: 10px;  /* lo empuja hacia abajo */
  margin-bottom: 10px; /* lo empuja hacia arriba */
  margin-left: 0px;
}

.company-info {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.company-name {
  font-size: 20px;
  font-weight: 700;
}

.system-name {
  font-size: 18px;
  font-weight: 300;
  opacity: 0.9;
}

.header-nav {
  display: flex;
  gap: 15px;
}

.header-nav a {
  font-weight: 600;
  color: white;
  text-decoration: none;
  padding: 8px 16px;
  border-radius: 6px;
  transition: all 0.3s ease;
  font-size: 14px;
}

.header-nav a:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.header-nav a.router-link-exact-active {
  background-color: rgba(255, 255, 255, 0.2);
  font-weight: 700;
}

/* Layout */
.layout {
  display: flex;
  flex: 1;
  /* ocupa todo el espacio restante debajo del header */
  min-height: calc(100vh - 70px);
}

/* Sidebar */
.sidebar {
  /* background-color: #2c3e50; */
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  width: 250px;
  transition: width 0.3s ease;
  box-shadow: 4px 0 12px rgba(0, 0, 0, 0.1);
}

.sidebar-collapsed {
  width: 70px;
}

.sidebar-header {
  padding: 20px;
  border-bottom: 1px solid #34495e;
}

.sidebar-toggle {
  background: none;
  border: none;
  color: white;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.hamburger-line {
  width: 20px;
  height: 2px;
  background-color: white;
}

/* Sidebar nav */
.nav-menu {
  list-style: none;
}

.nav-link {
  display: flex;
  align-items: center;
  padding: 15px 20px;
  color: #bdc3c7;
  text-decoration: none;
  transition: all 0.3s ease;
  border-left: 3px solid transparent;
}

.nav-link:hover {
  background-color: #abcef1;
  color: black;
}

.nav-link.active {
  background-color: #6ca4db;
  color: black;
  border-left-color: #6ca4db;
}

.nav-icon {
  font-size: 18px;
  margin-right: 12px;
  width: 20px;
  text-align: center;
}

.nav-text {
  font-weight: bold;
  
}

/* Main content */
.main-content {
  flex: 1;
  padding: 30px;
  overflow-y: auto;
  background-color: #f5f7fa;
}
</style>
