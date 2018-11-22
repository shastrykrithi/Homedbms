

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
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homepage() {
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
		String name=request.getParameter("nme");
		String pwd=request.getParameter("pwd");
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from admin_login where Username='"+name+"'");
			
			/*while(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					out.println("Successfully logged in");
					out.println("<form action=\"aindex2.html\"><input type=\"submit\" value=\"Homepage\"></form>");
				}
				else {
					out.println("Username and Password does not match");
					out.println("<form action=\"aindex1.html\"><input type=\"submit\" value=\"Login Form\"></form>");
				}
			}*/
			
			boolean records=rs.next();
			if(!records) {
				out.println("<font color=red size=4>");
				out.println("Admin "+name+" does not exists");
				out.println("<br>Login through a valid admin username and password</font>");
				out.println("<br><br><form action=\"aindex1.html\"><input type=\"submit\" value=\"Login Form\"></form>");
				throw new Exception();
			}
			else {
				do {
					if(rs.getString(2).equals(pwd)) {
						out.println("<h2>Successfully logged in</h2>");
						out.println("<br><form action=\"aindex2.html\"><input type=\"submit\" value=\"Admin Homepage\"></form>");
					}
					else {
						out.println("<h2>Username and Password does not match</h2>");
						out.println("<br><form action=\"aindex1.html\"><input type=\"submit\" value=\"Login Form\"></form>");
					}
				}while(rs.next());
			}
			
		}catch(Exception ex) {
			
		}
	}

}
