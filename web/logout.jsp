<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.net.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
   // Set no-cache directive
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");

   // Check if the user is logged in
   HttpSession sessions = request.getSession(false);
   if (sessions == null || session.getAttribute("email") == null) {
      // User is not logged in, redirect to login page
      response.sendRedirect("login.jsp");
   } else {
      // User is logged in, display normal content
%>
      <h1>Welcome, <%=session.getAttribute("email")%></h1>
      <p>This is the main content of the page.</p>
<%
   }
%>
<div class="ANM">Logout</div>
<a href="index.html">login page</a>

<script>
  // Function to redirect to the next HTML page
  function redirectToNextPage() {
    window.location.href = "index.html";
  }

  // Wait for the page to load
  document.addEventListener("DOMContentLoaded", function() {
    // Get the ANM div element
    var anmDiv = document.querySelector(".ANM");

    // Get the total duration of the animation in milliseconds
    var animationDuration = 1; // Adjust this value as needed

    // Wait for the animation to complete and redirect to the next page
    setTimeout(redirectToNextPage, animationDuration);
  });
</script>



<script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>


