<template>
  <div>
    <hr/>
    <h2 class="login col-sm-4 offset-sm-4 text-center">{{ this.room }}</h2>
    <hr/>
    <div class="border border-primary rounded px-3 mx-3">
      <div class="text-center" v-if="messages.length == 0">No previous message for this Room</div>
      <ul id="example-1">
        <li style="list-style-type: none;" v-for="(message, index) in lastMessages" v-bind:key="index">
          {{ message }}
        </li>
      </ul>
    </div>
    <br/>
    <div class="px-3 mx-3">
      <textarea v-model="message"  v-on:keyup.enter="submit" placeholder="your message goes here"></textarea>
      <button class="btn btn-primary solid blank js-login__submit"
        @click="submit">Send  </button>
      <button class="btn solid"><a @click="$router.go(-1)">back</a></button>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Chat',
  data: function () {
    return {
      messages: [],
      message: null,
      room: this.$route.params.room,
      messageChannel: null
    }
  },
  mounted: function () {
    const room = this.$route.params.room

    this.$http.get(`http://localhost:3000/api/v1/messages?room=${room}`)
      .then(response => {
        this.messages = response.body
      })
  },

  created: function () {
    var that = this
    this.messageChannel = this.$cable.subscriptions.create({ channel: 'MessagesChannel', room: this.room }, {
      received (data) {
        that.messages.push(data.user + ': ' + data.text)
      }
    })
  },
  methods: {
    submit: function () {
      this.$http.post('http://localhost:3000/api/v1/messages', { user: this.$route.query.user, room: this.room, text: this.message })
        .then(response => {
          // this.messages.push(this.message)
          if (this.message) {
            this.messageChannel.send({ text: this.message, user: this.$route.query.user })
          }
          this.message = null
        })
    }
  },
  computed: {
    lastMessages: function () {
      return this.messages.slice(-20)
    }
  }
}

</script>
