<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>update</title>
      <style>
body {
     background-image:url(im.jpg);
}

</style>
      <style>
        select
        {
         height: 25px;
         width: 250px;
        }
      </style> 
      
      <script language="javascript" type="text/javascript">
       var xmlHttp;
      function showsubcategory(str){
    	  if(typeof XMLHttpRequest !=="undefined"){
    		  xmlHttp = new XMLHttpRequest();
    	  } else if(window.ActiveXObject){
    			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
    	  }  
    		  if(xmlHttp === null)
    			  {
    			  alert("browser does not support XMLHTTP  request");
    			  return;
    			  }
    		  var url="upbrand2.jsp";
    		  url +="?count=" + str;
    		  xmlHttp.onreadystatechange = subcategoryChange;
    		  xmlHttp.open("GET",url,true);
    		  xmlHttp.send(null);
    	  }
    	  
    	  function subcategoryChange(){
    		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
    			  document.getElementById("subcategory").innerHTML = xmlHttp.responseText;
    			  
    		  }
    	  }      
    	 
      </script>
</head>
<body>
<form action="upbrand3.jsp" method="post">

   <table border="2" align="center" width="50%">
     <tr>
       <th align="center" bgcolor="darkblue" style="color:white" colspan="5">
         <h2>Select The Item and ItemModel</h2>
       </th>
     </tr> 
     
     <tr>
      <th align="right">Select category:</th>
      <td>
       <select name="category" onchange="showsubcategory(this.value)">
         <option value="none">Select category</option>
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
     </td>
     </tr>
  
    <tr>
    <th align="right">Select Model:</th>
    <td id="subcategory"><select name="subcategory">
      <option value="-1">Select ItemModel</option>
   </select>
   </td>
   </tr>
   
   </table>
   
 <center>
   
   <br>
   <br>
   <div style="position:relative;top:100px">
     <input type="submit" value="update"style="position:relative;top:0px;height:30px;width:100px;background:black;color:white;font-size:20px"/></center>
        </form>
    
   </center>
   </form>
<br><br>


<form action="itemmodel.jsp">
     
     <div style="position:relative;top:200px">
    <input type="submit" value="Back"style="position:relative;bottom:50px;height:30px;width:100px;font-size:20px">
    </div>
    </form>

</body>
</html>
