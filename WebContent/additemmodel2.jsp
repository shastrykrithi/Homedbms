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
   String subcategory=request.getParameter("itemmodel");

   String category=(String)session.getAttribute("categoryatt");


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
   sql="select itemid from item_table where itemname='"+category+"'";
    resultset =stmt.executeQuery(sql) ;
%>
<%
    while(resultset.next())
    { 
       key=resultset.getInt("itemid");
    }
%>
<br>
<br>
<%
if(subcategory=="")
{
	response.sendRedirect("additemmodel.jsp");
	
}
else{
	

  stmt.executeUpdate("INSERT INTO itemmodel_table(itemmodelname,itemid) VALUES('"+subcategory+"','"+key+"')");
   //stmt.executeUpdate("INSERT INTO subcattable(description) VALUES('"+des+"')");

  

 // out.println(subcategory+" has been added to the database");

}
%>
</center>
<h3> ITEM MODEL HAS BEEN ADDED SUCCESSFULLY</h3>
<br>
<br>


</center>
 <form action="itemmodel.jsp">
     
     <div style="position:relative;top:200px">
    <input type="submit" value="Back"style="height:50px;width:180px;font-size:30px">
    </div>
    </form>
</body>
</html>