import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import RegistrarVehiculo from '../components/vehiculo/RegistrarVehiculo.vue'
import RegistrarConductor from '../components/conductor/RegistrarConductor.vue'
import AsociarConductor from '../components/conductor/AsociarConductor.vue'
import DesasociarConductor from '../components/conductor/DesasociarConductor.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/registrar-vehiculo',
    name: 'Registrar vehículo',
    component: RegistrarVehiculo
  },
  {
    path: '/registrar-conductor',
    name: 'Registrar conductor',
    component: RegistrarConductor
  },
  {
    path: '/asociar-conductor',
    name: 'Asociar conductor',
    component: AsociarConductor
  },
  {
    path: '/desasociar-conductor',
    name: 'Desasociar conductor',
    component: DesasociarConductor
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
