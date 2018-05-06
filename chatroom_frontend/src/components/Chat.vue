<template>
  <div>
    <h1>ChaT</h1>
    <span v-if="messages.length == 0">Loading...</span>
    <ul id="example-1">
      <li v-for="(message, index) in lastMessages" v-bind:key="index">
        {{ message }}
      </li>
    </ul>
    <textarea v-model="message" placeholder="your message goes here"></textarea>
    <button class="btn btn-primary solid blank js-login__submit"
      @click="submit">Send  </button>
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
        that.messages.push(data.text)
      }
    })
  },
  methods: {
    submit: function () {
      this.$http.post('http://localhost:3000/api/v1/messages', { user: this.$route.query.user, room: this.room, text: this.message })
        .then(response => {
          // this.messages.push(this.message)
          this.messageChannel.send({ text: this.message })
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
