

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
 * Servlet implementation class Reports
 */
@WebServlet("/Reports")
public class Reports extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reports() {
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
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from reports");
			out.println("<font color=blue size=5><h2><center><B>REPORTS</B></center></h2></font>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> PATIENT ID </th><th> BRANCH ID </th><th> BLOOD GROUPS </th><th> AMOUNT OF BLOOD (in ml) </th><th> DATE OUT </th></tr>");
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(1)+" </td><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><tr>");
			}
			out.println("</table></font>");
			out.print("<br><form action=\"rindex.html\">"
					+"<center><input type=\"submit\" name=\"id\" value=\"Back\"></center></form>");
			out.println("<form action=\"aindex2.html\">"
					+ "<center><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></center></form>");
			out.println("<form action=\"aindex1.html\">" 
						+"<center><input type=\"submit\" name=\"id\" value=\"Logout\"></center></form>");
		}catch(Exception ex) {
			
		}
	}

}
