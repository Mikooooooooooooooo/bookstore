
// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router'
import Authorization from '../components/Authorization.vue';
import Market from '../components/Market.vue';
import Book from '../components/Book.vue'
import Mybooks from '../components/Mybooks.vue'



const routes = [
  { path: '/', name: 'Authorization', component: Authorization },
  { path: '/market' , name: 'Market' , component: Market} , 
  { path: '/book/:id' , name: "Book" , component: Book} , 
  { path: '/mybooks' , name: "Mybooks" , component: Mybooks}
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
