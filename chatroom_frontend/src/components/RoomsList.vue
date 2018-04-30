

<template>

<ul id="example-1">
    <li v-for="room in rooms">
        <a @click="goToRoom(room)">{{ room.name }}</a>
    </li>
</ul>

</template>

<script>

export default {
    name: 'RoomsList',
    data: function() {
        return {
            rooms: []
        }
    },
    mounted: function() {
        this.rooms = $.resourse('url-rails')
    },
    methods: {
        goToRoom: function(room) {
            loqueseadevuerouter(room.name)
        }
    }
}

</script>
