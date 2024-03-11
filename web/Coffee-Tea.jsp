<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="images/TRU-YUM.png">
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--AngularJS script --><script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title> Coffee & Tea | TruYum Restaurant  </title>
    <link rel="stylesheet" type="text/css" href="./Coffee-Tea.css">
    <link rel="stylesheet" type="text/css" href="./Bubbles.css">
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
    <div>
       
    </div>
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
  color: #394488;
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
    <a href="Address.jsp">Address</a>
    <a href="About.html">About</a>
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
          
     

    <script>
            var popupMessage = document.getElementById("popupMessage");
                popupMessage.classList.add("show");
                setTimeout(function() {
                    popupMessage.classList.remove("show");
                }, 2000);
        </script>
        </div>
        
      </div>
  



  
<style>
   
</style>
   


  <div class="today-special">
  <div ng-app="" class="today-special-1">
    <input class="search-bar" id="searchbar" ng-model="nonveg" type="text" placeholder=" Search-bar">

    <div id="button-container">
      <div class="conta">

        <!-- First Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Cappuccino_Coffee.jsp">  <h1 class="grilled-h1">
                Cappuccino
                    </h1></a>
              <p class="grilled-p">
                The coffee is made up of three layers, that is, a shot of espresso, a layer of foamy milk as well as a shot of steamed milk.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Cappuccino_Coffee.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Cappuccino-Coffee.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Cappuccino
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 167(Include all taxs)
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
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-1" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Cappuccino" />
                                        <input type="hidden" name="itemprice" value="167" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Cappuccino-Coffee.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Cappuccino_Coffee.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-1" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Cappuccino" />
                                            <input type="hidden" name="itemprice" value="167" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Cappuccino-Coffee.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Cappuccino_Coffee.jsp" />
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
                        Including adding some chocolate shavings on top.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- FIRST End -->
        
        <!-- 2 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Vanilla_Iced_Coffee.jsp">  <h1 class="grilled-h1">
                Vanilla Iced Coffee
                    </h1></a>
              <p class="grilled-p">
               A cup is filled with hot water, then two shots of espresso are added to it.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Vanilla_Iced_Coffee.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Vanilla-Iced-Coffee.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Vanilla Iced Coffee
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 90(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-2" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Vanilla Iced Coffee" />
                                        <input type="hidden" name="itemprice" value="90" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Vanilla-Iced-Coffee.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Vanilla_Iced_Coffee.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-2" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Vanilla Iced Coffee" />
                                            <input type="hidden" name="itemprice" value="90" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Vanilla-Iced-Coffee.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Vanilla_Iced_Coffee.jsp" />
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
                        The amount of espresso added to it.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 2 End -->
        
        
         <!-- 3 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Black_Coffee.jsp">  <h1 class="grilled-h1">
                  Black Coffee
                    </h1></a>
              <p class="grilled-p">
                Espresso is the type of coffee that makes the basis for other coffees.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Black_Coffee.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Black-Coffee.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Black Coffee
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 50(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-3" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Black Coffee" />
                                        <input type="hidden" name="itemprice" value="50" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Black-Coffee.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Black_Coffee.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-3" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Black Coffee" />
                                            <input type="hidden" name="itemprice" value="50" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Black-Coffee.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Black_Coffee.jsp" />
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
                        Admittedly, espresso is not coffee for everyone.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 3 End -->
        
        
        <!-- 4 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Flat_White_Coffee.jsp">  <h1 class="grilled-h1">
                  Flat White Coffee
                    </h1></a>
              <p class="grilled-p">
                Very creamy milk is usually poured over a shot of espresso.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Flat_White_Coffee.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Flat-White-Coffee.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Flat White Coffee
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 85(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-4" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Flat White Coffee" />
                                        <input type="hidden" name="itemprice" value="85" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Flat-White-Coffee.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Flat_White_Coffee.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-4" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Flat White Coffee" />
                                            <input type="hidden" name="itemprice" value="85" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Flat-White-Coffee.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Flat_White_Coffee.jsp" />
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
                        A Delicious cup of coffee.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 4 End -->
        
        <!-- 5 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/White_Tea.jsp">  <h1 class="grilled-h1">
                  White Tea
                    </h1></a>
              <p class="grilled-p">
                White tea is the least processed tea. The buds of the Camellia plant are plucked, withered and then dried for use.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/White_Tea.jsp">  <img class="grilled-img" src="images/Coffee-Tea/White-Tea.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          White Tea
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 65(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-5" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="White Tea" />
                                        <input type="hidden" name="itemprice" value="65" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/White-Tea.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/White_Tea.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-5" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="White Tea" />
                                            <input type="hidden" name="itemprice" value="65" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/White-Tea.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/White_Tea.jsp" />
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
                        The tea is called white tea because of the color of the budding of the plant.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 5 End -->
        
        <!-- 6 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Green_Tea.jsp">  <h1 class="grilled-h1">
                  Green Tea
                    </h1></a>
              <p class="grilled-p">
               Originally, green tea was the only type of tea produced. Green tea has quickly gained popularity in society today, even with other types of tea existing.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Green_Tea.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Green-Tea.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Green Tea
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 45(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-6" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Green Tea" />
                                        <input type="hidden" name="itemprice" value="45" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Green-Tea.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Green_Tea.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-6" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Green Tea" />
                                            <input type="hidden" name="itemprice" value="45" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Green-Tea.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Green_Tea.jsp" />
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
                        Most green teas have a grassy and earthy taste to them.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 6 End -->
        
        
        <!-- 7 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Black_Tea.jsp">  <h1 class="grilled-h1">
                  Black Tea
                    </h1></a>
              <p class="grilled-p">
              Black tea is a richly flavored tea, thanks to the fact that it is fully fermented. The taste is often very strong, with elements of spicy, leather, malty and oak sensations.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Black_Tea.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Black-Tea.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Black Tea
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 59(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-7" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Black Tea" />
                                        <input type="hidden" name="itemprice" value="59" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Black-Tea.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Black_Tea.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-7" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Black Tea" />
                                            <input type="hidden" name="itemprice" value="59" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Black-Tea.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Black_Tea.jsp" />
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
                       It is the most popular and most consumed type of tea in the world.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 7 End -->
        
        <!-- 8 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Lavish_Blue_Tea.jsp">  <h1 class="grilled-h1">
                  Lavish Blue Tea
                    </h1></a>
              <p class="grilled-p">
              Black tea is a richly flavored tea, thanks to the fact that it is fully fermented. The taste is often very strong, with elements of spicy, leather, malty and oak sensations.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Lavish_Blue_Tea.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Lavish-Blue-Tea.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Lavish Blue Tea
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 75(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-8" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Lavish Blue Tea" />
                                        <input type="hidden" name="itemprice" value="75" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Lavish-Blue-Tea.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Lavish_Blue_Tea.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                             <input type="hidden" name="itemid" value="CT-8" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Lavish Blue Tea" />
                                            <input type="hidden" name="itemprice" value="75" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Lavish-Blue-Tea.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Lavish_Blue_Tea.jsp" />
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
                       It is the most popular and most consumed type of tea in the world.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 8 End -->
        
        <!-- 9 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Yellow_Tea.jsp">  <h1 class="grilled-h1">
                  Yellow Tea
                    </h1></a>
              <p class="grilled-p">
             Yellow tea is the rarest of all teas. The tea is often produced in small quantities.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Yellow_Tea.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Yellow-Tea.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Yellow Tea
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 55(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-9" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Yellow Tea" />
                                        <input type="hidden" name="itemprice" value="55" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Yellow-Tea.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Yellow_Tea.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-9" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Yellow Tea" />
                                            <input type="hidden" name="itemprice" value="55" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Yellow-Tea.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Yellow_Tea.jsp" />
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
                       It is also considered a sweet-tasting tea.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 9 End -->
        
        <!-- 10 Start -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Coffee_Tea/Cafe_Latte.jsp">  <h1 class="grilled-h1">
                  Cafe Latte 
                    </h1></a>
              <p class="grilled-p">
              A latte is made of steamed milk and a shot of espresso.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Coffee_Tea/Cafe_Latte.jsp">  <img class="grilled-img" src="images/Coffee-Tea/Cafe-Latte.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Cafe Latte
                        </h1>
                        <p class="price-grilled">
                        
                  <i class="fa fa-rupee"></i> 75(Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Coffee-Tea.jsp" method="post">
                                        <input type="hidden" name="itemid" value="CT-10" /><!-- CT of means Coffee-Tea -->
                                        <input type="hidden" name="itemname" value="Cafe Latte " />
                                        <input type="hidden" name="itemprice" value="75" />
                                        <input type="hidden" name="image" value="images/Coffee-Tea/Cafe-Latte.jpg" />
                                        <input type="hidden" name="link" value="Coffee_Tea/Cafe_Latte.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Coffee-Tea.jsp" method="post">
                                            <input type="hidden" name="itemid" value="CT-10" /><!-- CT of means Coffee-Tea -->
                                            <input type="hidden" name="itemname" value="Cafe Latte " />
                                            <input type="hidden" name="itemprice" value="75" />
                                            <input type="hidden" name="image" value="images/Coffee-Tea/Cafe-Latte.jpg" />
                                            <input type="hidden" name="link" value="Coffee_Tea/Cafe_Latte.jsp" />
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
                       It is fairly popular among coffee lovers.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 10 End -->
        
        
        
        
         </div>
         <div class="noresults">
             <style>
           div.noresults{
          
          
             width: 100%;
             height: auto;
             margin: auto;
                 }                 
h1.not-found{
font-size: 70px;
overflow: hidden;
color:#fff;
padding-bottom: 20px;
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
    
    localStorage.setItem("_grecaptcha(done by bhargav)",  "09AINsHFc2uoI1NI35z0ref-oSZUuZUxeHb6E2g-zYQ7VS7l6GUozDM2ZnCgQ2BeiDsDMeZirZK2p5cOPVMKflDc0",);
    });
    
    
    setTimeout(() => {
    if (!localStorage.getItem("_grecaptcha(done by bhargav)")) {
      cookieContainer.classList.add("active");
    }
    }, 100);
      </script>
</body>
</html>