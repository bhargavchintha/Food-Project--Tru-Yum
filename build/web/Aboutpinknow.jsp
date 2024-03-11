<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="pin.UserDetails" %>
<%@ page import="pin.pin" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page import="UserDAO.*, pin.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    String email = request.getParameter("email");

    pin pinInstance = new pin();
    UserDetails userDetails = pinInstance.getUserDetailsByEmail(email);

    if (userDetails != null) {
        // display user details
    } else if (email != null && !email.isEmpty()) {
        // email entered is not found in the database
        response.sendRedirect("Aboutpin.html?message=Entered email not found in the database");
        return;
   }
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href='images/TRU-YUM.png' />
  <link rel="icon" href='https://www.visitstaugustine.com/sites/default/files/styles/cover/public/No_name_front_5x3.jpg?itok=T_w4Aehh.96x96.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <meta charset="UTF-8">
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Styles.css">
    <title> User Details</title>
    
</head>
<body  >
    <!--<div id="google_translate_element"></div>
    <script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>-->

  <div class="Tru-Yums"><h1 class="Tru-Yum-1">TruYum <!--<span><i id="Knife" class="fad fa-utensils-alt"></i></span>--></h1> </div>
    <div class="LOGIN-SIGN">  
        <div class="LOGIN-SIGN-1">   
            <div class="LOGIN-SIGN-2"   >
              <div class="login-page">
                  <div class="tab">
                   
                     
                  </div>
                </div>
                
              <div id="sign-up" class="tabcontent">
                <div class="sign-up-1">
                    <div class="Sign-up-h1">
                         <h1 class="Login" >Pin</h1>
                    </div>
                  <div class="sign-up-2">
                     <form method="post" action="Showpin.jsp">
                         <div class="Option1 > <label class="option1" for="your-email">Your Email</label><br></div>
                        <input type="text" name="email" value="<%= email %>" readonly><br>
                        <div class="Option1 > <label for="OPTION1" name="option1" ><%= userDetails.getOption1() %></label></div>
                        <input name="inputone" type="text" required placeholder="Enter Answer" /><br>
                        <div class="Option1 ><label for="OPTION1" name="option1" ><%= userDetails.getOption2() %></label></div>
                        <input name="inputtwo" type="text" required placeholder="Enter Answer" /><br>
                        <div class="Option1 > <label for="OPTION1" name="option1" ><%= userDetails.getOption3() %></label></div>
                        <input name="inputthree" type="text" required placeholder="Enter Answer" /><br>
                        <input type="submit" value="Submit"  />
                    </form>
                      <div class="LOGIN Details">
                          <span class="Already"> Back To<a class="indx"  href="index.html"> Login </a> Page </span><br>
                          <span class="Already">  -or- </span><br>
                          <span class="Already"> Back To<a class="indx"  href="signup.html"> Sign up </a> Page </span>
                      </div>  
                    </div>  
                </div>
              </div>        
             </div>
        </div>
    </div> 
    
    

   <div class="recaptcha">
        
        
        <div class="recaptcha-1">
          <div class="recaptcha-2">
            <div class="recaptcha-3 left">
              <div class="recaptcha-image"></div>
              <div class="recaptcha-2">
              <a href="https://www.google.com/intl/en/policies/privacy/" target="_blank" class="recaptcha"> Privacy</a><span></span>  <span><a class="recaptcha" href="https://www.google.com/intl/en/policies/terms/">Terms </a></span>
             </div>  
            </div>
            <div class="recaptcha-3 right" >
            <span> <p class="protected" >protected by  <strong>reCAPTCHA</strong>  </p></span>
            <div class="recaptcha-4">
            <a href="https://www.google.com/intl/en/policies/privacy/" target="_blank" class="recaptcha-1"> Privacy</a><span class="recaptcha" > &nbsp;</span><a class="recaptcha-1" href="https://www.google.com/intl/en/policies/terms/">Terms </a></span>
          </div>  
          </div>
          </div>
        
        </div>
        </div>
    
  
  
    

    <style>

.cookie-container {
  margin-top: 10px;
  padding: 20px;
  text-align: center;
  justify-content: center;
  position: fixed;
  bottom: -100%;
  display: inline;
  left: 0;
  right: 0;
  color: #1B395D;
  background: #F1F1F1 !important;
  box-shadow: 0 -2px 16px rgba(47, 54, 64, 0.39);
  transition: 400ms;
  border: 1px solid #ccc;
  z-index: 99999999999999;
}
div.Cookie-flex{
  display: grid;
  grid-template-columns: auto auto;
  width: 90%;
  margin: auto;
  text-align: center;
  justify-content: center;
}
@media screen and (max-width:650px) {
  div.Cookie-flex{
    display: block;
  }
  .cookie-btn,
  .cookie-btns{
    margin-top: 10px;
  }
}
.cookie-container.active {
  bottom: 0;
}

.cookie-btn {
font-family: inherit;
font-weight: 400;
background-color: #1B395D;
  color: #fff;
  padding: 1px 10px ;
  font-size: 15px;
  border-radius: 3px;
  cursor: pointer;
  outline:none;
  border: 1px solid #1B395D;
}
.cookie-btn:hover{
    border: 1px solid #fff;
 color: #1B395D;
background-color: #fff;
box-shadow: 0 0 8px 0 #000; 
}
.cookie-btns {
	font-family: inherit;
	font-weight: 400;
  background-color: #fff;
  color: #1B395D;
  padding: 1px 10px ;
  font-size: 14px;
  border-radius: 3px;
  cursor: pointer;
  outline:none;
  border: 1px solid #1B395D;
}
.cookie-btns:hover{
    border: 1px solid #fff;
 color: #fff;
background-color: #1B395D;
box-shadow: 0 0 8px 0 #000; 
}
p.Cookie{
  color: #1B395D;
  margin-right: 20px;
}
  </style>
    

    <div class="cookie-container" >
      <div class="Cookie-flex">
        <div class="cookie-matter">
      <p class="Cookie" >
        By visiting our site, you agree to our privacy policy regarding cookies, tracking statistics, etc.
      </p>
    </div>
    <div class="Cookie-Button">
      <button class="cookie-btn">
        Accept
      </button>
      <span class=" cookie-closebtn"  ><button class="cookie-btns"  >&times;</button></span>
    </div>
      </div>
    </div>
    <script>
      $(document).ready(function(){
        $(".cookie-closebtn").click(function(){
          $(".cookie-container").hide();
        });
      });
      </script>
      <script >
        
        const cookieContainer = document.querySelector(".cookie-container");
        const cookieButton = document.querySelector(".cookie-btn");
        
    cookieButton.addEventListener("click", () => {
    cookieContainer.classList.remove("active");
    
    localStorage.setItem("_grecaptcha(done by bhargav)",  "09AINsHFc2uoI1NI35z0ref-oSZUuZUxeHb6E2g-zYQ7VS7l6GUozDM2ZnCgQ2BeiDsDMeZirZK2p5cOPVMKflDc0",);
    });
    
    
    setTimeout(() => {
    if (!localStorage.getItem("_grecaptcha(done by bhargav)")) {
      cookieContainer.classList.add("active");
    }
    }, 100);
      </script>
  
  

 <script>
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('message');
    if (message) {
        alert(message);
    }
</script>

  
</body>
</html>


 
                        
    
                    

