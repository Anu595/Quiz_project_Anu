<%-- 
    Document   : Quizlist.jsp
    Created on : 12 Jun, 2023, 9:22:29 AM
    Author     : anuve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>QuizList</title>
    <link rel="stylesheet" href="quizlist.css" >
  <link rel="icon" href="Yellow.png" type="image/x-icon">
  
  </head>
  <body>
       <script>
        function expand() {
          // document.querySelector(".button-container").style.overflow="visible";
          document.getElementById("btngrp").style.top = "10px";
         
        }
      </script>
      
      
      <nav class="navbar-top">
            <li><a href="#">Log Out</a></li>
            <li><a href="#">Score</a></li>
            <li><a href="#">Leader Board</a></li>
            <li><a href="Contactform.jsp">Contact</a></li>
            
        </nav>
    <nav class="navbar">
        <ul>
            <div><img src="Yellow.png" id="yellow1"></div>
          <li>Quizzer</li>
               <li><a href="Quizlist.jsp">Home</a></li>
               <li><a href="#">About </a></li>
               <li><a href="#">HTML </a></li>
               <li><a href="#">CSS </a></li>
               <li><a href="#">RDBMS </a></li>
               <li><a href="#">Java </a></li>
               <li><a href="#">JDBC </a></li>
               <li><a href="#">Servlet </a></li>
               <li><a href="#">JSP</a></li>
               
           </ul> 
       </nav>
    <div class="button-container">
      <div class="button-box">
        <button type="button" class="tg-btn" value ="HTML" onclick="location.href='DB_javaquiz_rel.jsp?tablename=HTML'">HTML</button>
        <button type="button" class="tg-btn" value ="CSS" onclick="location.href='DB_javaquiz_rel.jsp?tablename=CSS'">CSS</button>
        <button type="button" class="tg-btn" value ="Javascript" onclick="location.href='DB_javaquiz_rel.jsp?tablename=Javascript'">Javascript</button>
        <button type="button" class="tg-btn" value ="RDBMS" onclick="location.href='DB_javaquiz_rel.jsp?tablename=RDBMS'">RDBMS</button>
        <button type="button" class="tg-btn" value ="Java" onclick="location.href='DB_javaquiz_rel.jsp?tablename=Java'">Java</button>
        <button type="button" class="tg-btn" value ="JDBC" onclick="location.href='DB_javaquiz_rel.jsp?tablename=JDBC'">JDBC</button>
        <button type="button" class="tg-btn" value ="Servlet" onclick="location.href='DB_javaquiz_rel.jsp?tablename=Servlet'">Servlet</button>
        <button type="button" class="tg-btn" value ="JSP" onclick="location.href='DB_javaquiz_rel.jsp?tablename=JSP'">JSP</button>
        <button type="button" class="tg-btn" value ="Aptitude" onclick="location.href='DB_javaquiz_rel.jsp?tablename=Aptitude'">Aptitude</button>
      </div>
<!--      <div id="btngrp">
        <div class="subbtn" id="one">
            <button class="mode-btn" type="button" onclick="location.href='DB_javaquiz_rel.jsp'">Relaxed</button><br /><br />
        </div>
        <div class="subbtn" id="two">
          <button class="mode-btn">Timed</button><br /><br />
        </div>
        <div class="subbtn" id="three">
          <button class="mode-btn">Top 100</button><br /><br />
        </div>
      </div>-->
    </div>
   
  </body>
</html>

