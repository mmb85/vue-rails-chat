<template>
  <div>
    <h1>Chat Room List</h1>
    <ul id="example-1">
      <li v-for="room in rooms" v-bind:key="room.id">
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
</template>

<script>

export default {
  name: 'RoomsList',
  data: function () {
    return {
      rooms: []
    }
  },
  mounted: function () {
    this.$http.get('http://localhost:3000/api/v1/rooms')
      .then(response => {
        this.rooms = response.body
      })
  }
}

</script>
