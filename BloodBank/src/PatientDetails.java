

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;

/**
 * Servlet implementation class PatientDetails
 */
@WebServlet("/PatientDetails")
public class PatientDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		Cookie[] cks=request.getCookies();
		//PrintWriter pw=response.getWriter();
		/*for(int i=0;i<cks.length;i++) {
			pw.println("cookieName : "+cks[i].getName()+" cookieValue : "+cks[i].getValue());
		}*/
		System.out.println(cks[0].getValue());
		String bn=cks[0].getValue();
		Cookie[] ckloc=request.getCookies();
		String loc=ckloc[1].getValue();
		PrintWriter out=response.getWriter();
		String n=request.getParameter("pname");
		int age=Integer.parseInt(request.getParameter("page"));
		String addr=request.getParameter("paddr");
		String ph=request.getParameter("ptele");
		String bgp=request.getParameter("pbgp");
		String hissue=request.getParameter("phi");
		int amt=Integer.parseInt(request.getParameter("breq"));
		ResultSet rs,rs1,rs2;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from patient");
			rs.last();
			int pid=rs.getInt(1)+1;
			
			rs1=st.executeQuery("select Branch_id from branch where Name='"+bn+"'");
			rs1.next();
			int bid=rs1.getInt(1);
			rs2=st.executeQuery("select Tot_litres from stocks where Branch_ids="+bid+" and Blood_gp='"+bgp+"'");
			rs2.next();
			int total=rs2.getInt(1);
			int famt=(total-amt);
			int i=st.executeUpdate("update stocks set Tot_litres="+amt+" where Branch_ids="+bid+" and Blood_gp='"+bgp+"'");
			
			rs=st.executeQuery("select Action_req from stocks where Branch_ids="+bid+" and Blood_gp='"+bgp+"'");
			rs.next();
			if(rs.getString(1).equals("donation required")) {
				out.println("<font color=red size=7><h2><center><B>Requested amount of Blood more than the availability!!!</B></center></h2></font>");
				
				rs=st.executeQuery("select * from donor where Blood_gp='"+bgp+"'");
				out.println("<font color=blue size=5><h2><center><B>CONTACT FOLLOWING DONORS</B></center></h2></font>");
				out.println("<br><font size=5><table border=3 align=center><tr><th> Name </th><th> Address </th><th> Contact number </th><th> Blood Group </th></tr>");
				while(rs.next()) {
					out.println("<tr><td> "+rs.getString(2)+" </td><td> "+rs.getString(4)+" </td><td> "+rs.getString(5)+" </td><td> "+rs.getString(6)+" </td><tr>");
				}
				out.println("</table></font>");
				
				out.print("<form action=\"index1.html\">"
						+ "<input type=\"submit\" name=\"id\" value=\"Back\"></form>"
						+"<form action=\"index.html\">"
						+ "<input type=\"submit\" name=\"id\" value=\"Home Page\"></form>");
				
				throw new Exception("Organise blood donation camp");
			}
			
			String qry="Insert into patient values(?,?,?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(qry);
			ps.setInt(1, pid);
			ps.setString(2, n);
			ps.setInt(3, age);
			ps.setString(4, addr);
			ps.setString(5, ph);
			ps.setString(6, bgp);
			ps.setString(7, hissue);
			ps.executeUpdate();
			
			
			
				System.out.println("1 row updated");
				out.println("<br><h3>Patient id is "+pid+"</h3>");
				out.println("<br><font color=red size=6><center>");
				
				out.println("<br><B>Blood will be delivered within 1 hour by "+bn+" blood bank to "+loc+" location</B></center></font>");
			
			PreparedStatement ps1=(PreparedStatement)con.prepareStatement("insert into reports values(?,?,?,?,?)");
			ps1.setInt(1, pid);
			ps1.setInt(2, bid);
			ps1.setString(3, bgp);
			ps1.setInt(4, amt);
			java.sql.Date tdate=new java.sql.Date(new java.util.Date().getTime());
			/*String d=tdate.toString();
			StringBuffer td=new StringBuffer(d);
			td.reverse();*/
			
			ps1.setDate(5,tdate);
			ps1.executeUpdate();
			
			out.print("<form action=\"index1.html\">"
					+ "<input type=\"submit\" name=\"id\" value=\"Back\"></form>"
					+"<form action=\"index.html\">"
					+ "<input type=\"submit\" name=\"id\" value=\"Home Page\"></form>");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
