<template>
    <div class="market">
        <div class="container">
            <div class="market_header"> 
                <div class="logo">
                    Agai<div style="color:red">Full</div>Koyinyzshy
                </div>
                <div class="profile_container">
                    <div @click="isWrapped=!isWrapped" class="market_profile">
                        {{username}} 
                    </div>
                    <div v-if="isWrapped" class="profile">
                        <div @click="toMyBooks" class="profile_button">
                            <img src="../assets/book.svg"/>
                            my books
                        </div> 
                        <div @click="logOut" class="profile_button">
                            <img src="../assets/exit.svg"/>
                            Log out 
                        </div>
                    </div>
                </div>
            </div>
            <div class="atom">
                <div class="atom_image">
                    <img src='../assets/atom_book.jpeg'>
                </div>
                <div class="atom_info">
                    <div class="atom year">
                        2018
                    </div>
                    <div class="atom_title">
                        Atomic Habits
                    </div>
                    <div class="atom_genres">
                        <div class="atom_genre">
                            Self-help 
                        </div>
                        <div class="atom_dot">
                        </div>
                        <div class="atom_genre">
                            Personal Development  
                        </div>
                        <div class="atom_dot">
                        </div>
                        <div class="atom_genre">
                            Psychology
                        </div>
                    </div>
                    <div class="atom_subtitle">
                        Atomic Habits by James Clear teaches how small, consistent habits can lead to massive personal and professional transformation over time. The book introduces a four-step system—cue, craving, response, and reward—for building good habits and breaking bad ones. Clear emphasizes that focusing on identity and systems is more effective than chasing goals alone
                    </div>
                    <div class="atom_options">
                        <div class="atom_option">
                            James Clear
                        </div>
                        <div class="atom_option">
                        </div>
                        <div class="atom_option">
                            320 pages
                        </div>
                    </div>
                    <div class="atom_button">
                        Read Trailer
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="container">
            <div class="list">
                <div @mouseover="isActive[index] = true" @mouseleave="isActive[index] = false" class="item" v-for="(book , index) in books" :key="index">
                    <transition name="fade">
                      <div class="item_cover" v-if="isActive[index]"></div>
                    </transition>
                    <transition name="fade">
                      <div v-if="isActive[index]" class="item_add" @click="this.$router.push(`/book/${book.id}`)">+</div>
                    </transition>
                    <img :src="book.image" class="item_image`">
                    <div class="item_footer">
                        <div class="item_info">
                            <div class="item_title">
                                {{book.title}}
                            </div> 
                            <div class="item_author"> 
                                {{book.author}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.market{
    color: white ; 
    height: 83.5vh ; 
    background: black ; 
    background-repeat: no-repeat ;  
    background-size: cover ; 
} 
.container{
    width: 90% ; 
    margin: 0 auto ; 
}
.market_header{ 
    display: flex ; 
    padding-top: 5vh ; 
    padding-bottom: 10vh ;  
    justify-content: space-between ; 
}
.logo{
    color: white ; 
    display: flex ; 
    align-items: center ; 
    font-size: 24px ; 
    font-weight: 600 ;
}
.market_profile{
    font-size: 18px ; 
    font-weight: 600 ; 
    cursor: pointer ; 
    transition: all .2s ease ; 
}
.market_profile:hover{
    color: red ;
}
.atom{
    display: flex ; 
    gap : 80px ;
}
.atom_info{
    width: 700px ; 
    font-size: 18px ; 
}
.atom_title{
    font-size: 60px ; 
    font-weight: 600 ; 
    margin: 3vh 0 ; 
}
.atom_subtitle{
    padding-bottom: 3vh ; 
    word-spacing: 3px ;  
}
.atom_genres{
    display: flex ; 
    align-items: center ; 
    gap: 10px ;
    padding-bottom: 3vh ; 
}
.atom_options{
    display: flex ; 
    gap: 15px ; 
    margin-bottom: 5vh ; 
}
.atom_button {
    width: fit-content ; 
    padding: 15px 25px ; 
    border-radius: 15px ; 
    font-size: 20px; 
    background: red ; 
}
.atom_dot {
    background: white ; 
    width: 10px ; 
    height: 10px ; 
    border-radius: 50% ; 
}
.main {
    color: white ; 
    background: black ;  
}
.list{
    display: grid ; 
    padding: 10vh 0 ; 
    gap: 40px ; 
    grid-template-columns: repeat(6 , 1fr ) ;  
}
.item{
    position: relative ; 
}
.item img{
    width: 100% ; 
    height: 400px ;
}
.item_title {
    font-size: 26px ; 
    font-weight: 600 ; 
    height: 110px ;  
}
.item_cover{
    position: absolute ; 
    top: 0 ; 
    left: 0 ; 
    width: 100% ; 
    height: 400px ; 
    background: red ; 
    opacity: .1 ; 
    display: flex ; 
    align-items: center ; 
    justify-content: center ; 
    transition: all 0.2s ease;
}
.item_add{
    color: white ;  
    opacity: .8 ; 
    cursor: pointer ; 
    background: red ;  
    position: absolute ; 
    top: 180px ;  
    left: 100px ;  
    width: fit-content; 
    padding: 10px 15px ; 
    font-size: 18px ; 
    border-radius: 10px ; 
    transition: all 0.2s ease;
}
.item_add:hover{
    color: black ; 
}
.fade-enter-active,
.fade-leave-active {
  transition: all 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: scale(0.98);
}
.profile_container{
    position: relative ; 
    padding-right: 100px ; 
}
.profile {
    position: absolute ;
}
.profile_button{
    padding-top: 10px ; 
    display: flex ; 
    align-items: center ; 
    gap: 5px ;  
    cursor: pointer ; 
    transition: all .2s ease ; 
}
.profile_button:hover{
    color: red ; 
}
</style>

<script>
export default {
    data() {
        return {
            books: [
                {
                    id: 1,
                    title: "The Go Programming Language",
                    author: "Alan A. A. Donovan",
                    price: 4500,
                    stock: 10,
                    isbn: "9780134190440",
                    image: "https://covers.openlibrary.org/b/id/890277-M.jpg",
                },
                {
                    id: 2,
                    title: "Clean Code",
                    author: "Robert C. Martin",
                    price: 5000,
                    stock: 7,
                    isbn: "9780132350884",
                    image: "https://covers.openlibrary.org/b/id/14634053-M.jpg",
                },
                {
                    id: 3,
                    title: "Introduction to Algorithms",
                    author: "Thomas H. Cormen",
                    price: 7200,
                    stock: 5,
                    isbn: "9780262033848",
                    image: "https://covers.openlibrary.org/b/id/12622181-M.jpg",
                },
                {
                    id: 4,
                    title: "Design Patterns",
                    author: "Erich Gamma",
                    price: 4800,
                    stock: 8,
                    isbn: "9780201633610",
                    image: "https://covers.openlibrary.org/b/id/13438312-M.jpg",
                },
                {
                    id: 5,
                    title: "You Don't Know JS",
                    author: "Kyle Simpson",
                    price: 3000,
                    stock: 15,
                    isbn: "9781491904244",
                    image: "https://covers.openlibrary.org/w/id/8295312-M.jpg",
                },
                {
                    id: 6,
                    title: "Effective Java",
                    author: "Joshua Bloch",
                    price: 5300,
                    stock: 6,
                    isbn: "9780134685991",
                    image: "https://covers.openlibrary.org/w/id/775426-M.jpg",
                },
                {
                    id: 7,
                    title: "Cracking the Coding Interview",
                    author: "Gayle Laakmann McDowell",
                    price: 4600,
                    stock: 9,
                    isbn: "9780984782857",
                    image: "https://covers.openlibrary.org/w/id/8295222-M.jpg",
                },
                {
                    id: 8,
                    title: "Refactoring",
                    author: "Martin Fowler",
                    price: 5500,
                    stock: 4,
                    isbn: "9780201485677",
                    image: "https://covers.openlibrary.org/b/id/4665422-M.jpg",
                },
                {
                    id: 9,
                    title: "The Pragmatic Programmer",
                    author: "Andrew Hunt",
                    price: 4900,
                    stock: 12,
                    isbn: "9780201616224",
                    image: "https://covers.openlibrary.org/b/id/10594745-M.jpg",
                },
                {
                    id: 10,
                    title: "Head First Design Patterns",
                    author: "Eric Freeman",
                    price: 4600,
                    stock: 11,
                    isbn: "9780596007126",
                    image: "https://covers.openlibrary.org/b/id/8231856-M.jpg",
                },
                {
                    id: 11,
                    title: "Programming Pearls",
                    author: "Jon Bentley",
                    price: 3400,
                    stock: 6,
                    isbn: "9780201657883",
                    image: "https://covers.openlibrary.org/b/id/239240-M.jpg",
                },
                {
                    id: 12,
                    title: "Structure and Interpretation of Computer Programs",
                    author: "Harold Abelson",
                    price: 5100,
                    stock: 5,
                    isbn: "9780262510875",
                    image: "https://covers.openlibrary.org/b/id/240726-M.jpg",
                }
            ] , 
            isActive: [false , false , false , false  , false , false , false , false , false , false , false , false , false] , 
            username: 'Miko' , 
            isWrapped: false ,
            error: ""
        }
    } , 
    methods: {
        logOut() {
            this.$router.push('/')
        } , 
        toMyBooks() {
            this.$router.push('/mybooks')
        }
    } , 
     
    async mounted() {
      try {
        const booksResponse = await fetch("http://localhost:8080/books");
        if (!booksResponse.ok) {
          const err = await booksResponse.text();
          this.error = err;
          return;
        }
        const bookData = await booksResponse.json(); 
        this.books = bookData.books 
    
        const userResponse = await fetch("http://localhost:8080/me", {
          credentials: "include" 
        });
        if (!userResponse.ok) {
          const err = await userResponse.text();
          this.error = err;
          return;
        }
        const userData = await userResponse.json();
        const user = userData.user
        this.username = user.username;
      } catch (e) {
        console.error(e);
        this.error = "Something went wrong while loading data.";
      }
    }
}
</script>

