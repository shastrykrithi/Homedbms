<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   String category=request.getParameter("item");
 %>
   <br>
   <%
   session.setAttribute("itemmodel1", category);
%>

<form action="additemmodel2.jsp">
Enter ItemModel
  <input type="text" name="itemmodel" style="position:relative;top:10px;height:50px;width:180px;font-size:25px">
  <br>
  <br>
   <input type="submit" value="ADD"style="position:relative;top:70px;height:40px;width:200px;background:black;color:white;font-size:30px"/></center>

</form>
 <form action="additemmodel.jsp">
     
     <div style="position:relative;top:100px">
    <input type="submit" value="back"style="height:50px;width:180px;font-size:30px">
    </div>
    </form>
</center>
</body>
</html>