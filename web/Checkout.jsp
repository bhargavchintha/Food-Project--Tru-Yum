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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

      <!-- start slick script here-->
  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous"></script>
  <!-- end here-->
    
    <link rel="stylesheet" type="text/css" href="./Bubbls.css">
   
    <link rel="stylesheet" type="text/css" href="./Check_out.css">
    </head>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="UserDAO.UserDAO" %>
<%@ page import="UserDAO.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Address.Address" %>
<%@ page import="Address.AddressDetails" %>
<%@page import="delete.deleteAddress"%>
<%@ page import="Address.AddressUpdate" %>
<%
    
        HttpSession sessions = request.getSession();
        String username = (String) session.getAttribute("username");
        String name = (String) session.getAttribute("name");
         String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        

        int pin = (int) session.getAttribute("pin");
         String FirstLetterCapitalized = name.substring(0, 1).toUpperCase();

    // You can now use the firstLetterCapitalized variable to display the first letter in capital
   // out.println("<p>Name: " + FirstLetterCapitalized + "</p>");
    
     String FullName = name.substring(0, 1).toUpperCase() + name.substring(1);

    // You can now use the fullNameCapitalized variable to display the full name with the first letter capitalized
     // out.println("<p>Name: " + email + "</p>");
       //out.println(pin);
        
       /// out.println("<p>Name: " + password + "</p>");
       // out.println("<p>PIN: " + phone + "</p>");
    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<!-- display the name and pin on the JSP page using EL -->

<%@ page import="java.sql.*"%>
<%
 String totalprice = request.getParameter("totalprice");
String item_name = request.getParameter("item_name");
String clock = request.getParameter("clock");
String status = request.getParameter("status");
//String email = request.getParameter("email");
 String randomtime=request.getParameter("randomtime");
 String nameitems=request.getParameter("nameitems");
    // Save itemName to the database using SQL statements
    String sql = "INSERT INTO itemsofnames (email, item_name,clock,status) VALUES ('" + email + "', '" + item_name + "', '" + clock + "', '" + status + "')";
    
    // Execute the SQL statement to insert the value into the database using your database connection
    try {
        Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        conn.close();
    } catch (Exception e) {
        //out.println("Error: " + e.getMessage());
    }
    
    // Print the item name in SQLYog
     //out.println("Email: " + nameitems);
    //out.println("<br>");
    //out.println("Item Name: " + item_name);out.println("<br>");
   //out.println(  clock +"<br>" + status + "<br>" + totalprice  ); // Add a line break between each item
%>





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
          <a class="Links-None" href="passwordchange.jsp">Change Password</a>
          <a class="Links-None" href="About.jsp">About</a>
          <a class="Links-None" href="Address.jsp">Address</a>
          <a class="Links-None" href="Your_Order_List.jsp">Order List</a>
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
    <a href="Your_Order_List.jsp">Order List</a>
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
 
      
    <div class="Check-out">
        <div class="Check-out-1">
           <!-- <div class="Check-out-2">  
               <div class="form-container">
                    <p class="Check-circle">1</p>
                    <div class="double-line"></div>
                    <p class="Check-circle">2</p>
                    <div class="double-line"></div>
                    <p class="Check-circle">3</p>
                </div>
            </div>-->
            <div class="List-Check">
                
                <div class="Line-Items">
                    <p class="Items"><span class="Onhover-Item">ITEM(s)</span></p>
                </div>
                <div class="Item-check">
                    <p class="Item-Name">Item(s):</p>
                    <div class="Item-Names">
                        
                        <div class="List-Names-1">
                           <p class="List-Items">
                                <%= item_name%>
                           </p> 
                        </div>
                        <div class="List-Names-2">
                            <a class="Go_Back" href="Order.jsp">Edit <span class="Angle-Down"><i class="fa fa-angle-down"></i></span> </a>
                        </div>
                        
                    </div>
                    <div class="Line-Hr">
                        <hr class="Hr-Line">
                    </div>
                    <div class="Total-Price">
                        
                        <div class="Total-Price-1">
                            <a href="Menu.jsp" class="Circle-Round-Name"> <span class="Cirlce-Plus"><i class="fa fa-plus-circle" aria-hidden="true"></i></span>Add More Items  </a> 
                        </div>
                        <div class="Total-Price-2">
                            <p class="Total-price-items">Price: <span class="Price-items"><i class="fa fa-rupee-sign"></i><%= totalprice %></span> </p>  
                        </div>
                        
                    </div> 
                        <style>
                            .fa-times{
                              font-size: 15px;
                              font-weight: 200;
                              padding-left: 5px;
                              padding-right: 5px;
                            }
                            div.multiple-items{
                                padding-left: 10px;
                                padding-right: 10px;
                            }
                            div.Item-Images{
                                padding-top: 10px;
                            }
                            div.Images-Slider{
                                padding-top: 10px;
                                padding-bottom: 10px;
                                z-index: 99999;
                               overflow: visible; 
                               width: 100%;
                               margin: auto;
                            }
                            div.tooltip{
                                width: 80%;
                                margin: auto;
                            }
                            span.tooltiptext{
                                display: none;
                                
                            }
                            a.A-Today{
                                display: block;
                                position: relative;
                            }
                            a.A-Today img{
                                width: 85px;
                                max-width: 85px;
                                height: 50px;
                                max-height: 50px;
                                border-radius: 5px;
                            }
                            a.A-Today:hover img {
                                transform: scale(1.4);
                                transition: 0.3s all linear;
                            }
                            div.Flex-box-btn{
                                display: flex;
                                align-items: center;
                                justify-content: space-between;
                            }
                            div.Buttons-Slider{
                                display: none;
                                margin-top: -100px;
                            }
                            div.Item-Images-1:hover div.Buttons-Slider{
                                display: block;
                            }
                            button.left-Arrow,button.right-Arrow{
                                background-color: #fff;
                                color: #204F7A;
                                border-radius: 50%;
                                border: 1px solid #204F7A;
                                outline: none;
                                padding: 6px;
                                font-size: 18px;
                                cursor: pointer;
                                width: 30px; 
                                height: 30px; 
                                display: flex; 
                                justify-content: center; 
                                align-items: center; 
                                position: absolute;
                                margin-left: -15px;
                            }
                            button.left-Arrow:hover,button.right-Arrow:hover{
                                background-color: #204F7A;
                                color: #fff;
                                border: 1px solid #fff;
                                box-shadow: 0 0 3px 0 #000;
                            }
                            div.Visible-Image{
                                color: #204F7A;
                                padding-top: 5px;
                            }
                        </style>
                        <div class="Visible-Image">
                            <span class="Image-Names">Item Name:&nbsp;<span class="Visible-Image-Name"></span></span>
                        </div>
                        <div class="Item-Images">
                            <div class="Item-Images-1">
                               <div class="slider multiple-items">
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                          <a class="A-Today" href="Today_Specail/Aamras_Ki_Kadhi.jsp"> 
                                              <img class="Image-Slider-Text" src="images/Today-Special/Aamras-Ki-Kadhi.jpg" alt="Aamras Ki Kadhi" title="Aamras Ki Kadhi" />
                                          </a>
                                            <span class="tooltiptext">Aamras Ki Kadhi</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Butter_Chicken.jsp"> 
                                                <img src="images/Today-Special/Butter-Chicken.jpg" alt="Butter Chicken" title="Butter Chicken"  />
                                          </a>
                                            <span class="tooltiptext">Butter Chicken</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Chicken_65.jsp"> 
                                                <img src="images/Today-Special/Chicken-65.jpg" alt="Chicken-65" title="Chicken-65"  />
                                          </a>
                                            <span class="tooltiptext">Chicken-65</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Egg_Plant.jsp"> 
                                                <img src="images/Today-Special/Egg-Plant.jpg" alt="Egg Plant" title="Egg Plant"  />
                                          </a>
                                            <span class="tooltiptext">Egg Plant</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Fish_Fingers.jsp"> 
                                                <img src="images/Today-Special/Fish-Finger.jpg" alt="Fish Finger" title="Fish Finger"  />
                                          </a>
                                            <span class="tooltiptext">Fish Finger</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Grilled_Chicken.jsp"> 
                                                <img src="images/Today-Special/Grilled-Chicken.png" alt="Grilled Chicken" title="Grilled Chicken"  />
                                          </a>
                                            <span class="tooltiptext">Grilled Chicken</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Hyderabadi_Chicken_Fry.jsp"> 
                                                <img src="images/Today-Special/Hyderabadi-Chicken-Fry.jpg" alt="Hyderabadi Chicken Fry" title="Hyderabadi Chicken Fry"  />
                                          </a>
                                            <span class="tooltiptext">Hyderabadi Chicken Fry</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Hyderabadi_Mutton_keema.jsp"> 
                                                <img src="images/Today-Special/Hyderabadi-Mutton-Keema.jpg" alt="Hyderabadi Mutton Keema" title="Hyderabadi Mutton Keema"  />
                                          </a>
                                            <span class="tooltiptext">Hyderabadi Mutton Keema</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Malabar_Fish_Biryani.jsp"> 
                                                <img src="images/Today-Special/Malabar-Fish-Biryani.jpg" alt="Malabar Fish Biryani" title="Malabar Fish Biryani"  />
                                          </a>
                                            <span class="tooltiptext">Malabar Fish Biryani</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Masala_Channa.jsp"> 
                                                <img src="images/Today-Special/Masala-Channa.jpg" alt="Masala Channa" title="Masala Channa"  />
                                          </a>
                                            <span class="tooltiptext">Masala Channa</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Mutton_Korma.jsp"> 
                                                <img src="images/Today-Special/Mutton-korma.png" alt="Mutton korma" title="Mutton korma"  />
                                          </a>
                                            <span class="tooltiptext">Mutton korma</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Nihari_Gosht.jsp"> 
                                                <img src="images/Today-Special/Nihari-Gosht.jpg" alt="Nihari Gosht" title="Nihari Gosht"  />
                                          </a>
                                            <span class="tooltiptext">Nihari Gosht</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Pina_Colada_Pork_Ribs.jsp"> 
                                                <img src="images/Today-Special/Pina-Colada-Pork-Ribs.jpg" alt="Pina Colada Pork Ribs" title="Pina Colada Pork Ribs"  />
                                          </a>
                                            <span class="tooltiptext">Pina Colada Pork Ribs</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Prawn_Curry.jsp"> 
                                                <img src="images/Today-Special/Prawn-Curry.jpg" alt="Prawn Curry" title="Prawn Curry"  />
                                          </a>
                                            <span class="tooltiptext">Prawn Curry</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Special_Chicken_Biryani.jsp"> 
                                                <img src="images/Today-Special/Special-Chicken-Biryani.jpg" alt="Special Biryani" title="Prawn Curry"  />
                                          </a>
                                            <span class="tooltiptext">Prawn Curry</span>
                                        </div>
                                    </div>
                                    <div class="Images-Slider">
                                        <div class="tooltip">
                                            <a class="A-Today" href="Today_Specail/Tandoori_Lamb_Chops.jsp"> 
                                                <img src="images/Today-Special/Tandoori-Lamb-Chops.jpg" alt="Tandoori Lamb Chops" title="Tandoori Lamb Chops"  />
                                          </a>
                                            <span class="tooltiptext">Tandoori Lamb Chops</span>
                                        </div>
                                    </div>
                                   
                              </div>
                                <div class="Flex-box-btn">
                                    <div class="Buttons-Slider">
                                       <button class="left-Arrow"><i class="fa fa-arrow-left"></i></button>
                                   </div>
                                <div class="Buttons-Slider">
                                       <button class="right-Arrow"><i class="fa fa-arrow-right"></i></button>
                                   </div>
                                </div>
                                  
                              <script>
                                $(document).ready(function(){
                                var container = $('.multiple-items');
                                var divs = container.children('div');

                                shuffleArray(divs); // Shuffle the div elements

                                container.html(divs); // Reorder the divs inside the container

                                // Initialize the Slick Slider
                                container.slick({
                                  infinite: true,
                                  slidesToShow: 6,
                                  slidesToScroll: 5,
                                  autoplay: true, 
                                  autoplaySpeed: 3000,
                                  prevArrow: $('.Buttons-Slider .left-Arrow'),
                                  nextArrow: $('.Buttons-Slider .right-Arrow'),
                                  responsive: [
                                        {
                                            breakpoint: 1100, 
                                            settings: {
                                                slidesToShow: 5, 
                                                slidesToScroll: 4 
                                            }
                                        },
                                        {
                                            breakpoint: 768,
                                            settings: {
                                                slidesToShow: 4, 
                                                slidesToScroll: 3 
                                            }
                                        },
                                        {
                                            breakpoint: 680, 
                                            settings: {
                                                slidesToShow: 3, 
                                                slidesToScroll: 2 
                                            }
                                        },
                                        {
                                            breakpoint: 380, 
                                            settings: {
                                                slidesToShow: 2, 
                                                slidesToScroll: 1 
                                            }
                                        },
                                        {
                                            breakpoint: 270, 
                                            settings: {
                                                slidesToShow: 1, 
                                                slidesToScroll: 1
                                            }
                                        }
                                    ],
                                  onInit: function() {
                                    // Show the initial tooltip text on load
                                    var initialImage = $('.tooltip:first-child');
                                    var tooltipText = initialImage.find('.tooltiptext').text();
                                    $('.Visible-Image-Name').text(tooltipText);
                                  }
                                });
                                if ($('.Visible-Image-Name').text().trim() === '') {
                                    $('.Visible-Image-Name').text('hover on the image');
                                  }
                                // Show tooltip text on hover
                                $('.tooltip').hover(function() {
                                  var tooltipText = $(this).find('.tooltiptext').text();
                                  $('.Visible-Image-Name').text(tooltipText);
                                }, function() {
                                  // Clear tooltip text when not hovering
                                  $('.Visible-Image-Name').text(tooltipText);
                                });
                              });

                              // Function to shuffle an array
                              function shuffleArray(array) {
                                for (var i = array.length - 1; i > 0; i--) {
                                  var j = Math.floor(Math.random() * (i + 1));
                                  var temp = array[i];
                                  array[i] = array[j];
                                  array[j] = temp;
                                }
                              }
                               
                               
                              </script> 
                            </div>
                        </div>
                </div>
                        <div class="Saving-Amount">
                            <div class="Saving-Amount-1">
                                <div class="Saving-Amount-2">
                                     <p class="Items"><span class="Onhover-Item">SAVING(s)</span></p>
                                </div>
                                <div  class="Item-check" id="ITEM_CHECKS">
                                    <div class="Flex-Button-Coupons">
                                        <div class="Item-check-coupon">
                                            <p class="Item-Name">Coupons</p> 
                                        </div>
                                        <div class="Coupon_button">
                                            <button id="myBtn"class="Open_modal-btn" >Click To Apply</button>
                                        </div> 
                                    </div>
                                   <div class="Open-Tab">
                                       
                                       <div class="Show-Coupon"><p class="Coupon"></p></div>
                                        <div id="myModal" class="modal">  
                                         <div class="modal-content">
                                                <span class="close">&times;</span>
                                                
                                                    <div class="Search-coupon">
                                                        <div class="Search-coupon-1">
                                                            <div class="Search-bar-coupon">
                                                                <input id="searchbar" type="text" placeholder="Search coupons"  required="" />
                                                                <button id="searchButton">Search</button>
                                                            </div>
                                                            <div style="display:none" class="noresults">Coupon Expired or Invalid</div>
                                                            <div class="Gift-coupon">
                                                                <div class="Gift-coupon-1">
                                                                    <div class="Gift-Coupon-flex-1">
                                                                      <i class="fa fa-gift"></i>
                                                                    </div>
                                                                    <div class="Gift-Coupon-flex-2">
                                                                        <p class="Gift-Section"> This section is for Coupons Only.
                                                                        <li class="Gift" >Click the "Apply" button to redeem your gift card.</li></p>
                                                                    </div>
                                                                </div>
                                                                
                                                            </div>
                                                            <div class="Offers-you">
                                                                <h5 class="Offer-for">Offers For You</h5>
                                                                <p class="Offer-Yu">Coupons made just for you</p>
                                                            </div>
                                                            <div id="button-container">
                                                                <!-- first start -->
                                                                <div class="Coupons" id="Coupons-1"  >
                                                                    <div class="Coupons-Applying">
                                                                        <div class="Coupons-Applying-1">
                                                                            <div class="Coupons-Applying-2">
                                                                                <div class="Coupons-Applying-3">
                                                                                    <div class="Coupon-first-1">
                                                                                        <p class="First-Order-T"> First Truyum  </p>
                                                                                    </div>
                                                                                    <div class="Coupon-first-2">
                                                                                        <p class="Total-Coupon-Offer"> 150 OFF</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="Amount-Coupon">
                                                                                    <p class="Amount-Value">Get 150 Off On Order Above Rs.250</p>
                                                                                </div>
                                                                                <div class="T-C-Apply">
                                                                                    <div class="T-C">
                                                                                        <p class="T_C">T & C</p> 
                                                                                    </div>
                                                                                    <div class="Apply-BUTTON">
                                                                                        <button class="APPLY_BTN" id="applyButton" >Apply</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="Red-Min">
                                                                                <p class="MUST_VALUE">The Value must be greater than or equal to 250 </p>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                                <!-- first End-->
                                                                <!-- second start -->
                                                                <div class="Coupons" id="Coupons-2" >
                                                                    <div class="Coupons-Applying">
                                                                        <div class="Coupons-Applying-1">
                                                                            <div class="Coupons-Applying-2">
                                                                                <div class="Coupons-Applying-3">
                                                                                    <div class="Coupon-first-1">
                                                                                        <p class="First-Order-T"> FOOD 200  </p>
                                                                                    </div>
                                                                                    <div class="Coupon-first-2">
                                                                                        <p class="Total-Coupon-Offer"> 200 OFF</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="Amount-Coupon">
                                                                                    <p class="Amount-Value">Get 200 Off On Order Above Rs.600</p>
                                                                                </div>
                                                                                <div class="T-C-Apply">
                                                                                    <div class="T-C">
                                                                                        <p class="T_C">T & C</p> 
                                                                                    </div>
                                                                                    <div class="Apply-BUTTON">
                                                                                        <button class="APPLY_BTN" id="applyButton" >Apply</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="Red-Min">
                                                                                <p class="MUST_VALUE">The Value must be greater than or equal to 600 </p>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                                <!-- second End -->
                                                                <!-- Third start -->
                                                                <div class="Coupons" id="Coupons-3" >
                                                                    <div class="Coupons-Applying">
                                                                        <div class="Coupons-Applying-1">
                                                                            <div class="Coupons-Applying-2">
                                                                                <div class="Coupons-Applying-3">
                                                                                    <div class="Coupon-first-1">
                                                                                        <p class="First-Order-T"> Order 300  </p>
                                                                                    </div>
                                                                                    <div class="Coupon-first-2">
                                                                                        <p class="Total-Coupon-Offer"> 300 OFF</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="Amount-Coupon">
                                                                                    <p class="Amount-Value">Get 300 Off On Order Above Rs.1000</p>
                                                                                </div>
                                                                                <div class="T-C-Apply">
                                                                                    <div class="T-C">
                                                                                        <p class="T_C">T & C</p> 
                                                                                    </div>
                                                                                    <div class="Apply-BUTTON">
                                                                                        <button class="APPLY_BTN" id="applyButton" >Apply</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="Red-Min">
                                                                                <p class="MUST_VALUE">The Value must be greater than or equal to 1000 </p>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                                <!-- Third End -->
                                                                   
                                                            </div>

                                                            
                                                        </div>
                                                    </div>
                                                
                                            </div>
                                        </div>
                                   </div>
                                     
                                    <div class="Display_Coupon"  id="couponDiv"  ></div>
<!--                                        <div class="Amount_Of_Coupon"></div>-->
                                </div>
                            </div>
                        </div>
                                        
                        <div class="Billing-Total">
                            <div class="Line-Items">
                                <p class="Items"><span class="Onhover-Item">BILLING</span></p>
                            </div>
                            <div class="Item-check">

                                <div class="Sub-Total">
                                    <div class="Sub-Total-1">
                                        <p class="Subtotal">Subtotal </p> 
                                    </div>
                                    <div class="Sub-Total-2">
                                        <div class="Amount_Of_Coupon-1" > <i class="fa fa-rupee-sign"></i><%= totalprice%> </div>
                                        <div style="display:none" class="Amount_Of_Coupon"  >  </div>
                                    </div> 
                                </div>
                                <div class="Coupon-Decrease">
                                    <div class="coupon-decrease-1">
                                        <p class="Subtotal">Coupon Discount</p>
                                    </div>
                                    <div class="coupon-decrease-1">
                                        <div class="decrase_Of_Coupon" ></div> 
                                    </div>
                                </div>
                                <div class="Delivery-Option">
                                    <div class="Delivery-Img-1">
                                        <div class="Delivery-Img-11">
                                             <img class="Delivery-Img" src="images/fast-delivery.png" />
                                        </div>
                                        <div class="Delivery-Img-12">
                                            <p class="Delivery-Fee-1">Delivery partner fee</p>
                                            <p class="Delivery-Fee-2">Fully goes to them for their time and effort</p>
                                        </div>
                                    </div>
                                    <div class="Delivery-Img-2">
                                        <p class="Delivery-Amount"><i class="fa fa-rupee-sign"></i>25</p>
                                    </div>
                                </div>
                                <div class="Line-Mark-Hr">
                                    <hr class="Line-Mark-Hr-1">
                                </div>
                                <div class="Grand-Total">
                                    <div class="Grand-Total-1">
                                        <p class="Value-Total">Grand Total</p>
                                    </div>
                                    <div class="Grand-Total-2">
                                         <p class="Grand-Total-Value"></p>
                                    </div>
                                </div>
                            </div>   
                        </div>  
                        
                           
                        <div class="Address-Details">
                            <div class="Line-Items">
                                <p class="Items"><span class="Onhover-Item">Your Address</span></p>
                            </div>
                            <div class="Item-check">
                                <p class="Add-your-Address">Your Address</p>
                                <div class="Line-Mark-Hr">
                                    <hr class="Line-Mark-Hr-1">
                                </div>
                                <div class="Address-Flex">
                                    <div class="Address-Flex-1">
                                        <div class="Showing-Address"></div>
                                    </div>
                                    <div class="Address-Flex-2">
                                        <button class="Open-Button-Modal">Change</button>
                                    </div>
                                </div>
                                
                                
                                <div class="Address-Default">
                                    <div class="Address-Default-1">
                                        <div class="Address-Default-2">
                                            
                                            <div id="Address-modal" class="Address-modal">  
                                                <div class="Address-modal-content">
                                                       <span class="Address-close">&times;</span>
                                                      
                                                       
                                                        <%
                                                       //String email = (String) session.getAttribute("email");

                                                       Address addressInstance = new Address();
                                                       List<AddressDetails> addressList = addressInstance.getAddressDetailsByEmail(email);

                                                       if (addressList != null && !addressList.isEmpty()) {
                                                           // Display the address details
                                                       %>
                                                           <h1 class="Your-Address">Your Address</h1>
                                                           <% for (AddressDetails addressDetails : addressList) { %>
        
   
    
    <div class="Address-show">
        <div class="Address-show-1">
            <div class="Address-Show-11">
                <input type="radio" checked="" id="Address-Show" name="addressshow"title="Address" placeholder="Address" value="&lt;span class=&quot;Address-Details-List&quot;&gt;  &lt;span class=&quot;Address-Name-1&quot;&gt;  <%= addressDetails.getCnName() %>,&lt;span class=&quot;Address-label&quot;&gt;<%= addressDetails.getAddressLabel() %> &lt;/span&gt; &lt;/span&gt; <br>  &lt;span class=&quot;Address-Name-2&quot;&gt;  <%= addressDetails.getHouseNo() %>, <%= addressDetails.getBuildingName() %>, <%= addressDetails.getVillageTown() %>, <%= addressDetails.getCity() %>, <%= addressDetails.getPincode() %>, <%= addressDetails.getState() %> &lt;/span&gt; <br> &lt;span class=&quot;Address-Name-3&quot;&gt;  <%= addressDetails.getPhoneNo() %>&lt;/span&gt; &lt;/span&gt; ">
            </div>
            <div  class="Address-show-2">
                <p class="Address-p"> <%= addressDetails.getCnName() %>  <span class="Inside-P"><%= addressDetails.getAddressLabel() %></span>  </p>
                <p class="Span-inside" > <span class="Address-span"><%= addressDetails.getHouseNo() %></span>,
                     <span class="Address-span"><%= addressDetails.getBuildingName() %></span>,
                     <span class="Address-span"><%= addressDetails.getVillageTown() %></span>,
                     <span class="Address-span"><%= addressDetails.getCity() %></span>,
                     <span class="Address-span"><%= addressDetails.getPincode() %> </span>,
                     <span class="Address-span"><%= addressDetails.getState() %></span>.
                <br><span class="Address-span"><%= addressDetails.getPhoneNo() %></p>
            </div>       
        </div>
  </div>   
           
<%
  
    }

%>
<p class="T-Edit">
    <a class="Edit-A" href="Address.jsp">Click to Add or Edit Address </a>
</p>
<div class="Close-A-Btn">
<button class="Close-Address">Close</button>
</div>
<%
} else if (email != null && !email.isEmpty()) {
 %>
 
<%
// No address details found for the user
}
%>




  
<%@ page import="java.sql.*" %>


   
            </div>
        </div>
    </div>
  
  
  <!-- Button to open the modal -->
  

                                      
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="Line-Items">
                                        <p class="Items"><span class="Onhover-Item">Payment Method(s)</span></p>
                                    </div>
                                    <div class="Item-check">
                                      
                                        <label class="Pay-ment" for="payment">Select Payment Method:</label>
                                            <select class="Pay-ment-Modes" name="paymentmodes" id="payment">
                                                <option value="Not select" disabled=""  selected="" >Select</option>
                                              <option value="UPI">UPI</option>
                                              <option value="Card">Card</option>
                                              <option value="Cash on delivery">Cash on delivery (COD)</option>
                                            </select>

                                        
                                        <div class="Select-option"></div>
                                       
                                       <div class="Upi-payment">
                                        <label for="upiInput">UPI Payment:</label>
                                        <input type="upi" id="upiInput"  name="upiInput"  placeholder=" @ybl or @ybl or @paytm" ><br>
                                        <div class="Pay-btn">
                                        <label class="Upi-verify"><i class="fa fa-check-circle"></i>  Verify </label>
                                        <label class="Error-Upi" >Error ID</label>
                                        <button class="UPI-PAY" onclick="verifyUPI()"> Pay &nbsp;<span class="Grand-Total-Value"></span></button>
                                        </div>


                                       </div>
                                       <div class="Card-Payment">
                                           <input type="name-1" class="Card-Name" name="card-name" placeholder=" Card Holder Name" />
                                           <input type="name-1"  id="numericInput" class="Card-number" name="card-number" placeholder="enter card number"  minlength="12" maxlength="12" />
                                          
                                           <select class="Month" name="card-month" id="month" >
                                               <option value="Select" disabled="" selected="">Select month</option>
                                               <option value="January">January</option>
                                                <option value="February">February</option>
                                                <option value="March">March</option>
                                                <option value="April">April</option>
                                                <option value="May">May</option>
                                                <option value="June">June</option>
                                                <option value="July">July</option>
                                                <option value="August">August</option>
                                                <option value="September">September</option>
                                                <option value="October">October</option>
                                                <option value="November">November</option>
                                                <option value="December">December</option>
                                           </select>
                                           
                                           <select id="year" name="year" class="year">
                                                <option value="Select" disabled="" selected="">Select Year</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                                <option value="2025">2025</option>
                                                <option value="2026">2026</option>
                                                <option value="2027">2027</option>
                                                <option value="2028">2028</option>
                                                <option value="2029">2029</option>
                                                <option value="2030">2030</option>
                                                <option value="2031">2031</option>
                                                <option value="2032">2032</option>
                                                <option value="2033">2033</option>
                                                <option value="2034">2034</option>
                                                <option value="2035">2035</option>
                                           </select><br>
                                            <input class="password"id="passwordcvv" type="password" placeholder="Enter Cvv " minlength="3" maxlength="3"  /><br>
                                <div class="Card-center">        
                                    <label class="card-verify"><i class="fa fa-check-circle"></i> Verified</label>
                                    <label class="Error-card">Error</label>
                                    <button class="UPI-PAY" onclick="verifyCard()">Pay &nbsp;<span class="Grand-Total-Value"></span></button>
                                </div>           
                                       </div>
                                       
                                    </div>
            
            
                               </div>
                                
                            </div>
                        </div>    
                                        
                          <!--<h4 class="Class-Delivered">Delivered on  <span class="Cricle-Tick_Mark"><i id='Fa-Cricle-Check' class="fa fa-check-circle" aria-hidden="true"></i></span> </h4>            -->                    

                        
<div class="Footer-Complete">
    <div class="Footer-Complete-1">
        <div class="Footer-Complete-2">
            <form method="post"  action="Your_Order_List.jsp">
                 <div class="Com-Footer">
                    <input type="hidden" name="email" value="<%=email%>" readonly="" />
                    <input type="hidden" name="itemlist" value="" readonly="" />
                    <input type="hidden" name="nameitems" value="<%=nameitems%>" readonly="" />
                    <input type="hidden"  name="coupons" id="couponsInput" value="No Coupon Applied" />
                    <input type="hidden" name="orderaddress" id="orderaddress" value="" />
                    <input type="hidden"  id="grand-total-amount" name="grandtotalamount" value=""/>
                    <input type="hidden" id="Paymentmode" name="payment" value=""/>
                    <input type="hidden" id="addresshouse" name="addresshouse" value=""/>
                    <input type="hidden" id="addresstype" name="addresstype" value="nmn"/>
                    <input type="hidden" id="countdownTime" name="randomtime" value="" readonly/>
                    <input type="hidden" id="dateInput" name="date" value="" readonly/>
                    <input type="hidden" id="clockInput"name="clock" value="" readonly/>
                    <input type="hidden" id="orderstatus"name="orderstatus" value="order is delivering" readonly/>
                    <input type="hidden" id="drivernames" name="drivername" value="" />
                    <input type="hidden" id="drivernumbers" name="drivernumber" value="" />
                    <input type="hidden" id="subtotal" name="subtotal" value="<%= totalprice%>" readonly="" />
                    <input type="hidden" id="subtotal" name="subtotal" value="  " readonly="" />
                     
                     <button class="Complete-Footer" id="completeOrderButton" onclick="submitForm(event)">Complete Order</button>
                </div>
            </form>

            <script>//pop message script
            var popupMessage = document.getElementById("popupMessage");
                popupMessage.classList.add("show");
                setTimeout(function() {
                    popupMessage.classList.remove("show");
                }, 2000);
        </script>

        
   
        

        <script>
  $(document).ready(function() {
    var addressRadios = $('input[name="addressshow"]');
    var addressInput = $("#addresstype");

    // Function to extract and set the value of the hidden input
    function setAddressValue() {
      var checkedRadio = addressRadios.filter(":checked");
      var addressHTML = checkedRadio.val();

      // Extract the content from the <span class="Address-Name-2"> element
      var addressSpanContent = $(addressHTML).find(".Address-label").html();
      addressInput.val(addressSpanContent);
    }

    // Call the setAddressValue function on page load
    setAddressValue();

    // Update the hidden input value when the radio button changes
    addressRadios.on("change", function() {
      setAddressValue();
    });
  });
</script>

<script>
  $(document).ready(function() {
    var addressRadios = $('input[name="addressshow"]');
    var addressInput = $("#addresshouse");

    // Function to extract and set the value of the hidden input
    function setAddressValue() {
      var checkedRadio = addressRadios.filter(":checked");
      var addressHTML = checkedRadio.val();

      // Extract the content from the <span class="Address-Name-2"> element
      var addressSpanContent = $(addressHTML).find(".Address-Name-2").html();
      addressInput.val(addressSpanContent);
    }

    // Call the setAddressValue function on page load
    setAddressValue();

    // Update the hidden input value when the radio button changes
    addressRadios.on("change", function() {
      setAddressValue();
    });
  });
</script>

<script>
  // Array containing 20 different names
  var drivers = [
  { name: "Bhargav" },
  { name: "Rama" },
  { name: "Dinesh" },
  { name: "Pranay" },
  { name: "Hari" },
  { name: "Siva" },
  { name: "Kumar" },
  { name: "Subba Reddy" },
  { name: "Anil" },
  { name: "Aadish" },
  { name: "Hamesh" },
  { name: "Deveshwar" },
  { name: "Eashan" },
  { name: "Fanindra" },
  { name: "Gambhir" },
  { name: "Harsh" },
  { name: "Lovesh" },
  { name: "Mallesh" },
  { name: "Narender" },
  { name: "Narayana" },
  { name: "Omesh" },
  { name: "Omkara" },
  { name: "Pavan" },
  { name: "Raagav" },
  { name: "Siddharth" },
  { name: "Tony" },
  { name: "Uday" },
  { name: "Vardan" },
  { name: "Wasan" },
  { name: "Yugander" },
  { name: "Zahin" }
  ];

 

 function updateDriverName() {
    var nameInputElement = document.getElementById("drivernames");
    var currentIndex = parseInt(nameInputElement.dataset.currentIndex) || 0;

    if (currentIndex < drivers.length) {
      // Set the name of the driver
      var driver = drivers[currentIndex];
      nameInputElement.value = driver.name;
    } else {
      // Reset the index to start from the beginning when all names have been displayed
      currentIndex = 0;
      nameInputElement.value = ''; // Clear the name input value
    }

    // Increment the current index to move to the next name in the array
    currentIndex++;
    nameInputElement.dataset.currentIndex = currentIndex;
  }

  // Call the function to update the name input element initially
  updateDriverName();

  setInterval(updateDriverName, 3000); 
</script>



<script>
  // Array containing 20 different phone numbers
  var phoneNumbers = [
    { number: "+91 9685741230" },
    { number: "+91 9874562103" },
    { number: "+91 9763210458" },
    { number: "+91 9948562145" },
    { number: "+91 9652314859" },
    { number: "+91 6253145879" },
    { number: "+91 6321457896" },
    { number: "+91 7845921356" },
    { number: "+91 8542169875" },
    { number: "+91 9685471230" },
    { number: "+91 9985641273" },
    { number: "+91 9985412067" },
    { number: "+91 9685741203" },
    { number: "+91 6301245789" },
    { number: "+91 6985712035" },
    { number: "+91 8569741230" },
    { number: "+91 7640185406" },
    { number: "+91 8897451263" },
    { number: "+91 6521403968" },
    { number: "+91 9652014796" },
    { number: "+91 8965314714" },
    { number: "+91 8695421037" },
    { number: "+91 9856230147" },
    { number: "+91 8965321430" },
    { number: "+91 7894203156" },
    { number: "+91 9966854712" },
    { number: "+91 8859662140" },
    { number: "+91 6958741123" },
    { number: "+91 8652103965" },
    { number: "+91 8574129635" },
    { number: "+91 6320158899" }
  ];

  function updateDriverNumber() {
    var numberInputElement = document.getElementById("drivernumbers");
    var currentIndex = parseInt(numberInputElement.dataset.currentIndex) || 0;

    if (currentIndex < phoneNumbers.length) {
      // Set the phone number
      var phoneNumber = phoneNumbers[currentIndex].number;
      numberInputElement.value = phoneNumber;
    } else {
      // Reset the index to start from the beginning when all phone numbers have been displayed
      currentIndex = 0;
      numberInputElement.value = ''; // Clear the phone number input value
    }

    // Increment the current index to move to the next phone number in the array
    currentIndex++;
    numberInputElement.dataset.currentIndex = currentIndex;
  }

  // Call the function to update the phone number input element initially
  updateDriverNumber();

  // Set the interval to update the phone number every 3 seconds (3000 milliseconds)
  setInterval(updateDriverNumber, 3000);
</script>






    




        
 <script>//date script
        function showDate() {
            var currentDate = new Date();
            var year = currentDate.getFullYear();
            var month = String(currentDate.getMonth() + 1).padStart(2, '0');
            var day = String(currentDate.getDate()).padStart(2, '0');
            var dateString = day + '-' + month + '-' + year;
            document.getElementById("dateInput").value = dateString;
        }

        showDate(); 
    </script>
         <script>// clock script
    function updateClock() {
      var now = new Date();
      var hours = now.getHours();
      var minutes = now.getMinutes();
      var seconds = now.getSeconds();

      // Format the time as HH:MM:SS
      var timeString = hours.toString().padStart(2, '0') + ':' +
        minutes.toString().padStart(2, '0') + ':' +
        seconds.toString().padStart(2, '0');

      // Update the input value with the current time
      document.getElementById('clockInput').value = timeString;
    }

    // Call the updateClock function every second
    setInterval(updateClock, 1);
  </script>   
 <script>// random time numbers b/w 12 to 30
  function updateRandomTime() {
    // Generate a random time between 12:00 and 30:00
    var minutes = Math.floor(Math.random() * 19) + 12;
    var seconds = Math.floor(Math.random() * 60);

    // Format minutes and seconds to always have two digits
    var formattedMinutes = minutes.toString().padStart(2, '0');
    var formattedSeconds = seconds.toString().padStart(2, '0');

    var randomTime = formattedMinutes + ':' + formattedSeconds;
    var timeElement = document.getElementById('countdownTime');

    // Only update the value if it hasn't been manually changed
    if (!timeElement.hasAttribute('disabled')) {
      timeElement.value = randomTime;
    }
  }

  function submitForm(event) {
    event.preventDefault();
    // Disable the input field to prevent manual changes
    var timeElement = document.getElementById('countdownTime');
    timeElement.setAttribute('disabled', 'disabled');
    // Submit the form
    // Your form submission code here
  }

  // Update the random time every 5 seconds
  setInterval(updateRandomTime, 3000);
</script>



<script>
    function submitForm(event) {
  event.preventDefault(); // Prevent the default form submission

  var countdownInput = document.getElementById("countdownTime");
  var completeOrderButton = document.getElementById("completeOrderButton");

  var timeRemaining = countdownInput.value; // Get the time from the input field
  countdownInput.value = timeRemaining; // Update the input value to ensure it is correct

  completeOrderButton.disabled = true; // Disable the button after submission

  startTimer(countdownInput);
}

    </script>
           

<script>// checking the details,like filled or not
  function checkPaymentMethod() {
  var selectedPayment = document.getElementById("payment").value;
  var upiVerificationLabel = document.getElementById("upiVerificationLabel");
  var cardVerificationLabel = document.querySelector(".card-verify");

  // Reset verification labels when payment method is changed
  upiVerificationLabel.textContent = "";
  upiVerificationLabel.classList.remove("verified", "Not-verified");
  cardVerificationLabel.textContent = "";
  cardVerificationLabel.classList.remove("verified", "Not-verified");

  if (selectedPayment === "UPI") {
    // Show UPI verification fields
    document.getElementById("upiDiv").style.display = "block";
    document.getElementById("cardDiv").style.display = "none";
  } else if (selectedPayment === "Card") {
    // Show Card verification fields
    document.getElementById("upiDiv").style.display = "none";
    document.getElementById("cardDiv").style.display = "block";
  } else {
    // Hide both verification fields
    document.getElementById("upiDiv").style.display = "none";
    document.getElementById("cardDiv").style.display = "none";
  }
}

  function verifyCard() {
    var cardNumber = document.querySelector(".Card-number").value;
    var cardMonth = document.getElementById("month").value;
    var cardYear = document.getElementById("year").value;
    var cvv = document.querySelector(".password").value;
    var cardVerificationLabel = document.querySelector(".card-verify");
    var errorCardLabel = document.querySelector(".Error-card");

    if (cardNumber !== "" && cardMonth !== "Select" && cardYear !== "Select" && cvv !== "") {
      // Verify Card
      if (cardNumber.length === 12 && cvv.length >= 3 && cvv.length <= 4) {
        // Card is verified
         cardVerificationLabel.innerHTML = 'Verified';
        cardVerificationLabel.style.display = "block";
        errorCardLabel.style.display = "none";
      } else {
        // Card is not verified
        cardVerificationLabel.style.display = "none";
        errorCardLabel.style.display = "block"; // Show the error label
      }
    } else {
      // Card details are incomplete
      cardVerificationLabel.style.display = "none";
      errorCardLabel.style.display = "block"; // Show the error label
    }
  }



function verifyUPI() {
  var upiInput = document.getElementById("upiInput").value;
  var verificationLabel = document.querySelector(".Upi-verify");
  var errorLabel = document.querySelector(".Error-Upi");

  // Check if the UPI ends with "@ibl", "@paytm", or "@ybl"
  if (upiInput.endsWith("@ibl") || upiInput.endsWith("@paytm") || upiInput.endsWith("@ybl")) {
    // UPI is verified
    verificationLabel.style.display = "block";
    errorLabel.style.display = "none";
  } else {
    // UPI is not verified
    verificationLabel.style.display = "none";
    errorLabel.style.display = "block";
  }
}


function submitForm(event) {
  event.preventDefault(); // Prevent form submission by default

  var totalprice = "<%= totalprice %>";
  var address = document.querySelector(".Showing-Address").textContent;

  if (totalprice === "null" || totalprice === "") {
    alert("Please add items to your order");
    window.location.href = "Order.jsp";
    
  } else if (address.trim() === "") {
    alert("Please add your address");
    window.location.href = "Address.jsp";
  } else {
    var paymentMode = document.getElementById("payment").value;
    var upiVerified = document.querySelector(".Upi-verify").style.display === "block";
    var cardVerified = document.querySelector(".card-verify").textContent === "Verified";

    if (paymentMode === "Not select") {
      alert("Please select a payment method");
    } else if (paymentMode === "UPI" && !upiVerified) {
      alert("Payment method is not verified");
    } else if (paymentMode === "Card" && !cardVerified) {
      alert("Payment method is not verified");
    } else {
      // Allow form submission
      if (paymentMode === "UPI") {
        var confirmPayment = confirm("UPI payment is in progress. Are you sure you want to proceed?");
        if (confirmPayment) {
          document.forms[0].submit();
        }
      } else if (paymentMode === "Card") {
        var confirmPayment = confirm("Card payment is in progress. Are you sure you want to proceed?");
        if (confirmPayment) {
          document.forms[0].submit();
        }
      } else {
        document.forms[0].submit();
      }
    }
  }
}
</script>

            
            
            
            
<script>//it is copying script from select to input
  // Check if there is a previously selected value stored in sessionStorage
  var storedValue = sessionStorage.getItem("selectedPayment");

  // Set the stored value as the initial selection, if available
  if (storedValue) {
    document.getElementById("payment").value = storedValue;
    document.getElementById("Paymentmode").value = storedValue;
  }

  // Add event listener to update and store the selected value
  document.getElementById("payment").addEventListener("change", function() {
    var selectedValue = this.value;
    document.getElementById("Paymentmode").value = selectedValue;
    sessionStorage.setItem("selectedPayment", selectedValue);
  });
</script>
  
  
            
        </div>
    </div>
</div>

<script>
    var numericInput = document.getElementById("numericInput");

numericInput.addEventListener("input", function(event) {
  var input = event.target.value;
  var numericValue = input.replace(/\D/g, ""); // Remove non-numeric characters

  if (input !== numericValue) {
    event.target.value = numericValue; // Update the input value without non-numeric characters
  }
});
</script>
<script>
    var passwordcvv = document.getElementById("passwordcvv");

passwordcvv.addEventListener("input", function(event) {
  var input = event.target.value;
  var passwordcvv = input.replace(/\D/g, ""); // Remove non-numeric characters

  if (input !== passwordcvv) {
    event.target.value = passwordcvv; // Update the input value without non-numeric characters
  }
});
</script>




<script>
  var paymentSelect = document.getElementById("payment");
  var upiPaymentDiv = document.querySelector(".Upi-payment");
  var cardPaymentDiv = document.querySelector(".Card-Payment");
  var selectOptionDiv = document.querySelector(".Select-option");

  // Retrieve the selected payment option from local storage
  var selectedPaymentOption = localStorage.getItem("selectedPaymentOption");
  if (selectedPaymentOption) {
    paymentSelect.value = selectedPaymentOption;
    showPaymentDiv(selectedPaymentOption);
  }

  // Event listener for payment selection change
  paymentSelect.addEventListener("change", function() {
    var selectedValue = paymentSelect.value;
    showPaymentDiv(selectedValue);
    // Store the selected payment option in local storage
    localStorage.setItem("selectedPaymentOption", selectedValue);
  });

  function showPaymentDiv(selectedValue) {
    if (selectedValue === "UPI") {
      upiPaymentDiv.style.display = "block";
      cardPaymentDiv.style.display = "none";
      selectOptionDiv.style.display = "none";
    } else if (selectedValue === "Card") {
      upiPaymentDiv.style.display = "none";
      cardPaymentDiv.style.display = "block";
      selectOptionDiv.style.display = "none";
    } else {
      upiPaymentDiv.style.display = "none";
      cardPaymentDiv.style.display = "none";
      selectOptionDiv.style.display = "block";
    }
  }
</script>



<script>
  document.addEventListener("DOMContentLoaded", function() {
    var listItems = document.querySelector(".List-Items");
    var input = document.querySelector('input[name="itemlist"]');

    // Extract the innerHTML of the <p> element
    var content = listItems.innerHTML.trim();

    // Set the extracted content as the value of the <input> element
    input.value = content;
  });
</script>


<script>
    // Get the div element
    var couponDiv = document.querySelector('.Display_Coupon');

    // Get the value of the div element
    var couponValue = couponDiv.innerText.trim();

    // Set the value of the hidden input field based on the div value
    var hiddenInput = document.querySelector('input[name="coupons"]');
    hiddenInput.value = couponValue !== "" ? couponValue : hiddenInput.value;
</script>



<script>
  $(document).ready(function() {
    var addressShows = document.querySelectorAll('input[name="addressshow"]');
    var showingAddress = document.querySelector(".Showing-Address");

    // Display selected address on page load
    var selectedAddress = $("input[name='addressshow']:checked").val();
    showingAddress.innerHTML = selectedAddress.replace(/&lt;br&gt;/g, "<br>");
    $("#orderaddress").val(selectedAddress); // Set the value of orderaddress input

    // Update selected address on radio button change
    $("input[name='addressshow']").on("change", function() {
      var selectedAddress = $(this).val();
      showingAddress.innerHTML = selectedAddress.replace(/&lt;br&gt;/g, "<br>");
      $("#orderaddress").val(selectedAddress); // Set the value of orderaddress input
    });

    addressShows.forEach(function(addressShow) {
      addressShow.addEventListener("change", function() {
        if (this.checked) {
          showingAddress.innerHTML = this.value.replace(/&lt;br&gt;/g, "<br>");
          $("#orderaddress").val(this.value); // Set the value of orderaddress input
        }
      });
    });
  });
</script>

  
<script>
    
 // Get the div element
var amountDiv = document.querySelector('.decrase_Of_Coupon');

// Check if totalprice has a value
if ("<%= totalprice %>".trim() !== "") {
  var totalAmount = "0";
  //amountDiv.textContent ='<i class="fa fa-rupee-sign"></i>' + totalAmount;
  amountDiv.innerHTML = "-" + '<i class="fa fa-rupee-sign"></i>' + totalAmount;
} else {
  amountDiv.textContent = "0";
}

</script>
                        
<script>
// Get the div element
var amountDiv = document.querySelector('.Amount_Of_Coupon');

// Check if totalprice has a value
if ("<%= totalprice %>".trim() !== "") {
  amountDiv.innerHTML = '<i class="fa fa-rupee-sign"></i>' + "<%= totalprice %>";
} else {
  amountDiv.textContent = "No value available";
}
</script>                
<script>
  $(document).ready(function() {
    $(".APPLY_BTN").on("click", function() {
      var couponName = $(this).closest(".Coupons").find(".First-Order-T").text();
      var couponAmount = parseInt($(this).closest(".Coupons").find(".Total-Coupon-Offer").text());
      var couponId = $(this).closest(".Coupons").attr("id");

      // Update total amount calculation
      var originalAmount = <%= totalprice %>; // Replace with actual value
      var totalAmount = originalAmount;

      // Apply coupon based on couponId
      if (couponId === "Coupons-1") {
        if (totalAmount >= 250) {
          totalAmount -= couponAmount;
          $(".Red-Min", "#" + couponId).hide();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid green");
          $("#myModal").hide();
          $(".Display_Coupon").text(couponName + " - Coupon Applied");
          $("#couponsInput").val(couponName + " - Coupon Applied");
          $(".Amount_Of_Coupon").text(totalAmount);
          $(".decrase_Of_Coupon").html("-" +'<i class="fa fa-rupee-sign"></i>' + couponAmount);
          $(this).text("Applied");
          $(this).prop("disabled", true);

          // Reset other coupons
          $("#Coupons-2 .APPLY_BTN").text("Apply");
          $("#Coupons-3 .APPLY_BTN").text("Apply");
          $("#Coupons-2 .APPLY_BTN").prop("disabled", false);
          $("#Coupons-3 .APPLY_BTN").prop("disabled", false);
        } else {
          $(".Red-Min", "#" + couponId).show();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid red");
        }
      } else if (couponId === "Coupons-2") {
        if (totalAmount >= 600) {
          totalAmount -= couponAmount;
          $(".Red-Min", "#" + couponId).hide();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid green");
          $("#myModal").hide();
          $(".Display_Coupon").text(couponName + " - Coupon Applied");
          $("#couponsInput").val(couponName + " - Coupon Applied");
          $(".Amount_Of_Coupon").text(totalAmount);
          $(".decrase_Of_Coupon").html("-" +'<i class="fa fa-rupee-sign"></i>' + couponAmount);
          $(this).text("Applied");
          $(this).prop("disabled", true);

          // Reset other coupons
          $("#Coupons-1 .APPLY_BTN").text("Apply");
          $("#Coupons-3 .APPLY_BTN").text("Apply");
          $("#Coupons-1 .APPLY_BTN").prop("disabled", false);
          $("#Coupons-3 .APPLY_BTN").prop("disabled", false);
        } else {
          $(".Red-Min", "#" + couponId).show();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid red");
        }
      } else if (couponId === "Coupons-3") {
        if (totalAmount >= 1000) {
          totalAmount -= couponAmount;
          $(".Red-Min", "#" + couponId).hide();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid green");
          $("#myModal").hide();
          $(".Display_Coupon").text(couponName + " - Coupon Applied");
          $("#couponsInput").val(couponName + " - Coupon Applied");
          $(".Amount_Of_Coupon").text(totalAmount);
          $(".decrase_Of_Coupon").html("-" +'<i class="fa fa-rupee-sign"></i>' + couponAmount);
          $(this).text("Applied");
          $(this).prop("disabled", true);

          // Reset other coupons
          $("#Coupons-1 .APPLY_BTN").text("Apply");
          $("#Coupons-2 .APPLY_BTN").text("Apply");
          $("#Coupons-1 .APPLY_BTN").prop("disabled", false);
          $("#Coupons-2 .APPLY_BTN").prop("disabled", false);
        } else {
          $(".Red-Min", "#" + couponId).show();
          $(".Coupons-Applying-2", "#" + couponId).css("border", "1px solid red");
        }
      }

      // Check if any coupons are applied
      var isCouponApplied = $("#Coupons-1 .APPLY_BTN").prop("disabled") ||
                            $("#Coupons-2 .APPLY_BTN").prop("disabled") ||
                            $("#Coupons-3 .APPLY_BTN").prop("disabled");

      if (!isCouponApplied) {
        $(".Display_Coupon").text("No Coupons are applied");
      }

      // Update the total amount display
      $(".Amount_Of_Coupon").html('<i class="fa fa-rupee-sign"></i>' + totalAmount);

      var deliveryAmount = parseFloat($(".Delivery-Amount").text());
      var totalAmount = parseFloat($(".Amount_Of_Coupon").text());

      if (!isNaN(totalAmount)) {
        var grandTotal = totalAmount + deliveryAmount;
        $(".Grand-Total-Value").html('<i class="fa fa-rupee-sign"></i>' + grandTotal.toFixed(1));
        $("#grand-total-amount").val('<i class="fa fa-rupee-sign"></i>' + grandTotal.toFixed(1));
      } else {
        $(".Grand-Total-Value").text("Invalid amount");
      }
    });
  });
</script>

    <script>
  $(document).ready(function() {
    var deliveryAmount = parseFloat($(".Delivery-Amount").text());
    var totalAmount = <%= totalprice %>;

    if (!isNaN(totalAmount)) {
      var grandTotal = totalAmount + deliveryAmount;
       $(".Grand-Total-Value").html('<i class="fa fa-rupee-sign"></i>' + grandTotal.toFixed(1));
       $("#grand-total-amount").val('<i class="fa fa-rupee-sign"></i>' + grandTotal.toFixed(1));
    } else {
      $(".Grand-Total-Value").text("Invalid amount");
    }
  });
</script>

   

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var openButton = document.querySelector(".Open-Button-Modal");
    var modal = document.getElementById("Address-modal");
    var closeButton = modal.querySelector(".Address-close");
    var closeAddressButton = document.querySelector(".Close-Address");

    function openModal() {
      modal.style.display = "block";
    }

    function closeModal() {
      modal.style.display = "none";
    }

    openButton.addEventListener("click", openModal);
    closeButton.addEventListener("click", closeModal);
    window.addEventListener("click", function(event) {
      if (event.target === modal) {
        closeModal();
      }
    });

    closeAddressButton.addEventListener("click", closeModal);
  });
</script>

        
  









                          
    <script>
  $(document).ready(function() {
    $("#searchButton").on("click", function() {
      var value = $("#searchbar").val().toLowerCase();
      var found = false; // Flag to track if any matching coupons are found

//       $("#button-container .Coupons").each(function()
      $("#button-container .Coupons").each(function() {
        var couponText = $(this).text().toLowerCase();
        var matches = couponText.includes(value);
        $(this).toggle(matches);
        if (matches) {
          found = true; // Set the flag to true if any matching coupon is found
        }
      });

      if (!found) {
        $(".noresults").show();
        $("#button-container .Coupons").show();
        $("#button-container").show(); 
      } else {
        $(".noresults").hide();
      }
      
      $("#button-container").show(); // Show the button-container div
    });

    $("#searchbar").on("input", function() {
      if ($(this).val() === "") {
        $("#button-container .Coupons").show();
        $(".noresults").hide();
        $("#button-container").show(); // Show the button-container div
      }
    });
  });
</script>



 
    
 
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "block";
  }
}
</script>


     
                        
                        
                        




                  
                        
                        
                        
         
      
      
      
     
      
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
    

