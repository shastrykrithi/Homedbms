

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
 * Servlet implementation class ModifyBranch1
 */
@WebServlet("/ModifyBranch1")
public class ModifyBranch1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBranch1() {
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
		System.out.println(n);
		String addr=request.getParameter("baddr");
		String ph=request.getParameter("bph");
		int id=Integer.parseInt(request.getParameter("hiddenstr"));
		System.out.println(id);
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String qry="update branch set Name='"+n+"',Address='"+addr+"',Contact_no='"+ph+"' where Branch_id="+id;
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(qry);
			
			int i=ps.executeUpdate();
			if(i>0) {
			out.println("Successfully Modified");
			//out.println("<font color=red size=7><h4><b>Donor id is "+did+"</b></h4></font>");
			out.print("<form action=\"aindex2.html\">"
					+"<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					+ "<form action=\"aindex1.html\">" 
					+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form>");
			}
		}catch(Exception ex) {
			
		}
	}

}
