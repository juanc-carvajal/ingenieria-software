<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body, html {
  margin: 0;
  padding: 0;
  overflow: hidden;
  background: linear-gradient(135deg, #e8f4f8 0%, #d4e7dd 100%);
}

#app {
  font-family: 'Inter', 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  width: 100%;
  height: 100vh;
  background: linear-gradient(135deg, #e8f4f8 0%, #d4e7dd 100%);
}

/* Variables CSS para colores pastel consistentes */
:root {
  --pastel-blue-light: #e8f4f8;
  --pastel-blue: #b8d4e0;
  --pastel-blue-dark: #8db3c5;
  --pastel-green-light: #d4e7dd;
  --pastel-green: #a8d5ba;
  --pastel-green-dark: #7ebf96;
  --pastel-mint: #c8e6e0;
  --pastel-sky: #c5e3f0;
  --text-dark: #2c3e50;
  --text-medium: #5a6c7d;
  --text-light: #8b9aa8;
  --white: #ffffff;
  --shadow-soft: rgba(139, 179, 185, 0.15);
}

/* Scrollbar personalizado suave */
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}

::-webkit-scrollbar-track {
  background: var(--pastel-blue-light);
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background: linear-gradient(135deg, var(--pastel-blue), var(--pastel-green));
  border-radius: 10px;
  border: 2px solid var(--pastel-blue-light);
}

::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(135deg, var(--pastel-blue-dark), var(--pastel-green-dark));
}

/* Estilos suaves para inputs globales */
input, textarea, select {
  font-family: inherit;
}

/* Transiciones suaves globales */
button, a {
  transition: all 0.3s ease;
}
</style>