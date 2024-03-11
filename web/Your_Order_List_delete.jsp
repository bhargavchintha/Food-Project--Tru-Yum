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
        String email = (String) session.getAttribute("email");
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
    String orderId = request.getParameter("orderId");
  //  String email = request.getParameter("email");
  String newOrderStatus = request.getParameter("orderstatus");
    String message = "";
try {
     Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup","root","root");
    // Prepare and execute a SELECT query to check if there is a matching order
    PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM orderitemnames WHERE orderId = ? AND email = ?");
    ps1.setString(1, orderId);
    ps1.setString(2, email);
    ResultSet rs = ps1.executeQuery();

    if (rs.next()) {
        // Update the order status in the database
        //String newOrderStatus = "order cancelled"; // Set the new order status here

        PreparedStatement ps2 = conn.prepareStatement("UPDATE orderitemnames SET orderstatus = ? WHERE orderId = ? AND email = ?");
        ps2.setString(1, newOrderStatus);
        ps2.setString(2, orderId);
        ps2.setString(3, email);
        int updateCount = ps2.executeUpdate();

        if (updateCount == 1) {
            message = "Order status updated successfully";
        } else {
            message = "Order status update failed, please check your orderId and email";
        }
    } else {
        message = "Order status update failed, please check your orderId and email";
    }

     //response.sendRedirect("Your_Order_List.jsp");
    
    conn.close();
} catch (Exception e) {
    out.println(e);
}


out.println(orderId);
out.println(newOrderStatus);
out.println(email);
%>

<%
    // Get the order ID and email from the request parameters
   // String orderId = request.getParameter("orderId");
    //String email = request.getParameter("email");

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

