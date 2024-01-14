import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import { useUserStore } from './stores/user'

const app = createApp(App)

app.use(createPinia())

router.beforeEach((to, from, next) => {
    const userStore = useUserStore();
  
    // If the route requires authentication and the user is not present, redirect to login
    if (to.meta.requiresAuth && !userStore.user) {
      next('/login');
    } else {
      next();
    }
  });
app.use(router)

app.mount('#app')
