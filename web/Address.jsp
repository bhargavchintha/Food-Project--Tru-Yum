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
    <link rel="stylesheet" type="text/css" href="./Addres.css">

    </head>
<%@page import="java.lang.String"%>
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
       // String username = (String) session.getAttribute("username");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        int pin = (int) session.getAttribute("pin");
        String phone = (String) session.getAttribute("phone");
         String FirstLetterCapitalized = name.substring(0, 1).toUpperCase();

    // You can now use the firstLetterCapitalized variable to display the first letter in capital
   // out.println("<p>Name: " + FirstLetterCapitalized + "</p>");
    
     String FullName = name.substring(0, 1).toUpperCase() + name.substring(1);

    // You can now use the fullNameCapitalized variable to display the full name with the first letter capitalized
   // out.println("<p>Name: " + FullName + "</p>");
       // out.println("<h1>My Cart</h1>");
        
        //out.println("<p>Name: " + name + "</p>");
       // out.println("<p>PIN: " + email + "</p>");
        
    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>
<!-- display the name and pin on the JSP page using EL -->

             <%@ page import="java.sql.*" %>
<%
String cnname = request.getParameter("cnname");
String houseno = request.getParameter("houseno");
String buildingname = request.getParameter("buildingname");
String villagetown = request.getParameter("villagetown");
String city = request.getParameter("city");
String state = request.getParameter("state");
String pincode = request.getParameter("pincode");
String phoneno = request.getParameter("phoneno");
String addresslabel = request.getParameter("addresslabel");

if (request.getParameter("address") != null) {
    if (cnname == null || addresslabel == null || cnname.isEmpty() || addresslabel.isEmpty()) {
        %>
        <div id="popupMessage" class="popup-message">
            Error: Missing or null values. Data not saved.
        </div>
        <%
    } else if (state == null || state.isEmpty()) {
        %>
        <div id="popupMessage" class="popup-message">
            Error: State value is missing. Data not saved.
        </div>
        <%
    }  else {
        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

            // Prepare the SQL statement to check if the entry already exists
            PreparedStatement checkStatement = conn.prepareStatement("SELECT * FROM address WHERE cnname = ? AND addresslabel = ?");
            checkStatement.setString(1, cnname);
            checkStatement.setString(2, addresslabel);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                // Entry already exists
                %>
                <div id="popupMessage" class="popup-message">
                    Entry already exists for this Address name and address label!
                </div>
                <%
            } else {
                // Prepare the SQL statement to insert the new entry
                PreparedStatement insertStatement = conn.prepareStatement("INSERT INTO address (cnname, email, houseno, buildingname, villagetown, city, state, pincode, phoneno, addresslabel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                insertStatement.setString(1, cnname);
                insertStatement.setString(2, email);
                insertStatement.setString(3, houseno);
                insertStatement.setString(4, buildingname);
                insertStatement.setString(5, villagetown);
                insertStatement.setString(6, city);
                insertStatement.setString(7, state);
                insertStatement.setString(8, pincode);
                insertStatement.setString(9, phoneno);
                insertStatement.setString(10, addresslabel);

                // Execute the query
                int rowsInserted = insertStatement.executeUpdate();

                if (rowsInserted > 0) {
                        %>
                        <div id="popupMessage" class="popup-message">
                            Data inserted successfully!
                        </div>
                        <%
                    } else if (rowsInserted == 0) {
                        %>
                        <div id="popupMessage" class="popup-message">
                            Failed to insert data!
                        </div>
                        <%
                    } else {
                        %>
                        <div id="popupMessage" class="popup-message">
                            Error occurred while inserting data!
                        </div>
                        <%
                    }

                insertStatement.close();
            }

            resultSet.close();
            checkStatement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
} else {
    %>
   <!--<div id="popupMessage" class="popup-message">
        Failed to insert data!
    </div>-->
    <%
}

//out.println("Email: " + email);
//out.println("Name: " + cnname);
//out.println("House No: " + houseno);
//out.println("Building Name: " + buildingname);
//out.println("Village/Town: " + villagetown);
//out.println("City: " + city);
//out.println("State: " + state);
//out.println("Country: " + country);
//out.println("Address Label: " + addresslabel);
%>



  <%
//    String cnname = request.getParameter("cnname");
//    String email = request.getParameter("email");
//    String houseno = request.getParameter("houseNo");
//    String buildingname = request.getParameter("buildingName");
//    String villagetown = request.getParameter("villageTown");
//    String city = request.getParameter("city");
//    String state = request.getParameter("state");
//    String country = request.getParameter("country");
    
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

        // Prepare the SQL statement to update the existing entry
        PreparedStatement updateStatement = conn.prepareStatement("UPDATE address SET houseno = ?, buildingname = ?, villagetown = ?, city = ?, state = ?, pincode = ?, phoneno = ?, addresslabel = ?    WHERE cnname = ? AND email = ?");
        updateStatement.setString(1, houseno);
        updateStatement.setString(2, buildingname);
        updateStatement.setString(3, villagetown);
        updateStatement.setString(4, city);
        updateStatement.setString(5, state);
        updateStatement.setString(6, pincode);
        updateStatement.setString(7, phoneno);
        updateStatement.setString(8, addresslabel);
        updateStatement.setString(9, cnname);
        updateStatement.setString(10, email);

        // Execute the update query
        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
                    %>
                    <div id="popupMessage" class="popup-message">
                        Data updated successfully!
                    </div>
                    <%
                } else if (rowsUpdated == 0) {
                    %>
                    <div id="popupMessage" class="popup-message">
                        Failed to update data!
                    </div>
                    <%
                } else {
                    %>
                    <div id="popupMessage" class="popup-message">
                        Error occurred while updating data!
                    </div>
                    <%
                }

        updateStatement.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
   
%>
<style>
    .popup-message {
        position: fixed;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #f8f8f8;
        padding: 10px 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s, opacity 0.3s;
        z-index: 99999;
    }

    .popup-message.show {
        visibility: visible;
        opacity: 1;
        transition: all 0.3s;
    }
</style>
<script>
    var popupMessage = document.getElementById("popupMessage");
        popupMessage.classList.add("show");
            setTimeout(function() {
        popupMessage.classList.remove("show");
            }, 2000);
        </script>

    <body>
        <div class="nav">      
        <input type="checkbox" id="nav-check" />
        <div class="nav-header">
          <div class="nav-title">
              <a class="tum-tum" href="Home.jsp">
                  <div class="Grid-tittle">
                      <div class="tittle-img">
                          <img src="images/Tru_yum-Transparent.png" width="40px"  alt="TruYum" title="TruYum" />
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
     
    </style>
      <div class="Ma">
         
      </div>
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
            <div class="Address-show-2">
                <p class="Address-p"> <%= addressDetails.getCnName() %>  <span class="Inside-P"><%= addressDetails.getAddressLabel() %></span>  </p>
                <p class="Span-inside" > <span class="Address-span"><%= addressDetails.getHouseNo() %></span>,<span class="Address-span"><%= addressDetails.getBuildingName() %></span>,
                <span class="Address-span"><%= addressDetails.getBuildingName() %></span>,
                <span class="Address-span"><%= addressDetails.getVillageTown() %></span>,
                <span class="Address-span"><%= addressDetails.getCity() %></span>,
                <span class="Address-span"><%= addressDetails.getPincode() %></span>,
                <span class="Address-span"><%= addressDetails.getState() %></span>.
                <br><span class="Address-span"><%= addressDetails.getPhoneNo() %></span>
                </p>
                <form action="Address.jsp" method="POST">
                    <input type="hidden" name="email" value="<%= addressDetails.getEmail() %>">
                    <input type="hidden" name="adname" value="<%= addressDetails.getCnName() %>">
                    <input type="hidden" name="address" value="<%= addressDetails.getAddressLabel() %>">
                    <button class="BTN" onclick="return confirm('Are you sure you want to delete this address?');" >Remove</button>
                </form>
            </div>
                    
              <button  class="accordion">Edit</button>


<div class="panel">
    
    <div class="Update-panel-1">
        <div class="Update-panel-2">
            <form class="MYFORM-value" action="Address.jsp" method="POST">
      <div class="form-group">
        <p class="house" >Address name</p>
        <input type="text" name="cnname"  value="<%= addressDetails.getCnName() %>" required="Only for Read" placeholder="Your Of Address name" readonly tittle="Only For Read" />
      </div>
      
      <div class="form-group">
          <p class="house" >House-No & Floor</p>
          <input type="text" id="houseNo" name="houseno" value="<%= addressDetails.getHouseNo() %>"/>
      </div>
      
      <div class="form-group">
           <p class="house" >Building & Block No</p>
          <input type="text" id="buildingName" name="buildingname" value="<%= addressDetails.getBuildingName() %>"/>
      </div>
      
      <div class="form-group">
           <p class="house" >Village/Town</p>
           <input type="text" id="villageTown" name="villagetown" value="<%= addressDetails.getVillageTown() %>"/>
      </div>
     
      <div class="form-group">
          <p class="house" >City</p>
          <input type="text" id="city" name="city" value="<%= addressDetails.getCity() %>"/>
      </div>
      
      <div class="form-group">
     <p class="house" >Pincode</p>
   <input type="text" id="country" name="country" pattern="[0-9]+" minlength="6" maxlength="6" value="<%= addressDetails.getPincode() %>" />
    </div>
    <div class="form-group">
     <p class="house" >Phone Number</p>
   <input type="text" id="phone" name="phoneno" pattern="[0-9]+" minlength="10" maxlength="10" value="<%= addressDetails.getPhoneNo() %>" />
    </div>
    <div class="form-group">
          <p class="house" >State</p>
         <input type="text" id="state" name="state" value="<%= addressDetails.getState() %> "readonly />
    </div>
    
    <div class="form-group">
     <p class="house" >Address Address</p>
     <input type="text"  name="addresslabel" value="<%= addressDetails.getAddressLabel() %>"  />
    </div>
    <button class="Update-Cancel" class="accordion">Cancel</button>
    <input type="hidden" name="cnname" value="<%= addressDetails.getCnName() %>">
    <input type="hidden" name="email" value="<%= addressDetails.getEmail() %>">
    
    <button class="Update-Cancel" type="submit">Update Address</button>
</form>
        </div>
    </div>
</div>      
            
        </div>
    </div>
    
    



<%
  
    }

%>

<script>
   var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");

    /* Toggle between hiding and showing the active panel */
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>



<%
} else if (email != null && !email.isEmpty()) {
 %>
 
<%
// No address details found for the user
}
%>


<%
//String email = request.getParameter("email");
String adname = request.getParameter("adname");
String address = request.getParameter("address");

deleteAddress myAddressInstance = new deleteAddress();
boolean deleted = myAddressInstance.deleteAddress(email, adname, address);

if (deleted) {
    %>
    <div id="popupMessage" class="popup-message">
         Remove Address successful
    </div>
    <%
        response.sendRedirect("Address.jsp");
} else {
%>
    <div id="popupMessage" class="popup-message">
        Remove Address Failed
    </div>
    <%
    //response.sendRedirect("erroraddress.jsp");
    // Failed to delete the address
    // response.sendRedirect("error.jsp"); // Redirect to an error page or handle the failure in an appropriate way
}
%>

  <div class="Address-form">
        <div class="Address-form-1">
            <div class="Address-form-2">
                <button id="openModalBtn">Add New Address</button>
  
 
  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close-btn">&times;</span>
      <h5 class="Do-same">Here Address Name and Address Label not be same for every address, if same it will remove Both.</h5>
      <form class="myForm" action="Address.jsp" method="post"  >
          
          <div class="form-group">
             <p class="house" >Address name</p>
             <input type="text" name="cnname" required placeholder="Your Of Address name" value="<%= FullName%>" />
          </div>
   
          <div class="form-group">
    <p class="house" for="house">House-No. & Floor</p>
    <input type="text" id="house" name="houseno" required placeholder="House-No. & Floor" />
  </div>
  <div class="form-group">
    <p class="house" for="housename">Building & Block No</p>
    <input type="text" id="housename" name="buildingname" required="" placeholder="Building & Block No" />
  </div>
  <div class="form-group">
    <p class="house" for="villagename">Village/Town</p>
    <input type="text" id="villagename" name="villagetown" required  placeholder="Village/Town" >
  </div>
  <div class="form-group">
    <p class="house" for="towncity">City</p>
    <input type="text" id="towncity" name="city" required placeholder="City"  />
  </div>
    <div class="form-group">
    <p class="house" for="pincode">Pin Code</p>
    <input type="text" id="PinCode" name="pincode"  required placeholder="Pin Code"  pattern="[0-9]+" minlength="6" maxlength="6" />
  </div>
   <div class="form-group">
    <p class="house" for="phone">Phone No</p>
    <input type="text" id="phone" name="phoneno"  required placeholder="Phone Number"  pattern="[0-9]+" minlength="10" maxlength="10" value="<%= phone%>" />
  </div>
  <div class="form-group">
    <p class="house" for="state">State</p>
    <select name="state" id="stateSelect" required>
      <option disabled selected>Select State</option>
      <option value="Andhra Pradesh">Andhra Pradesh</option>
    </select>
  </div>
  
   <div class="form-group">
     <p class="house" for="towncity">Add Address Label</p>
     <div class="H-W-O">
    <input id="H-W-O" class="Home" type="button" value="Home" onclick="setInputValue('Home')" required >
    <input id="H-W-O" class="Work" type="button" value="Work" onclick="setInputValue('Work')">
    <input id="H-W-O" class="others" type="button" value="Others" onclick="toggleInputVisibility()">
     </div>
     <input type="text"  id="myInput" name="addresslabel" style="display: none;" value=""  >
<script>
var isInputVisible = false;
var isOthersClicked = false;

function setInputValue(value) {
  if (!isOthersClicked && isInputVisible) {
    closeInput();
  }
  document.getElementById('myInput').value = value;
  isOthersClicked = false;
}

function toggleInputVisibility() {
  var inputField = document.getElementById('myInput');
  if (inputField.style.display === 'none') {
    inputField.style.display = 'inline-block';
    isInputVisible = true;
    isOthersClicked = true;
  } else {
    closeInput();
  }
}

function closeInput() {
  var inputField = document.getElementById('myInput');
  inputField.style.display = 'none';
  inputField.value = '';
  isInputVisible = false;
}

    </script>
  </div>
  <input type="hidden" name="address" value="true">
   <input type="submit" value="Submit">
     </form>
<%@ page import="java.sql.*" %>


   </div>
  </div>
            </div>
        </div>
    </div>
  
  
  <!-- Button to open the modal -->
  

  <script>
   // Get the modal element
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("openModalBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close-btn")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "block";
  }
};

// Handle form submission
var form = document.getElementById("myForm");
form.addEventListener("submit", function(event) {
  event.preventDefault();
  // Process form submission logic here

  // Close the modal
  modal.style.display = "none";
});

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
                              <a href="Home.jsp"><img class="TRU-YUM-img" src="images/Tru_yum-Transparent.png"  alt="TruYum" title="TruYum" ></a>
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
    

