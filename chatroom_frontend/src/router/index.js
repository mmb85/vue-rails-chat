import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import RoomsList from '@/components/RoomsList'
import Chat from '@/components/Chat'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: '/rooms-list',
      name: 'rooms-list',
      component: RoomsList
    },
    {
      path: '/chat/:room',
      name: 'chat',
      component: Chat
    }
  ]
})
