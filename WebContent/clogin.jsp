<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<style>
body {
    background-image:url(loginpage.jpg);
}

</style>
<center>
<body>
<h1 style="font-size:5vw"> Customer Login Form</h1>
<form action="clogin1.jsp" method="get">
Please enter your Username :<input type="text" name="username" value=""/><br><br>
Please enter your Password :<input type="password" name="password" value=""/><br><br>
<input type="submit" name="submit" value="submit"/><br><br>

<a href ="cregister.jsp">Click here to register</a><br><br>

</form>
<form action="index.jsp">
<input type="submit" value="back">
</form>
<%
//String username=request.getParameter("username");
//session.setAttribute("uname", username);
%>
</center>
</body>
</html>