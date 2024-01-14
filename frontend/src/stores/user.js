import { defineStore } from "pinia";

export const useUserStore = defineStore("users", {
  state: () => ({
    token: localStorage.getItem("token") || null,
    user: JSON.parse(localStorage.getItem("user")) || null,
    error:null,
  }),

  actions: {
    setToken(token) {
      this.token = token;
      localStorage.setItem("token", token);
    },
    setUser(user){
        this.user=user;
        localStorage.setItem("user", JSON.stringify(user));
    },
    logout() {
        // Clear the token and user data from local storage
        this.setToken(null);
        this.setUser(null);
        localStorage.removeItem("token");
        localStorage.removeItem("user");
    }
  },
});
