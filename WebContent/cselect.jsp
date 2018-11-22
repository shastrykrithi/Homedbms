<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>SELECT</title>
      <style>
body {
    background-color: lightblue;
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
    		  var url="cselect1.jsp";
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
<form action="cbrand.jsp" method="get">
<%
         String username=request.getParameter("user");
         %>
         <input name="username" type="hidden" value=""/>
   <table border="2" align="center" width="50%">
     <tr>
       <th align="center" bgcolor="darkblue" style="color:white" colspan="5">
         <h2>Select The Item</h2>
       </th>
     </tr> 
     
     <tr>
      <th align="right">Select Item:</th>
      <td>
       <select name="category" onchange="showsubcategory(this.value)">
         <option value="none">Select category</option>
         
         
         
         <%
        // out.println("                                                     "+username);
         Class.forName("com.mysql.jdbc.Driver").newInstance();
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
     <th align="right">Select Item:</th>
    <td id="subcategory"><select name="subcategory">
      <option value="-1">Select ItemModel</option>
   </select>
   </td>
   </tr>
  
      <%
   String subcategoryid=request.getParameter("subcategory");
   %>
   
  <centre>
     <input type="submit" value="Submit"style="position:relative;top:300px;left:550px;height:30px;width:100px;background:black;color:white;font-size:20px"/></center>
        </form>
   </centre>    
        
 
   </form>
    <form action="clogin.jsp">
     
     <centre>
    <input type="submit" value="Back"style="position:relative;top:380px;left:450px;height:30px;width:100px;font-size:20px">
    </div>
    </centre>
    </form>
<br><br>
</body>
</html>