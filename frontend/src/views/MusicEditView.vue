
<template>
  <h1>Edit Music for Artist {{ Artistname }}</h1>
<!--  <h2>{{musicData.value}}</h2>-->
  <ul>
    <li v-for="error in validateerror" :key="error" class="error">
      {{ error }}
    </li>
    <br>
  </ul>
  <div>
    <label for="Music Title">Music Title</label>
    <input type="text" id="title" v-model="musicData.value.title"/>
  </div>
  <div>
    <label for="Album Name">Album Name</label>
    <input type="text" id="album_name" v-model="musicData.value.album_name"/>
  </div>
  <div>
    <label for="genre">Genre</label>
    <select id="genre" v-model="musicData.value.genre">
      <option value="Rock">Rock</option>
      <option value="RNB">RNB</option>
      <option value="Country">Country</option>
      <option value="Classic">Classic</option>
      <option value="Jazz">Jazz</option>
    </select>
  </div>



  <div>
    <button v-on:click="onSubmit">Submit</button>
  </div>
</template>

<script setup>
import {ref,onMounted,reactive} from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
import router from "@/router/index.js";
const route = useRoute();
// const musicData=ref([{}]);
// const musicData=reactive({ value: {} });
const musicData = reactive({ value: {} });
const Artistname=ref("");

const paramsartistid = ref("");
const paramsmusicid=ref("");


const validateerror=ref("")

onMounted(() => {
  paramsartistid.value = route.params.artistid;
  paramsmusicid.value=route.params.musicid
  fetchArtist();
  fetchMusic();
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

const fetchMusic=async ()=>{
  try {
    const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics/${paramsmusicid.value}`);
    // Object.assign(musicData.value, response.data);
    musicData.value = response.data[0];
    console.log("Music Data",response.data);
  } catch (error) {
    console.log(error);
  }

}

const onSubmit = async() => {
  try{
    const formdata = {
      title:title.value,
      album_name:album_name.value,
      genre:genre.value
    }

    console.log("onSubmit");
    const response=await axios.put(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics/${paramsmusicid.value}`,formdata)
    console.log(response);
    if (response.status === 200 ) {
      router.push({ name: 'music', params: { artistid: route.params.artistid } });

    } else {
      console.log("Error: Unexpected response from the server");
    }
  }
  catch(error){
    console.log("error is",error)
    if (error.response) {
      console.error("Server error:", error.response.data);
      if (error.response.data.errors) {
        console.log("Validation errors:", error.response.data.errors);
        validateerror.value=error.response.data.errors
      }
    }
  }
}






</script>

<style scoped>

</style>