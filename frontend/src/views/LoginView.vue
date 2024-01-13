<script setup>
import { ref } from 'vue';
// const name=ref("");

const onSubmit=()=>{

    const formdata={
        email:email.value,
        password:password.value
    }
    console.log("onSubmit");
    console.log(formdata)
}

</script>

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