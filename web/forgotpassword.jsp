<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:include page="forgot-password.html" />
<%@ page import="ForgotPasswordDao.ForgotPasswordDao" %>

<%
String email = request.getParameter("email");
String pin = request.getParameter("pin");
String password = request.getParameter("newpassword");
String cpassword = request.getParameter("cpassword");
String message = "";

if (request.getMethod().equalsIgnoreCase("POST")) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup","root","root");

        // Verify that the connection was successful
        if (conn != null) {
            System.out.println("Connected to the database");
        } else {
            System.out.println("Failed to connect to the database");
        }

        // Check if the email and pin are valid
        PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM signu WHERE email = ? AND pin = ?");
        ps1.setString(1, email);
        ps1.setString(2, pin);
        ResultSet rs = ps1.executeQuery();

        if (rs.next()) {
            // Update the user's password in the database
            if (password.equals(cpassword)) { // Check if password matches cpassword
                PreparedStatement ps2 = conn.prepareStatement("UPDATE signu SET password = ? WHERE email = ? AND pin = ?");
                ps2.setString(1, password);
                ps2.setString(2, email);
                ps2.setString(3, pin);
                int updateCount = ps2.executeUpdate();

                if (updateCount == 1) {
                    if (password.equals(request.getParameter("newpassword"))) {
                        message = "Password updated successfully";
                         response.sendRedirect("index.html");
                    } else {
                        message = "Password updated successfully";
                    }
                } else {
                    message = "Password update failed, please check your email and pin";
                }
            } else {
                message = "Password and confirm password do not match";
            }
        } else {
            message = "Password update failed, please check your email and pin";
        }

        conn.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>

<script>
    const message = '<%= message %>';
    if (message) {
        document.getElementById("popupMessage").innerText = message;
        document.getElementById("popupMessage").classList.add("show");
        setTimeout(function() {
            document.getElementById("popupMessage").classList.remove("show");
        }, 3000);
    }
</script>
