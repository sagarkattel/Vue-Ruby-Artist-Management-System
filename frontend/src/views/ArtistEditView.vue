<template>
    <h1>Edit Artist for {{ artistData.value.name }}</h1>
    <div>
        <label for="name">Name</label>
        <input type="text" id="names" v-model="artistData.value.name" />
    </div>
    <div>
        <label for="address">Address</label>
        <input type="text" id="address" v-model="artistData.value.address" />
    </div>
    <div>
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob"  v-model="formattedDate" />
    </div>
    <div>
        <label for="gender">Gender</label>
        <select id="gender" defaultValue="Male" v-model="artistData.value.gender" >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
    </div>
    <div>
        <label for="first_release_year">First Year Release</label>
        <input type="number" id="first_release_year" v-model="artistData.value.first_release_year" />
    </div>
    <div>
        <label for="no_of_albums_released">No of Albums Released</label>
        <input type="number" id="no_of_albums_released" v-model="artistData.value.no_of_albums_released" />
    </div>
    

    <div>
        <button v-on:click="onSubmit">Submit</button>
    </div>

    
</template>

<script setup>
import { ref, onMounted, reactive,computed } from 'vue';
import { useRoute } from 'vue-router';
import axios from 'axios';
import router from '@/router';

const params = ref("");
const route = useRoute();
const artistData = reactive({ value: {} });

onMounted(() => {
    params.value = route.params.id; 
    fetchArtists();
});

const formattedDate = computed(() => {
      const isValidDate = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$/.test(artistData.value.dob);
      if (isValidDate) {
        const date = new Date(artistData.value.dob);
        const formatted = date.toISOString().split('T')[0];
        return formatted;
      } else {
        console.error('Invalid date format:', artistData.value.dob);
        return ''; 
      }
    });

const fetchArtists = async () => {
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${params.value}`);
        Object.assign(artistData.value, response.data);
        console.log("Artist Data", artistData.value);
    } catch (error) {
        console.log(error);
    }
}

const onSubmit = async() => {
    try{
    const formdata = {
        name:names.value,
        address:address.value,
        dob:dob.value,
        gender:gender.value,
        first_release_year:parseInt(first_release_year.value),
        no_of_albums_released:parseInt(no_of_albums_released.value)
    }
    const response=await axios.put(`http://127.0.0.1:3000/artists/${params.value}`,formdata);
    if (response.status === 200 ) {
            router.push("/artist");
        } else {
            console.log("Error: Unexpected response from the server");
        }    
    }
catch(error){
    console.log(error)
}
}
</script>
