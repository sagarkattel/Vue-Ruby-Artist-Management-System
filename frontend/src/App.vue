<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './components/Navbar.vue'
</script>

<template>
  <Navbar />
  <div class="body">
  <RouterView />
</div>
</template>

<style scoped>

</style>
