

import axios from "axios";

import { useUserStore } from "@/stores/user";

const userStore = useUserStore();
export const config = {
    headers: { Authorization: `Bearer ${userStore.token}` }
};
export const fetchArtists=async (artistData)=>{
    try {
        const response = await axios.get('http://127.0.0.1:3000/artists',config);
        // artistData.value = response.data;
        Object.assign(artistData.value, response.data);
        console.log(response.data)
    } catch (error) {
        console.error('Error fetching artists:', error);
    }
}

export const fetchUsers=async (userData)=> {
    try {
        const response = await axios.get('http://127.0.0.1:3000/user',
            config
        );
        userData.value = response.data;
        console.log(response.data)
    } catch (error) {
        console.error('Error fetching artists:', error);
    }
}

export const fetchMusics = async (paramsartistid,musicData) => {
    try {
        const response = await axios.get(`http://127.0.0.1:3000/artists/${paramsartistid.value}/musics`,config);
        Object.assign(musicData.value, response.data);
        // console.log("User Data", musicData.value);
    } catch (error) {
        console.log(error);
    }
}


export const deleteUser=async (id)=> {
    try {

        const response = await axios.delete(`http://127.0.0.1:3000/user/${id}`,config);
    } catch (error) {
        console.log(error)
    }
}


export const deleteArtist=async (id)=> {
    try {
        const response = await axios.delete(`http://127.0.0.1:3000/artists/${id}`,config)
        console.log(response)
    } catch (error) {
        console.log(error)
    }
}

export const deleteMusic=async (artistid,musicid)=>{
    try{
        const response=await axios.delete(`http://127.0.0.1:3000/artists/${artistid}/musics/${musicid}`,config)
        console.log(response)
    }
    catch(error){
        console.log(error)
    }
}

