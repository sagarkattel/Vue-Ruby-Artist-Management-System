
<template>
    <h1>Musics of Artist {{ Artistname }}</h1>
  <button @click="handleCreateMusic" class="buttons">Create Music</button>
    <div v-for="music in musicData" :key="music.id" class="musicdiv">
        Music Title: {{ music.title }} <br>
        Album Name: {{ music.album_name }} <br>
        Genre: {{ music.genre }} <br>
      <router-link v-if="music.id !== undefined" :to="{ name: 'editmusic', params: { artistid: paramsartistid.value, musicid: music.id } }">Edit</router-link>


      <br>
      <a href='' @click="deleteMusic(paramsartistid,music.id)">Delete</a>
    </div>
</template>

<script setup>
import {ref,onMounted,reactive} from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
import router from "@/router/index.js";
const route = useRoute();
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();


const config = {
  headers: { Authorization: `Bearer ${userStore.token}` }
};

const musicData=ref([{}]);
const Artistname=ref("");

const paramsartistid = ref("");
onMounted(() => {
    paramsartistid.value = route.params.artistid; 
    fetchMusics();
    fetchArtist();

    console.log("Params Value",paramsartistid.value)
});


const fetchArtist=async()=>{
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}`,config);
        Artistname.value=response.data.name
        // console.log("Artist Name",response.data.name);
    } catch (error) {
        console.log(error);
    }
}

const fetchMusics = async () => {
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics`,config);
        Object.assign(musicData.value, response.data);
        // console.log("User Data", musicData.value);
    } catch (error) {
        console.log(error);
    }
}

const deleteMusic=async (artistid,musicid)=>{
  try{
    const response=await axios.delete(`http://127.0.0.1:3000/artists/${artistid}/musics/${musicid}`,config)
    console.log(response)
  }
  catch(error){
    console.log(error)
  }
}


const handleCreateMusic=()=>{
  router.push("/createmusic/"+paramsartistid.value)
}


</script>

<style scoped>
.musicdiv{
    padding: 1.5%;

   
}
</style>