<template>
    <div class="auth">
        <div class=" background">
            <div class="back_top">
            </div> 
            <div class="back_bottom">
            </div>
        </div>
        <div class="container">
            <div class="main" v-if="isLogin">
                <div class="main_wrapper"> 
                    <div class="main_title">
                        Login
                    </div>
                    <div class="input_wrapper">
                        <div class="input_title">
                            Username or email
                        </div>
                        <input v-model="username" type="text"/>
                    </div>
                    <div class="input_wrapper">
                        <div class="input_title">
                            Password
                        </div>
                        <input v-model="password" type="password"/>
                    </div>
                    <div @click="login" class="button">
                        Login
                    </div>
                    <div @click="isLogin=false ; topSpace='12.5vh' ; clear()" class="main_footer">
                        Sign Up
                    </div>
                </div>
            </div>
            <div class="main" v-else>
                <div class="main_wrapper"> 
                    <div class="main_title">
                        Sign up
                    </div>
                    <div class="input_wrapper">
                        <div class="input_title">
                            Username or email
                        </div>
                        <input v-model="username" type="text"/>
                    </div>
                    <div class="input_wrapper">
                        <div class="input_title">
                            Password
                        </div>
                        <input v-model="password" type="password"/>
                    </div>
                    <div class="input_wrapper">
                        <div class="input_title">
                           Confirm Password 
                        </div>
                        <input v-model="confirmPassword" type="password"/>
                    </div>
                    <div @click="register" class="button">
                        Sign Up
                    </div>
                    <div @click="isLogin=true; topSpace='17.5vh' ; clear() ; " class="main_footer">
                        Login
                    </div>
                </div>
            </div>
            <div class="image">
                <div>
                    <img src="../assets/elearning.png" />
                    <div class="image_title">
                        AgaiFullKoiynyzshy
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
*{
    padding: 0 ; 
    margin: 0 ; 
    box-sizing: border-box ; 
}
.auth{
    height: 100vh ; 
    position: relative ; 
}
.background{
    height: 100vh ; 
}
.back_top{
    height: 50vh ; 
    background: #1e5ae6 ; 
}
.back_bottom{
    height: 50vh ; 
    background: #c0d4fb ; 
}
.container{
    display: flex ; 
    width: 65% ; 
    border-radius: 45px  ; 
    background: white ; 
    position: absolute ; 
    top: v-bind(topSpace)  ; 
    left: 17.5%  ; 
}
.main{
    width: 55% ; 
    display: flex ; 
    justify-content: center ; 
}
.main_wrapper{
    width: 60% ; 
    padding-top: calc(15vh - 20px );  
}
.main_title{
    font-size: 35px ; 
    margin-bottom: 20px ; 
    font-weight: 600 ; 
    text-align: center ; 
}
.input_title{
    color: #b3b2b1 ; 
    margin-bottom: 10px ;
}
input{
    width: 100%; 
    outline: none ; 
    border: 0 ; 
    padding: 15px 10px ; 
    background: #e4e4ed ;   
    font-size: 18px ; 
    border-radius: 10px ; 
    margin-bottom: 20px ;
}
.button{
    margin-top: 5vh ; 
    margin-bottom: 10vh ; 
    width: 100% ; 
    border-radius: 10px ; 
    padding: 15px 0 ;
    text-align: center ; 
    background: #1b59e6 ; 
    color: white ; 
    font-size: 18px ;
    font-weight: 600 ; 
    cursor: pointer ; 
    transition: all .2s ease ; 
}
.button:hover{
    background: #1b51e6 ; 
}
.main_footer{
   width: fit-content ; 
   margin: 0 auto ; 
   color: #1b59e6 ; 
   font-weight: 600 ; 
   margin-bottom: 5vh ; 
   cursor: pointer ; 
   transition: all .2s ease ; 
}
.main_footer:hover{
    color: black ; 
}
.image{
    width: 45% ; 
    background: #ecf0f4 ; 
    border-radius: 0 45px 45px 0 ; 
    display: flex ; 
    justify-content: center ; 
    align-items: center ; 
}
.image img{
    width: 150px ; 
    height: 150px ; 
}
.image div {
    text-align: center ; 
}
.image_title{
    margin-top: 5vh ; 
    font-size: 22px; 
    font-weight: 600 ; 
}
</style>

<script>
export default {
    data() {
        return {
            isLogin: true, 
            topSpace: "17.5vh" , 
            username: "" , 
            password: "" , 
            confirmPassword: "" , 
            error: "" 
        }
    } , 
    methods: {
        
        async login() {
          try {
            const response = await fetch("http://localhost:8080/users/authenticate", {
              method: "POST",
              headers: {
                "Content-Type": "application/json"
              },
              body: JSON.stringify({
                email: this.username + "@gmail.com",
                password: this.password
              }),
              credentials: "include" // store and send cookies
            });
        
            const data = await response.json();
        
            if (!response.ok) {
              this.error = data.error || "Login failed";
              return;
            }
        
            console.log("Login success:", data);
            this.$router.push("/market");
          } catch (e) {
            console.error(e);
            this.error = "Login Failed. Try again";
          }
        } , 
        async register() {
          try {
            if (this.password !== this.confirmPassword) {
              this.error = "Passwords are not the same";
              console.log(this.error);
              return;
            }
        
            const userEmail = this.username + "@gmail.com";
        
            const response = await fetch("http://localhost:8080/users", {
              method: "POST",
              headers: {
                "Content-Type": "application/json"
              },
              body: JSON.stringify({
                username: this.username,
                password: this.password,
                email: userEmail  // ✅ You had `this.username` here, corrected to use `userEmail`
              }),
              credentials: "include"
            });
        
            if (!response.ok) {
              const err = await response.text();
              this.error = err;
              console.error("Error:", err);
              return;
            }
        
            const data = await response.json();
            console.log("User created:", data);
        
            this.clear();
            this.isLogin = true;
        
          } catch (e) {
            console.error("Registration failed:", e);
            this.error = "Registration failed. Try again";
          }
        }, 
        clear() {
            this.username = "" 
            this.password = "" 
            this.confirmPassword = ""
        }
    }
}
</script>
