<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<style>
body {
     background-image:url(wall.jpg);
}

</style>
<center>
<%
String username=request.getParameter("uname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String pd=request.getParameter("pd");
String cpd=request.getParameter("cpd");
String city=request.getParameter("city");



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
if(pd.equals(cpd))
{
stmt.executeUpdate("INSERT INTO contact_table(username,password,email,ph_no,address1,address2,city) VALUES('"+username+"','"+pd+"','"+email+"','"+phone+"','"+address1+"','"+address2+"','"+city+"')");
//out.println("sucessfull!!");
%>
<h1 style="font-size:5vw; color:white;">Successfully Registered</h1>
<%

}
else
{
	response.sendRedirect("cusregister1.jsp");
}
%>
<br>
<br>

<form action="login1.jsp">

<input type="submit" name="submit">
</center>
</form>
</body>
</html>