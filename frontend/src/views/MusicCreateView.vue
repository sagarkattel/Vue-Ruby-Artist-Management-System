
<template>
  <h1>Create Music for Artist {{ Artistname }}</h1>
  <ul>
    <li v-for="error in validateerror" :key="error" class="error">
      {{ error }}
    </li>
    <br>
  </ul>
  <div>
    <label for="Music Title">Music Title</label>
    <input type="text" id="title" />
  </div>
  <div>
    <label for="Album Name">Album Name</label>
    <input type="text" id="album_name" />
  </div>
  <div>
    <label for="genre">Genre</label>
    <select id="genre" defaultValue="Rock">
      <option value="rock">Rock</option>
      <option value="rnb">RNB</option>
      <option value="country">Country</option>
      <option value="classic">Classic</option>
      <option value="jazz">Jazz</option>
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
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();


const config = {
  headers: { Authorization: `Bearer ${userStore.token}` }
};
const musicData=ref([{}]);
const Artistname=ref("");

const paramsartistid = ref("");


const validateerror=ref("")

onMounted(() => {
  paramsartistid.value = route.params.artistid;

  fetchArtist();
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

const onSubmit = async() => {
  try{
    const formdata = {
      title:title.value,
      album_name:album_name.value,
      genre:genre.value
    }

    console.log("onSubmit");
    const response=await axios.post(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics`,formdata,config)
    console.log(response);
    if (response.status === 201 ) {
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