

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
 * Servlet implementation class ModifyPatient
 */
@WebServlet("/ModifyPatient")
public class ModifyPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyPatient() {
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
		int id=Integer.parseInt(request.getParameter("hiddenstr4"));
		PrintWriter out=response.getWriter();
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from patient where Id="+id);
			out.println("<font color=blue size=5><h2><center><B>PATIENT DETAILS</B></center></h2></font>");
			out.println("<font color=red size=3><B>Patient id : "+id+"</B></font><br><br>");
			//out.println("<br><font size=5><table border=3 align=center><tr><th> Name </th><th> Age </th><th> Address </th><th> Contact number </th><th> Blood Group </th></tr>");
			while(rs.next()) {
				out.println("<html><body><form action=\"ModifyPatient1\" method=\"post\">");
				out.println("Name : <input type=\"text\" name=\"hpname\" value="+rs.getString(2)+">");
				out.println("<br><br>Age : <input type=\"text\" name=\"hpage\" value="+rs.getInt(3)+">");
				out.println("<br><br>Adddress : <input type=\"text\" name=\"hpaddr\" value="+rs.getString(4)+">");
				out.println("<br><br>Contact no. : <input type=\"text\" name=\"hpph\" value="+rs.getString(5)+">");
				out.println("<br><br>Blood Group : <input type=\"text\" name=\"hpbgp\" value="+rs.getString(6)+">");
				out.println("<br><br>Health Issue : <input type=\"text\" name=\"hphi\" value="+rs.getString(7)+">");

				out.println("<br>"
						+"<center><input type=\"hidden\" name=\"hiddenstr\" value="+id+">"
						+ "<input type=\"submit\" name=\"id\" value=\"Modify Details\"></center></form>");
					
			}
			out.println("</body></html>");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
