

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import javax.servlet.http.*;
import com.mysql.jdbc.Driver;

/**
 * Servlet implementation class BloodDetails
 */
@WebServlet("/BloodDetails")
public class BloodDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodDetails() {
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
		ResultSet rs=null;
		String s=null;
		PrintWriter out=response.getWriter();
		String bld=request.getParameter("bgp");
		String bloc=request.getParameter("loc");
		//System.out.println(bld);
		//System.out.println(bloc);
			/*try {
				Class.forName("com.mysql.jdbc.Driver");
			}catch(Exception e) {out.print("barthilla");}*/
			try {
				//Connection con=null;
				//String path="jdbc:mysql://localhost:3306/bloodbank";
				//String username="root";
				//String password="root";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");				Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				
				rs=st.executeQuery("Select stocks.Blood_gp,branch.Name,branch.Address,branch.Contact_no,stocks.Tot_litres,stocks.Cost_litre"
				+" from stocks,branch where stocks.Blood_gp='"+bld+"' and stocks.Branch_ids=branch.Branch_id");
			
			
			
				
				out.println("<font color=blue size=5><h2><center><B>BRANCH DETAILS</B></center></h2></font>");
				out.println("<br><font size=5><table border=3 align=center><tr><th> Branch Name </th><th> Branch Address </th><th> Branch Contact number </th><th> Cost per litre </th></tr>");
				while(rs.next()) {
					out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(6)
							+" </td><td><form action=\"index2.html\">" 
							+ "<input type=\"hidden\" name=\"hiddenstr\" value="+rs.getString(1)+">" 
							+ "<input type=\"submit\" name=\"id\" value=\"Request blood\"></form></td></tr>");
					s=rs.getString(2);
				}
				out.println("</table></font>");
				rs=st.executeQuery("select * from donor where Blood_gp='"+bld+"'");
				out.println("<font color=blue size=5><h2><center><B>DONOR DETAILS</B></center></h2></font>");
				out.println("<br><font size=5><table border=3 align=center><tr><th> Name </th><th> Address </th><th> Contact number </th><th> Blood Group </th></tr>");
				while(rs.next()) {
					out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><td> "+rs.getString(6)+" </td><tr>");
				}
				out.println("</table></font>");
				
				
				out.println("</table></font>");
				out.println("<br><form action=\"index1.html\">"
					+"<center><input type=\"submit\" name=\"id\" value=\"Back\"></center></form>");
				
				//s=rs.getString(2);
	}catch(Exception ex) {
		//out.println("sorry");
		ex.printStackTrace();
	}
			Cookie ck=new Cookie("bname",s);
			response.addCookie(ck);
			Cookie cloc=new Cookie("loc",bloc);
			response.addCookie(cloc);
			

}
	
}
