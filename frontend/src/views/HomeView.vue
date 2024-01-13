<script setup>
import router from '@/router';


const loginroute=()=>{
  router.push("/login")
}

const registerroute=()=>{
  router.push("/register")
}
</script>
<template>

  <div>
    <h1>Home</h1>
    <button @click="loginroute" class="buttons">Login</button> <br>
    <button @click="registerroute" class="buttons">Signup</button>
  </div>
</template>



<style scoped>

</style>
