<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
     
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
    background-size:300% 300%;
   
    font-size:20px;
    font-family:ravie;
    color:#FA8072;
}

</style>
<div style="width:100%;height:100%"/>
<center><h2 style="position:relative;top:10px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">Add ItemBrand:</h2></center> <br>
</center>
<%
   String subcategory=request.getParameter("subcategoryid");
   String category=request.getParameter("category");
   String partname=request.getParameter("partname");
   String price=request.getParameter("price");
   String quantity=request.getParameter("quantity");
   
   
   ResultSet resultset =null;
   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL = "jdbc:mysql://localhost/homedbms";
   int key=1;
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

<center>
<% 
 String sql;
   sql="select itemmodelid from itemmodel_table where itemmodelname='"+subcategory+"'";
    resultset =stmt.executeQuery(sql) ;
%>
<%
    while(resultset.next())
    { 
       key=resultset.getInt("itemmodelid");
    }

%>
<br>
<br>
<%
//stmt.executeUpdate("INSERT INTO itembrand_table(brandname)VALUES('"+partname+"'");
  stmt.executeUpdate("INSERT INTO itembrand_table(brandname,itemmodelid,prize,bquantity) VALUES('"+partname+"','"+subcategory+"','"+price+"','"+quantity+"')");
   //stmt.executeUpdate("INSERT INTO subcattable(description) VALUES('"+des+"')");

%>
<br>
<br>
<%

  //out.println(subcategory+"   has been added to the database");

%>
<h3>Item is Added!!!</h3>
</center>
<form action="itembrand.jsp">
<input type="submit" value="back">
</form>
</body>
</html>