

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
 * Servlet implementation class DeletePatient
 */
@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePatient() {
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
		int id=Integer.parseInt(request.getParameter("hiddenstr2"));
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			int i=st.executeUpdate("delete from patient where Id="+id);
			if(i>0) {
				out.println("<font color=magenta size=6>Patient with ID "+id+" successfully deleted</font>");
				out.println("<form action=\"aindex2.html\">" 
				+ "<br><input type=\"submit\" name=\"id\" value=\"Back\"></form>" 
			    + "<form action=\"aindex1.html\">"
				+ "<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
			}
			else {
				throw new Exception();
			}
			
		}catch(Exception ex) {
			
		}
	}

}
