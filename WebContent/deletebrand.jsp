<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DELETE</title>
</head>
<body>
<style>
body {
    background-image:url(im.jpg);
    }

</style>
<center>
<% 
String category=request.getParameter("subcategoryid");

%>
<form action="delitembrand2.jsp" method="post">
<select name="subcategory" >
         <option value="none">Select ItemBrand </option>
         <%
         
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homedbms","root","root");
         Statement stmt= con.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from itembrand_table where itemmodelid='"+category+"'");
        while(rs.next()){
        	%>
        	<option value="<%=rs.getString("itembrand_id") %>"><%=rs.getString("brandname")%></option>
        	
        	<%
        }
       %>
</select> 
 Enter the ItemBrand: <input type="text" name="subcategoryChange">
  <br>
  <br>
  
  
   
   <input type="submit" value="submit">
</form>
</center>

</body>
</html>