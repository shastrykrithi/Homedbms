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
   background-repeat: no-repeat;
    background-position: center;
    background-size:300% 300%;
   
    font-size:20px;
    font-family:ravie;
    color:#FA8072;
}

</style>
<div style="width:100%;height:100%"/>
<center><h2 style="position:relative;top:10px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">Delete ItemModel:</h2></center> <br>
</center>
<center>
<%
String name=" ";
String subcat=request.getParameter("subcategory");
String cc=request.getParameter("subcategoryChange");


//out.print(subcat+"   ");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homedbms","root","root");
Statement stmt= con.createStatement();
ResultSet rs= stmt.executeQuery("select itemmodelname from itemmodel_table where itemmodelid='"+subcat+"'");
while(rs.next()){
	 name=rs.getString("itemmodelname");
}
//out.print(cc);
if(cc=="")
{
	response.sendRedirect("delitemmodel.jsp");
}
else{
	

String sql="DELETE  FROM `homedbms`.`itemmodel_table` WHERE `itemmodelname`='"+cc+"' ";
stmt.executeUpdate(sql);
}

%>
<h3>Item is Deleted!!!</h3>
</center>
<form action="itemmodel.jsp">
     
     <div style="position:relative;top:200px">
    <input type="submit" value="Back"style="height:50px;width:180px;font-size:30px">
    </div>
    </form>

</body>
</html>