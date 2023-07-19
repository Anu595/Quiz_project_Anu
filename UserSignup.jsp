<%-- 
    Document   : UserSignup
    Created on : 9 Jun, 2023, 8:41:04 AM
    Author     : anuve
--%>

<%@page import="java.sql.*"%>
<%@page import="backend.ConnectionA1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quizzer Signin</title>
    <link rel="icon" href="Yellow.png" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="SignupStyles.css">
</head>
<body>
    <script>
        function signup(){
            document.getElementById("signin").style.left="-400px";
            document.getElementById("signup").style.left="50px";
            document.getElementById("btn").style.left="110px";
        }
        function signin(){
            document.getElementById("signin").style.left="50px";
            document.getElementById("signup").style.left="450px";
            document.getElementById("btn").style.left="0px";
        }
         function validateform(){
            var name= document.myForm.uname.value;
            var password=document.myForm.uname.value;
            if(name==null||name=="")
            {
                alert("Name cannot be blank");
                return false;
            }
            else if (password.length<8){
                alert("Password must be atleast 8 charachter long");
                return false;
            }
        }
    </script>
    <nav class="navbar">
        <ul>
            <div><img src="Yellow.png" id="yellow1"></div>
          <li>Quizzer</li>
               <li><a href="#">Home</a></li>
               <li><a href="#">About </a></li>
               <li><a href="#">Quiz List </a></li>
               <li><a href="Contactform.jsp">Contact</a></li>
               
           </ul> 
       </nav>
       <div class="msg-box">
           <h4>Quizzer</h4>
           <h6>Test your programming knowledge with Quizzer, an online platform that helps you have a strong and solid hold on basic concepts!</h6>
    </div>
   <div class="main">
    <div class="form-box">
        <div class="button-box">
            <div id="btn"></div>
            <button type="button" class="tg-btn" onclick="signin()">Sign In</button>
            <button type="button" class="tg-btn" onclick="signup()">Sign Up</button>
        </div>
      
       
        <form class="inp" id="signin" action="Signin.jsp" method="post" onsubmit="validateform()">
            <div class="msg">
                <div class="welcome1">
                <img src="Yellow.png" id="yellow">
                </div>
                <div class="welcome2">
                    <p>Welcome back!</p>
                </div>
            </div>
            <input type="text" class="inpfield" placeholder="  Username or Email Id" required name="username">
            <input type="text" class="inpfield" placeholder="  Password" required name="password">
           <p class="terms"><a href="#"><i>Forgot password?</i></a></p>
            <button type="submit" value="submit" class="sbtn1">Log In</button>
        </form>
        
        <form class="inp" id="signup" action="Signup.jsp" method="post" onsubmit="validateform()">  
            <div class="msg">
                <div class="welcome1">
                <img src="Yellow.png" id="yellow">
                </div>
                <div class="welcome2">
                    <p>Welcome to <b>Quizzer!</b></p>
                </div>
            </div>
            <input type="text" class="inpfield" placeholder="  Username" required name="username">
            <input type="email" class="inpfield" placeholder="  Email Id" required name="email">
            <input type="text" class="inpfield" placeholder="  Password" required name="password">
            <input type="checkbox" class="check"><span class="terms1"><i><a href="#"> I Agree to terms and conditions</a></i></span>
            <button type="submit" value ="submit" class="sbtn2">Sign Up</button>
        </form>
    </div>
</div>


</body>
</html>
