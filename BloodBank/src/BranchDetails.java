

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
 * Servlet implementation class BranchDetails
 */
@WebServlet("/BranchDetails")
public class BranchDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchDetails() {
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
			rs=st.executeQuery("select * from branch");
			out.println("<font color=blue size=5><h2><center><B>BRANCH DETAILS</B></center></h2></font>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> BRANCH ID </th><th> NAME </th><th> ADDRESS </th><th> CONTACT NUMBER </th></tr>");
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(1)+" </td><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td>"
						+ "</td><td><form action=\"DeleteBranch\" method=\"post\">"
						+ "<input type=\"hidden\" name=\"hiddenstr\" value="+rs.getInt(1)+">"
						+ "<input type=\"submit\" name=\"id\" value=\"Delete\"></form></td>"
						+ "<td><form action=\"ModifyBranch\" method=\"post\">"
						+ "<input type=\"hidden\" name=\"hiddenstr1\" value="+rs.getInt(1)+">"
						+ "<input type=\"submit\" name=\"id\" value=\"Modify\"></form></td>"
						+ "<td><form action=\"Stocks\" method=\"post\">" 
						+ "<input type=\"hidden\" name=\"hiddenstr2\" value="+rs.getInt(1)+">"
						+"<input type=\"submit\" name=\"id\" value=\"Check Stock\"></form></td><tr>");
			}
			out.println("</table></font>");
			
			out.println("<form action=\"abindex.html\">"
					+ "<center><br><input type=\"submit\" name=\"id\" value=\"Add Branch\"></center></form>");
			out.print("<form action=\"aindex2.html\">"
					+"<center><br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></center></form>"
					 +"<form action=\"aindex1.html\">" 
						+"<center><br><input type=\"submit\" name=\"id\" value=\"Logout\"></center></form>");
		}catch(Exception ex) {
			
		}
	}

}
