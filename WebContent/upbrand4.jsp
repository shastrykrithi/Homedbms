<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

<br><br>
<form action="upbrand5.jsp">
<%
	String orgproduct1=request.getParameter("product");
	
	out.println(orgproduct1);
	session.setAttribute("orgproduct",orgproduct1);
	String subid1=(String)session.getAttribute("subcategoryid");
	//out.println(subid1);
	session.setAttribute("subcategoryid", subid1);

%>
Enter BrandName (if updating): <input type="text" name="upproduct">
<br><br>

Enter product unit price: <input type="text" name="upproductprice">
<br><br>
Enter product quantity: <input type="text" name="upproductquan">
<br><br>
<input type="submit" value="Update Product">
</form>
<br><br>


</form>
<br><br>
<form action="updatebrand.jsp">
<input type="submit" value="back">
</form>
</center>
</body>
</html>