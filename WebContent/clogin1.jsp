<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN</title>
</head>
<body>
<center>
<style>
body {
    background-image:url(loginpage.jpg);
}

</style>
<form action="cselect.jsp" method="get"><br><br><br><br><br>
<% 

String user=request.getParameter("username") ;
String userPassword=request.getParameter("password"); 
%>
<input name="user" type="hidden" value=""/>
<%




// JDBC driver name and database URL
  final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  final String DB_URL = "jdbc:mysql://localhost/homedbms";

  //  Database credentials
  final String USER = "root";
  final String PASS = "root";
  
 
  Connection conn = null;
  Statement stmt = null;
  try{
     //STEP 2: Register JDBC driver
     Class.forName("com.mysql.jdbc.Driver");

     //STEP 3: Open a connection
System.out.println("Connecting to database...");
     conn = DriverManager.getConnection(DB_URL,USER,PASS);

     //STEP 4: Execute a query
     System.out.println("Creating statement...");
     stmt = conn.createStatement();
     //String sql="Select * from customer where username='"+uname+"' and password='"+pswd+"'";
     ResultSet rs=stmt.executeQuery("select * from user_table where uusername='"+user+"' and password='"+userPassword+"'");
     
     
     if(rs.next()){
    	 response.sendRedirect("cselect.jsp");  
     }
     else{
    	 response.sendRedirect("clogin.jsp");
     }
     
     

     
     
   
    
     //STEP 6: Clean-up environment
   
     stmt.close();
     conn.close();
  }catch(SQLException se){
     //Handle errors for JDBC
  
     se.printStackTrace();
  }catch(Exception e){
     //Handle errors for Class.forName
     e.printStackTrace();
  }finally{
     //finally block used to close resources
     try{
        if(stmt!=null)
           stmt.close();
     }catch(SQLException se2){
     }// nothing we can do
     try{
        if(conn!=null)
           conn.close();
     }catch(SQLException se){
        se.printStackTrace();
     }//end finally try
  }//end try
  System.out.println("\nGoodbye!");
//response.sendRedirect("edit.jsp");


%><center>


<input type="submit" value="next">
</form>
<form action="welcome.jsp"><br><br><br><br><br>
<input type="submit" value="back">
</form>
</center>
</center>
</body>
</html>