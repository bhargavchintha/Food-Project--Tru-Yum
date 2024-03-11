package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.String;
import java.sql.*;
import javax.swing.JOptionPane;
import java.util.Random;
import UserDAO.UserDAO;
import UserDAO.User;
import javax.servlet.http.HttpSession;
import OrderItems.Orderitem;
import OrderItems.OrderDAO;
import java.util.List;
import Orderitemsdelete.OrderdeleteDAO;
import Orderitemsdelete.Orderdeleteitems;
import Orderitemsdelete.Deleteorder;

public final class Your_005fOrder_005fList_005fdelete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
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
    
      out.write('\n');
      out.write('\n');

    String orderId = request.getParameter("orderId");
  //  String email = request.getParameter("email");
  String newOrderStatus = request.getParameter("orderstatus");
    String message = "";
try {
     Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup","root","root");
    // Prepare and execute a SELECT query to check if there is a matching order
    PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM your_order_table WHERE orderId = ? AND email = ?");
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

    conn.close();
} catch (Exception e) {
    out.println(e);
}


      out.write('\n');
      out.write('\n');

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("qwubukdbshvbjhsdvjhvg");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
