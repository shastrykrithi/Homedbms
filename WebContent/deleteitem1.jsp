<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete item</title>
</head>
<body>
<style>
body {
     background-image:url(im.jpg);
}

</style>
<center>
<% 
String cat=request.getParameter("itemname");
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
		     String sql;
		     if(cat=="")
		     {
		    	 response.sendRedirect("deletecat.jsp");
		     }
		     else{
		     sql = "DELETE FROM  item_table where itemname='"+cat+"'" ; 
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
Item sucessfully deleted!!
</center>
<form action="deletecat.jsp">
<input type="submit" value="back">
</form>
</body>
</html>