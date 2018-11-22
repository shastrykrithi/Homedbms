<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Register</title>
      <script>  
  function isEmpty(){  
     var data=document.getElementById("name").value;  
     if(data.length==0){  
       alert("Name is required");  
       return false;  
     }  
     return true;  
  }
  
  
  
  
  
  function checkEmail() {
    var email = document.getElementById('txtEmail');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 }
}
</script>  
    </head>
    <body>
    <center> <h3 style="margin-top:40px;">User Registration Form</h3></center><hr style="width:400px;">
    <center> 
        <form method="post" action="login1.jsp"    >
            <table style="border:0px solid white;border-radius:12px;background-color: grey;margin-top: 30px; ">
            <tr><td> User Name  </td><td> <input type="text" name="t1" class="btn"  ></td></tr>
            <tr><td>email</td><td><input type="text" name="t2" class="btn" id='txtEmail'></td></tr>
            <tr><td>Password</td><td><input type="password" name="t3" class="btn"></td></tr>
            <tr><td>Mobile Number</td><td><input type="text" name="t4" class="btn"></td></tr>
            <tr><td>Address1</td><td> <textarea row="42" col="30" type="text" name="t5" class="btn"></textarea></td></tr>
            <tr><td>Address2</td><td> <textarea row="42" col="30" type="text" name="t6" class="btn"></textarea></td></tr>
           <tr><td>city</td><td><input type="text" name="t7" class="btn"></td></tr>
           <tr><td></td><td> <input type="submit" value="Register" class="btn"       onclick="Javascript:checkEmail();"></td></tr>
            </table>
        </form>
        <hr style="width:400px;">
    </center>
        
        <%
        Connection conn = null;
  	   Statement stmt = null;
        try{
     // JDBC driver name and database URL
 	   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 	   final String DB_URL = "jdbc:mysql://localhost/homedbms";

 	   //  Database credentials
 	   final String USER = "root";
 	   final String PASS = "root";
 	   
 	  String username,password,email,address1,address2,city,phone;
 	 HttpServletRequest req=null;
 	  username=request.getParameter("t1");
 	 email=request.getParameter("t2");
 	password=request.getParameter("t3");
 	phone=request.getParameter("t4");
 	address1=request.getParameter("t5");
 	address2=request.getParameter("t6");
 	city=request.getParameter("t7");
 	
 	   
 	   try{
 	      //STEP 2: Register JDBC driver
 	      Class.forName("com.mysql.jdbc.Driver");

 	      //STEP 3: Open a connection
 	      System.out.println("Connecting to database...");
 	      conn = DriverManager.getConnection(DB_URL,USER,PASS);

 	      //STEP 4: Execute a query
 	      System.out.println("Creating statement...");
 	      stmt = conn.createStatement();
 	      
 	     
 	      
 	      stmt.executeUpdate("INSERT INTO contact_table(username,password,email,ph_no,address1,address2,city)"+"values('"+username+"','"+password+"','"+email+"','"+phone+"','"+address1+"','"+address2+"','"+city+"')");

 	      
 	      
 	    
 	      
 	      /*sql="INSERT INTO usertable (name, username, password)"+"VALUES(?,?,?)";
 	      PreparedStatement pst=conn.prepareStatement(sql);
 	    		  
 	    		  
 	      pst.setString(1, usr.getName());
 	      pst.setString(2, usr.getUsername());
 	      pst.setString(3, usr.getPassword());
 	      pst.executeUpdate();*/
 	      
 	      /*sql="INSERT INTO usertable (name, username, passwoed)"+"VALUES(usr.getName(), usr.getUsername(), usr.getPassword())";
 	      stmt.executeUpdate(sql);	    */  
 	      System.out.println("Success");
 	      //ResultSet rs = stmt.executeUpdate(sql);

 	      //STEP 5: Extract data from result set
 	     /* if(rs.next()){
 	        f=true;
 	      }
 	      else
 	      {
 	    	  f=false;
 	         
 	      }*/
 	      //STEP 6: Clean-up environment
 	      //rs.close();
 	     // pst.close();
 	      stmt.close();
 	      conn.close();
 	   }catch(SQLException se){
 	      //Handle errors for JDBC
 	      se.printStackTrace();
 	   }
        }catch(Exception e){
 	      //Handle errors for Class.forName
 	      e.printStackTrace();
 	   }finally{
 	      //finally block used to close resources
 	      try{
 	         if(stmt!=null)
 	            stmt.close();
 	      }catch(SQLException se2){
 	      }// nothing we can do
 	      try{
 	         if(conn!=null)
 	            conn.close();
 	      }catch(SQLException se){
 	         se.printStackTrace();
 	      }//end finally try
 	   }//end try
 	   
 	
 	   
 	   //end JDBCSample


 
        %>
        
    
    <div style="margin-top: 200px;">
     
        </div>
</body>
</html>
