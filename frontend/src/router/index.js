import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/user',
      name: 'user',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/UserView.vue'),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: '/artist',
      name: 'artist',
      component: () => import('../views/ArtistView.vue'),
      meta: {
        requiresAuth: true,
      },
    }
    ,
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    }
    ,
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/RegisterView.vue')
    },
    {
      path: '/edituser/:id',
      name: 'edituser',
      component: () => import('../views/UserEditView.vue'),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: '/editartist/:id',
      name: 'editartist',
      component: () => import('../views/ArtistEditView.vue'),
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: '/createartist',
      name: 'createartist',
      component: () => import('../views/ArtistCreateView.vue'),
      meta: {
        requiresAuth: true,
      },
    },

    {
      path: '/:artistid/music',
      name: 'music',
      component: () => import('../views/MusicView.vue'),
      meta: {
        requiresAuth: true,
      },
      
    },
    {
      path: '/createmusic/:artistid',
      name: 'createmusic',
      component: () => import('../views/MusicCreateView.vue'),
      meta: {
        requiresAuth: true,
      },

    },
    {
      path: '/:artistid/editmusic/:musicid',
      name: 'editmusic',
      component: () => import('../views/MusicEditView.vue'),
      meta: {
        requiresAuth: true,
      },
    },



  ]
})

export default router
