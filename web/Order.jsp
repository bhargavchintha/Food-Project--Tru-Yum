<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="UserDAO.UserDAO" %>
<%@ page import="UserDAO.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="delete.deleteOrder" %>
<%
    
    
        HttpSession sessions = request.getSession();
        String username = (String) sessions.getAttribute("username");
        String name = (String) sessions.getAttribute("name");
        int pin = (int) sessions.getAttribute("pin");
       String FirstLetterCapitalized = name.substring(0, 1).toUpperCase();
        String FullName = name.substring(0, 1).toUpperCase() + name.substring(1);
        
//        out.println("<p>Name: " + name + "</p>");
//        out.println("<p>PIN: " + pin + "</p>");
//        out.println("<p>First Letter: " + FirstLetterCapitalized + "</p>");
//        out.println("<p>Full Name: " + FullName + "</p>");

    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>



<%@page import="java.util.List"%>
<%@page import="order.orderDetails"%>
<%@page import="order.Order"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
   <title>My Orders | All Food Items</title>
        <link rel="icon" href='images/TRU-YUM.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./bub.css">
    <link rel="stylesheet" type="text/css" href="./Orders.css">
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
    
    
    
    
    
    
    
   
    
    
    
    
    
    
<%
    String email = (String) session.getAttribute("email");

    Order orderInstance = new Order();
    List<orderDetails> orderList = orderInstance.getOrderDetailsByEmail(email);

    if (orderList != null && !orderList.isEmpty()) {
        // Display the order details
%>

<div class="DIV"></div>
        <%
             String itemNames = ""; 
   for (orderDetails orderDetails : orderList) { %>            

            <div class="Order">
                <div class="Order-1">
                    <div class="Order-2">
                        <div class="Flex-Order">
                            <div class="Flex-Order-1">
                                <div class="Order-IMG">
                                    <img class="Order-first-img" src="<%= orderDetails.getImage() %>">
                                </div>
                            </div>
                                
                                
                                
                            <div class="Flex-Order-2">
                                <div class="Flex-Order-21">
                                <div class="Order-Name">
                                    <h1 class="Order-NAME">
                                        <%= orderDetails.getItemName() %>
                                    </h1>
                                </div>  
                            
                                        
                            <div class="Flex-Order-31">
                                <div class="Flex-Order-3">
                                    <div class="BTN-Order">
                                        <div class="BTN_order-1">
                                            <span class="decreaseBtn"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                            <input type="text" class="quantity" name="quantity" value="1" min="1" max="7" readonly>
                                            <span class="increaseBtn"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                            <div class="itemName" data-item-name="<%= orderDetails.getItemName() %>">

                                            </div>
                                        </div>
                                        <div class="BTN_order-2"> 
                                             <span class="Rupee">₹</span><span class="itemPrice" data-price="<%= orderDetails.getItemPrice() %>"><%= orderDetails.getItemPrice() %></span>
                                        </div>
                                    </div>
                                    <div class="Form-Order">
                                       <form action="DeleteOrderItem.jsp" method="POST">
                                            <input type="hidden" name="email" value="<%= orderDetails.getEmail() %>">
                                            <input type="hidden" name="itemId" value="<%= orderDetails.getItemId() %>">
                                            <input type="submit" value="Remove" onclick="return confirm('Are you sure you want to delete <%= orderDetails.getItemName() %>?');">
                                        </form>
                                    </div>
                                </div>
                            </div>
                                </div>      
                            </div>           
                        </div>
                    </div>
                </div>
            </div>

               
                                        





<%   
    //Print itemNamesString after the code block
//out.println(itemNamesString);
}
%>

   
 

<div class="Bottom-Stick">
   <div class="Bottom-Stick-1">
      <div class="Bottom-Stick-2">
         <div class="Name_PLACE-ORDER">  
            <h1 class="Place-Order">Total Amount: <span class="Place_rupee">₹</span> <span id="totalPriceOrderValue"></span></h1>
         </div>
         <div class="Form_Btn">
            <span>
                <div style="display: none" id="combinedItems"> </div>
                 <script>
$(document).ready(function() {
  function updateInputValue() {
    var combinedItems = $("#combinedItems").html();
    $("#itemNames").val(combinedItems);
  }

  // Initial update on page load
  updateInputValue();

  // Update input value whenever the content of combinedItems div changes
  $("#combinedItems").on("DOMSubtreeModified", function() {
    updateInputValue();
  });
});
</script>
<script>
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
    setInterval(updateClock, 1000);
  </script>
  <script>
  $(document).ready(function() {
    function updateInputValue() {
      var totalPrice = $("#totalPriceOrderValue").html();
      $("input[name='totalprice']").val(totalPrice);
    }

    // Initial update on page load
    updateInputValue();

    // Update input value whenever the content of totalPriceOrderValue span changes
    $("#totalPriceOrderValue").on("DOMSubtreeModified", function() {
      updateInputValue();
    });
  });
</script>
  <form class="FROM_ITEMS" action="Checkout.jsp" method="post">
                   <input type="hidden" name="totalprice" value="" readonly />
                   <input type="hidden" name="item_name" id="itemNames" value="" readonly="" />
                   <input type="hidden" name="status" id="itemNames" value="Failed" readonly="" />
                   <input type="hidden" id="clockInput"name="clock" value=""  readonly="" />
                   <input type="hidden" name="nameitems" id="nameitems" value="" />
                   <button class="Check_Out">Check Out</button>
               </form>
            </span>
         </div>
      </div>
   </div>
</div>





       

        
        <div  class="Max-Lenght">
    <div class="Max-Lenght-1">
<!--        <button class="MAX_LENGTH" onclick="hideMaxLenght()"><i class="fa fa-close"></i></button>-->
        <div class="Max-Lenght-2">
            <button class="MAX_LENGTH" onclick="hideMaxLenght()"><i class="fa fa-close"></i></button>
            <h5 class="CONTANT_lenght">Ordering a bulk order? Call us at</h5>
            <a class="Ta" href="tel:+919876547890">+919876547890</a>
            <p class="Exp">
                Our customer experience team is available all days from 9am to 12.00am to assist you with any questions or issues you might have.
            </p>
            <p class="Exp_em">
                You can email us at
            </p>
            <a class="Ta" href="mailto:bhargav@gmail.com">bhargav@gmail.com</a>
        </div>
    </div>
</div>  

        

<script>  
function hideMaxLenght() {
        document.querySelector(".Max-Lenght").style.display = "none";
    }  
</script>


<script>
var itemContainers = document.querySelectorAll(".Flex-Order-3");
var totalPriceOrder = document.getElementById("totalPriceOrder");
var totalPriceOrderValue = document.getElementById("totalPriceOrderValue");
var totalValue = 0;

itemContainers.forEach(function(container) {
  var decreaseButton = container.querySelector(".decreaseBtn");
  var increaseButton = container.querySelector(".increaseBtn");
  var quantityElement = container.querySelector(".quantity");
  var priceElement = container.querySelector(".itemPrice");
  var itemNameElement = container.querySelector(".itemName"); // Added item name element

  decreaseButton.addEventListener("click", function() {
    var currentValue = parseInt(quantityElement.value);
    if (currentValue > 1) {
      quantityElement.value = currentValue - 1;
      updatePrice();
      updateTotal();
      updateItemNames(itemNameElement, quantityElement); // Update item names when decreasing quantity
    }
  });

  increaseButton.addEventListener("click", function() {
    var currentValue = parseInt(quantityElement.value);
    var maxValue = parseInt(quantityElement.getAttribute("max"));
    if (currentValue < maxValue) {
      quantityElement.value = currentValue + 1;
      updatePrice();
      updateTotal();
      updateItemNames(itemNameElement, quantityElement); // Update item names when increasing quantity
    } else {
      document.querySelector(".Max-Lenght").style.display = "block";
    }
  });

  quantityElement.addEventListener("change", function() {
    var currentValue = parseInt(quantityElement.value);
    var minValue = parseInt(quantityElement.getAttribute("min"));
    var maxValue = parseInt(quantityElement.getAttribute("max"));

    if (currentValue < minValue) {
      quantityElement.value = minValue;
    } else if (currentValue > maxValue) {
      quantityElement.value = maxValue;
    }

    updatePrice();
    updateTotal();
    updateItemNames(itemNameElement, quantityElement); // Update item names when changing quantity
  });
});

function updatePrice() {
  itemContainers.forEach(function(container) {
    var quantityElement = container.querySelector(".quantity");
    var priceElement = container.querySelector(".itemPrice");
    var itemPrice = parseInt(priceElement.getAttribute("data-price"));
    var quantity = parseInt(quantityElement.value);
    priceElement.textContent = itemPrice * quantity;
  });
}

function updateTotal() {
  totalValue = 0;
  itemContainers.forEach(function(container) {
    var priceElement = container.querySelector(".itemPrice");
    var quantityElement = container.querySelector(".quantity");
    var itemPrice = parseInt(priceElement.getAttribute("data-price"));
    var quantity = parseInt(quantityElement.value);
    totalValue += itemPrice * quantity;
  });
  totalPriceOrderValue.textContent = totalValue;
}

var combinedItems = document.getElementById("combinedItems");
var nameItemsInput = document.getElementById("nameitems"); // Get the hidden input field with id "nameitems"

function updateItemNames() {
  var itemNames = [];
  var itemNamesWithoutAmounts = [];
  var itemsMap = new Map();

  itemContainers.forEach(function(container, index) {
    var itemNameElement = container.querySelector(".itemName");
    var itemName = itemNameElement.getAttribute("data-item-name");
    var quantityElement = container.querySelector(".quantity");
    var quantity = parseInt(quantityElement.value);
    var priceElement = container.querySelector(".itemPrice");
    var itemPrice = parseInt(priceElement.getAttribute("data-price"));

    if (quantity > 0) {
      if (!itemsMap.has(itemName)) {
        itemsMap.set(itemName, { quantity: quantity, itemPrice: itemPrice });
      } else {
        var existingItem = itemsMap.get(itemName);
        existingItem.quantity += quantity;
        itemsMap.set(itemName, existingItem);
      }
    }
  });

  itemsMap.forEach(function(item, itemName) {
    var itemNumber = itemNames.length + 1;
    var totalAmount = item.quantity * item.itemPrice;
    itemNames.push(itemNumber + ". " + itemName + " * " + item.quantity + " &nbsp;= &nbsp;<i class=\"fa fa-rupee-sign\"></i>" + totalAmount);
    itemNamesWithoutAmounts.push(itemName);
  });

  // Set the content of the combinedItems div
  combinedItems.innerHTML = itemNames.join("<br>") + "<br>";

  // Set the value of the hidden input field with the id "nameitems" without the total amounts
  nameItemsInput.value = itemNamesWithoutAmounts.join(", ");
}




// Initialize totalValue with the initial item price multiplied by the initial quantity
itemContainers.forEach(function(container) {
  var priceElement = container.querySelector(".itemPrice");
  var quantityElement = container.querySelector(".quantity");
  var itemPrice = parseInt(priceElement.getAttribute("data-price"));
  var quantity = parseInt(quantityElement.value);
  totalValue += itemPrice * quantity;
});

updateTotal();

// Call updateItemNames initially to set the initial content of combinedItems
updateItemNames();

// Update item names when changing quantity
itemContainers.forEach(function(container) {
  var quantityElement = container.querySelector(".quantity");
  quantityElement.addEventListener("change", function() {
    updateItemNames();
  });
});




// Initialize totalValue with the initial item price multiplied by the initial quantity
itemContainers.forEach(function(container) {
  var priceElement = container.querySelector(".itemPrice");
  var quantityElement = container.querySelector(".quantity");
  var itemPrice = parseInt(priceElement.getAttribute("data-price"));
  var quantity = parseInt(quantityElement.value);
  totalValue += itemPrice * quantity;
});

updateTotal();
</script>







        
        
<style>
    .ocean{
        margin-top: 20px;
    } 
</style>      
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
hai{
 margin-top: 0px;
        margin-bottom: 15px;
        width: 100%;
        padding: 15px 20px;
        border-radius:5px;
font-size: 18px;
color: #1B395D;
font-weight: 600;
background-color: #1574f5;
border: none;
cursor: pointer;
transition: all 0.3s ease-in-out;
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

        
<%
    } else if (email != null && !email.isEmpty()) {
      //  out.println("No orders found.");
%>

<style>
        .Ma{
            padding-top: 80px;
            text-align: center;
        }
        button.Browse{
        margin-top: 0px;
        margin-bottom: 15px;
        width: 100%;
        padding: 15px 20px;
        border-radius:5px;
        font-size: 18px;
        color: #fff;
        font-weight: 600;
        background-color: #1574f5;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        }
        button.Browse:hover{
        color: #1da1f2;
        background-color: #fff;
        box-shadow: 0 0 8px 0 #000; 
           }
           div.Ma{
               width: 100%;
               margin: auto;
           }
           div.Ma-1{
               width: 80%;
               margin: auto;
           }
           div.Ma-2{
               width: 60%;
               margin: auto;
           }
           @media screen and (max-width:350px){
               div.Ma-2{
               width: 80%;
               margin: auto;
           }
           }
           @media screen and (max-width:250px){
               div.Ma-2{
               width: 100%;
               margin: auto;
           }
           }
           div.Ma-3{
               width: 40%;
               margin: auto;
           }
           @media screen and (max-width:1000px){
               div.Ma-3{
               width: 100%;
               margin: auto;
           }
           }
           .fa-shopping-cart{
               padding-top: 20px;
               color: #192E4F;
               font-size: 40px;
           }
           p.Your-cart{
             color: #192E4F;  
             padding-bottom: 10px;
             padding-top: 1px;
             font-size: 20px;
           }
    </style>
      <div class="Ma">
          <div class="Ma-1">
              <div class="Ma-2">
                  <div class="Ma-3">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                      <p class="Your-cart">Your Order Is Empty</p>
                  <a href="Menu.jsp" class="Brow">
                      <button class="Browse" > Browse Items </button>
                  </a>
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
hai{
 margin-top: 0px;
        margin-bottom: 15px;
        width: 100%;
        padding: 15px 20px;
        border-radius:5px;
font-size: 18px;
color: #1B395D;
font-weight: 600;
background-color: #1574f5;
border: none;
cursor: pointer;
transition: all 0.3s ease-in-out;
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
    

<%
    }
%>

<%
    String itemId = request.getParameter("itemId");
    
    if (itemId != null) {
        Order myOrderInstance = new Order();
        boolean deleted = myOrderInstance.deleteOrderItem(email, itemId);

        if (deleted) {
           // out.println("Item deleted successfully.");
            // Redirect to the same Order.jsp page
            response.sendRedirect("Order.jsp");
        } else {
           // out.println("Failed to delete the item.");
            // Redirect to an error page or handle the failure in an appropriate way
            // response.sendRedirect("error.jsp");
        }
    }
%>





</body>
</html>

