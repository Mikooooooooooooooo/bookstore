<template>
    <div class="book">
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
            <div class="wrapper">
                <div class="book_image"> 
                    <img :src="book.image" />
                </div>
                <div class="book_info">
                    <div class="book_title">
                        {{book.title}}
                    </div>
                    <div class="book_rating">
                        <img v-for="n in 5" src="../assets/star.png" />
                        5.0
                    </div>
                    <div class="book_subtitle">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsam dolore ad quibusdam, culpa odio facere aliquid maxime repudiandae nulla dolorum ullam aperiam excepturi voluptatem distinctio amet cum expedita sequi quas minima repellat eaque velit consectetur aspernatur. Laboriosam a repudiandae dolorum porro magnam! Soluta dolor architecto odio molestiae iure quaerat a!
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam suscipit saepe quam dolorum voluptate cupiditate, laboriosam voluptas inventore blanditiis delectus corporis dicta quidem illo. Consequuntur repellendus corrupti omnis ea eum?
                        <br>
                        <br>
                        Explicabo ut accusamus velit necessitatibus commodi quos labore, optio modi. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse maxime dolore aliquam, illum, tempora distinctio sapiente in, omnis aperiam excepturi dolores sed! Aperiam magnam dolor sapiente, qui ut vero libero! Vitae id nihil quis quos? Qui dolores blanditiis at asperiores nobis sequi, quo in fugit minima magni atque praesentium ad veritatis eaque pariatur provident temporibus unde ipsa odit error accusamus! Ipsa, cupiditate.
                    </div>
                    <div class="book_options">
                        <div class="book_option"> 
                            <div class="option_header">
                                Writen by 
                            </div>
                            <div class="option_text">
                                {{book.author}}
                            </div>
                        </div>
                        <div class="book_option"> 
                            <div class="option_header">
                                Publisher
                            </div>
                            <div class="option_text">
                                Agai FullKoiynyzshy
                            </div>
                        </div>
                        <div class="book_option"> 
                            <div class="option_header">
                                Year
                            </div>
                            <div class="option_text">
                                2022
                            </div>
                        </div>
                    </div>
                    <div class="book_footer">
                        <div class="book_price"> 
                            {{book.price}} tg 
                        </div>
                        <div @click="addOrder" class="book_button">
                            Buy 
                            <transition name="fade-slide">
                             <div v-if="isAlert" class="alert">
                                {{aler}}
                             </div>
                            </transition>
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

<style scoped>
*{
    color: white ; 
}
.book {
    background: black ; 
    min-height: 100vh ; 
}
.container{
    width: 70% ; 
    margin: 0 auto ; 
    padding-top: 5vh ; 
}
.wrapper{
    display: flex ; 
    gap: 80px ;
}
.book_image img {
    width: 350px ;  
    border-radius: 15px;
}
.book_title{
    font-size: 40px ; 
    font-weight: 600 ; 
}
.book_rating{
    display: flex ; 
    gap: 15px ; 
    margin: 40px 0; 
    font-size: 24px ; 
    font-weight: 600 ; 
    align-items: center ; 
}
.book_subtitle{
    margin-bottom: 4vh ; 
}
.book_options{
    display: flex ; 
    gap: 60px ; 
    padding-bottom: 3vh ;  
    border-bottom: 1px dashed #bab8b8 ; 
}
.option_header{
    color: #bab8b8 ; 
    padding-bottom: 2vh ; 
}    
.option_text{
    font-size: 24px ; 
    font-weight: 600 ; 
}
.book_footer{
    margin-top: 3vh ; 
    display: flex ; 
    justify-content: space-between ; 
}
.book_price{
    font-size: 32px ; 
    font-weight: 600 ; 
}
.book_button{
    background: #d45d5d ;  
    font-weight: 600 ; 
    font-size: 16px ; 
    display: flex ; 
    align-items: center ; 
    justify-content: center ; 
    width: 180px ; 
    border-radius: 10px ; 
    transition: all .2s ease ; 
    position: relative ; 
}
.book_button:hover{
    background: #cc3f3f ;
    color: black ;
    cursor: pointer ; ;
}
.market_header{ 
    display: flex ; 
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
.alert{
    background: v-bind(alertColor) ; 
    padding: 10px ; 
    position: absolute ; 
    top: 70px ;  
}
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.5s ease;
}
.fade-slide-enter-from,
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-50px);
}
</style>


<script>

export default {
  data() {
    return {
      book:  {
                    id: 1,
                    title: "The Go Programming Language",
                    author: "Alan A. A. Donovan",
                    price: 4500,
                    stock: 10,
                    isbn: "9780134190440",
                    image: "https://covers.openlibrary.org/b/id/890277-M.jpg",
                },
               isWrapped: false , 
               username: 'miko' , 
               userId: null , 
               bookId: null  , 
               isAlert: false , 
               aler: "alert" , 
               alertColor: "red"
    }
  }, 
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
    setAlert() {
        console.log("It is working`")
        this.isAlert = true  
        setTimeout(() => {
          console.log("This runs after 2 seconds");
          this.isAlert = false 
        }, 2000);
    } ,
    async addOrder() {
      
        try {
          const response = await fetch("http://localhost:8080/orders", {
            method: "POST", 
            headers: {
              "Content-Type": "application/json"
            },
            credentials: "include", // Required for cookies to be sent
            body: JSON.stringify({
              book_id: this.bookId,
              user_id: this.userId
            })
          });
        
          if (!response.ok) {
            const err = await response.text(); // await was missing here
            this.error = err;
            this.aler = "Book is not available"
            this.setAlert() 

            return;
          }
        
          // Optional: handle success response
          const data = await response.json();
          console.log("Order created:", data);
          this.aler = "Book is yours"
          this.alertColor = "green"
          this.setAlert()
        
        } catch (error) {
          console.log("Request failed:", error.message);
          this.error = "Request failed. Please try again.";
          this.aler = "Book is not available"
          this.setAlert() 
        }
    }
  } , 
  async mounted() {
    try {
        const id = this.$route.params.id
        const res = await fetch(`http://localhost:8080/books/${id}`)
        if (!res.ok) {
            const err = await res.text() 
            this.error = err 
            return 
        }
        const bookData = await res.json()
 
        this.book = bookData.book 
        this.bookId = this.book.id
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
        this.userId = user.id 
    } catch (e) {
        console.error(e);
        this.error = "Something went wrong while loading data.";
     }

  }
}
</script>
