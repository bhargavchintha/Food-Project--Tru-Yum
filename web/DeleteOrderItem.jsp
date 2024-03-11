<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="order.Order"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Order Item</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String itemId = request.getParameter("itemId");

    if (email != null && itemId != null) {
        Order myOrderInstance = new Order();
        boolean deleted = myOrderInstance.deleteOrderItem(email, itemId);

        if (deleted) {
            out.println("Item deleted successfully.");
            // Redirect back to the Order.jsp page
            response.sendRedirect("Order.jsp");
        } else {
            out.println("Failed to delete the item.");
            // Redirect to an error page or handle the failure in an appropriate way
            // response.sendRedirect("error.jsp");
        }
    }
%>
</body>
</html>
