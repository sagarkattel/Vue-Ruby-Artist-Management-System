<template>
    <h1>Login</h1>
    <div v-if="userStore?.error" class="error">{{ userStore?.error }}</div>
    <div v-if="validateerror" class="error">
        {{validateerror}}
    </div>
    <br>
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

let validateerror=ref("");

const userStore = useUserStore();



const onSubmit=async()=>{
    try{
        if(!email.value ||!password.value){
            validateerror.value="Fill all the Form";
            return;
        }
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
    // console.log(error);
    console.log(error.response.data.message);
    validateerror.value=error.response.data.message
    
}
}

</script>