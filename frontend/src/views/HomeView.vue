
<template>

  <div v-if="userStore?.user">
    <h1>Home</h1>
    <h2>Hello, {{ userStore?.user?.first_name }}</h2>
    <button @click="logout" class="buttons">Logout</button>
    
    
  </div>
  <div v-else>
    <button @click="loginroute" class="buttons">Login</button> <br>
    <button @click="registerroute" class="buttons">Signup</button>
    </div>
</template>

<script setup>
import router from '@/router';


import { useUserStore } from "@/stores/user";




const userStore = useUserStore();


const logout=()=>{
  userStore.logout()
}

const loginroute=()=>{
  router.push("/login")
}

const registerroute=()=>{
  router.push("/register")
}
</script>

<style scoped>

</style>
