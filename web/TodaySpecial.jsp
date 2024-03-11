<%-- 
    Document   : TodaySpecial
    Created on : May 6, 2023, 8:36:44 PM
    Author     : Bhargav
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="images/TRU-YUM.png">
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--AngularJS script --><script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title> Today Special | TruYum Restaurant </title>
    <link rel="stylesheet" type="text/css" href="./Today_Special.css">
    <link rel="stylesheet" type="text/css" href="./Bubbls.css">
   
</head>

<%@page import="java.util.List"%>
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
        String email = (String) session.getAttribute("email");
        int pin = (int) session.getAttribute("pin");
       
        String FirstLetterCapitalized = name.substring(0, 1).toUpperCase();
        String FullName = name.substring(0, 1).toUpperCase() + name.substring(1);
        //out.println("<p>Name: " + name + "</p>");
        //out.println("<p>PIN: " + email + "</p>");
        
    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>






<%
// Get the item details from the form data
String itemid = request.getParameter("itemid");
String itemname = request.getParameter("itemname");
String itemprice = request.getParameter("itemprice");
String image = request.getParameter("image");
String link = request.getParameter("link");

if (request.getParameter("addToCart") != null) {
    // Add to Cart button is clicked
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
        PreparedStatement ps1 = c1.prepareStatement("SELECT email, itemid, itemname, image FROM cart WHERE email = ? AND itemid = ? AND itemname = ? AND image = ?");
        ps1.setString(1, email);
        ps1.setString(2, itemid);
        ps1.setString(3, itemname);
        ps1.setString(4, image);
        ResultSet rs = ps1.executeQuery();

        if (rs.next()) {
            // Item with the same email, item ID, and item name already exists in the cart
%>
            <div id="popupMessage" class="popup-message">
                Item Already In Cart!
            </div>
<%
        } else {
            // Item doesn't exist, insert it into the cart table
            try {
                PreparedStatement pstmt = c1.prepareStatement("INSERT INTO cart (email, itemid, itemname, itemprice, image, link) VALUES (?, ?, ?, ?, ?, ?)");
                pstmt.setString(1, email);
                pstmt.setString(2, itemid);
                pstmt.setString(3, itemname);
                pstmt.setString(4, itemprice);
                pstmt.setString(5, image);
                pstmt.setString(6, link);

                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    // Item added to the cart successfully
%>
                    <div id="popupMessage" class="popup-message">
                        Item added to cart!
                    </div>
<%
                } else {
                    // Item insertion failed
                    // response.sendRedirect("TodaySpecial.html?message=Item Does not add to Cart");
                    // return;
                }

                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        c1.close();
    } catch (Exception e) {
        System.out.println(e);
    }
}
%>

<%
    Connection conn1 = null;
    PreparedStatement pstmt1 = null;
    if (request.getParameter("addToOrder") != null) {
        // Add to Order button is clicked
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
            pstmt1 = c1.prepareStatement("SELECT email, itemid, itemname, image FROM `order` WHERE email = ? AND itemid = ? AND itemname = ? AND image = ?");
            pstmt1.setString(1, email);
            pstmt1.setString(2, itemid);
            pstmt1.setString(3, itemname);
            pstmt1.setString(4, image);
            ResultSet rs = pstmt1.executeQuery();

            if (rs.next()) {
                // Item with the same email, item ID, and item name already exists in the orders
%>
                <div id="popupMessage" class="popup-message">
                    Item Already In Order!
                </div>
<%
            } else {
                // Item doesn't exist, insert it into the orders
                try {
                    PreparedStatement pstmt = c1.prepareStatement("INSERT INTO `order` (email, itemid, itemname, itemprice, image, link) VALUES (?, ?, ?, ?, ?, ?)");
                    pstmt.setString(1, email);
                    pstmt.setString(2, itemid);
                    pstmt.setString(3, itemname);
                    pstmt.setString(4, itemprice);
                    pstmt.setString(5, image);
                    pstmt.setString(6, link);
                    int rowsInserted = pstmt.executeUpdate();

                    if (rowsInserted > 0) {
                        // Item added to the orders successfully
                    // response.sendRedirect("Order.jsp");
%>
                        <div id="popupMessage" class="popup-message">
                            Item added to Order!
                        </div>
<%
                    } else {
                        // Item insertion failed
                        // response.sendRedirect("TodaySpecial.html?message=Item Does not add to Order");
                        // return;
                    }

                    pstmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            rs.close();
            pstmt1.close();
            c1.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
%>
<!--    <div id="popupMessage" class="popup-message">
        Error Adding Item to Order!
    </div>-->
<%
}
%>






<%
// Get the item details from the form data
//String email = request.getParameter("email");
//String itemid = request.getParameter("itemid");
//String itemname = request.getParameter("itemname");
//String itemprice = request.getParameter("itemprice");
//String image = request.getParameter("image");


%>

<!-- Add to Cart Form -->






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
          
     

    <script>//pop message script
            var popupMessage = document.getElementById("popupMessage");
                popupMessage.classList.add("show");
                setTimeout(function() {
                    popupMessage.classList.remove("show");
                }, 2000);
        </script>
        </div>
        
      </div>



  
<style>
    div.today-special{
           /*  background-image: linear-gradient(#68c8CD,#3cb3d3,#0798d9);*/
         background-image: linear-gradient(rgba(10,10,10,0.75),rgba(10,10,10,0.75)),url('images/Today-Special/backimage.jpg');
          background-attachment: fixed;
          background-size: 100% 110%;
           background-repeat: no-repeat;       
             width: 100%;
             margin: auto;
         }
         @media screen and (max-width:700px){
             p.grilled-p{
                 line-height: 28px !important;    
             }
         }
             a.LINK-h1{
        text-decoration: none;
    }
   h1.grilled-h1:hover {
    text-shadow: 1px 0.3px 10px #ddd;
}

h1.grilled-h1 {
    display: inline-block;
}

a.LINK-h1 {
    text-decoration: none;
    color: inherit;
}

@media screen and (max-width:1000px){
                div.img-price-name{
                    position: relative;
                }
                .img-hidden:hover .img-price-name{
                    margin-top: 0px;
                }
            }
           
</style>
   


  <div class="today-special">
  <div ng-app="" class="today-special-1">
    <input class="search-bar" id="searchbar" ng-model="nonveg" type="text" placeholder=" Search-bar">

    <div id="button-container">
      <div class="conta">

        <!-- first Grilled Chicken Escalope -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Today_Specail/Grilled_Chicken.jsp" ><h1 class="grilled-h1">
                Grilled Chicken Escalope with Fresh Salsa
                    </h1></a>
              <p class="grilled-p">
                Chicken marinated in home-made spice powder and green paste. Grilled to perfection and served with a fresh salsa of grapes, spring onion, and cherry tomatoes.
                grilled chicken 625
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Today_Specail/Grilled_Chicken.jsp">  <img class="grilled-img" src="images/Today-Special/Grilled-Chicken.png"></a>
                    
                     <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Grilled Chicken Escalope with Fresh Salsa
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 175 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            <style>
                                div.add-cart-order-btn {
                               display: flex;
                               justify-content: center;
                               align-items: center;
                               gap: 10px;
                               padding-top: 20px;
                                }
                                img.grilled-img {
                                  width: 100%;
                                  height: 55%;
                                  cursor: pointer;
                                }
                            </style>
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-1" /><!-- TS means Today Special -->
                                        <input type="hidden" name="itemname" value=" Grilled Chicken Escalope with Fresh Salsa" />
                                        <input type="hidden" name="itemprice" value="175" />
                                        <input type="hidden" name="image" value="images/Today-Special/Grilled-Chicken.png" />
                                        <input type="hidden" name="link" value="Today_Specail/Grilled_Chicken.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-1" /><!-- TS means Today Special -->
                                        <input type="hidden" name="itemname" value=" Grilled Chicken Escalope with Fresh Salsa" />
                                        <input type="hidden" name="itemprice" value="175" />
                                        <input type="hidden" name="image" value="images/Today-Special/Grilled-Chicken.png" />
                                        <input type="hidden" name="link" value="Today_Specail/Grilled_Chicken.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="escalope">
                    <div class="escalope-name">
                      <p class="escalope">
                        Chicken Escalope
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Grilled Chicken Escalope End -->
        
        
         <!--Second Start here-->
                <div class="hai">
                  <div class="grilled" >
                     <div class="grilled-1">
                         <a class="LINK-h1" href="Today_Specail/Mutton_Korma.jsp">  <h1 class="grilled-h1">
                        Mutton Korma
                             </h1></a>
                      <p class="grilled-p" >
                        A flavourful mutton curry, where the meat is stirred with curd, garlic-ginger paste, cloves, cardamom and cinnamon sticks.
                      </p>
                      <div class="grilled-2">
                        <div class="grilled-3">
  
  
                        <div class="img-hidden">  
  
                            <a href="Today_Specail/Mutton_Korma.jsp"> <img class="grilled-img" src="images/Today-Special/Mutton-korma.png "> </a>
                     
                       <div class="img-price-name">
                         <div class="img-price-name-1">
                              <h1 class="name-grilled">
                                Mutton Korma
                              </h1> 
                              <p class="price-grilled">
                                <i class="fa fa-rupee"></i> 350(Include all taxs)
                              </p>
                                <div class="add-cart-order-btn">
                            
                                    <div class="cart-items">
                                        <!-- Add to Cart Form -->
                                        <form action="TodaySpecial.jsp" method="post">
                                            <input type="hidden" name="itemid" value="TS-2" />
                                            <input type="hidden" name="itemname" value=" Mutton Korma" />
                                            <input type="hidden" name="itemprice" value="350" />
                                            <input type="hidden" name="image" value="images/Today-Special/Mutton-korma.png" />
                                            <input type="hidden" name="link" value="Today_Specail/Mutton_Korma.jsp" />
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                        </form>
                                    </div>
                                    <div class="cart-items">
                                          <!-- Add to Order Form -->
                                        <form action="TodaySpecial.jsp" method="post">
                                            <input type="hidden" name="itemid" value="TS-2" />
                                            <input type="hidden" name="itemname" value=" Mutton Korma" />
                                            <input type="hidden" name="itemprice" value="350" />
                                            <input type="hidden" name="image" value="images/Today-Special/Mutton-korma.png" />
                                            <input type="hidden" name="link" value="Today_Specail/Mutton_Korma.jsp" />
                                            <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                        </form>
                                     </div>
                                </div>
                         </div>
                       </div> 
  
                      </div>
  
                    <div class="escalope">
                      <div class="escalope-name">
                         <p class="escalope">
                          A super delicious dinner party dish that would leave you wanting more.
                         </p>
                      </div>
                      <!--<div class="escalope-price">
                         <h1 class="price">
                          <i class="fa fa-rupee"></i> 500 (Include all taxs)
                         </h1>    
                      </div>-->
                    </div>
  
                    </div> </div>        
                     </div>
                  </div>
  
                  </div>

                 <!--Second End here-->
        

                 <!--Third Start here-->
               <div class="hai">
                <div class="grilled" >
                   <div class="grilled-1">
                       <a class="LINK-h1" href="Today_Specail/Pina_Colada_Pork_Ribs.jsp" ><h1 class="grilled-h1">
                      Pina Colada Pork Ribs
                         </h1></a>
                    <p class="grilled-p" >
                      The ingredients of the popular rum-based cocktail team up with pork ribs to create a lip-smacking treat. Pork is slow roasted to soak in the flavours, and the kick of ginger gives it an interesting edge.
                     </p>
                    <div class="grilled-2">
                      <div class="grilled-3">


                      <div class="img-hidden">  

                          <a href="Today_Specail/Pina_Colada_Pork_Ribs.jsp">   <img class="grilled-img" src="images/Today-Special/Pina-Colada-Pork-Ribs.jpg "> </a>
                   
                     <div class="img-price-name">
                       <div class="img-price-name-1">
                            <h1 class="name-grilled">
                              Pina Colada Pork Ribs
                            </h1> 
                            <p class="price-grilled">
                              <i class="fa fa-rupee"></i> 339(Include all taxs)
                            </p>
                            <div class="add-cart-order-btn">
                            
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-3" />
                                        <input type="hidden" name="itemname" value=" Pina Colada Pork Ribs" />
                                        <input type="hidden" name="itemprice" value="339" />
                                        <input type="hidden" name="image" value="images/Today-Special/Pina-Colada-Pork-Ribs.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Pina_Colada_Pork_Ribs.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-3" />
                                        <input type="hidden" name="itemname" value=" Pina Colada Pork Ribs" />
                                        <input type="hidden" name="itemprice" value="339" />
                                        <input type="hidden" name="image" value="images/Today-Special/Pina-Colada-Pork-Ribs.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Pina_Colada_Pork_Ribs.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                       </div>
                     </div> 

                    </div>

                  <div class="escalope">
                    <div class="escalope-name">
                       <p class="escalope">
                        Pork ribs
                       </p>
                    </div>
                    <!--<div class="escalope-price">
                       <h1 class="price">
                        <i class="fa fa-rupee"></i> 450 (Include all taxs)
                       </h1>    
                    </div>-->
                  </div>

                  </div> </div>        
                   </div>
                </div>

                </div>

               <!--Third End here-->
                 
               <!-- Fourth Start here  -->
               
                <div class="hai">
                  <div class="grilled">
                     <div class="grilled-1">
                         <a class="LINK-h1" href="Today_Specail/Tandoori_Lamb_Chops.jsp" > <h1 class="grilled-h1">
                        Tandoori Lamb Chops
                         </h1></a>
                      <p class="grilled-p" >
                        Lamb chops marinated in strained yogurt and flavoursome masalas. Cooked till tender, this dish is guaranteed to impress. 
                      </p>
                      <div class="grilled-2">
                        <div class="grilled-3">
  
  
                    <div class="img-hidden">  
  
                        <a href="Today_Specail/Tandoori_Lamb_Chops.jsp">    <img class="grilled-img" src="images/Today-Special/Tandoori-Lamb-Chops.jpg"> </a>
                     
                       <div class="img-price-name">
                         <div class="img-price-name-1">
                              <h1 class="name-grilled">
                                Tandoori Lamb Chops
                              </h1> 
                              <p class="price-grilled">
                                <i class="fa fa-rupee"></i> 250(Include all taxs)
                              </p>
                            <div class="add-cart-order-btn">
                            
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-4" />
                                        <input type="hidden" name="itemname" value=" Tandoori Lamb Chops" />
                                        <input type="hidden" name="itemprice" value="250" />
                                        <input type="hidden" name="image" value="images/Today-Special/Tandoori-Lamb-Chops.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Tandoori_Lamb_Chops.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                 </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-4" />
                                        <input type="hidden" name="itemname" value=" Tandoori Lamb Chops" />
                                        <input type="hidden" name="itemprice" value="250" />
                                        <input type="hidden" name="image" value="images/Today-Special/Tandoori-Lamb-Chops.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Tandoori_Lamb_Chops.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                         </div>
                       </div> 
  
                    </div>
  
                    <div class="escalope">
                      <div class="escalope-name">
                         <p class="escalope">
                          Cooked till tender, these lamb chops are the perfect starter.
                         </p>
                      </div>
                      <!--<div class="escalope-price">
                         <h1 class="price">
                          <i class="fa fa-rupee"></i> 450 (Include all taxs)
                         </h1>    
                      </div>-->
                    </div>
  
                    </div> </div>        
                     </div>
                  </div>
  
                  </div>
                 <!-- Fourth End here  -->  
                 
                 
                 
                 
                 <!-- Fivth Start here  -->
                  
                 <div class="hai">
                  <div class="grilled" >
                     <div class="grilled-1">
                     <a class="LINK-h1" href="Today_Specail/Malabar_Fish_Biryani.jsp" > <h1 class="grilled-h1">
                        Malabar Fish Biryani
                         </h1></a>
                      <p class="grilled-p" >
                        This classic Malabar Fish Biryani can be devoured at all times. Enjoy the delicious taste of this ever-charming dish.
                      </p>
                      <div class="grilled-2">
                        <div class="grilled-3">
  
  
                        <div class="img-hidden">  
  
                            <a href="Today_Specail/Malabar_Fish_Biryani.jsp">  <img class="grilled-img" src="images/Today-Special/Malabar-Fish-Biryani.jpg"></a> 
                     
                       <div class="img-price-name">
                         <div class="img-price-name-1">
                              <h1 class="name-grilled">
                                Malabar Fish Biryani
                              </h1> 
                              <p class="price-grilled">
                                <i class="fa fa-rupee"></i> 235(Include all taxs)
                              </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-5" />
                                        <input type="hidden" name="itemname" value="  Malabar Fish Biryani" />
                                        <input type="hidden" name="itemprice" value="235" />
                                        <input type="hidden" name="image" value="images/Today-Special/Malabar-Fish-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Malabar_Fish_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-5" />
                                        <input type="hidden" name="itemname" value=" Malabar Fish Biryani" />
                                        <input type="hidden" name="itemprice" value="235" />
                                        <input type="hidden" name="image" value="images/Today-Special/Malabar-Fish-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Malabar_Fish_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                         </div>
                       </div> 
  
                      </div>
  
                    <div class="escalope">
                      <div class="escalope-name">
                         <p class="escalope">
                          A fish biryani worth every bite!
                         </p>
                      </div>
                      <!--<div class="escalope-price">
                         <h1 class="price">
                          <i class="fa fa-rupee"></i> 450 (Include all taxs)
                         </h1>    
                      </div>-->
                    </div>
  
                    </div> </div>        
                     </div>
                  </div>
  
                  </div>

                 <!-- Fivth End here  -->
                 
                 
                 
                  <!-- sixth Start here  -->
               
                 <div class="hai">
                  <div class="grilled" >
                     <div class="grilled-1">
                         <a class="LINK-h1" href="Today_Specail/Fish_Fingers.jsp" > <h1 class="grilled-h1">
                        Curried Parmesan Fish Fingers
                          </h1></a>
                      <p class="grilled-p" >
                        Tender fish pieces are cut into pieces, wrapped in batter and fried to perfection. Team this with ketchup, mayo or mustard sauce and you're sorted for the evening.
                      </p>
                      <div class="grilled-2">
                        <div class="grilled-3">
  
  
                        <div class="img-hidden">  

                            <a href="Today_Specail/Fish_Fingers.jsp"> <img class="grilled-img" src="images/Today-Special/Fish-Finger.jpg"> </a>
                     
                       <div class="img-price-name">
                         <div class="img-price-name-1">
                              <h1 class="name-grilled">
                                Curried Parmesan Fish Fingers
                              </h1> 
                              <p class="price-grilled">
                                <i class="fa fa-rupee"></i> 289(Include all taxs)
                              </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-6" />
                                        <input type="hidden" name="itemname" value="Curried Parmesan Fish Fingers" />
                                        <input type="hidden" name="itemprice" value="289" />
                                        <input type="hidden" name="image" value="images/Today-Special/Fish-Finger.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Fish_Fingers.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-6" />
                                        <input type="hidden" name="itemname" value="Curried Parmesan Fish Fingers" />
                                        <input type="hidden" name="itemprice" value="289" />
                                        <input type="hidden" name="image" value="images/Today-Special/Fish-Finger.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Fish_Fingers.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                         </div>
                       </div> 
  
                      </div>
  
                    <div class="escalope">
                      <div class="escalope-name">
                         <p class="escalope">
                          A great option for a quick starter for a party at home.
                         </p>
                      </div>
                      <!--<div class="escalope-price">
                         <h1 class="price">
                          <i class="fa fa-rupee"></i> 450 (Include all taxs)
                         </h1>    
                      </div>-->
                    </div>
  
                    </div> </div>        
                     </div>
                  </div>
  
                  </div>

                 <!-- sixth End here  -->
                 
                 <!-- seventh Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Chicken_65.jsp" > <h1 class="grilled-h1">
                          Chicken 65
                           </h1></a>
                        <p class="grilled-p" >
                          Chicken 65 is said to have originated in Madras (Chennai). This delicious, deep-fried recipe of Chicken 65 is from the house of Tamil Nadu. A popular and easy-to-make snack recipe, fried, full of spice with the flavours of ginger, garlic and chillies.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Chicken_65.jsp"><img class="grilled-img" src="images/Today-Special/Chicken-65.jpg"></a> 
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Chicken 65
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 235(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-7" />
                                        <input type="hidden" name="itemname" value="Chicken 65" />
                                        <input type="hidden" name="itemprice" value="235" />
                                        <input type="hidden" name="image" value="images/Today-Special/Chicken-65.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Chicken_65.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-7" />
                                        <input type="hidden" name="itemname" value="Chicken 65" />
                                        <input type="hidden" name="itemprice" value="235" />
                                        <input type="hidden" name="image" value="images/Today-Special/Chicken-65.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Chicken_65.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                            Tempered with guntur chillies, mustard seeds and curry leaves, this chicken recipe will leave you gasping yet wanting more!
                           </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- seventh End here  -->
                 
                 <!-- eight Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Prawn_Curry.jsp" > <h1 class="grilled-h1">
                          Goan Prawn Curry With Raw Mango
                            </h1></a>
                        <p class="grilled-p" >
                          Luscious prawns bathed in a burst of flavours to cook up a brilliant Goan delicacy, enjoy! A perfect seafood, winter recipe that you can pair with rice. 
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Prawn_Curry.jsp"> <img class="grilled-img" src="images/Today-Special/Prawn-Curry.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Goan Prawn Curry With Raw Mango
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 380(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-8" />
                                        <input type="hidden" name="itemname" value="Goan Prawn Curry With Raw Mango" />
                                        <input type="hidden" name="itemprice" value="380" />
                                        <input type="hidden" name="image" value="images/Today-Special/Prawn-Curry.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Prawn_Curry.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-8" />
                                        <input type="hidden" name="itemname" value="Goan Prawn Curry With Raw Mango" />
                                        <input type="hidden" name="itemprice" value="380" />
                                        <input type="hidden" name="image" value="images/Today-Special/Prawn-Curry.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Prawn_Curry.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                            This prawn curry make the best pair with some cooked rice
                           </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- eight End here  -->
                   
                   <!-- nine Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Nihari_Gosht.jsp" > <h1 class="grilled-h1">
                          Nihari Gosht
                            </h1></a>
                        <p class="grilled-p" >
                          A traditional Muslim dish, where the meat almost blends with the gravy. Nihari traditionally means a slow cooked mutton stew, which is said o be originated in the Awadhi kitchen of Lucknow. A popular dish in Pakistan and Bangladesh, Nihari is also considered to be the national dish of Pakistan. The hint of rose water gives this a perfect finish.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Nihari_Gosht.jsp"> <img class="grilled-img" src="images/Today-Special/Nihari-Gosht.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Nihari Gosht
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 310(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-9" />
                                        <input type="hidden" name="itemname" value="Goan Prawn Curry With Raw Mango" />
                                        <input type="hidden" name="itemprice" value="310" />
                                        <input type="hidden" name="image" value="images/Today-Special/Nihari-Gosht.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Nihari_Gosht.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-9" />
                                        <input type="hidden" name="itemname" value="Goan Prawn Curry With Raw Mango" />
                                        <input type="hidden" name="itemprice" value="310" />
                                        <input type="hidden" name="image" value="images/Today-Special/Nihari-Gosht.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Nihari_Gosht.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                            Here is the special royal recipe that you can cook at home with easy steps on festive occasions and dinner parties. Accompany it with naan, paratha or rice
                           </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- nine End here  -->
                   
                   <!-- ten Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Butter_Chicken.jsp" > <h1 class="grilled-h1">
                          Butter Chicken
                           </h1></a>
                        <p class="grilled-p" >
                          Keeping the classic at the last! Butter chicken is one-of-a-kind recipe that's been passed down from one generation to another and holds a permanent spot on India's menu. This recipe of Butter Chicken from Moti Mahal is easy to follow and makes for an instant conversation-starter!
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Butter_Chicken.jsp">  <img class="grilled-img" src="images/Today-Special/Butter-Chicken.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Butter Chicken
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 180(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-10" />
                                        <input type="hidden" name="itemname" value="Butter Chicken" />
                                        <input type="hidden" name="itemprice" value="180" />
                                        <input type="hidden" name="image" value="images/Today-Special/Butter-Chicken.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Butter_Chicken.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-10" />
                                        <input type="hidden" name="itemname" value="Butter Chicken" />
                                        <input type="hidden" name="itemprice" value="180" />
                                        <input type="hidden" name="image" value="images/Today-Special/Butter-Chicken.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Butter_Chicken.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                            A perfect dinner party recipe, this North-Indian style chicken recipe is made throughout the country with equal zest.
                          </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- ten End here  -->
                   
                   
                   <!--  eleven  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Hyderabadi_Chicken_Fry.jsp" ><h1 class="grilled-h1">
                          Hyderabadi Chicken Fry
                            </h1></a>
                        <p class="grilled-p" >
                          The Hyderabadi chicken fry is the perfect appetizer for impromptu guest gatherings or any special occasion – It has a fairly simple recipe but will give you an immensely juicy and flavorful chicken dish.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Hyderabadi_Chicken_Fry.jsp">  <img class="grilled-img" src="images/Today-Special/Hyderabadi-Chicken-Fry.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Hyderabadi Chicken Fry
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 220(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-11" />
                                        <input type="hidden" name="itemname" value="Hyderabadi Chicken Fry" />
                                        <input type="hidden" name="itemprice" value="220" />
                                        <input type="hidden" name="image" value="images/Today-Special/Hyderabadi-Chicken-Fry.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Hyderabadi_Chicken_Fry.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-11" />
                                        <input type="hidden" name="itemname" value="Hyderabadi Chicken Fry" />
                                        <input type="hidden" name="itemprice" value="220" />
                                        <input type="hidden" name="image" value="images/Today-Special/Hyderabadi-Chicken-Fry.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Hyderabadi_Chicken_Fry.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                            A perfect dinner party recipe.
                          </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- eleven End here  -->
                   
                   <!--  twelve  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Hyderabadi_Mutton_keema.jsp" > <h1 class="grilled-h1">
                          Hyderabadi Mutton keema
                            </h1></a>
                        <p class="grilled-p" >
                          This Hyderabadi mutton keema recipe accentuates the taste of keema and makes a mouth-watering masaledaar dish. It would taste great with some rotis or pair it with some tandoori naan.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Hyderabadi_Mutton_keema.jsp" > <img class="grilled-img" src="images/Today-Special/Hyderabadi-Mutton-Keema.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Hyderabadi Keema
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 379(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-12" />
                                        <input type="hidden" name="itemname" value="Hyderabadi Mutton Keema" />
                                        <input type="hidden" name="itemprice" value="379" />
                                        <input type="hidden" name="image" value="images/Today-Special/Hyderabadi-Mutton-Keema.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Hyderabadi_Mutton_keema.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-12" />
                                        <input type="hidden" name="itemname" value="Hyderabadi Mutton Keema" />
                                        <input type="hidden" name="itemprice" value="379" />
                                        <input type="hidden" name="image" value="images/Today-Special/Hyderabadi-Mutton-Keema.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Hyderabadi_Mutton_keema.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                           party recipe.
                          </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- twelve End here  -->
                   
                   <!--  13  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Special_Chicken_Biryani.jsp" >  <h1 class="grilled-h1">
                          Special Chicken Biryani 
                           </h1></a>
                        <p class="grilled-p" >
                          Special Biryani is a mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, and usually some type of meat, and sometimes, in addition, eggs and potatoes. 
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Special_Chicken_Biryani.jsp"> <img class="grilled-img" src="images/Today-Special/Special-Chicken-Biryani.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Special Biryani
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 209(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-13" />
                                        <input type="hidden" name="itemname" value="Special Chicken Biryani" />
                                        <input type="hidden" name="itemprice" value="209" />
                                        <input type="hidden" name="image" value="images/Today-Special/Special-Chicken-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Special_Chicken_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-13" />
                                        <input type="hidden" name="itemname" value="Special Biryani Chicken" />
                                        <input type="hidden" name="itemprice" value="209" />
                                        <input type="hidden" name="image" value="images/Today-Special/Special-Chicken-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Special_Chicken_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                           All Time
                          </p>
                        </div>
                        <div class="escalope-price">
                         <div class="none" style="visibility:hidden;" >Tempered with guntur chillies, mustard seeds </div>
                           <!--<h1 class="price">
                            <i class="fa fa-rupee"></i> 450 (Include all taxs)
                           </h1>  -->  
                        </div>
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- 13 End here  -->
                   
                   <!--  14  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Masala_Channa.jsp" > <h1 class="grilled-h1">
                          Masala Channa
                            </h1></a>
                        <p class="grilled-p" >
                         An all-season favourite for north Indians and a great source of protein, this bowlful of mouth watering masala channa is topped with tadka aloo. You can either pair it with pooris, chapati or even steamed rice.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Masala_Channa.jsp"> <img class="grilled-img" src="images/Today-Special/Masala-Channa.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Masala Channa
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 150(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-14" />
                                        <input type="hidden" name="itemname" value="Masala Channa" />
                                        <input type="hidden" name="itemprice" value="150" />
                                        <input type="hidden" name="image" value="images/Today-Special/Masala-Channa.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Masala_Channa.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-14" />
                                        <input type="hidden" name="itemname" value="Masala Channa" />
                                        <input type="hidden" name="itemprice" value="150" />
                                         <input type="hidden" name="image" value="images/Today-Special/Masala-Channa.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Masala_Channa.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                          This bowlful of mouth watering masala channa is topped with tadka aloo.
                          </p>
                        </div>
                        
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- 14 End here  -->
                   
                   
                   <!--  15  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Aamras_Ki_Kadhi.jsp" > <h1 class="grilled-h1">
                          Aamras Ki Kadhi
                            </h1></a>
                        <p class="grilled-p" >
                         A quick, easy and tangy blend of mango puree, heeng and buttermilk. This kadhi is not only flavourful, but also quite filling at the same time. Pair it with steamed rice and enjoy the meal.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Aamras_Ki_Kadhi.jsp"> <img class="grilled-img" src="images/Today-Special/Aamras-Ki-Kadhi.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Aamras Ki Kadhi
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 279(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-15" />
                                        <input type="hidden" name="itemname" value="Aamras Ki Kadhi" />
                                        <input type="hidden" name="itemprice" value="279" />
                                        <input type="hidden" name="image" value="images/Today-Special/Aamras-Ki-Kadhi.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Aamras_Ki_Kadhi.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-15" />
                                        <input type="hidden" name="itemname" value="Aamras Ki Kadhi" />
                                        <input type="hidden" name="itemprice" value="279" />
                                        <input type="hidden" name="image" value="images/Today-Special/Aamras-Ki-Kadhi.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Aamras_Ki_Kadhi.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                          This kadhi is not only flavourful, but also quite filling at the same time.
                          </p>
                        </div>
                        
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- 15 End here  -->
                   
                   
                   <!--  16  Start here  -->
               
                  <div class="hai">
                    <div class="grilled" >
                       <div class="grilled-1">
                           <a class="LINK-h1" href="Today_Specail/Egg_Plant.jsp" ><h1 class="grilled-h1">
                          Stuffed Baby Egg Plant
                            </h1></a>
                        <p class="grilled-p" >
                         A quick, easy and tangy blend of mango puree, heeng and buttermilk. This kadhi is not only flavourful, but also quite filling at the same time. Pair it with steamed rice and enjoy the meal.
                        </p>
                        <div class="grilled-2">
                          <div class="grilled-3">
    
    
                          <div class="img-hidden">  
    
                              <a href="Today_Specail/Egg_Plant.jsp"> <img class="grilled-img" src="images/Today-Special/Egg-Plant.jpg"> </a>
                       
                         <div class="img-price-name">
                           <div class="img-price-name-1">
                                <h1 class="name-grilled">
                                  Stuffed Baby Eggplant
                                </h1> 
                                <p class="price-grilled">
                                  <i class="fa fa-rupee"></i> 200(Include all taxs)
                                </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-16" />
                                        <input type="hidden" name="itemname" value="Stuffed Baby Egg Plant" />
                                        <input type="hidden" name="itemprice" value="200" />
                                        <input type="hidden" name="image" value="images/Today-Special/Egg-Plant.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Egg_Plant.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-16" />
                                        <input type="hidden" name="itemname" value="Stuffed Baby Egg Plant" />
                                        <input type="hidden" name="itemprice" value="200" />
                                        <input type="hidden" name="image" value="images/Today-Special/Egg-Plant.jpg" />
                                        <input type="hidden" name="link" value="Today_Specail/Egg_Plant.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToOrder">Add to Order</button>
                                    </form>
                                </div>
                            </div>
                           </div>
                         </div> 
    
                        </div>
    
                      <div class="escalope">
                        <div class="escalope-name">
                           <p class="escalope">
                          This recipe will make you fall in love with eggplant.
                          </p>
                        </div>
                        
                      </div>
    
                      </div> </div>        
                       </div>
                    </div>
    
                    </div>
  
                   <!-- 16 End here  -->
                 
      </div>
         <div class="noresults">
             <style>
                  
h1.not-found{
font-size: 70px;
overflow: hidden;
padding-top: 20px;
padding-bottom: 20px;
color:#fff; 
line-height: 100%;
}
             </style>
             <h1  class="not-found">{{nonveg}} Is Not Found</h1>
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

    <script>
  $(document).ready(function() {
    $('.noresults').hide();

    $("#searchbar").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#button-container .hai").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        $('.noresults').hide();

        var noResult = true;
        $("#button-container").children('div').each(function() {
          if ($(this).children(':visible').length != 0) {
            noResult = false;
          }
        });

        if (noResult) {
          $('.noresults').show();
        }
      });
    });
  });
</script>







    

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
    localStorage.setItem("_grecaptcha(done by bhargav)",  "09AINsHFc2uoI1NI35z0ref-oSZUuZUxeHb6E2g-zYQ7VS7l6GUozDM2ZnCgQ2BeiDsDMeZirZK2p5cOPVMKflDc0");
    });
    
    setTimeout(() => {
    if (!localStorage.getItem("_grecaptcha(done by bhargav)")) {
      cookieContainer.classList.add("active");
    }
    }, 100);
      </script>
      
      
      
      <div class="Top-Scroll">
<style>
  #return-to-top {
      z-index: 99999999;
    outline: none;
    border: none;
    position: fixed;
    bottom: 10px;
    right: 20px;
    background:#ffffff;
    background: rgba(247, 245, 245, 0.7);
    box-shadow: 0px 2px 18px 0px rgb(0 0 0 / 30%);
    width: 50px;
    height: 50px;
    display: block;
    text-decoration: none;
    -webkit-border-radius: 35px;
    -moz-border-radius: 35px;
    border-radius: 35px;
    display: none;
    -webkit-transition: all 0.3s linear;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
    cursor: pointer;
}
#return-to-top i {
    color: #000;
    margin: 0;
    position: relative;
    left: 1px;
    top: 5px;
    font-size: 19px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top:hover {
    background: rgba(0, 0, 0, 0.9);
}
#return-to-top:hover i {
    color: #fff;
    top: 1px;
}
</style>



<button  id="return-to-top" style="display: inline-block;"><i class="fas fa-arrow-up"></i></button>
<script>
  // ===== Scroll to Top ==== 
$(window).scroll(function() {
    if ($(this).scrollTop() >= 300) {        
        $('#return-to-top').fadeIn(1000);    
    } else {
        $('#return-to-top').fadeOut(100);   
    }
});
$('#return-to-top').click(function() {      
    $('body,html').animate({
        scrollTop : 0                       
    }, 1000);
});
</script>
</div>
      
      
    
      
      
    </body>
</html>
