<template>
  <div class="login col-sm-4 offset-sm-4">
    <h1> HOLA </h1>
    <div class="form-group">
      <input
        type="text" v-model="user" placeholder="Enter your username"
      >
    </div>
    <button
      data-id="login.submit"
      class="btn btn-primary solid blank js-login__submit"
      @click="submit()"
    >
      Login &nbsp; <i class="fa fa-arrow-circle-o-right"></i>
    </button>
  </div>
</template>

<script>

export default {
  name: 'Login',
  data: function () {
    user: this.name
  },
  methods: {
    submit: function() {
      return this.user
    }
  }
}
</script>
