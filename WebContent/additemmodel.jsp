<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@ page import="java.sql.*" %>
    <%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD</title>
</head>
<body>
<style>
body {
    background-image:url(im.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size:200% 300%;
   
    font-size:20px;
    font-family:ravie;
    color:#FA8072;
}

</style>
<div style="width:100%;height:100%"/>
<center><h2 style="position:relative;top:10px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">Add ItemModel:</h2></center> <br>
</center>
<center>
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
      resultset =stmt.executeQuery("select * from item_table") ;

%>
<center>

       <form action="additemmodel1.jsp">
       <select name="item" style="position:relative;top:100px;height:50px;width:180px;">
       
       
       <b><option>SELECT ITEM</option></b>
      
       <%while(resultset.next()){  %>
       
       <option>
           <%= resultset.getString("itemname")%>
        </option>
        <%} %>
        </select>
        
  <br>
  <br>
        <br>
        <br>
        <div style="position:relative;top:100px">
     <input type="submit" value="Next"style="position:relative;top:70px;height:40px;width:180px;background:black;color:white;font-size:30px"/></center>
        </form>
       
</center>

<%

       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
    
     
%>

</center>
 <form action="itemmodel.jsp">
     
     <div style="position:relative;top:200px">
    <input type="submit" value="Back"style="height:50px;width:180px;font-size:30px">
    </div>
    </form>
</body>
</html>