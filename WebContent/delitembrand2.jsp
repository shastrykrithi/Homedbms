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
String name=" ";
String subcat=request.getParameter("subcategory");
String cc=request.getParameter("subcategoryChange");


out.print(subcat+"   ");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homedbms","root","root");
Statement stmt= con.createStatement();
ResultSet rs= stmt.executeQuery("select brandname from itembrand_table where itembrand_id='"+subcat+"'");
while(rs.next()){
	 name=rs.getString("brandname");
}
out.print(cc);
if(cc=="")
{
	response.sendRedirect("delitembrand.jsp");
}
else{
	

String sql="DELETE  FROM `homedbms`.`itembrand_table` WHERE `brandname`='"+cc+"' ";
stmt.executeUpdate(sql);
}

%>
Item is deleted!!!
</center>
<form action="itembrand.jsp">
<input type="submit" value="back">
</form>
</body>
</html>