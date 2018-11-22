<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@ page import="java.sql.*" %>
    <%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    final String DB_URL = "jdbc:mysql://localhost/homedbms";

    final String USER = "root";
    final String PASS = "root";
   
    Connection conn = null;
    Statement stmt = null;
    try{
      
      Class.forName("com.mysql.jdbc.Driver");

      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      stmt = conn.createStatement();
      resultset =stmt.executeQuery("select * from itemmodel_table where") ;

%>
<center>

       <form action="login1.jsp">
       <select name="item">
       <%while(resultset.next()){  %>
       <option>
           <%= resultset.getString("itemname")%>
        </option>
        <%} %>
        </select>
        <input type="submit">
        </form>
       
</center>

<%

       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
    
     
%>
</body>
</html>