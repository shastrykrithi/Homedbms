<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  
    <%@page import="com.mysql.jdbc.Driver"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE</title>
</head>
<body>
<style>
body {
     background-image:url(im.jpg);
     background-repeat: no-repeat;
    background-position: center;
    background-size:100% 200%;
   
    font-size:20px;
    font-family:ravie;
    color:#FA8072;
}
</style>
 <center>
 <div style="width:100%;height:50px;"/>
<center><h2 style="position:relative;top:10px;border:none;background:black;font-color:whitefont-family: "Times New Roman", Times, serif;">Update Item:</h2></center> <br>
</center>
<script>
  function cc()
  {
    	  
      var x = document.getElementById("item"); 
	  document.getElementById("ww").value=  x.options[x.selectedIndex].text;
	  document.getElementById("wx").value=  x.selectedIndex;  	  
  }
</script>

</head>
<body>
<center>
    <form action="updateitem1.jsp" method="post">
       <div style="position:relative;top:30px">
       <select  style="height:25px;width:180px;" name="item" id="item" onchange="cc()">
       <option >Select Item</option>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homedbms","root","root");
            Statement stmt= con.createStatement();
            ResultSet rs= stmt.executeQuery("select * from item_table");
            while(rs.next()){
        %>
                 <option value="<%=rs.getString("itemid") %>"><%=rs.getString("itemname") %></option>
                        
          
        <%
            }
        %>
      
        </select> 
        <br>
        <br>
        <div style="position:relative;top:50px">
        Item name:<input type="text" id="ww" name="itemname" readonly style="height:20px;width:180px;">
        <br>
        <br>
       Enter  new item name:<input type="text" id="ww" name="newitemname"style="height:20px;width:180px;">
        <br>
         <div style="position:relative;top:30px">
         Item ID:<input type="text" id="wx" name="itemid" disabled style="height:20px;width:180px;">
         </div>
         
         
        <br>
        <br>
        <br>
        <input type="submit" value="Submit"style="height:50px;width:250px;background:black;color:white;font-size:30px"/></center>

        <br>
        <br>
        </div>
        </div>
        
    </form>
    <centre>
     <form action="edit.jsp">
     
     <div style="position:relative;top:90px">
    <input type="submit" value="back"style="height:50px;width:180px;font-size:30px">
    </div>
    </form>
    </centre>
    
    
</center>
</center>
</body>
</html>

 

 