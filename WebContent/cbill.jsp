<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.mysql.jdbc.Driver" %>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
     <%@ page import=" java.util.Date" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BILL</title>
</head>
<body>
<style>
body {
    background-image:url(im.jpg);
}

</style>
<%
   String subcategory=request.getParameter("subcategoryid");
   String category1=request.getParameter("category");
   String partname=request.getParameter("partname");
   String username=request.getParameter("username");
   String quantity=request.getParameter("quantity");
   
   int quantity1;
 
   try{
	   quantity1=Integer.parseInt(quantity); 
	 }catch(NumberFormatException e){quantity1=0;
	
	 }
   
   ResultSet resultset =null;
   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL = "jdbc:mysql://localhost/homedbms";
   int key=1;
   final String USER = "root";
   final String PASS = "root";
   int price=0;
   String date1=null;
   Connection conn = null;
   Statement stmt = null;
   try
   {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
   
%>

<center>
<% 
 String sql;

   sql="select * from itembrand_table where brandname='"+partname+"'";
    resultset =stmt.executeQuery(sql) ;
%>
<%

    while(resultset.next())
    { 
       key=resultset.getInt("itembrand_id");
       price=resultset.getInt("prize");
    }


%>
<%

 price=quantity1*price;
 
 Date date = new Date();
 date1=date.toString();
 %>
 
<br>
<br>
<%
if(key==0)
{
	response.sendRedirect("cbrand.jsp");
	out.println(key+" "+partname);
	
}
else{

  stmt.executeUpdate("INSERT INTO updateuser_table(username,itembrand_id,totalbill,quantity,billdate) VALUES('"+username+"','"+key+"','"+price+"','"+quantity1+"','"+date1+"')");
   }
%>
<br>
<br>
<%

  out.println("YOUR ORDER IS NOTED, PLEASE MAKE NOTE OF THE AMOUNT TO BE PAID AND BILL");
int n;
n=stmt.executeUpdate("UPDATE itembrand_table SET bquantity = bquantity - 1 WHERE itembrand_id = '"+key+"' and bquantity>0");
   }
   catch(Exception e)
   {
	           out.println("wrong entry"+e);
   }


%>
<table border="2" align="center">
   <tr>
        
        <td>Name</td>
        <td>ItemName</td>
        <td>Quantity</td>
         <td>Price</td>
         <td>BillDate</td>
        
        
   </tr>
   <tr>
          
    <td><%=username%></td>    
     <td><%=partname%></td>  
      <td><%=quantity1%></td>
      <td><%=price%></td>
      <td><%=date1%></td>
      </tr>

</center>

<form action="cbrand.jsp">
<centre>
     <input type="submit" value="back"style="position:relative;top:250px;right:250px;height:30px;width:100px;background:black;color:white;font-size:20px"/></center>
        </form>
   </centre>   
<form action="clogin.jsp">
     
     <centre>
    <input type="submit" value="Logout"style="position:relative;top:200px;right:350px;height:30px;width:100px;font-size:20px">
    </div>
    </centre>
    </form>
</form>
</body>
</html>