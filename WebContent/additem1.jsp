<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD ITEM</title>

</head>
<body>
<style>
body {
    background-image:url(im.jpg);
}

</style>
<center>
<%
   String cat=request.getParameter("item");


   


   ResultSet resultset =null;
   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL = "jdbc:mysql://localhost/homedbms";
   
   final String USER = "root";
   final String PASS = "root";

   Connection conn = null;
   Statement stmt = null;
   try
   {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
   }
   catch(Exception e)
   {
        out.println("wrong entry"+e);
   }

%>

<%
if(cat=="")
{
	response.sendRedirect("addcategory.jsp");

}
else{
  stmt.executeUpdate("INSERT INTO item_table(itemname) VALUES('"+cat+"')");

 %>
<p style="font=60px">ITEM HAS BEEN ADDED SUCCESSFULLY</p>
<% 
  out.println(cat+" has been added to the database");
  

}
	
%>
</center>
<p style="font:25px";>ADD ONE MORE ITEM
<form action="additem.jsp">
<input type="submit" value="add more">
</form>
<br>
<br>


</center>
</body>
</html>