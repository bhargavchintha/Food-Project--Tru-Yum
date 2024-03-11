<%@page import="javafx.scene.control.Alert"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random" %>
<%@ page import="javax.swing.JOptionPane" %>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    String password=request.getParameter("password");
    String cpassword=request.getParameter("cpassword");
    
    String option1 = request.getParameter("option1");
    String inputone = request.getParameter("inputone");
    String option2 = request.getParameter("option2");
    String inputtwo = request.getParameter("inputtwo");
    String option3 = request.getParameter("option3");
    String inputthree = request.getParameter("inputthree");
    //out.print( name +"<br> "+ email + " <br> " + phone + "<br>" +Password + "<br>" );
    
//out.println("Name: " + name);
//out.println("Email: " + email);
//out.println("Phone: " + phone);
//out.println("Password: " + password);
//out.println("Confirm Password: " + cpassword);
//out.println("Option 1: " + option1);
//out.println("Input 1: " + inputone);
//out.println("Option 2: " + option2);
//out.println("Input 2: " + inputtwo);
//out.println("Option 3: " + option3);
//out.println("Input 3: " + inputthree);


  Random random = new Random();
    int pin = random.nextInt(900000) + 100000;
    if((password.equals(cpassword))){
          
    try
    {
         Class.forName("com.mysql.jdbc.Driver");
       Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup","root","root");
       PreparedStatement ps1=c1.prepareStatement("select email and password from signu where email=? and password=? ");
       ps1.setString(1, email);
       ps1.setString(2, password);
       ResultSet rs=ps1.executeQuery();
       if(rs.next())
       {
            //System.out.println("Already user exists");
            //out.print("Already email exists");
           // response.sendRedirect("emailexists.html");
           response.sendRedirect("signup.html?message=Email or Password Exists ");
            return;
       }
       
       else
       {
           //
            try{
        Class.forName("com.mysql.jdbc.Driver");
       Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup","root","root");
       PreparedStatement ps=c.prepareStatement("insert into signu values(?,?,?,?,?,?,?,?,?,?,?)");
       ps.setString(1, name);
       ps.setString(2,email);
       ps.setString(3,phone);
       ps.setString(4, password);
       ps.setInt(5, pin);
       ps.setString(6, option1);
       ps.setString(7, inputone);
       ps.setString(8, option2);
       ps.setString(9, inputtwo);
       ps.setString(10, option3);
       ps.setString(11, inputthree);
       
       int x=ps.executeUpdate();
       
       if(x>0)
       {
            
           // out.println("Successfull Registered");
           response.sendRedirect("index.html");
           
       }
                
            else
            {
               response.sendRedirect("signup.html?message=Signup Falied ");
            return;
            }
    }catch(Exception e)
    {
        System.out.println(e);
    }
   
            //
       }
        
    }catch(Exception e)
    {
        System.out.println(e);
    }
    
    }
    else{
        //out.println("password are not same");
    }
  
%>


 <script>
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('message');
    if (message) {
        alert(message);
    }
</script>

      
      
      
      
      
    