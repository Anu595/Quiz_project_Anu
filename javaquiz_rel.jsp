<%-- 
    Document   : javaquiz_rel
    Created on : 26 Jun, 2023, 1:58:08 PM
    Author     : anuve
--%>

<%@page import="backend.QuestionListJava"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ArrayList<QuestionListJava> ql = (ArrayList<QuestionListJava>) request.getAttribute("questions");%>
<% String tablename=request.getParameter("tablename");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HTML Quiz</title>
        <link rel="stylesheet" href="css/javaquiz_rel.css" >
        <link rel="icon" href="Yellow.png" type="image/x-icon">

    </head>
    <body>
          
        <nav class="navbar-top">
            <li><a href="UserSignup.jsp">Log Out</a></li>
            <li><a href="#">Score</a></li>
            <li><a href="#">Leader Board</a></li>

        </nav>
        <nav class="navbar">
            <ul>
                <div><img src="Yellow.png" id="yellow1"></div>
                <li>Quizzer</li>
                <li><a href="#">Home</a></li>
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

        <div class="quizbody-wrapper">
            <div class="quizbody" id="quizbody-id">
              

                    <%for (QuestionListJava q : ql) {%>
                    
                    <div class="qset"  >
                        <form name="sub-form" id="opt-form"><br>
                         <pre style="width:500px;font-size: 15px;font-family:sans-serif;line-height: 2;"> <%=q.getSino()%>. <%=q.getQuestion().toString().trim()%></pre>
                         <label class="radio_lab"><input type="radio" name="option" class="inprad" id="opta" value="<%=q.getOptA().toString().trim()%>"/><%=q.getOptA().toString().trim()%></label><br>
                       <label class="radio_lab"><input type="radio" name="option" class="inprad" id="optb" value="<%=q.getOptB().toString().trim()%>"/><%=q.getOptB().toString().trim()%></label><br>
                        <label class="radio_lab"><input type="radio" name="option"  class="inprad" id="optc" value="<%=q.getOptC().toString().trim()%>"/><%=q.getOptC().toString().trim()%></label><br>
                        <label class="radio_lab"><input type="radio" name="option" class="inprad" id="optd" value="<%=q.getOptD().toString().trim()%>"/><%=q.getOptD().toString().trim()%></label><br>
                        <input type="hidden" name="ans" value="<%=q.getAns().toString().trim()%>"/>
                        <div id="disp"></div>
                        </form>
                  
                    </div>
                    
                    <% }%>
                    <form name="jform" id="myform">
                        <!--onsubmit="validation();return false;"-->
                    <input type="submit" value="Submit Quiz" class="sub_but"/>
                  
                    </form>
                       
            </div>
               <div id="result"></div>       
        </div>
           <script>
//               document.getElementsByClassName("radio_lab").addEventListener("mouseover", function() {
//    document.getElementsByClassName("radio_lab").style.backgroundColor = "#CDE1F7";
//});
//    
//document.getElementsByClassName("radio_lab").addEventListener("mouseout", function() {
//    document.getElementsByClassName("radio_lab").style.backgroundColor = "white";
//});
     window.addEventListener("DOMContentLoaded", (event) => {
      var form=document.getElementById("myform");
      //Calling a function during form submission.
       form.addEventListener('submit',validation);
      form.addEventListener('submit',submitForm);
     
});
 function validation(){
//     const hiddenInputs = document.querySelectorAll('input[type="hidden"]');
//const radio_but=document.querySelectorAll('input[name="option"]');
//const hiddenInputValues = [];
//const selectedValues=[];
//hiddenInputs.forEach((ele) => {
//    hiddenInputValues.push(ele.value);
//});
//
//console.log(hiddenInputValues);
//var buf=1;
//radio_but.forEach((rad) => {
//    for(var i=0;i<=)
//    if(rad.checked){
//    selectedValues.push(rad.value);
//    }
//});
//console.log(selectedValues);
     
//           const radio_but=document.querySelectorAll('input[name="option"]');
//           const answer=document.querySelectorAll('input[name="ans"]');
//           var attempted=0;
//           var score=0;
//            var ans_arr = [];
//            var tags = document.getElementsByTagName("input");

//for(var i = 0; i < tags.length; i++){
//  if(tags[i].getAttribute("hidden") != null){
//    console.log(tags[i].value);
//  }
//}
//            alert(answer.length);
//        try{
//            for(var j=0;j<answer.length;j++){
//                var a=String(answer[j].value).trim();
//                ans_arr.push(a);
//document.getElementById("result").innerHTML += j+":"+answer[j].value +"<br>"; 
//            }
//            alert(ans_arr);
//        }
//        catch(e){
//            console.log(e);
//        }
            
            
 
//            document.getElementById("result").innerHTML += answer[0].value;
//             document.getElementById("result").innerHTML += ans_arr +"<br>"; 
//    
           var attempted=0;
           var score=0; 
           var temp=0;
           const scro=document.getElementById("quizbody-id");
const answer=document.querySelectorAll('input[name="ans"]');
const radio_but=document.querySelectorAll('input[name="option"]');
const label_ele=document.querySelectorAll('label');

          for(var i=0;i<answer.length;i++)  {
              for(var j=(4*i);j<((i+1)*4);j++){
                  if((radio_but[j].value)==(answer[i].value)){
                      var temp=j;
                  }
                   if(radio_but[j].checked){
              attempted++;
                  if((radio_but[j].value)==(answer[i].value)){
//                      document.getElementById("disp").innerHTML += "Correct !! Answer : " + answer[i].value;
                      label_ele[j].style.backgroundColor="#ACDF87";
                      label_ele[j].style.fontWeight="bolder";
                   score++;   
               }
               else if((radio_but[j].value)!=(answer[i].value)){
                   label_ele[j].style.backgroundColor="#eda08e";
                      label_ele[j].style.fontWeight="bolder";
                      label_ele[temp].style.backgroundColor="#ACDF87";
                       label_ele[temp].style.fontWeight="bolder";
               }
          }
                      
              }
              
          }
//         scro.scrollIntoView(behavior: "smooth", block: "end"); 
       document.getElementById("result").innerHTML+= "        Your Score Card !!"+"<br>"+"<br>"+"<br>";
       document.getElementById("result").innerHTML+= "Total Questions:      20"+"<br>"+"<br>";
       document.getElementById("result").innerHTML+= "Attempted:          "+attempted +"<br>"+"<br>";
       document.getElementById("result").innerHTML+="Score:               "+ score +"<br>"
   }
// const radio_but=document.querySelectorAll('input[name="option"]');
// buf=0;
//      for(var i=0;i<radio_but.length;i++){
//          
//  if(radio_but[i].checked){
//              attempted++;
//              
//          }
//      }
////               selectedValues.push(radio_but[i].value);
//               document.getElementById("result").innerHTML += radio_but[i].value +"<br>";  
// document.getElementById("result").innerHTML += radio_but[i].value + "::"+ answer[i].value +"<br>"; 
//                if((radio_but[i].value)==(answer[i].value)){
//                   score++;
//                   
//               } 

//          }
//                       else{
//               selectedValues.push("null"); 
//            }
//              document.getElementById("result").innerHTML+= "attempted: "+attempted + "score : "+ score +"<br>";
//      }
//     document.getElementById("result").innerHTML+= "attempted: "+attempted + "score : "+ score +"<br>";
//     }
//        for(var i=0;i<=20;i++){
//            var se=radio_but.value;
      //    console.log(radio_but);
//               if((radio_but[i].value)===(answer[i].value)){
//                   score++;
//               } 
//            }
//             else{
//               selectedValues.push("null"); 
//            }       
//        }
              
//            document.getElementById("result").innerHTML = "";
//            var ele = document.getElementsByTagName('input');
//            for (i = 0; i < ele.length; i++) {
//                if (ele[i].type = "radio") {
// 
//                    if (ele[i].checked)
//                        document.getElementById("result").innerHTML
//                            += ele[i].name + " Value: "
//                            + ele[i].value + "<br>";
//                }
//            }
        
  function submitForm(event){   
      //Preventing page refresh
       event.preventDefault();
}
//     alert("hello1");
      
        
       //alert("hello2");
//        var element= document.getElementById("quizbody-id").getElementsByTagName("input");
//      var selectedValues = [];
//const node=element.getAttribute("option");
//
//        let a=element.length;
//        alert(a);


//                  for (var i = 0; i < form.length; i++) {
//for(var j=1;j<=4;j++){
//    if(radio_ele[i].checked){
//        selectedValues.push(radio_ele[i].value);
//         document.getElementById("result").innerHTML = "Result: " + radio_ele[i].value; 
//    }
//    else{
//         selectedValues.push("--blank--");
//    }
//}}
   //    const radio_but=document.querySelectorAll('input[name="option"]');
//       const answer=document.querySelectorAll('input[name="ans"]');
//        let a=answer.length;
//        alert(a);
    
    
//var attempted=0;
//var score=0;
      
//        for(var i=0;i<=20;i++){
//            var se=radio_but.value;
      //    console.log(radio_but);
//               if((radio_but[i].value)===(answer[i].value)){
//                   score++;
//               } 
//            }
//             else{
//               selectedValues.push("null"); 
//            }

             
        
//        }
//        alert(attempted+ " "+ score);
           
          
//    }
        
                </script>     
    </body>
</html>