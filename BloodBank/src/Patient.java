

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Patient
 */
@WebServlet("/Patient")
public class Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Patient() {
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
		//int count=0;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from patient");
			out.println("<font color=blue size=5><h2><center><B>PATIENT DETAILS</B></center></h2></font>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> Name </th><th> Age </th><th> Address </th><th> Contact number </th><th> Blood Group </th><th> Health issue </th></tr>");
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><td> "+rs.getString(6)+"</td><td> "+rs.getString(7)
				+ "</td><td><form action=\"DeletePatient\" method=\"post\">"
				+ "<input type=\"hidden\" name=\"hiddenstr2\" value="+rs.getInt(1)+">"
				+ "<input type=\"submit\" name=\"id\" value=\"Delete\"></form></td>"
				+ "<td><form action=\"ModifyPatient\" method=\"post\">"
				+ "<input type=\"hidden\" name=\"hiddenstr4\" value="+rs.getInt(1)+">"
				+ "<input type=\"submit\" name=\"id\" value=\"Modify\"></form></td><tr>");
				//count++;
			}
			out.println("</table></font>");
			
			String qry="{call countProc1}";
			//CallableStatement cs=(CallableStatement)con.prepareCall(qry);
			//cs.registerOutParameter(1, Types.INTEGER);
			ResultSet rs1=st.executeQuery(qry);
			rs1.next();
			int count=rs1.getInt(1);
			//cs.execute();
			out.println("<br><font color=red size=4><b>Number of Patients = "+count+"<b></font>");
			
			out.println("<form action=\"aindex2.html\">"
					+ "<center><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></center></form>");
			out.println("<form action=\"aindex1.html\">" 
					+"<center><input type=\"submit\" name=\"id\" value=\"Logout\"></center></form>");
				
		}catch(Exception ex) {
			
		}
	}

}
