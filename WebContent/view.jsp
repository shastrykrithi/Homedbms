<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee summary</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="js/jspdf.js"></script>
    <script type="text/javascript" src="js/from_html.js"></script>
    <script type="text/javascript" src="js/split_text_to_size.js"></script>
    <script type="text/javascript" src="js/standard_fonts_metrics.js"></script>
    <script type="text/javascript" src="js/cell.js"></script>
    <script type="text/javascript" src="js/FileSaver.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {

            $("#exportpdf").click(function() {
                var pdf = new jsPDF('p', 'pt', 'a2');
                
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                source = $('#yourTableIdName')[0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme' : function(element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top : 80,
                    bottom : 60,
                    left : 100,
                 	width:700,
                    
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(source, // HTML string or DOM elem ref.
                margins.left, // x coord
                margins.top, { // y coord
                    'width' : margins.width, // max width of content on PDF
                    'elementHandlers' : specialElementHandlers
                },

                function(dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('Employee Report.pdf');
                }, margins);
            });

        });
    </script>

<style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    /* The image used */
     background-image:url(im.jpg);

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
     border: 2px solid black;
}
table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
table {
    border-spacing: 15px;
}
form {
    width: 180px;
    margin: 0 auto;
}
</style>
</head>
<body>

<div id="yourTableIdName">
<div class="bg">
<body>
<style>
body {
    background-image:url(im.jpg);
}

</style>
<centre>

<table border="2" align="center" width=100% height=100%>
   <tr>
        <td><b>ItemName</b></td>
        <td><b>ModelName</b></td>
        <td><b>BrandName</b></td>
        <td><b>Price</b></td>
        <td><b>Quantity</b></td>
   </tr>
<%
   ResultSet rs =null;
   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL = "jdbc:mysql://localhost/homedbms";
   
   final String USER = "root";
   final String PASS = "root";

   Connection conn = null;
   Statement stmt = null;
   try
   {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
         rs= stmt.executeQuery("select * from item_table i,itemmodel_table m,itembrand_table b where i.itemid=m.itemid and m.itemmodelid=b.itemmodelid");
        while(rs.next())
        {
        	        %>
        	
        	        
            <tr>
              <td><%=rs.getString("itemname")%></td>    
                <td><%=rs.getString("itemmodelname")%></td>    
            <td><%=rs.getString("brandname")%></td>    
             <td><%=rs.getInt("prize")%></td>  
              <td><%=rs.getInt("bquantity")%></td>
              </tr>
            
           
                <%

        }
        %>
           </table>
           <br><br>

           
             <%
   }
   catch(Exception e)
   {
        out.println("wrong entry"+e);
   }

%>
<br><br>
<center>
        <input type="button" id="exportpdf" value="Download PDF" style="height:30px; width:150px">

<br><br>
</centre>
<p style="font:25px";>
<form action="edit.jsp">
<centre>
<input type="submit" value="back"style="height:40px;width:130px;font-size:20px">
</centre>
</form>

<br>
<br>


</body>
</html>