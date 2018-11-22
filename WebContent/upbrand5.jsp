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
<center>
<%
    String subid=(String)session.getAttribute("subcategoryid");
	String orgproduct=(String)session.getAttribute("orgproduct");
    String newproduct=request.getParameter("upproduct");
    String newproductprice=request.getParameter("upproductprice");
    String newproductquan=request.getParameter("upproductquan");
    
    //out.println(orgproduct+"    "+newproduct+"   "+newproductdesc);
	int key=Integer.parseInt(subid);
	int price=Integer.parseInt(newproductprice);
	int quan=Integer.parseInt(newproductquan);
	//out.println(subid);
	Connection connection = 
    DriverManager.getConnection("jdbc:mysql://localhost/homedbms?user=root&password=root");
    Statement statement = connection.createStatement() ;
    if(newproduct!=""){
    statement.executeUpdate("update itembrand_table set brandname='"+newproduct+"',prize='"+price+"', bquantity='"+quan+"' where brandname='"+orgproduct+"' and itemmodelid='"+key+"'") ;
	out.println();
    out.println();
	out.println(orgproduct+" has been updated to "+newproduct+ " successfully!!!");
    }
    else
    {
    	   out.println("Enter ModelNmae");
    }
%>
<br><br>
<form action="itembrand.jsp">
<input type="submit" value="back">
</form>
</center>
</body>
</html>