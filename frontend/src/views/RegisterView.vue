<script setup>
import { ref } from 'vue';
// const name=ref("");

const onSubmit=()=>{

    const formdata={
        first_name:first_name.value,
        last_name:last_name.value,
        email:email.value,
        password:password.value,
        phone:phone.value,
        dob:dob.value,
        gender:gender.value,
        address:address.value
        
    }
      
    console.log("onSubmit");
    console.log(formdata)

}

</script>

<template>
    <h1>Register</h1>
    <div>
        <label for="first_name">Fist Name</label>
        <input type="text" id="first_name"  />
    </div>
    <div>
        <label for="last_name">Last Name</label>
        <input type="text" id="last_name" />
    </div>
    <div>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" />
    </div>
    <div>
        <label for="password">Password</label>
        <input type="password" id="password" />
    </div>
    <div>
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" />
    </div>
    <div>
        <label for="phone">Phone</label>
        <input type="number" id="phone" />
    </div>
    <div>
        <label for="gender">Gender</label>
        <input type="text" id="gender" />
    </div>
    <div>
        <label for="address">Address</label>
        <input type="text" id="address" />
    </div>



    <div>
        <button v-on:click=onSubmit>Submit</button>
    </div>

    <div>Already have an Account? <router-link :to="{ path: '/login' }">Login</router-link></div>

    

</template>