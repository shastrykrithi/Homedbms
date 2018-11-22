

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;

/**
 * Servlet implementation class AddDonor
 */
@WebServlet("/AddDonor")
public class AddDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDonor() {
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
		String n=request.getParameter("dname");
		int age=Integer.parseInt(request.getParameter("dage"));
		String addr=request.getParameter("daddr");
		String ph=request.getParameter("dtele");
		String bgp=request.getParameter("dbgp");
		ResultSet rs;
		
		try {
			
			if(age<18) {
				out.println("<font color=red size=3>Age cannot be less than 18<br><br>Donor with age less than 18 cannot donate</font>");
				
				out.print("<br><br><form action=\"dindex.html\">"
						+ "More donors to be added <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
						+ "<form action=\"aindex2.html\">"
						+"<input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
						+ "<form action=\"aindex1.html\">" 
						+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
				
				throw new Exception("donor is not valid");
			}
			else if(age>=60){
				out.println("<font color=red size=3>Age cannot be more than 60<br><br>Donor with age more than 60 cannot donate</font>");
				
				out.print("<br><br><form action=\"dindex.html\">"
						+ "More donors to be added <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
						+ "<form action=\"aindex2.html\">"
						+"<input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
						+ "<form action=\"aindex1.html\">" 
						+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
				
				throw new Exception("donor is not valid");
			}
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from donor");
			rs.last();
			int did=rs.getInt(1)+1;
			String qry="Insert into donor values(?,?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(qry);
			ps.setInt(1, did);
			ps.setString(2, n);
			ps.setInt(3, age);
			ps.setString(4, addr);
			ps.setString(5, ph);
			ps.setString(6, bgp);
			ps.executeUpdate();
			
			out.println("Successfully added");
			out.println("<font color=red size=7><h4><b>Donor id is "+did+"</b></h4></font>");
			out.print("<form action=\"dindex.html\">"
					+ "More donors to be added <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
					+ "<form action=\"aindex2.html\">"
					+"<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					+ "<form action=\"aindex1.html\">" 
					+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
		}catch(Exception ex) {
			
		}
	}

}
