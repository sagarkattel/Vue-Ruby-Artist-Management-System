<template>
    <h1>Login</h1>
    
    <div>
        <label for="email">Email</label>
        <input type="email" id="email"  />
    </div>
    <div>
        <label for="password">Password</label>
        <input type="password" id="password" />
    </div>
    
    <div>
        <button v-on:click=onSubmit>Login</button>
    </div>

    <div>Don't have an Account yet? <router-link :to="{ path: '/register' }">Register</router-link></div>

</template>

<script setup>
import axios from 'axios';
import { ref } from 'vue';
import router from '@/router';

import { useUserStore } from "@/stores/user";



const userStore = useUserStore();

const onSubmit=async()=>{
    try{
    const formdata={
        email:email.value,
        password:password.value
    }
    const response=await axios.post("http://127.0.0.1:3000/login",formdata);
    console.log("The response is ",response.data);
    console.log(response.status)
    if(response.status==200){
        userStore.setToken(response.data.token);
        userStore.setUser(response.data.user);
        router.push("/")
    }
}
catch(error){
    console.log(error);
}
}

</script>