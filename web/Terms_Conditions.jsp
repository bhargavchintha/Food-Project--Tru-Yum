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
    <link rel="stylesheet" type="text/css" href="./Bubbls.css">
    <link rel="stylesheet" type="text/css" href="./Terms-conditions.css">
    </head>
    <body>
        <div class="nav">      
        <input type="checkbox" id="nav-check" title="Checkbox" placeholder="checkbox" >
        <div class="nav-header">
          <div class="nav-title">
              <a class="tum-tum" href="Home.jsp">
                  <div class="Grid-tittle">
                      <div class="tittle-img">
                          <img src="images/Tru_yum-Transparent.png" width="40px" tittle="TruYum" alt="TruYum" >
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
                        <h1 class="FULL_NAME">Welcome,&nbsp;<%= FullName%>!</h1>
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
          <a class="Links-None" href="passwordchange.jsp">Change Password</a>
          <a class="Links-None" href="About.jsp">About</a>
          <a class="Links-None" href="Address.jsp">Address</a>
          <a class="Links-None" href="Address.jsp">Address</a>
          <a class="Links-None" href="logout.jsp">Logout</a>
          
         
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
     <a href="Address.jsp">Address</a>
    <a href="Address.jsp">Address</a>
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
        


    <div class="Ma">
          <div class="Terms-Conditions">
              <div class="Terms-Conditions-1">
                  <div class="Terms-Conditions-2">
                      
                    <h1 class="Terms-CS">Terms and Conditions for Truyum Project</h1>
                    <div class="Second-T-C">  
                        <div class="Space-Terms">
                            <p class="Terms-C">These terms and conditions ("Terms") govern your use of the Truyum project ("Project"). Please read these Terms carefully before accessing or using the Project. By accessing or using the Project, you agree to be bound by these Terms.</p>
                        </div>
                    </div>   
                    
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">1.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Project Purpose: </span>
                                    The Truyum Project aims to provide a platform for users to access and manage their digital library of books, as well as discover new books and interact with other users.</p></div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">  
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">2.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms"> User Responsibilities:</span></p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">a.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C" ><span class="Terms">Registration:</span> In order to use the Project, you may be required to register and provide accurate and complete information. You are responsible for maintaining the confidentiality of your account and password.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">b.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C" ><span class="Terms">Prohibited Activities - You agree not to engage in any of the following activities:</span></p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Term">-</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C" >Violating any applicable laws or regulations.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Term">-</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">Impersonating any person or entity or misrepresenting your affiliation with any person or entity.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Term">-</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">Interfering with or disrupting the Project or servers or networks connected to the Project.</p>
                            </div>
                        </div>        
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Term">-</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">Uploading, posting, or transmitting any harmful content including viruses, malware, or any other similar software.</p>
                            </div>
                        </div>         
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">c.</span></p></div>
                            <div class="C-flex">
                                 <p class="Terms-C" ><span class="Terms">Content Usage:</span> You understand that the content provided within the Project, including books, reviews, and other user-generated content, is for personal use only. You may not reproduce, distribute, modify, or create derivative works based on the content without the proper authorization.</p>
                            </div>
                        </div>  
                   </div>
              
                    <div class="Second-T-C">
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">3.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms"> Intellectual Property:</span></p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">a.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms">Ownership: </span>All intellectual property rights in the Project, including but not limited to the software, designs, trademarks, and logos, are owned by the Project owner or its licensors.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">b.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms">User Content: </span>By posting or submitting any content to the Project, you grant the Project owner a non-exclusive, worldwide, royalty-free, irrevocable license to use, reproduce, modify, adapt, publish, distribute, and display such content in connection with the Project.</p>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="Second-T-C">
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">4.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms"> Privacy:</span></p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">a.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms">Data Collection: </span>The Project may collect and store certain personal information as outlined in the Privacy Policy. By using the Project, you consent to the collection and use of your personal information as described in the Privacy Policy.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">b.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms">Security: </span>The Project owner takes reasonable measures to protect the security of your information. However, no system is completely secure, and the Project owner cannot guarantee the absolute security of your information.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">5.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Disclaimer of Warranty:</span>
                                    To the maximum extent permitted by law, the Project owner shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, arising out of your access to or use of the Project.</p></div>
                        </div>
                    </div>
                     
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">6.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Limitation of Liability:</span>
                                    The Project is provided on an "as is" and "as available" basis. The Project owner does not warrant that the Project will be uninterrupted, error-free, or free of viruses or other harmful components. The Project owner disclaims all warranties, express or implied, including any warranties of accuracy, merchantability, non-infringement, and fitness for a particular purpose.</p></div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">7.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Modifications:</span>
                                    The Project owner reserves the right to modify or discontinue the Project, or any part thereof, with or without notice. The Project owner shall not be liable to you or any third party for any modification, suspension, or discontinuation of the Project.</p></div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">8.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Governing Law:</span>
                                    These Terms shall be governed by and construed in accordance with the laws of the jurisdiction where the Project owner is located, without regard to its conflict of law principles.</p></div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">
                        <div class="Space-Terms">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">9.</span></p></div>    
                                <div class="C-flex"><p class="Terms-C"><span class="Terms">Entire Agreement:</span>
                                    These Terms constitute the entire agreement between you and the Project owner regarding the Project and supersede all prior or contemporaneous understandings and agreements.</p></div>
                        </div>
                    </div>
                    
                    <div class="Second-T-C">
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">10.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C"><span class="Terms"> Remembering PIN:</span></p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">a.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">Upon successful login, the Project may provide an option to remember your PIN for future logins. This feature is designed for convenience, allowing you to bypass entering the PIN during subsequent login attempts.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">b.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">You acknowledge that enabling the "Remember PIN" feature is at your own risk. You are responsible for maintaining the security and confidentiality of your PIN. The Project owner shall not be liable for any unauthorized access to your account resulting from the use of the "Remember PIN" feature.</p>
                            </div>
                        </div>
                        <div class="Space-Conditions">
                            <div class="T-flex"><p class="Terms-C"><span class="Terms">c.</span></p></div>
                            <div class="C-flex">
                                <p class="Terms-C">You may disable the "Remember PIN" feature at any time through the Project settings. It is recommended to exercise caution and disable this feature if you are using a shared or public device.</p>
                            </div>
                        </div>
                    </div>

                    <div class="Space-Conditions">
                        <p class="Terms-C">Please note that the above clause is a suggested addition based on your request and may need to be reviewed and adjusted to fit the specific context and requirements of your Truyum Project.</p>  
                    </div>
                    
                    <div class="Space-Conditions">
                        <p class="Terms-C">By using the Truyum Project, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these Terms, please refrain from accessing or using the Project.</p>  
                    </div>
    
              </div>
          </div>
      </div>
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
                                       <i class="fa fa-facebook" aria-hidden="true" ></i>
                                    </span>
                                  </a>
                              </div>   
                              
                              <div class="Twitter">
                                    <a class="FACEBOOK" href="https://twitter.com/Truyum3" target="_blank" >
                                        <span class="facebook-icon">
                                           <i class="fa fa-twitter" aria-hidden="true" ></i>
                                        </span>
                                    </a>
                              </div> 
                              
                              <div class="You-Tube">
                                    <a class="FACEBOOK" href="https://www.youtube.com/channel/UCFIsbjBz154Qqb5RJJoDBUQ" target="_blank" >
                                        <span class="facebook-icon">
                                           <i class="fa fa-youtube-play" aria-hidden="true"></i>
                                        </span>
                                    </a>
                              </div>   
                              
                              <div class="Instagram">
                                    <a class="FACEBOOK" href="https://www.instagram.com/truyum3/" target="_blank" >
                                        <span class="facebook-icon">
                                            <i class="fa fa-instagram" aria-hidden="true" ></i>
                                        </span>
                                    </a>
                              </div>
                              
                          </div>
                          
                          <div class="Term-Co">
                              <div class="Term-Co-1">
                                  <div class="Term-Co-2">
                                      <a class="Terms" href="Terms_Conditions.jsp"><i id="fa-gave" class="fa fa-gavel"></i>Terms and Conditions</a>
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
    

