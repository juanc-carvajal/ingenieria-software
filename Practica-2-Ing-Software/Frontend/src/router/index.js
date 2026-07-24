import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/components/HomeView.vue'
import PacientesView from '@/components/PacientesView.vue'
import LaboratoristasView from '@/components/LaboratoristasView.vue'
import ResultadosView from '@/components/ResultadosView.vue'
import NuevoResultado from '@/components/NuevoResultado.vue'
import NuevoPaciente from '@/components/NuevoPaciente.vue'
import NuevoLaboratorista from '@/components/NuevoLaboratorista.vue'
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/pacientes',
    name: 'pacientes',
    component: PacientesView
  },
  {
    path: '/laboratoristas',
    name: 'laboratoristas',
    component: LaboratoristasView
  },
  {
    path: '/resultados',
    name: 'resultados',
    component: ResultadosView
  },
  { 
    path: '/resultados/nuevo',
    name: 'NuevoResultado',
    component: NuevoResultado 
  },
  {
    path: '/paciente/nuevo',
    name: 'NuevoPaciente',
    component: NuevoPaciente
  },
  {
  path: '/laboratorista/nuevo',
  name: 'NuevoLaboratorista',
  component: NuevoLaboratorista
}
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router