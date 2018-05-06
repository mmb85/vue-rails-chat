// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import routes from './router'
import ActionCable from 'actioncable'
import VueResource from 'vue-resource'

const cable = ActionCable.createConsumer('ws://localhost:28080/cable')

Vue.prototype.$cable = cable
Vue.use(VueResource)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router: routes,
  components: { App },
  template: '<App/>'
})
