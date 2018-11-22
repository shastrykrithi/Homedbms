

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
 * Servlet implementation class SStocks
 */
@WebServlet("/SStocks")
public class SStocks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SStocks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		int branch=Integer.parseInt(request.getParameter("branchid"));
		System.out.println(branch);
		ResultSet rs,rs1;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs1=st.executeQuery("select * from branch where Branch_id="+branch);
			rs1.next();
			String branchid=rs1.getString(2);
			rs=st.executeQuery("select * from stocks where Branch_ids="+branch);
			out.println("<font color=blue size=5><h2><center><B>BRANCH STOCKS</B></center></h2></font>");
			out.println("<font color=red size=5>Branch Name : "+branchid+"</font><br><br>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> BLOOD GROUPS </th><th> TOTAL LITRES (in ml)</th><th> COST PER LITRE </th><th> ACTION REQUIRED </th></tr>");
			
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><tr>");
				
			}
			out.println("</table></font>");
			out.print("<br><br><center><form action=\"stocks.jsp\">"
					+ "To check other branch stocks <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
					+ "<form action=\"aindex2.html\">"
					+"<input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					 +"<form action=\"aindex1.html\">" 
						+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form></center>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		String branch=request.getParameter("branchname");
		System.out.println(branch);
		ResultSet rs,rs1;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs1=st.executeQuery("select * from Branch where Name=\""+branch+"\"");
			rs1.next();
			int branchid=rs1.getInt(1);
			rs=st.executeQuery("select * from stocks where Branch_ids="+branchid);
			out.println("<font color=blue size=5><h2><center><B>BRANCH STOCKS</B></center></h2></font>");
			out.println("<font color=red size=5>Branch id "+branchid+"</font><br><br>");
			out.println("<br><font size=5><table border=3 align=center><tr><th> BLOOD GROUPS </th><th> TOTAL LITRES (in ml)</th><th> COST PER LITRE </th><th> ACTION REQUIRED </th></tr>");
			
			while(rs.next()) {
				out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(3)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><tr>");
				
			}
			out.println("</table></font>");
			out.print("<br><br><center><form action=\"stocks.jsp\">"
					+ "To check other branch stocks <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
					+ "<form action=\"aindex2.html\">"
					+"<input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
					 +"<form action=\"aindex1.html\">" 
						+"<input type=\"submit\" name=\"id\" value=\"Logout\"></form></center>");
		}catch(Exception e) {
			
		}
	}

}
