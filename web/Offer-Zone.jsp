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
    <title> Offer Zone | TruYum Restaurant </title>
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
<div >
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
          <a class="Links-None" href="passwordchange.jsp">Change Password</a>
          <a class="Links-None" href="About.jsp">About</a>
          <a class="Links-None" href="Address.jsp">Address</a>
          <a class="Links-None" href="Address.jsp">Order List</a>
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
                <a class="LINK-h1" href="Offer-Zone/Egg_Roast_Biryani.jsp">  <h1 class="grilled-h1">
                Egg Roast Biryani
                    </h1></a>
              <p class="grilled-p">
                Kerala style egg roast biryani is one of its kinds that is similar to the Kerala street food that is sold as Neichoru / ghee rice topped with egg roast. This is flavorful with an unique aroma that comes from the blend of kerala spices.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Offer-Zone/Egg_Roast_Biryani.jsp">  <img class="grilled-img" src="images/Offer-Zone/Egg-Roast-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Egg Roast Biryani
                        </h1>
                        <p class="price-grilled">
                        <style>
                            .strike {
                              text-decoration: none;
                              position: relative;
                            }
                            .strike::before {
                              content: "";
                              position: absolute;
                              top: 50%;
                              left: 0;
                              width: 100%;
                              height: 3px;
                              background-color: black;
                            }
                        </style>
                 <span class="strike"><i class="fa fa-rupee"></i>155</span> &nbsp; <i class="fa fa-rupee"></i> 135 (Include all taxs)
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
                                    <form action="Offer-Zone.jsp" method="post">
                                        <input type="hidden" name="itemid" value="OF-1" /><!-- of means Offer-Zone -->
                                        <input type="hidden" name="itemname" value="Egg Roast Biryani" />
                                        <input type="hidden" name="itemprice" value="135" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/Egg-Roast-Biryani.png" />
                                        <input type="hidden" name="link" value="Offer-Zone/Egg_Roast_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Offer-Zone.jsp" method="post">
                                            <input type="hidden" name="itemid" value="OF-1" /><!-- of means Offer-Zone -->
                                            <input type="hidden" name="itemname" value="Egg Roast Biryani" />
                                            <input type="hidden" name="itemprice" value="135" />
                                            <input type="hidden" name="image" value="images/Offer-Zone/Egg-Roast-Biryani.png" />
                                            <input type="hidden" name="link" value="Offer-Zone/Egg_Roast_Biryani.jsp" />
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
                        Tastes of Egg Roast Biryani.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- FIRST End -->
        
        
        <!-- 2 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Offer-Zone/SPL_VEG_Biryani.jsp"> <h1 class="grilled-h1">
                SPL VEG Biryani
                 </h1></a>
              <p class="grilled-p">
               A garden fresh vegetable biryani, bursting with spices and beautiful in its simplicity.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Offer-Zone/SPL_VEG_Biryani.jsp">  <img class="grilled-img" src="images/Offer-Zone/SPL-VEG-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          SPL VEG Biryani
                        </h1>
                        <p class="price-grilled">
                         <span class="strike"><i class="fa fa-rupee"></i>175</span> &nbsp; <i class="fa fa-rupee"></i> 149 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Offer-Zone.jsp" method="post">
                                        <input type="hidden" name="itemid" value="OF-2" /><!-- OF means Offer-Zone  -->
                                        <input type="hidden" name="itemname" value="SPL VEG Biryani" />
                                        <input type="hidden" name="itemprice" value="149" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/SPL-VEG-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Offer-Zone/SPL_VEG_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Offer-Zone.jsp" method="post">
                                            <input type="hidden" name="itemid" value="OF-2" /><!-- OF means Offer-Zone  -->
                                            <input type="hidden" name="itemname" value="SPL VEG Biryani" />
                                            <input type="hidden" name="itemprice" value="149" />
                                            <input type="hidden" name="image" value="images/Offer-Zone/SPL-VEG-Biryani.jpg" />
                                            <input type="hidden" name="link" value="Offer-Zone/SPL_VEG_Biryani.jsp" />
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
                        Fresh Vegetable Biryani.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 2 End -->
        
        <!-- 3 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Offer-Zone/Soya_Chunk_Biryani.jsp"> <h1 class="grilled-h1">
                Soya Chunk Biryani
                 </h1></a>
              <p class="grilled-p">
              Experience the brilliance of vegetables combined with fragrant basmati rice and an elaborate blend of flavours.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Offer-Zone/Soya_Chunk_Biryani.jsp">  <img class="grilled-img" src="images/Offer-Zone/Soya-Chunk-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Soya Chunk Biryani
                        </h1>
                        <p class="price-grilled">
                         <span class="strike"><i class="fa fa-rupee"></i>185</span> &nbsp; <i class="fa fa-rupee"></i> 149 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Offer-Zone.jsp" method="post">
                                        <input type="hidden" name="itemid" value="OF-3" /><!-- OF means Offer-Zone -->
                                        <input type="hidden" name="itemname" value="Soya Chunk Biryani" />
                                        <input type="hidden" name="itemprice" value="149" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/Soya-Chunk-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Offer-Zone/Soya_Chunk_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Offer-Zone.jsp" method="post">
                                            <input type="hidden" name="itemid" value="OF-3" /><!-- OF means Offer-Zone -->
                                            <input type="hidden" name="itemname" value="Soya Chunk Biryani" />
                                            <input type="hidden" name="itemprice" value="149" />
                                            <input type="hidden" name="image" value="images/Offer-Zone/Soya-Chunk-Biryani.jpg" />
                                            <input type="hidden" name="link" value="Offer-Zone/Soya_Chunk_Biryani.jsp" />
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
                        Elaborate Blend Of Flavours.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 3 End -->
        
        <!-- 4 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Offer-Zone/Awadhi_Chicken_Biriyani.jsp"> <h1 class="grilled-h1">
                Awadhi Chicken Biriyani
                 </h1></a>
              <p class="grilled-p">
               Lucknowi style dum biriyani made with chicken. This is popular mostly in north Indian restaurants and is well known for its unique aroma & simplicity.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Offer-Zone/Awadhi_Chicken_Biriyani.jsp">  <img class="grilled-img" src="images/Offer-Zone/Awadhi-Chicken-Biriyani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Awadhi Chicken Biriyani
                        </h1>
                        <p class="price-grilled">
                         <span class="strike"><i class="fa fa-rupee"></i>179</span> &nbsp; <i class="fa fa-rupee"></i> 139 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Offer-Zone.jsp" method="post"  >
                                        <input type="hidden" name="itemid" value="OF-4" /><!-- OF means Offer-Zone -->
                                        <input type="hidden" name="itemname" value="Awadhi Chicken Biriyani" />
                                        <input type="hidden" name="itemprice" value="139" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/Awadhi-Chicken-Biriyani.png" />
                                        <input type="hidden" name="link" value="Offer-Zone/Awadhi_Chicken_Biriyani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Offer-Zone.jsp" method="post">
                                            <input type="hidden" name="itemid" value="OF-4" /><!-- OF means Offer-Zone -->
                                            <input type="hidden" name="itemname" value="Awadhi Chicken Biriyani" />
                                            <input type="hidden" name="itemprice" value="139" />
                                            <input type="hidden" name="image" value="images/Offer-Zone/Awadhi-Chicken-Biriyani.png" />
                                            <input type="hidden" name="link" value="Offer-Zone/Awadhi_Chicken_Biriyani.jsp" />
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
                        A Flavorsome Biryani.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 4 End -->
        
        
        <!-- 5 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="Offer-Zone/Mushroom_Biryani.jsp"> <h1 class="grilled-h1">
                Mushroom Biryani 
                 </h1></a>
              <p class="grilled-p">
               Mushroom biryani is a delicious one pot dish made with rice, mushrooms, masala powder & herbs.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="Offer-Zone/Mushroom_Biryani.jsp">  <img class="grilled-img" src="images/Offer-Zone/Mushroom-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Mushroom Biryani 
                        </h1>
                        <p class="price-grilled">
                         <span class="strike"><i class="fa fa-rupee"></i>169</span> &nbsp; <i class="fa fa-rupee"></i> 135 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="Offer-Zone.jsp" method="post">
                                        <input type="hidden" name="itemid" value="OF-5" /><!-- OF means Offer-Zone -->
                                        <input type="hidden" name="itemname" value="Mushroom Biryani " />
                                        <input type="hidden" name="itemprice" value="135" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/Mushroom-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Offer-Zone/Mushroom_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="Offer-Zone.jsp" method="post">
                                        <input type="hidden" name="itemid" value="OF-5" /><!-- OF means Offer-Zone -->
                                        <input type="hidden" name="itemname" value="Mushroom Biryani " />
                                        <input type="hidden" name="itemprice" value="135" />
                                        <input type="hidden" name="image" value="images/Offer-Zone/Mushroom-Biryani.jpg" />
                                        <input type="hidden" name="link" value="Offer-Zone/Mushroom_Biryani.jsp" />
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
                        Mushroom!
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 5 End -->
        
        
        
        
         </div>
         <div class="noresults">
             <style>
                 div.noresults{
                     
          background-attachment: fixed;
          background-size: 90% 110%;
           background-repeat: no-repeat;       
             width: 100%;
             height: 100%;
             margin: auto;
                 }                 
h1.not-found{
font-size: 70px;
overflow: hidden;
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