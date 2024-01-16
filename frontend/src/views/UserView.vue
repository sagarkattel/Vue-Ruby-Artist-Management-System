

<template>
  <div>
    <h1>Users</h1>
    <button @click="gotocreateuser" class="buttons">Create User</button>


    <table class="user-table">
      <thead>
      <tr>
        <th>Email</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="(detail, index) in userData" :key="index">
        <td>{{ detail.email }}</td>
        <td>
          <router-link :to="{ path: '/edituser/' + detail.id }">Edit</router-link> |
          <a href="/user" @click="deleteUser(detail.id)">Delete</a>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import router from '@/router';
import axios from 'axios';
import {onMounted, ref} from "vue";
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();
const userData=ref([{}]);


import {fetchUsers,deleteUser} from "@/utils/api.js";


onMounted(()=>{
  fetchUsers(userData);
})



const gotocreateuser=()=>{
  router.push("/register")
}



</script>

<style>
h1 {
  text-align: center;
}



.user-table {
  width: 80%;
  margin: 20px auto;
  border-collapse: collapse;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.user-table th, .user-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.user-table th {
  background-color: #3498db;
  color: white;
}

.user-table tbody tr:hover {
  background-color: #f5f5f5;
}

.user-table a {
  color: #e74c3c;
  cursor: pointer;
  text-decoration: none;
}

.user-table a:hover {
  text-decoration: underline;
}
</style>


<style scoped>

</style>