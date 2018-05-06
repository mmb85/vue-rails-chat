<template>
  <div>
    <hr/>
    <h2 class="login col-sm-4 offset-sm-4 text-center">Chat Room List</h2>
    <hr/>
    <div class="container">
      <div class="row">
        <div class="col-4">
          Select a Room or create a new one
          <ul class="list-group" id="example-1">
            <li class="list-group-item" v-for="room in rooms" v-bind:key="room.id">
              <router-link
                :to="{name: 'chat', params: {room: room.name}, query: {user: $route.query.user}}"
                exact
                class="nav-link"
                active-class="active">
                {{ room.name }}
              </router-link>
            </li>
          </ul>
        </div>
        <div class="col-5"/>
        <div class="col-3">
          <div class="input-group">
            <textarea  class="form-control" v-model="room"  v-on:keyup.enter="submit" placeholder="Create new Chat Room"></textarea>
            &nbsp;<button class="btn btn-primary solid blank js-login__submit"
              @click="submit">Send  </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'RoomsList',
  data: function () {
    return {
      rooms: [],
      room: null
    }
  },
  mounted: function () {
    this.$http.get('http://localhost:3000/api/v1/rooms')
      .then(response => {
        this.rooms = response.body
      })
  },
  methods: {
    submit: function () {
      this.$http.post('http://localhost:3000/api/v1/rooms', { name: this.room })
        .then(response => {
          this.$router.go(this.$router.currentRoute)
        })
    }
  }
}

</script>
