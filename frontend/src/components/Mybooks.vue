<template>
    <div class="mybooks">
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
                        <div class="profile_button">
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
            <div class="list">
                <div class="item" v-for="(book , index) in books" :key="index">
                    <img :src="book.image" class="item_image">
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
            <div @click="toMarket" class="back_button">
                back
            </div>
        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            username: null , 
            isWrapped: false , 
            error: "" , 
            books: [] ,  
        }
    } , 
    methods: {
      logOut() {
          this.$router.push('/')
      } , 
      toMarket() {
          this.$router.push('/market')
      } ,
      toMyBooks() {
          this.$router.push('/mybooks')
      } , 
      async getBookById(id) {
        try {

            const url = "http://localhost:8080/books/" + id
            const res = await fetch(url) 

            if (!res.ok) {
                const err = await response.text() 
                this.error = err ;
                return
            }

            const bookData = await res.json() 
            const book = bookData.book

            this.books.push(book)
        } catch (error) {
            console.error(this.error);
        }
      }
    
    } , 
    async mounted() {
      
        try {
          const userRes = await fetch("http://localhost:8080/me", {
            method: "GET",
            credentials: "include"
          });
        
          if (!userRes.ok) {
            const err = await userRes.text();
            this.error = err;
            return;
          }
        
          const userData = await userRes.json();
          this.username = userData.user.username;
        
          this.books = [];
        
          const response = await fetch("http://localhost:8080/users/me/orders", {
            method: "GET",
            credentials: "include"
          });
        
          if (!response.ok) {
            const err = await response.text();
            this.error = err;
            return;
          }
        
          const orderData = await response.json();
          const orders = orderData.orders;
        
          for (let i = 0; i < orders.length; i++) {
            this.getBookById(orders[i].book_id); // make sure this method is defined and works
          }
        
        } catch (error) {
          console.error("Request failed:", error.message);
          this.error = "Something went wrong while fetching user or orders.";
        }
    }
}
</script>

<style scoped> 
.mybooks{
    background: black ; 
    min-height: 100vh ; 
    color: white ; 
}
.container{
    width: 90% ; 
    margin: 0 auto ; 
    padding-bottom: 5vh ; 
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
.list{
    min-height: 60vh ; 
}
.market_profile:hover{
    color: red ;
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
.list{
    display: grid ; 
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
.back_button{
    font-size: 18px ;
    font-weight: 600 ; 
    width: fit-content; 
    margin: 0 auto ;
    color: #cca63f ; 
    border: 2px #cca63f solid ; 
    padding: 10px 25px ; 
    cursor: pointer ; 
    transition: all .2s ease ; 
    border-radius: 5px ; 
    margin-top: 10vh ; 
    text-decoration: underine ; 
}
.back_button:hover{
    background: #cca63f ;
    color: black ;  
}
</style>
