<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
    

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
String name = null;
int pin = 0;
String phone = null;
try {
    // Establish a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

    // Prepare a SQL statement to retrieve the user's name, password, and pin based on their email address
    String sql = "SELECT name, password, pin,phone FROM signu WHERE email = ?";
    PreparedStatement ps = c1.prepareStatement(sql);
    ps.setString(1, email);

    // Execute the SQL statement and retrieve the result
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // If the query returned a result, get the user's name, password, and pin
        name = rs.getString("name");
        pin = rs.getInt("pin");
        phone = rs.getString("phone");
        String dbPassword = rs.getString("password");

        if (password.equals(dbPassword)) {
            // If the passwords match, create a session and store the user details
            HttpSession sessions = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("name", name);
            session.setAttribute("pin", pin);
            session.setAttribute("phone", phone);
            session.setAttribute("password", password);
            response.sendRedirect("Home.jsp");
        } else {
            // If the passwords do not match, display an error message
            response.sendRedirect("index.html?message=Email or Password are Wrong");
            return;
        }
    } else {
        // If the query did not return a result, display an error message
        response.sendRedirect("index.html?message=Email or Password are Wrong");
        return;
    }

    // Close the database objects
    rs.close();
    ps.close();
    c1.close();
} catch (Exception e) {
    // Handle any exceptions
    e.printStackTrace();
    return;
}
%>

     
     
    <!DOCTYPE html>


<html>
    <head>
        <title>TruYum Restaurant | All Food Items</title>
        <link rel="icon" href='https://www.visitstaugustine.com/sites/default/files/styles/cover/public/No_name_front_5x3.jpg?itok=T_w4Aehh.96x96.png' />
    <!--this is fontawesome pro icon script start here-->  <link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        *{
            margin: 0%;
            padding: 0%;
            box-sizing: border-box;
            
        }
       .nav {
  height: 70px;
  width: 100%;
  background-color: #394488;
  position: relative;
  padding-top: 13px;
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
    font-size: 22px;
    margin-left: 50px;
    transition: all 0.9s ease;
    text-decoration: none;
}
@media screen and (max-width:600px) {
  div.nav-title a.tum-tum{
    margin-left: 50px;
  }
}
.nav > .nav-links {
  display: inline;
  float: right;
  font-size: 20px;
  margin-right: 100px;
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
    z-index: 9999;
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
    width: 50%;
    height: 50%;
    background-color: #333;

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




/* drop down list*/
.fa-cog {
  background-color: transparent;
  color: white;
  padding: 5px;
  font-size: 20px;
  border: none;
  cursor: pointer;
  z-index: 999;
   transition:1s;
     
}
.fa-cog:hover{
    -o-transform:rotate(70deg);
   -ms-transform:rotate(70deg);
   -moz-transform:rotate(70deg);
   -webkit-transform:rotate(70deg);
   transform:rotate(70deg);
}

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
        top: -20.3%;
        left: 64.5%;
        position: absolute;
        z-index: 999;
         margin-left: -5px;
        border-width: 25px;
        border-style: solid;
       border-color: transparent transparent #f1f1f1 transparent;
    }
    
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
/* end here */
div.welcome{
 width: 100%;
 margin: auto;
 padding: 12px 16px;
}
p.Welcomeback{
  padding-bottom: 15px;  
}
    </style>
    </head>
    <body>
        <div class="nav">
          
            
        <input type="checkbox" id="nav-check">
        <div class="nav-header">
          <div class="nav-title">
            <a class="tum-tum" href="#">TruYum
                <i id="Knife" class="fad fa-utensils-alt"></i>
            </a>
          </div>
        </div>
        <div class="nav-btn">
          <label for="nav-check">
            <i id="fa-bars" class="fa fa-bars" aria-hidden="true"></i>
          </label>
        </div>
        
        <div class="nav-links">
          <a class="active" href="Home.jsp" >Home</a>
          <a href="menu.html" >Menu</a>
          <a href="coffee.html">Coffee & Tea</a>
          <a href="photo.jsp">Photos</a>
          <a href="myCart.jsp">My Cart</a>
          <a href="">My Orders</a>
          
            <div class="dropdown">
                <i onclick="myFunction()" class="fa fa-cog"></i>
  <div id="myDropdown" class="dropdown-content">
      <div class="welcome">
      <p class="Welcomeback">Welcome,&nbsp; <%= name %> </p>
      <p class="enterpin" >Your PIN: <%= pin %> </p>
      <p class="enterpin" >Your PIN: <%= phone %> </p>
        <p class="enterpin" >Your PIN: <%= password %> </p>         
          <a href="passwordchange.jsp">change password</a>
          <a href="About.html">About</a>
          <a href="logout.jsp">Logout</a>
      </div>
   
   
  </div>
</div>

 
          
        </div>
        
      </div>
        <script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.fa-cog')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>



    </body>
</html>
