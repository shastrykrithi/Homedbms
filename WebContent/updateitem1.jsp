<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.mysql.jdbc.Driver"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
body {
     background-image:url(im.jpg);
}

</style>
<center>
<%

String categoryname =request.getParameter("itemname"); 
String newcategoryname =request.getParameter("newitemname"); 
@SuppressWarnings("unused")
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
     if(newcategoryname=="")
     {
    	 response.sendRedirect("updateitem.jsp");
     }
     else{
     String sql;
     sql = "UPDATE  item_table SET itemname='"+newcategoryname+"' where itemname='"+categoryname+"'";  
     
     stmt.executeUpdate(sql);
     }
     stmt.close();
     conn.close();
  }catch(SQLException se){
   
     se.printStackTrace();
  }catch(Exception e){
     
     e.printStackTrace();
  }finally{
     
     try{
        if(stmt!=null)
           stmt.close();
     }catch(SQLException se2){
     }
     try{
        if(conn!=null)
           conn.close();
     }catch(SQLException se){
        se.printStackTrace();
     }
  }
  System.out.println();
  System.out.println("Goodbye!");
	  %>

Item update successfully!!!
</center>
<form action="edit.jsp" >
<input type="submit" value="back">
</form>
</body>
</html>