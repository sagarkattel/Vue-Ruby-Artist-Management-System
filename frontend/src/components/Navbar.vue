
<template>
    <div class="navbar">
  <div class="navbar-name">
    Artist Management System
  </div>

  <div class="navbar-sections">
  <div class="navbar-home"><router-link :to="{ path: '/' }">Home</router-link></div>
  <div ><router-link :to="{ path: '/user' }">Users</router-link></div>
  <div ><router-link :to="{ path: '/artist' }">Artists</router-link></div>

  </div>
</div>
</template>

<style scoped>
.navbar{
    background-color: 	#4c3c3c;
    display: flex;
    gap: 10%;
    height: 80px;
    align-items: center;
    padding-left: 80px;
}

.navbar>div{
    display: flex;
    height: 40px;
    font-size: 25px;
    color: white;
    font-weight: bold;
}

.navbar-name{
    width: 35%;
}

.navbar-sections{
    gap: 20%;
    /*align-items: center;*/
    justify-content: center;
    /*background-color: red;*/
    width: 90%;
}

.navbar a{
    all:unset;
    cursor: pointer;
}
</style>

<script setup>

</script>