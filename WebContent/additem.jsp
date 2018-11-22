<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD ITEM</title>
</head>
<body>
<style>
body {
    background-image:url(im.jpg);
    background-color: black;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100%;
    font-size:20px;
    font-family:ravie;
    color:#FA8072;
}

</style>
<center>
<br>
<br>

<form action ="additem1.jsp" method="post">
<div style="width:100%;height:500px;">
<center><h2 style="position:relative;top:-75px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">ADD ITEM:</h2></center> <input type= "text" value="" name ="item"style="height:35px;font-size:20px"/><br>
<br>

<br>
<br>
<center><input type="submit" value="Save and Add"style="height:50px;width:250px;background:black;color:white;font-size:30px"/></center>
<br>
<br>
</form>
<form action="edit.jsp" >
<input type="submit" value="Back"style="height:50px;width:180px;font-size:30px"/>
</center>
</form>
</body>
</html>