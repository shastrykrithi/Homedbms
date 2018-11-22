<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select</title>
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
<center><h2 style="position:relative;top:10px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">Shopping:</h2></center> <br>
</center>
<form action="cbill.jsp" method="get">
<%
String username=request.getParameter("username");
%>
<input name="username" type="hidden" value="krithi"/>
<center>
<table border="2" align="center"style="position:relative;bottom:150px;" >
   <tr>
        
        <td>BrandName</td>
        <td>Price</td>
        <td>Quantity</td>
   </tr>
<%
String name=" ";
String subcat=request.getParameter("subcategoryid");
String cc=request.getParameter("subcategoryChange");

//out.println(username);
%>


<% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homedbms","root","root");
Statement stmt= con.createStatement();

ResultSet rs= stmt.executeQuery("select * from itembrand_table where itemmodelid='"+subcat+"'");

while(rs.next()){
    %>
	
    
    <tr>
          
    <td><%=rs.getString("brandname")%></td>    
     <td><%=rs.getInt("prize")%></td>  
      <td><%=rs.getInt("bquantity")%></td>
      </tr>
      
   
        <%


}

if(cc=="")
{   
	out.println("NO ITEM IN SELECTED ITEM AND MODEL");
	
}



%>
 
   <br>
   <br>
   <p style="position:relative;bottom:60px;">Enter Brand name :</p>
   <input type="text"  name="partname" value="" style="position:relative;bottom:60px;">
   <br>
   <br>
    <br>
   <br>
   <p style="position:relative;bottom:100px;">Enter Quantity  :</p>
   <input type="text" name="quantity" value="" style="position:relative;bottom:100px;">
   <br>
   <br>
   




<div style="position:relative;top:100px">
     <input type="submit" value="next"style="position:relative;top:-80px;height:30px;width:100px;background:black;color:white;font-size:20px"/></center>
        </form>
</center>
 <form action="cselect.jsp">
     
     <div style="position:relative;top:200px">
    <input type="submit" value="Back"style="position:relative;bottom:270px;height:30px;width:100px;font-size:20px">
    </div>
    </form>

</body>
</html>