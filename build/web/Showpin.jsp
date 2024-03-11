<%-- 
    Document   : Showpin
    Created on : May 14, 2023, 11:09:28 AM
    Author     : Bhargav
--%>


<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="pin.pin" %>
<%@ page import="pin.UserDetails" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String email = request.getParameter("email");

    pin pinInstance = new pin();
    UserDetails userDetails = pinInstance.getUserDetailsByEmail(email);

    if (userDetails != null) {
        String inputone = request.getParameter("inputone");
        String inputtwo = request.getParameter("inputtwo");
        String inputthree = request.getParameter("inputthree");

        // check if the input values match the corresponding values in the user details
        boolean isMatch = inputone.equals(userDetails.getInputone())
                && inputtwo.equals(userDetails.getInputtwo())
                && inputthree.equals(userDetails.getInputthree());

        if (isMatch) {
            // display success message
            //out.println("<h2>Verification successful!</h2>");
        } else {
            // display error message
            response.sendRedirect("Aboutpin.html?message=User not found");
        }
    } else {
        // user not found, display error message
        response.sendRedirect("Aboutpin.html?message=User not found");
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
                <style>
                    div.Email-detail{
                        padding-top: 15px;
                        padding-bottom: 10px;
                        margin-bottom: 30px;
                    }
                    p.Email-details{
                        font-size: 20px;
                        padding-bottom: 10px;
                        
                    }
                </style>
                
              <div id="sign-up" class="tabcontent">
                <div class="sign-up-1">
                    
                  <div class="sign-up-2">
                      <div class="Sign-up-h1">
                         <h1 class="Login" >Pin</h1>
                      </div>
                      <div class="Email-detail">
                      <p class="Email-details"  >Your Email: <%= userDetails.getEmail() %></p>
                          <p class="Email-details" >Your Pin: <%= userDetails.getPin() %></p>
                      </div>
                      <div class="LOGIN Details">
                          <span class="Already"> Back To<a class="indx"  href="index.html"> Login </a> Page </span><br>
                          <span class="Already">  -or- </span><br>
                          <span class="Already"> Back To<a class="indx"  href="signup.html"> Sign up </a> Page </span><br>
                          <span class="Already">  -or- </span><br>
                          <span class="Already"> Back To<a class="indx"  href="forgot-password.html"> Forgot Password </a> Page </span>
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



        
       