

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
 * Servlet implementation class DeleteDonor
 */
@WebServlet("/DeleteDonor")
public class DeleteDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDonor() {
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
		int id=Integer.parseInt(request.getParameter("hiddenstr"));
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			int i=st.executeUpdate("delete from donor where Id="+id);
			int j=st.executeUpdate("delete from blood_donation where Donor_id="+id);
			if(i>0 && j>0) {
				out.println("<font color=magenta size=6>Donor with ID "+id+" successfully deleted</font>");
				out.println("<form action=\"aindex2.html\">" 
				+ "<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>" 
			    + "<form action=\"aindex1.html\">"
				+ "<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
			}
			else {
				throw new Exception("No donations of donor found else cannot delete donor");
			}
		}catch(Exception ex) {
	
			ex.printStackTrace();
		}
	}

}
