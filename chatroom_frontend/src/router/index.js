import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import RoomsList from '@/components/RoomsList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/roomslist',
      name: 'RoomsList',
      component: RoomsList
    }
  ]
})
