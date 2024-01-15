<template>
    <h1>Edit User for {{ userData.value.first_name }}</h1>
    <div>
        <label for="first_name">First Name</label>
        <input type="text" id="first_name" v-model="userData.value.first_name" />
    </div>
    <div>
        <label for="last_name">Last Name</label>
        <input type="text" id="last_name" v-model="userData.value.last_name" />
    </div>
    <div>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" v-model="userData.value.email" />
    </div>
    <div>
        <label for="password">Password</label>
        <input type="password" id="password" v-model="userData.value.password" />
    </div>
    
    <div>
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" v-model="userData.value.dob" />
    </div>
    <div>
        <label for="phone">Phone</label>
        <input type="number" id="phone" v-model="userData.value.phone" />
    </div>
    <div>
        <label for="gender">Gender</label>
        <select id="gender" defaultValue="Male"  v-model="userData.value.gender" >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
    </div>
    <div>
        <label for="address">Address</label>
        <input type="text" id="address" v-model="userData.value.address" />
    </div>

    <div>
        <button v-on:click="onSubmit">Submit</button>
    </div>

    <div>Already have an Account? <router-link :to="{ path: '/login' }">Login</router-link></div>
</template>

<script setup>
import { ref, onMounted, reactive ,computed } from 'vue';
import { useRoute } from 'vue-router';
import axios from 'axios';
import router from '@/router';
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();

const params = ref("");
const route = useRoute();
const userData = reactive({ value: {} });


const config = {
  headers: { Authorization: `Bearer ${userStore.token}` }
};

onMounted(() => {
    params.value = route.params.id; 
    fetchUser();
    // formattedDate();
});


const fetchUser = async () => {
    try {
        const response = await axios.get(`http://127.0.0.1:3000/user/${params.value}`,config);
        Object.assign(userData.value, response.data);
        console.log("User Data", userData.value);
    } catch (error) {
        console.log(error);
    }
}

const onSubmit = async() => {
    try{
    const formdata = {
        first_name: userData.value.first_name,
        last_name: userData.value.last_name,
        email: userData.value.email,
        password: password.value,
        phone: userData.value.phone,
        dob: userData.value.dob,
        gender: userData.value.gender,
        address: userData.value.address
    }
    const response=await axios.put(`http://127.0.0.1:3000/user/${params.value}`,formdata,config);
    console.log(response);
    if (response.status===200){
        router.push("/user")
    }
    else{
        console.log("Error: Unexpected response from the server");
    }
}
catch(error){
    console.log("The error is ",error)

}
}
</script>
