

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
 * Servlet implementation class BloodDonation1
 */
@WebServlet("/BloodDonation1")
public class BloodDonation1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodDonation1() {
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
			rs=st.executeQuery("select * from blood_donation");
			out.println("<font color=blue size=5><h2><center><B>BLOOD DONATION DETAILS</B></center></h2></font>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> Donor ID </th><th> Branch ID </th><th> Blood Group </th><th> Amount of blood (in ml) </th><th> Donation Date </th></tr>");
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(1)+" </td><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5));
			}
			out.println("</table></font>");
			
			out.println("<br><form action=\"bdindex.html\">"
				+"<center><input type=\"submit\" name=\"id\" value=\"Register Blood Donations\"></center></form>");
			out.println("<form action=\"aindex2.html\">"
					+ "<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>");
			out.println("<form action=\"aindex1.html\">" + 
					"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");	
				
			
		}catch(Exception ex) {
			
		}
	}

}
