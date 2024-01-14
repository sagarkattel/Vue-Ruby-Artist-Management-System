<template>
    <h1>Create Artist</h1>

    <ul>
        <li v-for="error in validateerror" :key="error" class="error">
            {{ error }}
        </li>
        <br>
    </ul>
    <div>
        <label for="name">Name</label>
        <input type="text" id="names" />
    </div>
    <div>
        <label for="address">Address</label>
        <input type="text" id="address" />
    </div>
    <div>
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob"   />
    </div>
    <div>
        <label for="gender">Gender</label>
        <select id="gender" defaultValue="Male">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
    </div>
    <div>
        <label for="first_release_year">First Year Release</label>
        <input type="number" id="first_release_year"  />
    </div>
    <div>
        <label for="no_of_albums_released">No of Albums Released</label>
        <input type="number" id="no_of_albums_released"  />
    </div>
    

    <div>
        <button v-on:click="onSubmit">Submit</button>
    </div>

    
</template>

<script setup>

import axios from 'axios';

import router from '@/router';
import { ref } from 'vue';

const validateerror=ref("")


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

    console.log("onSubmit");
    const response=await axios.post("http://127.0.0.1:3000/artists",formdata)
    console.log(response);
    if (response.status === 201 ) {
            router.push("/artist");
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
