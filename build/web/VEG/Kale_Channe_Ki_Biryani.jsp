<%-- 
    Document   : Kale_Channe_Ki_Biryani
    Created on : May 27, 2023, 10:16:38 AM
    Author     : Bhargav
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%-- 
    Document   : Order
    Created on : May 20, 2023, 7:01:24 PM
    Author     : Bhargav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
       // out.println("<p>Name: " + name + "</p>");
       // out.println("<p>PIN: " + pin + "</p>");
    %>
<%@page import="java.sql.*"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.Random" %>



<!-- display the name and pin on the JSP page using EL -->



<%@page import="java.util.List"%>
<%@page import="order.orderDetails"%>
<%@ page import="order.Order" %>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart Details</title>
</head>
<body>
   
   <%
    String email = (String) session.getAttribute("email");

    Order orderInstance = new Order();
    List<orderDetails> orderList = orderInstance.getOrderDetailsByEmail(email);

    if (orderList != null && !orderList.isEmpty()) {
        // Display the order details
%>
        <h2>User Details</h2>
        <% for (orderDetails orderDetails : orderList) { %>
            <p>Email: <%= orderDetails.getEmail() %></p>
            <p>Item ID: <%= orderDetails.getItemId() %></p>
            <p>Item Name: <%= orderDetails.getItemName() %></p>
            <p>Item Price: <%= orderDetails.getItemPrice() %></p>
            <p>Item Price: <%= orderDetails.getImage() %></p>
            <p>Item Price: <%= orderDetails.getLink() %></p>
            <form action="Order.jsp" method="POST">
                <input type="hidden" name="email" value="<%= orderDetails.getEmail() %>">
                <input type="hidden" name="itemId" value="<%= orderDetails.getItemId() %>">
                <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this item?');">
            </form>
            <hr>
        <% } %>
        
<%
    } else if (email != null && !email.isEmpty()) {
       
    }
%>

<%
    String itemId = request.getParameter("itemId");
    
     Order myOrderInstance = new Order();
    boolean deleted = orderInstance.deleteOrderItem(email, itemId);

    if (deleted) {
        // Item deleted successfully
        response.sendRedirect("Order.jsp"); // Redirect to the order page or any other desired location
    } else {
        // Failed to delete the item
        // response.sendRedirect("error.jsp"); // Redirect to an error page or handle the failure in an appropriate way
    }
    out.println(itemId);
%>



    





