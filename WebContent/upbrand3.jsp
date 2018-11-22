<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    background-image:url(im.jpg);
}

</style>
</head>

<body>

<%
   
%>
<center>
<br><br>
<form action="upbrand4.jsp">
<%
String subcategoryid=request.getParameter("subcategory");
int key=Integer.parseInt(subcategoryid);
session.setAttribute("subcategoryid", subcategoryid);


Connection connection = 
DriverManager.getConnection("jdbc:mysql://localhost/homedbms?user=root&password=root");
Statement statement = connection.createStatement() ;
resultset =statement.executeQuery("select * from itembrand_table where itemmodelid='"+key+"'") ;
%>
<br><br>
   <h1> Select Brand</h1>
        <select name="product">
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString("brandname")%></option>
        <% } %>
        </select>
<br><br>

<br><br>
<br><br>
<input type="submit" value="Submit">

</form>




</center>
</body>

</html>