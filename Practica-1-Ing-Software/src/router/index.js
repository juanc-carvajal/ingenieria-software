import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/components/HomeView.vue'
import UbicacionesView from '@/components/UbicacionesView.vue'
import PersonalView from '@/components/PersonalView.vue'
import EquiposView from '@/components/EquiposView.vue'
import NuevaUbicacion from '@/components/NuevaUbicacion.vue'
import NuevoPersonal from '@/components/NuevoPersonal.vue'
import NuevoEquipo from '@/components/NuevoEquipo.vue'
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/ubicacion',
    name: 'ubicacion',
    component: UbicacionesView
  },
  {
    path: '/personal',
    name: 'personal',
    component: PersonalView
  },
  {
    path: '/equipos',
    name: 'equipos',
    component: EquiposView
  },
  { 
    path: '/ubicacion/nueva',
    name: 'nuevaUbicacion',
    component: NuevaUbicacion 
  },
  {
    path: '/personal/nuevo',
    name: 'nuevoPersonal',
    component: NuevoPersonal
  },
  {
  path: '/equipo/nuevo',
  name: 'nuevoEquipo',
  component: NuevoEquipo
}
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router