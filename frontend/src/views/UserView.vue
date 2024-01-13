

<template>
  <div>
    <h1>Users</h1>
    <button  class="buttons">Create User</button>


    <table class="user-table">
      <thead>
        <tr>
          <th>Email</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(detail, index) in users" :key="index">
          <td>{{ detail.email }}</td>
          <td>
            <router-link :to="{ path: '/edit-user/' + index }">Edit</router-link> |
            <a href="/user" @click="deleteUser(detail.id)">Delete</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        users: [],
      };
    },
    mounted() {
      this.fetchUsers();
    },
    methods: {
      async fetchUsers() {
        try {
          const response = await axios.get('http://127.0.0.1:3000/user'); 
          this.users = response.data;
          console.log(response.data)
        } catch (error) {
          console.error('Error fetching artists:', error);
        }
      },
      async deleteUser(id) {
        try{
          console.log("Delete id :",id)
          const response=await axios.delete(`http://127.0.0.1:3000/user/${id}`);
          console.log(response);
         

        }
        catch(error){
          console.log(error)
        }
        
      },
    },
  };
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
