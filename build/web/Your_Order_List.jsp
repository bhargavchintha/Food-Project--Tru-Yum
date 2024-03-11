<%@page import="java.lang.String"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<%@ page import="UserDAO.UserDAO" %>
<%@ page import="UserDAO.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="OrderItems.Orderitem" %>
<%@ page import="OrderItems.OrderDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Orderitemsdelete.OrderdeleteDAO" %>
<%@ page import="Orderitemsdelete.Orderdeleteitems" %>
<%@ page import="Orderitemsdelete.Deleteorder" %>
<%
    
        HttpSession sessions = request.getSession();
        String username = (String) session.getAttribute("username");
        String name = (String) session.getAttribute("name");
       // String email = (String) session.getAttribute("email");
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
    
   
   
    
    <%
         String email = (String) session.getAttribute("email");
    if (request.getMethod().equals("POST")) {
       
        String itemlist = request.getParameter("itemlist");
        String coupons = request.getParameter("coupons");
        String orderaddress = request.getParameter("orderaddress");
        String grandtotalamount = request.getParameter("grandtotalamount");
        String payment = request.getParameter("payment");
        String randomtime = request.getParameter("randomtime");
        String date = request.getParameter("date");
        String clock = request.getParameter("clock");
        String orderstatus = request.getParameter("orderstatus");
        String nameitems = request.getParameter("nameitems");
        String addresshouse = request.getParameter("addresshouse");
        String addresstype = request.getParameter("addresstype");
        String drivername = request.getParameter("drivername");
        String drivernumber = request.getParameter("drivernumber");
        String subtotal = request.getParameter("subtotal");
        
       //addresstype
        
        if (payment == null) {
            response.sendRedirect("Checkout.jsp");
            out.println("<div id=\"popupMessage\" class=\"popup-message\">Please select a payment method!</div>");
        } else {
            Random random = new Random();
            int randomNumber = random.nextInt(10000000);
            String orderid = "#Tru" + randomNumber;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

                String sql = "INSERT INTO orderitemnames (orderid, email, itemlist, coupons, orderaddress, grandtotalamount, payment, randomtime, date, clock, orderstatus, nameitems, addresshouse, addresstype, drivername, drivernumber,subtotal ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, orderid);
                statement.setString(2, email);
                statement.setString(3, itemlist);
                statement.setString(4, coupons);
                statement.setString(5, orderaddress);
                statement.setString(6, grandtotalamount);
                statement.setString(7, payment);
                statement.setString(8, randomtime);
                statement.setString(9, date);
                statement.setString(10, clock);
                statement.setString(11, orderstatus);
                statement.setString(12, nameitems);
                statement.setString(13, addresshouse);
                statement.setString(14, addresstype); 
                statement.setString(15, drivername); 
                statement.setString(16, drivernumber);
                statement.setString(17, subtotal);
                
                
                statement.executeUpdate();
                statement.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

                String sql1 = "INSERT INTO deleteorderitems (orderid, email, itemlist, coupons, orderaddress, grandtotalamount, payment, randomtime, date, clock, orderstatus, nameitems, addresshouse, addresstype, drivername, drivernumber, subtotal ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement1 = conn1.prepareStatement(sql1);
                statement1.setString(1, orderid);
                statement1.setString(2, email);
                statement1.setString(3, itemlist);
                statement1.setString(4, coupons);
                statement1.setString(5, orderaddress);
                statement1.setString(6, grandtotalamount);
                statement1.setString(7, payment);
                statement1.setString(8, randomtime);
                statement1.setString(9, date);
                statement1.setString(10, clock);
                statement1.setString(11, orderstatus);
                statement1.setString(12, nameitems);
                statement1.setString(13, addresshouse);
                statement1.setString(14, addresstype); 
                statement1.setString(15, drivername); 
                statement1.setString(16, drivernumber);
                statement1.setString(17, subtotal);
                
                statement1.executeUpdate();

                statement1.close();
                conn1.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            // Redirect to a different page to avoid re-submitting the form
            response.sendRedirect("Your_Order_List.jsp");
        }
         
    }
   
%>





<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html>
    <head>
        <title>TruYum Restaurant | All Food Items</title>
        <link rel="icon" href='images/TRU-YUM.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

<!--   <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>-->
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./Bubbls.css">
    <link rel="stylesheet" type="text/css" href="./Homecss.css">
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
        



    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Akatab:wght@500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Lisu+Bosa&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Lisu+Bosa&family=Poltawski+Nowy&display=swap');
        .Ma{
            padding-top: 100px;
        }
        div.Order-List-1{
            width: 100%;
            margin: auto;
        }
        div.Order-List-2{
            width: 60%;
            margin: auto;
            background-color: #FFF;
            padding-top: 20px;
            border-radius: 5px;
            transition: 0.3s all ease-in-out;
             box-shadow: 0px 0 5px 0 #000;
        }
        @media screen and (max-width:1200px){
            div.Order-List-2{
                width: 70%;
            } 
        }
        @media screen and (max-width:900px){
            div.Order-List-2{
                width: 80%;
            } 
        }
        @media screen and (max-width:300px){
            div.Order-List-2{
                width: 90%;
            } 
        }
        @media screen and (max-width:230px){
            div.Order-List-2{
                width: 100%;
            } 
        }
        div.Order-List-3{
            padding: 10px 30px;
            overflow: hidden;
            transition: 0.3s all ease-in-out;
        }
        @media screen and (max-width:24px){
            div.Order-List-3{
            padding: 10px 20px;
            overflow: hidden;
        }
        }
        h1.Your-Order-S{
            padding-bottom: 10px;
            color: #204F7A;
            text-align: center;
            font-family: 'Lato', sans-serif;
            font-weight: 700;
            font-style: italic;
            transition: 0.3s all ease-in-out;
        }
        @media screen and (max-width:900px){
            h1.Your-Order-S{
                font-size: 28px;
            }
        }
        @media screen and (max-width:600px){
            h1.Your-Order-S{
                font-size: 20px;
            }
        }
        div.Order-List-3{
            margin-bottom: 30px;
        }
    </style>
      <div class="Ma">
          <div class="Order-List" id="orderListDiv" >
              <div class="Order-List-1">
                  <div class="Order-List-2">
                      <div class="Order-List-3">
                           
                        <%
                            // Get the email from the session or request parameter
                           // String email = (String) session.getAttribute("email");
                            if (email == null) {
                                email = request.getParameter("email");
                            }

                            OrderdeleteDAO orderDeleteDAO = new OrderdeleteDAO("jdbc:mysql://localhost:3306/signup", "root", "root");

                            // Get the list of order items from the database
                            List<Orderdeleteitems> orderItems = orderDeleteDAO.getOrdersByEmail(email);
                        %>

                        <h1 class="Your-Order-S" >Your Order Status</h1>

                        <% if (orderItems.isEmpty()) { %>
                            <p>No deleted orders found for this email.</p>
                        <% } else { %>
    
                        <% for (Orderdeleteitems OrderDeleteItem : orderItems) { %>

                <style>
      .loader-container {
        display: flex;
      }

      .loader {
        position: relative;
        width: 110px;
        height: 110px;
      }

      .loader:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        border: 8px solid #f3f3f3; 
        border-top: 8px solid #3498db; 
        border-radius: 50%;
        animation: spin 1s linear infinite;
        
      }

      .text {
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #333;
        position: absolute;
        width: 100%;
        height: 100%;
      }

      @keyframes spin {
        0% {
          transform: rotate(0deg);
        }
        100% {
          transform: rotate(360deg);
        }
      }
      input[type=submit]{
          display: none;
      }
      h1.Your-Order-Details{
          color: #095486;
          font-size: 25px;
          padding-bottom: 0px;
          font-family: 'Akatab', sans-serif;
          transition: 0.3s all ease-in-out;
      }
      @media screen and (max-width:600px){
            h1.Your-Order-Details{
                font-size: 20px;
            }
        }
      p.Your-Order-No{
          color: #2c82c9;
          font-size: 20px;
          padding-bottom: 10px;
          font-family: sans-serif;
          transition: 0.3s all ease-in-out;
      }
      @media screen and (max-width:600px){
            p.Your-Order-No{
                font-size: 16px;
            }
        }
      span.Order-Id{
          color: #069;
          font-size: 23px;
          font-weight: 300;
          font-family: 'Kanit', sans-serif;
          overflow: hidden;
          transition: 0.3s all ease-in-out;
      }
      @media screen and (max-width:600px){
            span.Order-Id{
                font-size: 18px;
            }
        }
      div.Flex-Names-Loader{
          display: flex;
          align-items: center;
          padding-top: 10px;
      }
      
      @media screen and (max-width:500px){
          div.Flex-Names-Loader{
              display: block;
          }
      }
      
      div.Item-Names{
          padding-left: 30px;
          padding-right: 30px;
          transition: 0.3s all ease-in-out;
      }
      @media screen and (max-width:600px){
          div.Item-Names{
          padding-left: 20px;
          padding-right: 20px;
          }   
      }
      @media screen and (max-width:500px){
          div.Item-Names{
          padding-left: 10px;
          padding-right: 10px;
          }   
      }
      h1.Item-list{
          text-align: center;
          font-size: 25px;
          color: #204F7A;
          font-family: 'Lisu Bosa', serif;
          padding-bottom: 5px;
      }
      p.Item-List{
          color: #095486;
          font-family: sans-serif;
          transition: 0.3s all ease-in-out;
      }
      div.Delivery-Home{
          padding-top: 10px;
          padding-bottom: 10px;
      }
      div.Delivery-Home-1{
          align-items: center;
      }
      p.Delivery-To-Address{
          margin-top: 0px;
          text-align: center;
          position: relative;
          z-index: 99;
      }
      p.Delivery-To-Address::before,
      p.Delivery-To-Address::after{
         content: "";
        display: block;
        width: 100%;
        height: 1.5px;
        background: #204f7a0f;
        position: absolute;
        top: 10px;
        left: 0;
        z-index: -1;
      }
      span.DA{
          background-color: #fff;
          padding-left: 10px;
          padding-right: 10px;
          color: #2c82c9;
          font-size: 15px;
      }
      span.Address-Delivery {
        color: #204F7A;
        font-size: 16px;
        cursor: pointer;
        position: relative;
        display: inline-block;
        font-family: 'Lisu Bosa',monospace;
      }

      .Delivery-Address{
        display: none;
        position: absolute;
        top: -41px; 
        width: 100%;
        left: 0px;
        background-color: #095486;
        color: #fff;
        padding: 5px;
        padding-top: 10px;
        padding-bottom: 10px;
        border-radius: 5px;
        transition: 0.3s all ease-in-out;
        font-family: cursive;
      }
      @media screen and (max-width:786px){
          .Delivery-Address{
            top: -62px;   
          } 
      }
      @media screen and (max-width:491.5px){
          .Delivery-Address{
            top: -82px;   
          } 
      }
      @media screen and (max-width:334.5px){
          .Delivery-Address{
            top: -102px;   
          } 
      }
      @media screen and (max-width:312.5px){
          .Delivery-Address{
            top: -122px;   
          } 
      }
      @media screen and (max-width:300.5px){
          .Delivery-Address{
            top: -82px;   
          } 
      }
      @media screen and (max-width:298px){
          .Delivery-Address{
            top: -102px;   
          } 
      }
      @media screen and (max-width:278px){
          .Delivery-Address{
            top: -122px;   
          } 
      }
      @media screen and (max-width:233px){
          .Delivery-Address{
            top: -110px;   
          } 
      }
      @media screen and (max-width:193px){
          .Delivery-Address{
            top: -92px;   
          } 
      }
      @media screen and (max-width:177px){
          .Delivery-Address{
            top: -109px;   
          } 
      }
      @media screen and (max-width:170px){
          .Delivery-Address{
            top: -126px;  
            overflow: hidden;
          } 
      }
      @media screen and (max-width:167px){
          .Delivery-Address{
            top: -142px;   
          } 
      }
      @media screen and (max-width:115px){
          .Delivery-Address{
            top: -125px;   
          } 
      }
      @media screen and (max-width:109px){
          .Delivery-Address{
            top: -146px;
            visibility: hdden;
          } 
      }
      
      .Delivery-Address::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        margin-left: 15px;
        border-width: 5px;
        border-style: solid;
        border-color: #095486 transparent transparent transparent;
        transition: 0.3s all ease-in-out;
      }
       @media screen and (max-width:318.5px){
          .Delivery-Address::after {
           margin-left: 47px;  
          } 
      }
      @media screen and (max-width:300px){
          .Delivery-Address::after {
           margin-left: 17px;  
          } 
      }
      @media screen and (max-width:284px){
          .Delivery-Address::after {
           margin-left: 47px;  
          } 
      }
      @media screen and (max-width:193px){
          .Delivery-Address::after {
           margin-left: -34px;  
          } 
      }
      @media screen and (max-width:158px){
          .Delivery-Address::after {
           margin-left: -1.5px;  
          } 
      }
      @media screen and (max-width:153px){
          .Delivery-Address::after {
           margin-left: 8px;  
          } 
      }
      @media screen and (max-width:115px){
          .Delivery-Address::after {
           margin-left: -1px;  
          } 
      }
      .Address-Delivery:hover + .Delivery-Address {
        display: inline;
      }
      .Address-Delivery:focus + .Delivery-Address {
        display: inline;
      }
      span.Delivery-Address{
          color: #fff; 
          font-weight: 700; 
          font-size: 15px;
      }
      @media screen and (max-width:232px){
          span.Delivery-Address{
              font-size: 13px;
          }
      }
      div.Order-Delivered-Staus-1{
          display: none;
      }
      @media screen and (max-width:500px){
          div.Flex-Coloum{
              display: flex;
              align-items: center;
        }
          div.Order-Delivered-Staus-1{
          display: block;
          padding-left: 20px;
          padding-right: 10px;
        }
      }
      @media screen and (max-width:300px){
         div.Order-Delivered-Staus-1{
          display: none;
      } 
      }
      p.Order-Delivered-Staus-2{
          color: #004879;
          font-weight: 400;
          font-family: initial;
      }
      h1.Arivingg-In{
          color: #095486;
          font-size: 13px;
          font-family: serif;
      }
      div.Arrive-Time{
          width: 100%;
          margin: auto;
          padding-top: 10px;
          padding-bottom: 10px;
          text-align: center;
      }
      div.Arrive-Time-1{
          width: 80%;
          margin: auto;
          display: flex;
          align-items: center;
          justify-content: center;
      }
      .form-container {
        display: flex;
        align-items: center;
        gap: 0px;
        }  
      p.Check-circle {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background-color: green;
        color: #fff;
        font-weight: bold;
        margin-right: 5px;
      }
      p.Check-circle-1,p.Check-circle-2{
         display: flex;
        justify-content: center;
        align-items: center;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background-color: #204F7A;
        color: #fff;
        font-weight: bold;
        margin-right: 5px; 
      }
      div.double-line-1 {
        width: 40px;
        height: 5px;
        background: #204F7A;
        margin-left: 2px; 
        border-radius: 5px 0px 0px 5px;
      }
      div.double-line-2{
        width: 40px;
        height: 5px;
        background: #204F7A;
        margin-left: -1px;
        margin-right: 10px;   
        border-radius: 0 5px 5px 0;
      }
      div.double-line-3{
        width: 40px;
        height: 5px;
        background: #204F7A;
        margin-left: 2px; 
        border-radius: 5px 0px 0px 5px;
      }
      div.double-line-4{
        width: 40px;
        height: 5px;
        background: #204F7A;
        margin-left: -1px;
        margin-right: 10px;   
        border-radius: 0 5px 5px 0;
      }
      
      span.Text-Number{
       color: green;
       font-size: 20px;
       margin-right: 10px;
       font-family: 'Poltawski Nowy', serif;
      }
      span.Text-Number-1,span.Text-Number-2{
       color: #204F7A;
       font-size: 20px;
       margin-right: 10px;
       font-family: 'Poltawski Nowy', serif;
      }
      div.Packing-Showing{
          margin-top: 10px;
      }
      p.Your-Packing{
          background-color: #fff;
          box-shadow: 0 0 3px 0 #ccc;
          display: inline-block;
          padding: 7px 13px ;
          border-radius: 5px;
      }
      h1.Driver-Details{
          font-size: 25px; 
          font-family: serif;
          font-weight: 600;
          color: #204F7A;
          padding-bottom:10px;
          padding-left: 10px;
      }
      p.Your-Packing{
          color: #204F7A;
          font-size: 18px;
          font-family: 'Poltawski Nowy', serif;
      }
      div.Driver-Details-flex{
          display: flex;
          align-items: center;
          justify-content: space-around;
          transition: 0.3s all linear;
      }
      #Icon-User{
        color: #004879;
        font-size: 20px;
      }
      #Icon-Phone{
          color: #2c82c9;
          font-size: 20px;
      }
      span.Driver-Name{
          color: #095486;
          font-size: 20px;
          font-family: monospace;
      }
      a.Driver_Numbers{
          text-decoration: none;
          color: #2c82c9;
          display: flex;
          font-family: serif;
          font-size: 20px;
      }
      div.Driver-Phone-Number{
          margin-top: -4px;
      }
      #syringe-V{
          color: #204F7A;
          transform: rotate(180deg);  
          margin-right: 3px;
      }
      span.Vaccin{
          color: #204F7A;
          font-size: 18px;
      }
      p.Vaccinated-Person{
          position: absolute;
          margin-top: -45px;
          background: #fff;
          padding: 10px 20px;
          border-radius: 5px;
          margin-left: -20px;
          transition: 0.3s all linear;
          visibility: hidden;
          transition: 0.3s all linear; 
          box-shadow: 0 0 8px 0 #000;
      }
      p.Vaccinated-Person::after{
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        margin-left: -5px;
        border-width: 5px;
        border-style: solid;
        border-color: #fff transparent transparent transparent;
        
      }
      p.Driver-Details-V {
         cursor: pointer;
      }
      
      div.Driver_Names:hover  p.Vaccinated-Person{
          visibility: visible;
      }
      div.Button-Canecl-Time{
          padding-top: 10px;
      }
      button.Time-Cancel-Btn {
          margin-top: 10px;
          margin-bottom: 20px;
        width: 100%;
        display: inline-block;
        padding: 10px 20px;
        border-radius: 5px;
        color: #204F7A;
        font-size: 20px;
        background-color: #204F7A;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        z-index: 1;
        cursor: pointer;
        border: 1px solid #204F7A;
      }

      button.Time-Cancel-Btn:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #fff;
        border-radius: 5px;
        z-index: -2;
      }
    button.Time-Cancel-Btn:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0%;
      height: 100%;
      background-color: #204F7A;
      color: #fff;
      transition: all 0.3s;
      border-radius: 5px;
      z-index: -1;
    }

    button.Time-Cancel-Btn:hover:before {
      width: 100%;
      color: #fff;
    }
    button.Time-Cancel-Btn:hover{
        color: #fff;
        border: 1px solid #fff;
        box-shadow: 0 0 8px 0 #2c82c9; 
    }
    
    .modal-timer {
  display: none; 
  position: fixed; 
  z-index: 1; 
  padding-top: 100px; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto;
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4); 
  z-index: 9999999;
  transition: 0.3s all ease-in-out;
}
    
    .modal-content-timer {
  position: relative;
  margin: auto;
  width: 80%;
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s;
  transform: translate(0%, 100%);
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}



div.Cancel-Section-Timer-2{
    display: flex;
    align-items: center;
    justify-content: space-evenly;
}

div.Modal-Timer-Section{
    width: 80%;
    margin: auto;
    height: auto;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px  0 rgba(0,0,0,0.19);
    background: #fff;
    text-align: center;
    transition: 0.3s all ease-in-out;
    
}
div.modal-content{
    width: 100%;
    margin: auto;
}
h1.Cancel-Order-Section{
    padding-bottom: 15px;
    padding-top: 10px;
    color: #204F7A;
    font-size: 35px;
}
button.Order-Cancel{
   margin-top: 10px;
    margin-bottom: 20px;
    width: 100%;
    display: inline-block;
    padding: 10px 20px;
    border-radius: 5px;
    color: #204F7A;
    font-size: 20px;
    background-color: #204F7A;
    transition: all 0.3s;
    position: relative;
    overflow: hidden;
    z-index: 1;
    cursor: pointer;
    border: 1px solid #204F7A;  
    color: #204F7A;
}
button.Order-Cancel:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #fff;
        border-radius: 5px;
        z-index: -2;
      }
    button.Order-Cancel:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0%;
      height: 100%;
      background-color: #204F7A;
      color: #fff;
      transition: all 0.3s;
      border-radius: 5px;
      z-index: -1;
      right: 0; 
      left: auto; 
      transform-origin: right; 
    }

    button.Order-Cancel:hover:before {
      width: 100%;
      color: #fff;
      left: 0; /* Change from 0% to left: 0 */
      right: auto; /* Add this line to remove the right position */
      transform-origin: left;
    }
    button.Order-Cancel:hover{
        color: #fff;
        border: 1px solid #fff;
        box-shadow: 0 0 8px 0 #2c82c9; 
    }
    
    button.Close-Modal{
    margin-top: 10px;
    margin-bottom: 20px;
    width: 100%;
    display: inline-block;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 20px;
    background-color: #204F7A;
    transition: all 0.3s;
    position: relative;
    overflow: hidden;
    z-index: 1;
    cursor: pointer;
    border: 1px solid #204F7A;  
    color: #fff;
    }
    button.Close-Modal:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #204F7A;
        border-radius: 5px;
        z-index: -2;
      }
    button.Close-Modal:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0%;
      height: 100%;
      background-color: #fff;
      color: #204F7A;
      transition: all 0.3s;
      border-radius: 5px;
      z-index: -1;
       left: 0; 
       right: auto; 
      transform-origin: left;
    }

    button.Close-Modal:hover:before {
      width: 100%;
      color: #204F7A;
      left: auto; 
     right: 0; 
     transform-origin: right;
    }
    button.Close-Modal:hover{
        color: #204F7A;
        border: 1px solid #fff;
        box-shadow: 0 0 8px 0 #2c82c9; 
    }
    </style>
                
      
                <div class="Your-Order-Details-0">
                    <h1 class="Your-Order-Details">Your Order Details</h1>
                    <p class="Your-Order-No"> Order-Id: <span class="Order-Id"> <%= OrderDeleteItem.getOrderid() %></span></p>
                </div>
                <div class="Flex-Names-Loader">
                    <div class="Flex-Coloum">
                        <div class="loader-container">
                            <div class="loader">
                                <div class="text">
                                    <div class="Time-Cancel-Delivered">
                                        <h1 class="Arivingg-In">Arriving In</h1>
                                       <div class="given-timer" data-time="<%= OrderDeleteItem.getRandomtime() %>" > <%= OrderDeleteItem.getRandomtime() %></div>
                                        <form action="Your_Order_List_delete.jsp"  method="post" >
                                            <input type="hidden" name="orderId" value="<%= OrderDeleteItem.getOrderid() %>" readonly=""/>
                                            <input type="hidden" name="email" value="<%= OrderDeleteItem.getEmail() %>" readonly=""/>
                                            <input type="hidden" name="orderstatus" value="Order Sucessfully Delivered" readonly=""/>
                                            <input type="submit" class="Auto-submit" value="Delete" />
                                        </form>
                                            <div style="display: nne;" class="Time-Running-Not">Not Running</div>
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="Order-Delivered-Staus-1"> 
                            <p class="Order-Delivered-Staus-2">Order Will be delivered soon.</p> 
                        </div>                    
                    </div>
                    <div class="Item-Names">   
                        <h1 class="Item-list">Order List</h1>
                        <p class="Item-List"> <%= OrderDeleteItem.getNameitems() %></p>
                    </div> 
                </div>    
                
                <div class="Arrive-Time">
                    <div class="Arrive-Time-1">
                        <div class="Check-out-2">  
                            <div class="form-container">
                                <p class="Check-circle"></p><span class="Text-Number">Packing</span>
                                 <div class="double-line-1"></div> <div class="double-line-2"></div>
                                 <p class="Check-circle-1"></p><span class="Text-Number-1">On The Way</span>
                                 <div class="double-line-3"></div> <div class="double-line-4"></div>
                                 <p class="Check-circle-2"></p><span class="Text-Number-2">Arrived</span>
                             </div>
                        </div>  
                        
                    </div>  
                    <div class="Packing-Showing">
                        <div class="Packing-Showing-1">
                            <p class="Your-Packing">Your Order Is Getting Packing</p>
                        </div>
                    </div>
                </div>    
                    
                <div class="Delivery-Home">
                    <div class="Delivery-Home-1">
                        <p class="Delivery-To-Address"><span class="DA"> Delivering To <span class="Address-Delivery"><%= OrderDeleteItem.getAddresstype() %></span> 
                                <span class="Delivery-Address"><%= OrderDeleteItem.getAddresshouse() %></span>
                                Address</span> </p>
                    </div>    
                </div>
                <div class="DriverDetails">
                    <div class="Driver-Details-1">
                        <h1 class="Driver-Details">Driver Details<span class="Dots-Details">:</span></h1>
                        <div class="Driver-Details-flex">
                            
                            <div class="Driver-Name">
                                
                                <div class="Driver_Names">
                                <p class="Vaccinated-Person"> 
                                    <span class="Icon-VA">
                                        <span class="Icon"><i id="syringe-V" class='fas fa-syringe'></i> </span>
                                        <span class="Vaccin">Vaccinated</span>
                                    </span>
                                </p>
                                <p class="Driver-Details-V">    
                                    <span class="Icon-Driver-Name"><i id="Icon-User" class="fa fa-user" aria-hidden="true"></i></span>
                                    <span class="Driver-Name"><%= OrderDeleteItem.getDrivername() %></span>
                                </p>    
                                </div>
                            </div>
                            <div class="Driver-NUmber">
                                
                                <a href="tel:<%= OrderDeleteItem.getDrivernumber() %>" class="Driver_Numbers">
                                    <div class="Icon-Driver-Number"><i  id="Icon-Phone" class="fa fa-phone" aria-hidden="true"></i></div>
                                    <div class="Driver-Phone-Number" ><%= OrderDeleteItem.getDrivernumber() %></div>
                                </a>
                            </div>    
                            
                        </div>
                    </div>        
                </div>    
                
                        
                     <button id="Time-Cancel-Btn" class="Time-Cancel-Btn" >Cancel Order</button>

                    <div id="myModal-timer" class="modal-timer">
                      <div  id="modal-content" class="modal-content-timer">
                        <div class="Modal-Timer-Section">

                            <div class="Cancel-Section-1">
                                <h1 class="Cancel-Order-Section">
                                    Do You Want To Cancel The Order - <span class="Order-Id-No"><%= OrderDeleteItem.getOrderid() %></span>
                                </h1>
                            </div>

                            <div class="Cancel-Section-Timer-2">
                                <div id="Button-Canecl-Time">
                                    <form action="Your_Order_List_delete.jsp" method="post">
                                        <input type="hidden" name="orderId" value="<%= OrderDeleteItem.getOrderid() %>" readonly=""/>
                                        <input type="hidden" name="email" value="<%= OrderDeleteItem.getEmail() %>" readonly=""/>
                                        
                                        <input type="hidden" name="orderstatus" value="order cancelled" readonly=""/>
                                        <button class="Order-Cancel" onclick="cancelCountdown()">Yes</button>
                                    </form>
                                </div>
                                <div class="close">
                                    <button class="Close-Modal">No</button>
                                </div>
                            </div>

                        </div>  
                      </div>

                    </div>    

<script>

var modaltime = document.getElementById("myModal-timer");

var btn = document.getElementById("Time-Cancel-Btn");


var span = document.getElementsByClassName("Close-Modal")[0];

btn.onclick = function() {
  modaltime.style.display = "block";
}

span.onclick = function() {
  modaltime.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modaltime) {
    modaltime.style.display = "none";
  }
}
</script>

        <% }
}

        %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  // Get the elements by their class names
  const addressDelivery = document.querySelector('.Address-Delivery');
  const deliveryAddress = document.querySelector('.Delivery-Address');
  let isTooltipVisible = false;

  // Function to toggle the tooltip visibility
  function toggleTooltip() {
    isTooltipVisible = !isTooltipVisible;
    deliveryAddress.classList.toggle('show-tooltip', isTooltipVisible);
    deliveryAddress.style.display = isTooltipVisible ? 'block' : 'none';
  }

  // Toggle the tooltip on click
  addressDelivery.addEventListener('click', () => {
      deliveryAddress.style.display = 'block';
    toggleTooltip();
    // If the tooltip is open (after toggle), close it after 2 seconds

  });

  // Show the tooltip on hover
  addressDelivery.addEventListener('mouseenter', () => {
    isTooltipVisible = true;
    deliveryAddress.style.display = 'block';
  });

  // Hide the tooltip when the mouse leaves the element
  addressDelivery.addEventListener('mouseleave', () => {
    if (!deliveryAddress.classList.contains('show-tooltip')) {
      deliveryAddress.style.display = 'none';
      isTooltipVisible = false;
    }
  });
</script>


<script>
    // Get the element with the class "Time-RunningNot"
    var timeRunningElement = document.querySelector('.Time-RunningNot');

    // Check the text content of the element
    var trimmedText = timeRunningElement.innerText.trim();
    
    if (trimmedText === "Not Running") {
        // Trigger the form submission
        document.querySelector('.Running-Form').submit();
    }
</script>



<script>
  $(document).ready(function() {
    // Function to check the timers and submit the forms if needed
    function checkTimersAndSubmit() {
      // Get all the div elements with class "given-timer"
      var timerDivs = $(".given-timer");

      // Loop through each div element
      timerDivs.each(function() {
        var timerContent = $(this).text().trim();
        var timerValue = $(this).data("time");

        // Check if the content is "Order Delivered" or if it's a numeric value and equal to zero
        if (timerContent === "Your Order Is Delivered" || (Number(timerValue) === 0 && !isNaN(timerValue))) {
          // Find the corresponding form and submit it
          $(this).next("frm").submit();
        }
      });
    }

    // Check the timers every second (1000 milliseconds)
    setInterval(checkTimersAndSubmit, 3000);
  });
</script>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    var givenTimer = document.querySelector(".given-timer");
    var packingMessage = document.querySelector(".Your-Packing");
    var doubleLine1 = document.querySelector(".double-line-1");
    var doubleLine2 = document.querySelector(".double-line-2");
    var doubleLine3 = document.querySelector(".double-line-3");
    var doubleLine4 = document.querySelector(".double-line-4");
    var Checkcircle1 = document.querySelector(".Check-circle-1");
    var TextNumber1 = document.querySelector(".Text-Number-1");
    var Checkcircle2 = document.querySelector(".Check-circle-2");
    var TextNumber2 = document.querySelector(".Text-Number-2");
    var timeRunningNot = document.querySelector(".Time-Running-Not");
    var initialTime = givenTimer.getAttribute("data-time");
    var totalInitialSeconds = parseTimeToSeconds(initialTime); // Parse the initial time to seconds
    var timerId;

    function updatePackingMessage(timeLeft) {
      var initialMinutes, initialSeconds, totalInitialSeconds;

      [initialMinutes, initialSeconds] = initialTime.split(":");
      totalInitialSeconds = parseInt(initialMinutes) * 60 + parseInt(initialSeconds);

      if (timeLeft <= 0) {
        packingMessage.textContent = "Your Order Is Delivered";
        TextNumber2.style.color = "green";
        Checkcircle2.style.background = "green";
        stopTimer();
        timeRunningNot.textContent = "Not Running";
        localStorage.removeItem("orderEndTime");
        return;
        doubleLine4.style.background = "green";
        doubleLine3.style.background = "green";
        doubleLine2.style.background = "green";
        doubleLine1.style.background = "green";
        TextNumber1.style.color = "green";
        TextNumber2.style.color = "green";
      } else if (timeLeft <= 0.2 * totalInitialSeconds) {
        packingMessage.textContent = "Your Order Will Be Delivered in Few More Minutes";
        doubleLine4.style.background = "green";
      } else if (timeLeft <= 0.35 * totalInitialSeconds) {
        doubleLine3.style.background = "green";
      } else if (timeLeft <= 0.5 * totalInitialSeconds) {
        packingMessage.textContent = "Your Order Is On The Way";
        TextNumber1.style.color = "green";
        Checkcircle1.style.background = "green";
        doubleLine1.style.background = "green";
      } else if (timeLeft <= 0.65 * totalInitialSeconds) {
        doubleLine2.style.background = "green";
      } else if (timeLeft <= 0.8 * totalInitialSeconds) {
        packingMessage.textContent = "Your Order Is Packed";
        doubleLine1.style.background = "green";
      } else {
        packingMessage.textContent = "Your Order Is Getting Packing";
      }
    }

    function updateTimer(endTime) {
      var currentTime = Date.now();
      var remainingMilliseconds = Math.max(0, endTime - currentTime);
      var totalSeconds = Math.floor(remainingMilliseconds / 1000);

      updatePackingMessage(totalSeconds);

      if (totalSeconds <= 0) {
        stopTimer();
        givenTimer.textContent = "Your Order Is Delivered";
        timeRunningNot.textContent = "Not Running";
        localStorage.removeItem("orderEndTime");
        return;
      }

      var minutesLeft = Math.floor(totalSeconds / 60);
      var secondsLeft = totalSeconds % 60;
      var formattedTime = minutesLeft.toString().padStart(2, "0") + ":" + secondsLeft.toString().padStart(2, "0") + " min";

      givenTimer.textContent = formattedTime;
      timeRunningNot.textContent = "Running";

      // Update the message when there is only 1 second left (e.g., from "00:01" to "00:00")
      if (totalSeconds === 0) {
        updatePackingMessage(1);
      }

      timerId = setTimeout(function () {
        updateTimer(endTime);
      }, 1000);
    }

    function stopTimer() {
      clearTimeout(timerId);
    }

    var savedEndTime = localStorage.getItem("orderEndTime");
    if (savedEndTime) {
      var endTime = parseInt(savedEndTime);
      //console.log("Saved end time from localStorage:", endTime);
      updateTimer(endTime);
    } else {
      var endTime = Date.now() + totalInitialSeconds * 1000;
      //console.log("Calculated end time:", endTime);
      updateTimer(endTime);
      localStorage.setItem("orderEndTime", endTime);
    }

    function parseTimeToSeconds(timeString) {
      var minutes, seconds;
      [minutes, seconds] = timeString.split(":");
      return parseInt(minutes) * 60 + parseInt(seconds);
    }
  });
</script>
      


        
<%
    // Get the order ID and email from the request parameters
    String orderId = request.getParameter("orderId");
   // String email = request.getParameter("email");

    // Create an instance of the OrderdeleteDAO
    OrderdeleteDAO dao = new OrderdeleteDAO("jdbc:mysql://localhost:3306/signup", "root", "root");

    // Delete the order item
    boolean deletionSuccess = dao.deleteOrderItem(orderId, email);

    if (deletionSuccess) {
        //out.println("Item deleted successfully.");
        response.sendRedirect("Your_Order_List.jsp");
    } else {
       // out.println("Failed to delete item.");
    }
%>


                      </div>
                  </div>
              </div>
          </div>
      






    <%
//    String email = (String) session.getAttribute("email");

    OrderDAO orderDAO = new OrderDAO("jdbc:mysql://localhost:3306/signup", "root", "root");
    List<Orderitem> orderList = orderDAO.getOrdersByEmail(email);

    if (orderList != null && !orderList.isEmpty()) {
%>
<style>
    div.Name-Item_List{
        width: 100%;
        margin: auto;
        margin-bottom: 15px;
    }
    h1.Your-Items{
        color: #204F7A;
        font-family: 'Lato', sans-serif;
        font-weight: 700;
        font-style: italic;
        text-align: center;
    }
    div.List-Items-Deliver{
        width: 100%;
        margin: auto;
    }
    div.List-Items_Deliver-1{
        width: 60%;
        margin: auto;
    }
    div.List-Items_Deliver-2{
        background-color: #fff;
        box-shadow: 0 0 8px 0 #ccc;
        border: 1px solid #d4d5d9;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 20px;
    }    
    div.Div-Flex-Items{
        display: flex;
        justify-content: space-between; 
        align-items: center;
    }
    .Div-Items-Flex-1,
    .Div-Items-Flex-2 {
      flex: 0 0 auto; /* To keep the width of the first and second items fixed */
     }
    .Div-Items-Flex-3 {
       margin-left: auto; /* To push the third item to the right */
     }
     div.Div-Items-Flex-1{
         width: 25%;
     }
     img.Img-Order-Type{
         width: 100%;
     }
     h3.Div-Flex-Name{
         color: #204F7A;
         font-size: 20px;
         font-style: italic;
         font-family: 'Lato';
         padding-bottom: 5px;
     }
     h4.Div-Felx-Location{
         color: #2c82c9;
         font-size: 18px;
         font-family: math;
         padding-bottom: 2px;
     }
     #Fa-Cricle-Check{
         color: green;
         padding-left: 5px;
         font-size: 20px;
     }
     div.Div-Items-Details{
         padding-left: 10px;
         padding-right: 10px;
     }
     h4.Class-Delivered{
         color: #004879;
         font-family:'Lato';
     }
     p.Div-Order-Details{
         color: #204F7A;
         font-size: 18px;
         font-family: serif;
         padding-bottom: 5px;
     }
     span.Order_details-No{
         color: #3498db;
         font-family: system-ui;
     }
     p.More-Details{
         background-color: #2c82c9;
     }
     button.More-Details_BTN{
        margin-top: 5px;
        display: inline-block;
        padding: 6px 10px;
        padding-top: 8px;
        border-radius: 5px;
        font-size: 18px;
        background-color: #fff;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        z-index: 1;
        cursor: pointer;
        border: 1px solid #204F7A;  
        color: #204F7A;
     }
     button.More-Details_BTN:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #fff;
        border-radius: 5px;
        z-index: -2;
      }
    button.More-Details_BTN:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0%;
      height: 100%;
      background-color: #204F7A;
      color: #204F7A;
      transition: all 0.3s;
      border-radius: 5px;
      z-index: -1;
       left: 0; 
       right: auto; 
      transform-origin: left;
    }
    button.More-Details_BTN:hover:before {
      width: 100%;
      color: #fff;
      left: auto; 
     right: 0; 
     transform-origin: right;
    }
    button.More-Details_BTN:hover{
        color: #fff;
        border: 1px solid #fff;
        box-shadow: 0 0 8px 0 #2c82c9; 
    }
    .ItemsDetails {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
</style>
        <div class="Name-Item_List">
            <div class="Name-Item-List-1">
                <h1 class="Your-Items">
                    Your Order Lists
                </h1>
            </div>
        </div>
        
        
        <% for (Orderitem orderItem : orderList) { %>
        
        
        <div class="List-Items-Deliver">
            <div class="List-Items_Deliver-1">
                <div class="List-Items_Deliver-2">
                    
                    <div class="Div-Flex-Items">
                        <div class="Div-Items-Flex-1">
                            <div class="Img-Flex-Tru">
                                <div class="Img-Flex-Tru-1">
                                    <img  class="Img-Order-Type"  src="images/Tru-Yum-Order.png" >
                                </div>
                            </div>
                        </div>
                        <div class="Div-Items-Flex-2">
                            <div class="Div-Items-Flex-2-1">
                                <div class="Div-Items-Flex-2-2">
                                    <div class="Div-Hotal-Name">
                                        <h3 class="Div-Flex-Name">TruYum</h3>
                                    </div>
                                    
                                    <div class="Village-Name">
                                      <h4 class="Div-Felx-Location">Village Name</h4>  
                                    </div>
                                    
                                    <div class="Order-Details">
                                      <p class="Div-Order-Details"> <span class="Order_details-No"> Order No: </span> <%= orderItem.getOrderid() %> | <%= orderItem.getDate() %>, <%= orderItem.getClock() %> </p>  
                                    </div>
                                     
                                    <div class="Button-Details">
                                        <style>
                                            .ItemReview{
                                                display: none;
                                                position: fixed;
                                                top: 0%;
                                                left: 0;
                                                right: 0;
                                                overflow: auto;
                                                width: 50%;
                                                height: 100%;
                                                background-color: rgb(0,0,0); 
                                                background-color: rgba(0,0,0,0.4); 
                                                z-index: 999999;
                                            }
                                            div.Item-Review-1{
                                                width: 80%;
                                                height: auto;
                                                margin: auto;
                                                background-color: #fff;
                                                margin-top:20%;
                                                border-radius: 5px;
                                                padding: 10px 15px;
                                            }
                                            button.Back-BTN{
                                                background-color:transparent;
                                                outline: none;
                                                border: 2px solid #2c82c9;
                                                padding: 3px 6px;
                                                padding-top: 4px;
                                                border-radius: 3px;
                                                color: #004879;
                                                cursor: pointer;  
                                                float: right;
                                            }
                                            #Fa-Times{
                                                font-size: 20px;
                                            }
                                            button.Back-BTN:hover{
                                                box-shadow: 1px 2px 1px #2c82c9; 
                                            }
                                            div.Id-Order{
                                                width: 100%;
                                                height: 100%;
                                                margin: auto;
                                            }
                                            div.Id-Order-1{
                                                width: 100%;
                                                height: 100%;
                                                padding: 10px 15px;
                                            }
                                            
                                            div.Order-ID{
                                                padding-bottom: 5px;
                                            }
                                            h3.Order-ID-N{
                                                color: #004879;
                                                font-size: 21px;
                                            }
                                            #Fa-Fa-Map{
                                                color: #2c82c9;
                                                font-size: 21px;
                                            }
                                            span.Location{
                                                color: #004879;
                                                font-size: 21px;
                                            }
                                            p.v-location-1{
                                                border-left: 2px dotted gray;
                                                height: 50px;
                                                margin-left: 8px;
                                                } 
                                            span.Delivery-Location-1{
                                               color: #004879;
                                                font-size: 18px;
                                                margin-left: 5px;
                                            }
                                            hr.Delivery-Line{
                                                border-top:1px solid #8080804f;
                                                margin-top: 5px;
                                            }
                                            div.Delivery-Date-1{
                                                margin-top: 5px;
                                                margin-bottom: 5px;
                                            }
                                            div.Items-Details-Order-1{
                                                padding-top: 10px;
                                            }
                                            p.Items-Details{
                                                color: #204F7A;
                                                font-size: 18px; 
                                            }
                                            hr.Delivery-Line-1{
                                                 border-top:2px dotted #8080804f;
                                                margin-top: 5px;
                                            }
                                            div.Right-Side{
                                                padding-top: 7px;
                                                padding-right: 10px;
                                                text-align: right;
                                            }
                                            div.Right-Side-2{
                                                float: left;
                                            }
                                            #Sub-Total-TEXT{
                                               color: #204F7A;
                                                font-size: 18px;
                                                padding-bottom: 3px;
                                            }
                                            div.Payment-modal{
                                                padding-top: 10px;
                                                padding-bottom: 10px;
                                            }
                                            div.Payment-modal-1{
                                                display: grid;
                                                grid-template-columns: auto auto;
                                            }
                                            p.Payment-Mode{
                                                color: #204F7A;
                                                font-size: 18px;
                                                
                                            }
                                            div.Total-payment{
                                                text-align: right;
                                                padding-right: 15px;
                                            }
                                             p.Total-Amount{
                                                color: #204F7A;
                                                font-size: 18px;  
                                            }
                                        </style>
                                       
                                         <button class="More-Details_BTN">View Details</button>
                                         
                                         
                                         <div class="ItemReview">
                                             <div class="Item-Review-1">
                                                 <div class="Item-Review-2">
                                                     
                                                     <div class="Back-Btn">
                                                         <button class="Back-BTN">
                                                            <i class="fa fa-times"   id="Fa-Times" aria-hidden="true"></i>
                                                         </button>
                                                     </div>
                                                    
                                                     <div class="Id-Order">
                                                         <div class="Id-Order-1">
                                                             <div class="Id-Order-2">
                                                                 
                                                                <div class="Order-ID">
                                                                    <h3 class="Order-ID-N">
                                                                        Order Id: <%= orderItem.getOrderid() %>
                                                                    </h3>
                                                                </div>
                                                                
                                                                <div class="Location-Share">
                                                                    <div class="Location-Share-1">
                                                                        <div class="Location-Share-1-1">
                                                                         <i  id="Fa-Fa-Map" class="fa fa-map-marker" aria-hidden="true"></i>
                                                                         <span class="Location">TrmYum</span>
                                                                        </div>
                                                                        <div class="Line-Location-1-2">
                                                                           <p class="v-location-1"></p>
                                                                        </div>
                                                                        <div class="Delivery-Location">
                                                                            <i  id="Fa-Fa-Map" class="fa fa-map-marker" aria-hidden="true"></i>
                                                                         <span class="Delivery-Location-1"><%= orderItem.getAddresshouse() %></span>
                                                                        </div>
                                                                        <div class="Hr-Line-Delivery">
                                                                            <hr class="Delivery-Line"/>
                                                                        </div>
                                                                        <div class="Delivery-Date">
                                                                            <div class="Delivery-Date-1">
                                                                                 <h4 class="Class-Delivered">Delivered on <%= orderItem.getDate() %> <span class="Cricle-Tick_Mark"><i id='Fa-Cricle-Check' class="fa fa-check-circle" aria-hidden="true"></i></span> </h4>
                                                                                 <hr class="Delivery-Line"/>
                                                                            </div>
                                                                        </div>
                                                                            <div class="Items-Details-Order">
                                                                                <div class="Items-Details-Order-1">
                                                                                    <p class="Items-Details">
                                                                                        <%= orderItem.getItemlist() %>
                                                                                    </p>
                                                                                     <hr class="Delivery-Line-1"/>
                                                                                </div>
                                                                            </div>  
                                                                                    <div class="Right-Side">
                                                                                        <div class="Right-side-2">
                                                                                            <p  id="Sub-Total-TEXT" class="Sub-Total">Sub-Total : <i class="fa fa-rupee-sign"></i> <%= orderItem.getSubtotal() %></p>
                                                                                            <p id="Sub-Total-TEXT" class="Coupon">Coupon Applied (<%= orderItem.getCoupons() %>)</p>
                                                                                            <p id="Sub-Total-TEXT" class="Delivery-fee">Delivery partner fee : <i class="fa fa-rupee-sign"></i>25</p>
                                                                                        </div>
                                                                                             <hr class="Delivery-Line-1"/>
                                                                                    </div>
                                                                                    <div class="Payment-modal">
                                                                                        <div class="Payment-modal-1">
                                                                                            <div class="Payment">
                                                                                                <p class="Payment-Mode" >Payment Mode: <%= orderItem.getPayment() %></p>
                                                                                            </div>
                                                                                            <div class="Total-payment">
                                                                                                <p class="Total-Amount">Total: <%= orderItem.getGrandtotalamount() %></p>
                                                                                            </div>
                                                                                        </div>        
                                                                                    </div>        
                                                                                           
                                                                    </div>    
                                                                </div>     
                                                                 
                                                             </div>
                                                         </div>
                                                     </div>
                                                     
                                                     
                                                      
                                                     
           
             
             
                                                     
                                                     
                                                 </div>
                                             </div>
                                             
                                         </div>
                                         
                                         
                                          
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="Div-Items-Flex-3">
                            <div class="Div-Items-Details">
                                <h4 class="Class-Delivered">Delivered on <%= orderItem.getDate() %> <span class="Cricle-Tick_Mark"><i id='Fa-Cricle-Check' class="fa fa-check-circle" aria-hidden="true"></i></span> </h4>
                            </div>
                        </div>
                    </div>

                            
                    
                </div>
            </div>
                            
                             
                                             
                            
        </div>
        
        
        
        <%= orderItem.getOrderstatus() %>
       
        
        
          <!--  <p>Email: <%= orderItem.getEmail() %></p>
            <p>Order ID: <%= orderItem.getOrderid() %></p>
            <p>Itemlist: <%= orderItem.getItemlist() %></p>
            <p>Coupons: <%= orderItem.getCoupons() %></p>
            <p>Order Address: <%= orderItem.getOrderaddress() %></p>
            <p>Grand Total Amount: <%= orderItem.getGrandtotalamount() %></p>
            <p>Payment: <%= orderItem.getPayment() %></p>
            <p>Random Time: <%= orderItem.getRandomtime() %></p>
            <p>Date: <%= orderItem.getDate() %></p>
            <p>Clock: <%= orderItem.getClock() %></p>
            <p>order status <%= orderItem.getOrderstatus() %></p>
            <p>Item Details: <%= orderItem.getNameitems() %></p>
            <p>Address House <%= orderItem.getAddresshouse() %></p>
            <p>Address type <%= orderItem.getAddresstype() %></p>
            <%= orderItem.getDrivername() %>
                            <%= orderItem.getDrivernumber() %>
                             <%= orderItem.getSubtotal() %> -->
                             
            
           
            
        <% } %>
<%
    } else {
        // Handle case when no orders are found
    }
%>

     <script>
                                                var acc = document.getElementsByClassName("More-Details_BTN");
                                                 var i;
                                                for (var i = 0; i < acc.length; i++) {
                                                  acc[i].addEventListener("click", function() {
                                                    this.classList.toggle("active");
                                                    var ItemReview = this.nextElementSibling;


                                                    if (ItemReview.style.display === "block") {
                                                      ItemReview.style.display = "none";

                                                    } else {
                                                      ItemReview.style.display = "block";

                                                    }
                                                  });
                                                }
                                              </script>     
<script>
            $(document).ready(function(){
              $(".Back-BTN").click(function(){
                $(".ItemReview").hide(1000);
              });
            });
            </script>
                  
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
    

<!--<script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>-->



