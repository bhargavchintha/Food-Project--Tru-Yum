<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="UserDAO.UserDAO" %>
<%@ page import="UserDAO.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    
        HttpSession sessions = request.getSession();
        String username = (String) session.getAttribute("username");
        String name = (String) session.getAttribute("name");
        int pin = (int) session.getAttribute("pin");
         String FirstLetterCapitalized = name.substring(0, 1).toUpperCase();

    // You can now use the firstLetterCapitalized variable to display the first letter in capital
   // out.println("<p>Name: " + FirstLetterCapitalized + "</p>");
    
     String FullName = name.substring(0, 1).toUpperCase() + name.substring(1);

    // You can now use the fullNameCapitalized variable to display the full name with the first letter capitalized
   // out.println("<p>Name: " + FullName + "</p>");
       // out.println("<h1>My Cart</h1>");
        
        //out.println("<p>Name: " + name + "</p>");
        //out.println("<p>PIN: " + pin + "</p>");
    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<!-- display the name and pin on the JSP page using EL -->


<!DOCTYPE html>
<html>
    <head>
        <title>TruYum Restaurant | All Food Items</title>
        <link rel="icon" href='images/TRU-YUM.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./bub.css">
    <style>
        *{
            margin: 0%;
            padding: 0%;
            box-sizing: border-box;
            
        }
       .nav {
  height: 70px;
  width: 100%;
  background-color: #204F7A;
  position: relative;
  padding-top: 13px;
  position: fixed;
  z-index: 99999999;
}

.nav > .nav-header {
  display: inline;
}

.nav > .nav-header > .nav-title {
  display: inline-block;
  font-size: 22px;
  color: #fff;
  padding: 10px 10px 10px 10px;
}

.nav > .nav-btn {
  display: none;
}

div.nav-title a.tum-tum{
    color: white;
    transition: all 0.9s ease;
    text-decoration: none;
}
@media screen and (max-width:600px) {
  div.nav-title a.tum-tum{
    margin-left: 0px;
  }
}

.nav > .nav-links {
  display: inline;
  float: right;
  font-size: 20px;
  margin-right: 100px;
  z-index: 99999999;
}

.nav > .nav-links > a {
  display: inline-block;
  padding: 13px 20px 20px 10px;
  text-decoration: none;
  color: #efefef;
}

.nav > .nav-links > a:hover {
  background-color: rgba(0, 0, 0, 0.3);
}

.nav > #nav-check {
  display: none;
}

@media  (max-width:967px) {
  .nav > .nav-btn {
    display: inline-block;
    position: absolute;
    right: 0px;
    top: 0px;
    z-index: 99999;
    
  }
  .nav > .nav-btn > label {
    display: inline-block;
    width: 50px;
    height: 50px;
    padding: 13px;
  }
  
  #fa-bars{
      color: white;
      font-size: 22px;
      padding-top: 13px;
  }
  .nav > .nav-links {
    position: absolute;
    display: block;
    width: 40%;
    background-color: #333333db;

    transition: all 0.3s ease-in;
    overflow-y: hidden;
    top:70px;
    left: 0px;
  }
  .nav > .nav-links > a {
    display: block;
    width: 100%;
  }
  .nav > #nav-check:not(:checked) ~ .nav-links {
    height: 0px;
  }
  .nav > #nav-check:checked ~ .nav-links {
    height: calc(100vh - 50px);
    overflow-y: auto;
  }
}
@media  (max-width:750px){
    .nav > .nav-links {
     width: 45%;   
    }
}
@media  (max-width:600px){
    .nav > .nav-links {
     width: 55%;   
    }
}

@media  (max-width:500px){
    .nav > .nav-links {
     width: 60%;   
    }
}
@media  (max-width:450px){
    .nav > .nav-links {
     width: 68%;   
    }
}
@media  (max-width:420px){
    .nav > .nav-links {
     width: 70%;   
    }
}
@media  (max-width:400px){
    .nav > .nav-links {
     width: 73%;   
    }
}
/* drop down list*/

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
    padding-top: 10px;
    padding-bottom: 20px;
  display: none;
  margin-left: -200px;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 300px;
  height: 240px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
   animation-name: example;
   animation-duration:1s;
   border-radius: 10px; 
   z-index: 999999;
   margin-top: 17px;
   }
    @keyframes example {
    from {height:0vh;
    padding-top:0px;
    padding-bottom:0px;}
    to {height:240px;
    padding-top:10px;
    padding-bottom:20px;}
    }

    .dropdown-content::after{
        content: '';
        top: -17.2%;
        left: 68.5%;
        position: absolute;
        z-index: 999;
         margin-left: -5px;
        border-width: 25px;
        border-style: solid;
       border-color: transparent transparent #f1f1f1 transparent;
    }
    
.dropdown-content a {
  color: black;
  padding: 12px 10px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
/* end here */
  @media screen and (max-width:967px){
    .dropdown-content{
        display: block;
        margin-left: 0px;
        background-color: transparent;
        color: #fff;
        box-shadow: none;
        height:0px;
        margin-top: 0px;
        padding-top: 0px
    }
    .dropdown-content::after{
        display: none;
    }
    .dropdown-content a{
        color: #fff;
        font-size: 23px;
    }
}
div.welcome{
 width: 100%;
 margin: auto;
 padding: 12px 16px;
}
p.Welcomeback{
  padding-bottom: 15px;  
}
.status-bar {
    margin-top: 25px;
    width: 75px;
    height: 45px;
    border-radius: 10px; 
    padding: 10px;
    background-color: green;
    color: #fff;
  }

  .status-bar.online {
    color: #fff;
  }

  .status-bar.offline {
    color: #fff;
  }
  
  .well-display{
      display: none;
  }
  @media screen and (max-width:967px){
      .well-display{
          display: block;
      }
      .welcome{
          display: none;
      }
      
  }
  
  @media screen and (max-width:967px){
      .my{
          display: none;
      }
      .dropdown-content{
       margin-top: -20px;   
      }
      .wel1{
          display: grid;
          grid-template-columns: 1fr 1fr;
          grid-gap: 20px;
      }
  }
  
  h1.FULL_NAME,
  h2.PIN_N{
      padding:13px 10px 10px 10px;
      font-size: 20px;
      color: #fff;
      font-weight: 400;
  }
  .Grid-tittle{
      display: grid;
      grid-template-columns: auto 1fr;
      margin-left: 30px;
      transition: all 0.9s ease;
  }
  
  #fa-bars{
      transition: 0.3s all ease-in;
  }
  
    </style>
    </head>
    <body>
        <div class="nav">      
        <input type="checkbox" id="nav-check">
        <div class="nav-header">
          <div class="nav-title">
              <a class="tum-tum" href="Home.jsp">
                  <div class="Grid-tittle">
                      <div class="tittle-img">
                          <img src="images/Tru_yum-Transparent.png" width="40px"  >
                      </div>
                      <div class="tittle-name">
                          TruYum
                <i id="Knife" class="fad fa-utensils-alt"></i>
                      </div>
                  </div>
                  
            </a>
          </div>
        </div>
        <div class="nav-btn">
          <label for="nav-check">
            <i id="fa-bars" class="fa fa-bars" aria-hidden="true" onclick="toggleIcon()"></i>

<script>
  function toggleIcon() {
    var icon = document.getElementById("fa-bars");
    
    if (icon.classList.contains("fa-bars")) {
      icon.classList.remove("fa-bars");
      icon.classList.add("fa-times");
    } else {
      icon.classList.remove("fa-times");
      icon.classList.add("fa-bars");
    }
  }
</script>
        </label>
        </div>
        
        <div class="nav-links">
            <div class="well-display">
                <div class="wel1"> 
                    <div class="well-1">
                        <h1 class="FULL_NAME">Welcome,&nbsp;<%= FullName%></h1>
                        <h2 class="PIN_N">Your PIN: <%= pin%></h2>
                    </div>
                    <div class="status-bar" title="Online" >Online</div>
                </div>
            </div>    
          <a class="active" href="Home.jsp" >Home</a>
          <a href="Menu.jsp" >Menu</a>
          <a href="Coffee-Tea.jsp">Coffee & Tea</a>  
          <a href="myCart.jsp">My Cart</a>
          <a href="Order.jsp">My Orders</a>
          
          <style>
.letter-container {
  display: inline-block;
}

.circle {
  position: relative; /* Add this line */
  display: inline-block;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #fff;
  text-align: center;
  line-height: 50px;
  cursor: pointer;
  color: #204F7A;
  border: 1px solid;
}

.circle:hover{
    border: 1px solid #ccc;
}
.letter {
  font-size: 24px;
}

.status-dot {
  position: absolute;
  bottom: 5px;
  right: 3px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
}

.online {
  background-color: green;
}

.offline {
  background-color: red;
}
</style>

<div class="dropdown">
    <div class="my">
        <div onclick="myFunction()" class="circle">
            <span class="letter"><%= FirstLetterCapitalized %> </span>
            <span class="status-dot"></span>
        </div>
    </div>         
  <div id="myDropdown" class="dropdown-content">
    <div class="welcome"> 
      <div class="welcome-1">
        <%
         out.println("<p class=\"Welcomeback\">Welcome,&nbsp;" + FullName + "</p>");
         out.println("<p class=\"enterpin\" > Your PIN: " + pin + "</p>");
         %>
      </div>
      
    </div>
    <a href="passwordchange.jsp">Change Password</a>
    <a href="About.jsp">About</a>
    <a href="logout.jsp">Logout</a>
  </div>
</div>

<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.circle') && !event.target.matches('.letter')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

<script>
  function updateStatusDot() {
    var isOnline = navigator.onLine;
    var statusDotClass = isOnline ? 'online' : 'offline';
    var statusDot = document.querySelector('.status-dot');
    statusDot.className = 'status-dot ' + statusDotClass;
  }

  window.addEventListener('online', updateStatusDot);
  window.addEventListener('offline', updateStatusDot);

  // Initial update
  updateStatusDot();
</script>


<script>
  function updateStatusBar() {
    var isOnline = navigator.onLine;
    var statusBar = document.querySelector('.status-bar');
    statusBar.textContent = isOnline ? 'Online' : 'Offline';
    statusBar.title = isOnline ? 'Online' : 'Offline';
    statusBar.classList.toggle('offline', !isOnline);
  }

  window.addEventListener('online', updateStatusBar);
  window.addEventListener('offline', updateStatusBar);

  // Initial update
  updateStatusBar();
</script>
          
        </div>
        
      </div>
        



    <style>
        .Ma{
            padding-top: 70px;
        }
    </style>
      <div class="Ma">
          jhjrhb
      </div>
      
      
      
      
      
      
      
      
      
      
      
      
     
      
      <div class="ocean">
      <div class="bubble bubble--1"></div>
      <div class="bubble bubble--2"></div>
      <div class="bubble bubble--3"></div>
      <div class="bubble bubble--4"></div>
      <div class="bubble bubble--5"></div>
      <div class="bubble bubble--6"></div>
      <div class="bubble bubble--7"></div>
      <div class="bubble bubble--8"></div>
      <div class="bubble bubble--9"></div>
      <div class="bubble bubble--10"></div>
      <div class="bubble bubble--11"></div>
      <div class="bubble bubble--12"></div>
      <div class="bubble bubble--13"></div>
      <div class="bubble bubble--14"></div>
      <div class="bubble bubble--15"></div>
      <div class="bubble bubble--16"></div>
      <div class="bubble bubble--17"></div>
      <div class="bubble bubble--18"></div>
      <div class="bubble bubble--19"></div>
      <div class="bubble bubble--20"></div>
      <div class="bubble bubble--21"></div>
      <div class="bubble bubble--22"></div>
      
      <div class="Matter-Footer">
          <div class="Matter-Footer-1">
              <div class="Matter-Footer-2">
                  <div class="Matter-Footer-3">
                      
                      <div class="Grid-Footer-1">
                          <div class="Logo-Footer">
                              <a href="Home.jsp"><img class="TRU-YUM-img" src="images/Tru_yum-Transparent.png"  ></a>
                          </div>
                          <div class="Footer-Matter">
                              <p class="Footer-matter">
                                  TruYum Food Restaurant, Your destination for delectable cuisine and exceptional dining experiences.
                              </p>
                          </div>
                      </div>
                      
                      <div class="Grid-Footer-2">
                          <div class="Gird-US">
                          <div class="Grid-Footer-21">
                              
                              <div class="Tags-Start">
                                <p class="LINE-mark-1"><a class="Tags" href="Home.jsp">Home</a></p>
                              </div>
                              
                              <div class="MENU">
                              <p class="LINE-mark"><a class="Tags" href="Menu.jsp">Menu</a></p>
                              <div class="Menu-List">
                                  <p class="DOT-mark" ><a class="Tags" href="TodaySpecial.jsp">Today Special</a><p>
                                  <p class="DOT-mark" ><a class="Tags" href="NON-VEG.jsp">NON vegetarian</a><p>
                                  <p class="DOT-mark" ><a class="Tags" href="VEG.jsp">Vegetarian</a></p>
                                  <p class="DOT-mark" ><a class="Tags" href="Offer-Zone.jsp">Offer Zone</a></p>
                              </div>
                              </div>
                              
                              <div class="Coffee">
                                  <p class="LINE-mark"><a class="Tags" href="Coffee-Tea.jsp">Coffee & Tea</a></p>
                              </div>
                              
                              <div class="Mycart">
                                  <p class="LINE-mark"><a class="Tags" href="myCart.jsp">My Cart</a></p>
                              </div>
                              
                              
                              
                          </div>
                          <div class="Grid-Footer-22">
                            <div class="Tag-Footer">
                              
                                <div class="Mycart">
                                  <p class="LINE-mark"><a class="Tags" href="Order.jsp">My Orders</a></p>
                              </div>
                                
                              <div class="password">
                                  <p class="LINE-mark"><a class="Tags" href="passwordchange.jsp">Password Change</a></p>
                              </div>
                              
                              <div class="About">
                                  <p class="LINE-mark"><a class="Tags" href="About.jsp">About</a></p>
                              </div>
                              
                            </div>
                         </div>
                      </div>
                      </div> 
                      
                      
                      
                      
                      <div class="Grid-Footer-4">
                          <div class="Address-contant">
                              <div class="H1-address">
                                  <h3 class="Contant">
                                      Contant
                                  </h3>
                              </div>
                              <div class="Number-email">
                                  <div class="NO">
                                      <i id="PHONE-MARKER" class="fa fa-phone"></i>
                                       <a class="Tags" href="tel:+919876547890">+919876547890</a>
                                  </div>
                                  <div class="Em">
                                      <i id="PHONE-MARKER" class=" fa fa-envelope  "></i>
                                      <a class="Tags" href="mailto:bhargav@gmail.com">bhargav@gmail.com</a>
                                  </div>
                                  <div class="Loaction">
                                      <div class="Loaction-symbol">
                                          <i id="PHONE-MARKER" class=" fa fa-map-marker  "></i>
                                      </div>
                                      <div class="Address">
                                          <a  href="https://www.google.com/maps/place/RXJG%2B3Q7,+Addanki+North+U,+Andhra+Pradesh+523201/@15.8301625,79.974347,17z/data=!3m1!4b1!4m5!3m4!1s0x3a4af3df4d382e83:0x6cc95f13de02fb99!8m2!3d15.8301625!4d79.9769219?entry=ttu"
                                              class="Tags" target="_blank" >  RXJG+3Q7, Addanki North U, Andhra Pradesh 523201</a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                          
                  </div>
                  
                  <div class="LINE-H">
                      <div class="Line-H">
                          <div class="horizontal-line"></div>
                      </div>
                      <div class="Line-H-1">
                          
                          <div class="F-T-Y-I">
                              
                              <div class="FaceBook">
                                  <a class="FACEBOOK" href="https://www.facebook.com/profile.php?id=100093568745955&sk=about_contact_and_basic_info" target="_blank" >
                                    <span class="facebook-icon">
                                       <i class="fa fa-facebook"></i>
                                    </span>
                                  </a>
                              </div>   
                              
                              <div class="Twitter">
                                    <a class="FACEBOOK" href="https://twitter.com/Truyum3" target="_blank" >
                                        <span class="facebook-icon">
                                           <i class="fa fa-twitter"></i>
                                        </span>
                                    </a>
                              </div> 
                              
                              <div class="You-Tube">
                                    <a class="FACEBOOK" href="https://www.youtube.com/channel/UCFIsbjBz154Qqb5RJJoDBUQ" target="_blank" >
                                        <span class="facebook-icon">
                                            <i class="fa fa-youtube"></i>
                                        </span>
                                    </a>
                              </div>   
                              
                              <div class="Instagram">
                                    <a class="FACEBOOK" href="https://www.instagram.com/truyum3/" target="_blank" >
                                        <span class="facebook-icon">
                                            <i class="fa fa-instagram"></i>
                                        </span>
                                    </a>
                              </div>
                              
                          </div>
                          
                          <div class="Term-Co">
                              <div class="Term-Co-1">
                                  <div class="Term-Co-2">
                                      <a class="Terms" href="#"><i id="fa-gave" class="fa fa-gavel"></i>Terms and Conditions</a>
                                  </div>
                                  <div class="Rights">
                                      <p class="Right"> © Copyrights 2023.All rights reserved</p>
                                  </div>
                              </div> 
                          </div>
                          
                      </div> 
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
  color: #84879f;
  background: #F1F1F1 !important;
  box-shadow: 0 -2px 16px rgba(47, 54, 64, 0.39);
  transition: 400ms;
  border: 1px solid #ccc;
  z-index: 9999999;
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
  color: #000000;
  padding: 1px 10px ;
  font-size: 14px;
  border-radius: 3px;
  cursor: pointer;
  outline:none;
  border: 1px solid #84879f;
}
.cookie-btns {
	font-family: inherit;
	font-weight: 400;
  color: #84879f;
  padding: 1px 10px ;
  font-size: 14px;
  border-radius: 3px;
  cursor: pointer;
  outline:none;
  border: 1px solid #84879f;
}
p.Cookie{
  color: #84879f;
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
    <div> </div>
    </body>
</html>
    

