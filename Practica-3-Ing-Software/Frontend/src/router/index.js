import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/components/HomeView.vue'
import EquiposView from '@/components/EquiposView.vue'
import DetallesView from '@/components/DetallesView.vue'
import CrearEquipo from '@/components/CrearEquipo.vue'
import EditarEquipos from '@/components/EditarEquipos.vue' 

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/equipos',
    name: 'equipos',
    component: EquiposView
  },
  {
    path: '/detalles/:id',
    name: 'detalles',
    component: DetallesView
  },
  {
    path: '/crear-equipo',
    name: 'crear-equipo',
    component: CrearEquipo
  },
  {
    path: '/editar-equipo/:id',
    name: 'editarEquipo',
    component: EditarEquipos
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router