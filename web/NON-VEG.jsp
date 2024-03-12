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
    <title> NON-Vegetarian | TruYum Restaurant </title>
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
                <a class="LINK-h1" href="NON-VEG/Kongunadu_Chicken.jsp"> <h1 class="grilled-h1">
                   Kongunadu Chicken
                </h1></a>
              <p class="grilled-p">
                One of the most delicious chicken dishes I've sampled is the Pichu Potta Kozhi (shredded chicken) cooked in traditional Kongunad style with free range chicken in Coimbatore. This city is in the heart of the erstwhile Kongunad region in West Tamil Nadu.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Kongunadu_Chicken.jsp">  <img class="grilled-img" src="images/Non-VEG/Kongunadu-Chicken.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Kongunadu Chicken
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 260 (Include all taxs)
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
                                    <form action="NON-VEG.jsp" method="post">
                                        <input type="hidden" name="itemid" value="NV-1" /><!-- NV means NON-VEG -->
                                        <input type="hidden" name="itemname" value="Kongunadu Chicken" />
                                        <input type="hidden" name="itemprice" value="260" />
                                        <input type="hidden" name="image" value="images/Non-VEG/Kongunadu-Chicken.jpg" />
                                        <input type="hidden" name="link" value="NON-VEG/Kongunadu_Chicken.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-1" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Kongunadu Chicken" />
                                            <input type="hidden" name="itemprice" value="260" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Kongunadu-Chicken.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kongunadu_Chicken.jsp" />
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
                        The traditional recipe uses little oil and does not marinate the meat.
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
                <a class="LINK-h1" href="NON-VEG/Natu_Kodi_Kura.jsp"> <h1 class="grilled-h1">
                Natu Kodi Kura 
                 </h1></a>
              <p class="grilled-p">
                Natu kodi kura is a delicious and spicy Andhra chicken curry made with a Guntur chilli spice mix and a hint of coconut.
                
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Natu_Kodi_Kura.jsp">  <img class="grilled-img" src="images/Non-VEG/Natu-Kodi-Kura.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Natu Kodi Kura
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 280 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-2" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Natu Kodi Kura" />
                                            <input type="hidden" name="itemprice" value="280" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Natu-Kodi-Kura.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Natu_Kodi_Kura.jsp" />
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-2" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Natu Kodi Kura" />
                                            <input type="hidden" name="itemprice" value="280" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Natu-Kodi-Kura.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Natu_Kodi_Kura.jsp" />
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
                        Natu Kodi Kura: This Spicy and Delicious Andhra Special Chicken.
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
                <a class="LINK-h1" href="NON-VEG/Kerala_Beef_Vindaloo.jsp"> <h1 class="grilled-h1">
                Kerala Beef Vindaloo
                 </h1></a>
              <p class="grilled-p">
               Vindaloo is often synonymous with fiery, bold, pungent curries. It is one Indian curry that needs no introduction. It is lip-smacking delicious, tenderly cooked meat in a spicy gravy. It is almost pickle like with flavor of vinegar and ground mustard. But again, the perfect vindaloo curry strikes the right balance with chilies, aromatic spices, and vinegar- a perfect balance of acidity, spicy heat, and flavor of earthy spices. 
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Kerala_Beef_Vindaloo.jsp">  <img class="grilled-img" src="images/Non-VEG/Beef-vindaloo.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Kerala Beef Vindaloo
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 350 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-3" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value=" Kerala Beef Vindaloo" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Beef-vindaloo.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kerala_Beef_Vindaloo.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-3" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value=" Kerala Beef Vindaloo" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Beef-vindaloo.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kerala_Beef_Vindaloo.jsp"/>
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
                        The traditional slow-cooked stove top recipe and an Instant pot recipe.
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
                <a class="LINK-h1" href="NON-VEG/Kozhi_Vepudu.jsp"> <h1 class="grilled-h1">
                Fiery Guntur Style Kozhi Vepudu
                    </h1></a>
              <p class="grilled-p">
               Freshly ground spices combined with marinated chicken and fiery Guntur chilies in this iconic Chicken dish that is among the most popular Andhra dishes. Telangana's version of the Chicken curry is equally famous and uses generous quantities of pepper, curry leaves and coconut.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Kozhi_Vepudu.jsp">  <img class="grilled-img" src="images/Non-VEG/Fiery-Guntur-Style-Kozhi-Vepudu.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Fiery Guntur Style Kozhi Vepudu
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 350 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-4" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Fiery Guntur Style Kozhi Vepudu" />
                                            <input type="hidden" name="itemprice" value="300" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Fiery-Guntur-Style-Kozhi-Vepudu.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kozhi_Vepudu.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                             <input type="hidden" name="itemid" value="NV-4" /><!-- TS means Today Special -->
                                            <input type="hidden" name="itemname" value=" Kerala Beef Vindaloo" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Fiery-Guntur-Style-Kozhi-Vepudu.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kozhi_Vepudu.jsp"/>
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
                        Preferably made a day in advance to let the flavours soak into the chicken.
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
                <a class="LINK-h1" href="NON-VEG/Hyderabads-Haleem.jsp"> <h1 class="grilled-h1">
                Hyderabad's Haleem
                 </h1></a>
              <p class="grilled-p">
               The jury is still not out about South India's best biryani.Hyderabad's Mutton Biryani and exquisite Haleem are quite special. The Haleem cooked with minced meat, lentils and wheat has its origins in the Middle East.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Hyderabads-Haleem.jsp">  <img class="grilled-img" src="images/Non-VEG/Hyderabad's-Haleem.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Hyderabad's Haleem
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 250 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-5" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Hyderabad's Haleem" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Hyderabad's-Haleem.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Hyderabads-Haleem.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-5" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Hyderabad's Haleem" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Hyderabad's-Haleem.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Hyderabads-Haleem.jsp"/>
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
                        Preferably made a day in advance to let the flavours soak into the chicken.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 5 End -->
        
        <!-- 6 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Hyderabadi_Chicken_Biryani.jsp"> <h1 class="grilled-h1">
                Hyderabadi Chicken Biryani
                  </h1></a>
              <p class="grilled-p">
               The jury is still not out about South India's best biryani. There's the mildly flavoured Kozhikode Chicken Biryani and the spicier Ambur and Dindigul versions from Tamil Nadu but Hyderabad's Mutton Biryani and exquisite Haleem are quite special. The Haleem cooked with minced meat, lentils and wheat has its origins in the Middle East.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Hyderabadi_Chicken_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Hyderabadi-Chicken-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Hyderabadi Chicken Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 250 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-6" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Hyderabadi Chicken Biryani" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Hyderabadi-Chicken-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Hyderabadi_Chicken_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-6" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Hyderabadi Chicken Biryani" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Hyderabadi-Chicken-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Hyderabadi_Chicken_Biryani.jsp"/>
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
                        Preferably made a day in advance to let the flavours soak into the chicken.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 6 End -->
        
        <!-- 7 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Kalyani_Biryani.jsp"> <h1 class="grilled-h1">
                Kalyani Biryani
                 </h1></a>
              <p class="grilled-p">
               The jury is still not out about South India's best biryani. There's the mildly flavoured Kozhikode Chicken Biryani and the spicier Ambur and Dindigul versions from Tamil Nadu but Hyderabad's Mutton Biryani and exquisite Haleem are quite special. The Haleem cooked with minced meat, lentils and wheat has its origins in the Middle East.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Kalyani_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Kalyani-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Kalyani Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 250 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-7" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Kalyani Biryani" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Kalyani-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kalyani_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-7" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Kalyani Biryani" />
                                            <input type="hidden" name="itemprice" value="250" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Kalyani-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Kalyani_Biryani.jsp"/>
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
                        Preferably made a day in advance to let the flavours soak into the chicken.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 7 End -->
        
        <!-- 8 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Ambur_Biryani.jsp"> <h1 class="grilled-h1">
                Ambur Biryani
                    </h1></a>
              <p class="grilled-p">
               Ambur is a small town in the Arcot region that was once ruled by Nawabs of Arcot in Tamil Nadu. It is known for its biryani with unique meaty flavours made with dried chilli paste and whole spices. The locals generally eat Brinjal Masala as an accompaniment.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Ambur_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Ambur-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Ambur Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 220 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-8" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Kalyani Biryani" />
                                            <input type="hidden" name="itemprice" value="220" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Ambur-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Ambur_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-8" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Kalyani Biryani" />
                                            <input type="hidden" name="itemprice" value="220" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Ambur-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Ambur_Biryani.jsp"/>
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
                       This dum mutton biryani includes curd and mint leaves, making it almost similar to its counterpart- Lucknowi Biryani.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 8 End -->
        
        
        <!-- 9 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Bhatkali_Biryani.jsp"> <h1 class="grilled-h1">
                Bhatkali Biryani
                    </h1></a>
              <p class="grilled-p">
               This biryani makes a popular delicacy in the coastal regions of Karnataka. The rice and chicken are infused with spicy masalas giving it a distinct flavour. Unlike marinated chicken used in other biryanis.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Bhatkali_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Bhatkali-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                          Bhatkali Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 269 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-9" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Bhatkali Biryani" />
                                            <input type="hidden" name="itemprice" value="269" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Bhatkali-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Bhatkali_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-9" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Bhatkali Biryani" />
                                            <input type="hidden" name="itemprice" value="269" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Bhatkali-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Bhatkali_Biryani.jsp"/>
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
                      A delight for biryani lovers.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 9 End -->
        
        <!-- 10 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Thalapakatti_Mutton_Biryani.jsp"> <h1 class="grilled-h1">
                Thalapakatti Mutton Biryani
                    </h1></a>
              <p class="grilled-p">
               Thalapakatti Mutton Biryani is popular in Tamil Nadu.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Thalapakatti_Mutton_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Thalapakatti-Mutton-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                         Thalapakatti Mutton Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 310 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-10" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Thalapakatti Mutton Biryani" />
                                            <input type="hidden" name="itemprice" value="510" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Thalapakatti-Mutton-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Thalapakatti_Mutton_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-10" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Thalapakatti Mutton Biryani" />
                                            <input type="hidden" name="itemprice" value="510" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Thalapakatti-Mutton-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Thalapakatti_Mutton_Biryani.jsp"/>
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
                      South Indian Biryani.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 10 End -->
        
        <!-- 11 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Beary_Biryani.jsp"> <h1 class="grilled-h1">
                 Beary Biryani
                    </h1></a>
              <p class="grilled-p">
               Beary Biryani or Manglorean-style biryani comes from the Muslim community in the coastal regions of Dakshin Kannada.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Beary_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Beary-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                         Beary Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 275 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-11" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Beary Biryani" />
                                            <input type="hidden" name="itemprice" value="275" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Beary-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Beary_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                             <input type="hidden" name="itemid" value="NV-11" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Beary Biryani" />
                                            <input type="hidden" name="itemprice" value="275" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Beary-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Beary_Biryani.jsp"/>
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
                      This Biryani cooks slowly and tastes best.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 11 End -->
        
        
        <!-- 12 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Thalassery_Biryani.jsp"> <h1 class="grilled-h1">
                 Thalassery Biryani
                    </h1></a>
              <p class="grilled-p">
               Thalassery Biryani is also known as Kozhikode Biryani and the rice used in this biryani is slightly different from what is generally used. The rice used is thinner, short and a fragrant type from Kerala called Khyma or Jeerakasala.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Thalassery_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Thalassery-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                         Thalassery Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 275 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-12" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Thalassery Biryani" />
                                            <input type="hidden" name="itemprice" value="275" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Thalassery-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Thalassery_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-12" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Thalassery Biryani" />
                                            <input type="hidden" name="itemprice" value="275" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Thalassery-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Thalassery_Biryani.jsp"/>
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
                      It is cooked with lots of ghee and a handful of spices to make it a lip-smacking treat.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 12 End -->
        
        <!-- 13 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Malabar_Biryani.jsp"> <h1 class="grilled-h1">
                 Malabar Biryani
                 </h1></a>
              <p class="grilled-p">
               Malabar Biryani: Dig Into This Signature Dish from Kozhikode (Calicut), Kerala.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Malabar_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Malabar-Biryani.jpg"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                         Malabar Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 205 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-13" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Malabar Biryani" />
                                            <input type="hidden" name="itemprice" value="205" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Malabar-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Malabar_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-13" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Malabar Biryani" />
                                            <input type="hidden" name="itemprice" value="205" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Malabar-Biryani.jpg" />
                                            <input type="hidden" name="link" value="NON-VEG/Malabar_Biryani.jsp"/>
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
                      BiryaniKozhikode and Thalassery.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 13 End -->
        
        <!-- 14 Start here  -->
                  
                 <div class="hai">
                  <div class="grilled" >
                     <div class="grilled-1">
                         <a class="LINK-h1" href="Today Specail Html Pages/Malabar_Fish_Biryani.jsp"> <h1 class="grilled-h1">
                        Malabar Fish Biryani
                             </h1></a>
                      <p class="grilled-p" >
                        This classic Malabar Fish Biryani can be devoured at all times. Enjoy the delicious taste of this ever-charming dish.
                      </p>
                      <div class="grilled-2">
                        <div class="grilled-3">
  
  
                        <div class="img-hidden">  
  
                            <a href="Today Specail Html Pages/Malabar_Fish_Biryani.jsp">  <img class="grilled-img" src="images/Today Special/Malabar-Fish-Biryani.jpg"></a> 
                     
                       <div class="img-price-name">
                         <div class="img-price-name-1">
                              <h1 class="name-grilled">
                                Malabar Fish Biryani
                              </h1> 
                              <p class="price-grilled">
                                <i class="fa fa-rupee"></i> 260(Include all taxs)
                              </p>
                            <div class="add-cart-order-btn">
                                <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-5" />
                                        <input type="hidden" name="itemname" value=" Tandoori Lamb Chops" />
                                        <input type="hidden" name="itemprice" value="260" />
                                        <input type="hidden" name="image" value="images/Today Special/Malabar Fish Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today Specail Html Pages/Malabar_Fish_Biryani.jsp" />
                                        <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                                <div class="cart-items">
                                    <!-- Add to Order Form -->
                                    <form action="TodaySpecial.jsp" method="post">
                                        <input type="hidden" name="itemid" value="TS-5" />
                                        <input type="hidden" name="itemname" value=" Tandoori Lamb Chops" />
                                        <input type="hidden" name="itemprice" value="260" />
                                        <input type="hidden" name="image" value="images/Today Special/Malabar Fish Biryani.jpg" />
                                        <input type="hidden" name="link" value="Today Specail Html Pages/Malabar_Fish_Biryani.jsp" />
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

                 <!-- 14 End here  -->
                 
                 <!-- 15 Start Here  -->
        <div class="hai">
          <div class="grilled">
            <div class="grilled-1">
                <a class="LINK-h1" href="NON-VEG/Chicken_Dum_Biryani.jsp"><h1 class="grilled-h1">
                 Chicken Dum Biryani
                    </h1></a>
              <p class="grilled-p">
               An authentic Mughlai dish, Biryani is an aromatic delicacy loved by all. This dum biryani recipe is sumptuous as the chicken biryani is cooked with utmost precision.
              </p>
              <div class="grilled-2">
                <div class="grilled-3">

                <div class="img-hidden">
                    <a href="NON-VEG/Chicken_Dum_Biryani.jsp">  <img class="grilled-img" src="images/Non-VEG/Chicken-Dum-Biryani.png"></a>
                    <div class="img-price-name">
                      <div class="img-price-name-1">
                        <h1 class="name-grilled">
                         Chicken Dum Biryani
                        </h1>
                        <p class="price-grilled">
                          <i class="fa fa-rupee"></i> 225 (Include all taxs)
                        </p>
                        <div class="add-cart-order-btn">
                            
                                 <div class="cart-items">
                                    <!-- Add to Cart Form -->
                                    <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-15" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Chicken Dum Biryani" />
                                            <input type="hidden" name="itemprice" value="225" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Chicken-Dum-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Chicken_Dum_Biryani.jsp"/>
                                            <button class="Add-cart-grilled" type="submit" name="addToCart">Add to Cart</button>
                                    </form>
                                </div>
                           
                                <div class="cart-items">
                                       <!-- Add to Order Form -->
                                       <form action="NON-VEG.jsp" method="post">
                                            <input type="hidden" name="itemid" value="NV-15" /><!-- NV means NON-VEG -->
                                            <input type="hidden" name="itemname" value="Chicken Dum Biryani" />
                                            <input type="hidden" name="itemprice" value="225" />
                                            <input type="hidden" name="image" value="images/Non-VEG/Chicken-Dum-Biryani.png" />
                                            <input type="hidden" name="link" value="NON-VEG/Chicken_Dum_Biryani.jsp"/>
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
                       A quick and easy home made biryani is something you cannot escape.
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 15 End -->
        
        
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