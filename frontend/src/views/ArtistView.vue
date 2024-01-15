<template>
  <div>
    <h1>Artist Management System</h1>
    <button @click="navigatecreateuser" class="buttons">Create Artist</button>



    <table class="artist-table">
      <thead>
      <tr>
        <th>Name</th>
        <th>DOB</th>
        <th>Gender</th>
        <th>Address</th>
        <th>First Year Release</th>
        <th>Number of Albums Released</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="artist in userData" :key="artist.id">
        <td>{{ artist?.name }}</td>
        <td>{{ artist?.dob }}</td>
        <td>{{ artist?.gender }}</td>
        <td>{{ artist?.address }}</td>
        <td>{{ artist?.first_release_year }}</td>
        <td>{{ artist?.no_of_albums_released }}</td>
        <td>
          <router-link :to="{ path: +artist.id+'/music/'  }">Music</router-link> |

          <router-link :to="{ path: '/editartist/'+artist.id }">Edit</router-link> |
          <a href="/artist" @click="deleteArtist(artist.id)">Delete</a>

        </td>
      </tr>
      </tbody>
    </table>
  </div>


</template>

<script setup>
import axios from 'axios';
import router from '@/router';
import {onMounted, ref} from "vue";
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();


const config = {
  headers: { Authorization: `Bearer ${userStore.token}` }
};
const userData=ref([{}]);

onMounted(()=>{
  fetchArtists()
})

const fetchArtists=async ()=>{
  try {
    const response = await axios.get('http://127.0.0.1:3000/artists',config);
    userData.value = response.data;
    console.log(response.data)
  } catch (error) {
    console.error('Error fetching artists:', error);
  }
}

const deleteArtist=async (id)=> {
  try {
    const response = await axios.delete(`http://127.0.0.1:3000/artists/${id}`,config)
    console.log(response)
  } catch (error) {
    console.log(error)
  }
}

const navigatecreateuser=()=>{
  router.push("/createartist")
}
</script>

<style scoped>


.buttons {
  display: inline-block;
  margin: 10px;
  padding: 8px 16px;
  text-align: center;
  text-decoration: none;
  background-color: #3498db;
  color: white;
  border: 1px solid #3498db;
  border-radius: 4px;
  cursor: pointer;
}

.buttons:hover {
  background-color: #2980b9;
  border-color: #2980b9;
}

.artist-table {
  width: 80%;
  margin: 20px auto;
  border-collapse: collapse;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.artist-table th,
.artist-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.artist-table th {
  background-color: #3498db;
  color: white;
}

.artist-table tbody tr:hover {
  background-color: #f5f5f5;
}

.artist-table a {
  color: #e74c3c;
  cursor: pointer;
  text-decoration: none;
}

.artist-table a:hover {
  text-decoration: underline;
}
</style>
