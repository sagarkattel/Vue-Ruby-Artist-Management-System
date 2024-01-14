
<template>
    <h1>Musics of Artist {{ Artistname }}</h1>
    <div v-for="music in musicData" :key="music.id" class="musicdiv">
        Music Title: {{ music.title }} <br>
        Album Name: {{ music.album_name }} <br>
        Genre: {{ music.genre }} <br>
        <router-link :to="{ path: '/editmusic' }">Edit</router-link>
        <br>
        <router-link :to="{ path: '/deletemusic' }">Delete</router-link>
    </div>
</template>

<script setup>
import {ref,onMounted,reactive} from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
const route = useRoute();
const musicData=ref([{}]);
const Artistname=ref("");

const paramsartistid = ref("");
onMounted(() => {
    paramsartistid.value = route.params.artistid; 
    fetchMusics();
    fetchArtist();
});

const fetchArtist=async()=>{
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}`);
        Artistname.value=response.data.name
        // console.log("Artist Name",response.data.name);
    } catch (error) {
        console.log(error);
    }
}

const fetchMusics = async () => {
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics`);
        Object.assign(musicData.value, response.data);
        // console.log("User Data", musicData.value);
    } catch (error) {
        console.log(error);
    }
}

console.log(paramsartistid.value)
</script>

<style scoped>
.musicdiv{
    padding: 1.5%;

   
}
</style>