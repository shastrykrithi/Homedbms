

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Stocks
 */
@WebServlet("/Stocks")
public class Stocks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stocks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		
		int bid=Integer.parseInt(request.getParameter("hiddenstr2"));
		
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from stocks where Branch_ids="+bid);
			out.println("<font color=blue size=5><h2><center><B>BRANCH STOCKS</B></center></h2></font>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> BLOOD GROUPS </th><th> TOTAL LITRES (in ml)</th><th> COST PER LITRE </th><th> ACTION REQUIRED </th></tr>");
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><tr>");
			}
			out.println("</table></font>");
			out.print("<center><br><form action=\"aindex2.html\">"
					+"<input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					 +"<form action=\"aindex1.html\">" 
						+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form></center>");
		}catch(Exception ex) {
			
		}
	}

}
