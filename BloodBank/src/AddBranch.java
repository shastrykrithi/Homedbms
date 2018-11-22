

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
 * Servlet implementation class AddBranch
 */
@WebServlet("/AddBranch")
public class AddBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBranch() {
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
		String n=request.getParameter("bname");
		String addr=request.getParameter("baddr");
		String ph=request.getParameter("btele");
		System.out.println(n+" "+addr+" "+ph);
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from branch");
			rs.last();
			int bid=rs.getInt(1)+1;
			st.executeUpdate("Insert into branch values('"+bid+"','"+n+"','"+addr+"','"+ph+"');");
			out.println("Successfully added");
			out.println("<font color=red size=7><h4><b>Branch id is "+bid+"</b></h4></font>");
			out.print("<form action=\"abindex.html\">"
					+ "More branches to be added <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
					+ "<form action=\"aindex2.html\">"
					+"<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					+ "<form action=\"aindex1.html\">" 
					+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
			
		}catch(Exception e) {
			
		}
	}

}
