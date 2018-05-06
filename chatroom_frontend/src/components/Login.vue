<template>
  <div class="login col-sm-4 offset-sm-4">
    <h1> HOLA </h1>
    <div class="form-group">
      <input
        type="text" v-model="user" placeholder="Enter your username"
      >
    </div>
    <button
      class="btn btn-primary solid blank js-login__submit"
      @click="submit"
    >
      Login &nbsp; <i class="fa fa-arrow-circ le-o-right"></i>
    </button>
  </div>
</template>

<script>

export default {
  name: 'Login',
  data: function () {
    return { user: null }
  },
  methods: {
    submit: function () {
      if (this.user != null) {
        this.$http.post('http://localhost:3000/api/v1/users', { user: { name: this.user } })
          .then(response => {
            this.$router.push({
              name: 'rooms-list',
              query: { user: response.body.user }
            })
          }, response => {
            // response.body { errors: { name: ... } }
          })
      }
    }
  }
}
</script>
