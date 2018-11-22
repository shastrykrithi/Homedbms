<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<center>
<h1 style="font-size:5vw; color:white;">Customer registration</h1>
</center>
</head>
<body>
<style>
body {
    background-image:url(wall.jpg);
}

</style>
<center>
<form action="cregister1.jsp">
<b style="color:pink;">UserName:</b><input type="text" name="uname" value="" style="margin-left:20px;width:400px;" required><br></br>
<b style="color:pink;">Email:</b><input type="email" name="email" value="" style="margin-left:20px;width:400px;position:relative;left:12px;" required><br></br>
<b style="color:pink;">Password:</b><input type="password" name="pd" value="" style="margin-left:20px;width:400px;position:relative;left:9px;" required><br></br>
<b style="color:pink;">Confirm Password:</b><input type="password" name="cpd" value="" style="margin-left:20px;width:400px;position:relative;left:9px;" required><br></br>
<b style="color:pink;">Phone Number:</b><input type="text" name="phone" value="" style="margin-left:20px;width:400px;position:relative;right:17px;" required><br></br>
<b style="color:pink;">Address:</b><input type="text" name="address1" value="" style="margin-left:20px;width:400px;position:relative;right:17px;" required><br></br>
<b style="color:pink;">City:</b><input type="text" name="city" value="" style="margin-left:20px;width:400px;position:relative;right:17px;" required><br></br>
<b style="color:pink;">Address2:</b><input type="text" name="address2" value="" style="margin-left:20px;width:400px;position:relative;right:17px;" ><br></br>

<input type="submit" value="Register" style="background:black;color:white;height:50px;width:150px;">
 
</form>
<form action="index.jsp"><br><br><br><br><br>
<input type="submit" value="back">
</form>
</center>
</body>
</html>