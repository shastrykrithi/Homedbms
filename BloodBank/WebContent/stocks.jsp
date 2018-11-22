<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>

<%ResultSet resultset =null,resultset1=null;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
background-image: url("blood drop.jpg");
//height: 100%;
//background-position: center;
background-repeat: no-repeat;
//background-size: cover;

}
</style>
</head>
<body>
<%
    try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from branch") ;
%>
<br>
<form action="SStocks" method="post">
<center>
    <font color=blue size=5><b>Select Branch Name</b></font>
        <select name="branchname">
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString(2)%></option>
        <% } %>
        </select>
<br><br>

<input type="submit" value="check stock">
</center>
</form>
<br>
<%
resultset1 =statement.executeQuery("select * from branch") ;
%>
<form action="SStocks" method="get">
<center>
    <font color=blue size=5><b>Select Branch ID</b></font>
        <select name="branchid">
        <%  while(resultset1.next()){ %>
            <option><%= resultset1.getInt(1)%></option>
        <% } %>
        </select>
<br><br>

<input type="submit" value="check stock">
</center>
</form>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>


</body>
</html>