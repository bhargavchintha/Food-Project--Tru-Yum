



<%@page import="javafx.scene.control.Alert"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random" %>
<%@ page import="javax.swing.JOptionPane" %>
<%
    String itemlist=request.getParameter("itemlist");
    String coupons=request.getParameter("coupons");
    String orderaddress=request.getParameter("orderaddress");
    String grandtotalamount=request.getParameter("grandtotalamount");
    String payment=request.getParameter("payment");
    out.print(grandtotalamount+ "<br>");
   out.print(itemlist);
   out.print(coupons+ "<br>"); 
out.print(orderaddress);

out.print(payment);


%>


<head>
        <title>TruYum Restaurant | All Food Items</title>
        <link rel="icon" href='images/TRU-YUM.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./bub.css">
    <link rel="stylesheet" type="text/css" href="./Home.css">
    </head>