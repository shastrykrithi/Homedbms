

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
 * Servlet implementation class BloodDonation
 */
@WebServlet("/BloodDonation")
public class BloodDonation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodDonation() {
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
		int j=0;
		PrintWriter out=response.getWriter();
		int did=Integer.parseInt(request.getParameter("did"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int amt=Integer.parseInt(request.getParameter("amt"));
		String bgp=request.getParameter("bgp");
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			String qry="Insert into blood_donation values(?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(qry);
			ps.setInt(1, did);
			ps.setInt(2, bid);
			ps.setString(3, bgp);
			ps.setInt(4, amt);
			java.sql.Date tdate=new java.sql.Date(new java.util.Date().getTime());
			ps.setDate(5, tdate);
			
			int k=ps.executeUpdate();
			
			if(k>0) {
			rs=st.executeQuery("select Tot_litres,Cost_litre from stocks where Branch_ids="+bid+" and Blood_gp='"+bgp+"'");
			boolean empty=true;
			//rs.next();
			while(rs.next()) {
				empty=false;
			}
			if(empty) {
				String query="Insert into stocks values(?,?,?,?,?)";
				PreparedStatement p=(PreparedStatement)con.prepareStatement(query);
				
				p.setInt(1, bid);
				p.setString(2, bgp);
				p.setInt(3, amt);
				p.setInt(4, 2500);
				p.setString(5, "no action");
				j=p.executeUpdate();	
			}
			else {
			int total=rs.getInt(1);
			int cost=rs.getInt(2);
			System.out.println(total+" "+cost);
			int tamt=total+amt;
			int i=st.executeUpdate("delete from stocks where Branch_ids="+bid+" and Blood_gp='"+bgp+"'");
			System.out.println(i);
			if(i>=0) {
				String query="Insert into stocks values(?,?,?,?,?)";
				PreparedStatement p=(PreparedStatement)con.prepareStatement(query);
				
				p.setInt(1, bid);
				p.setString(2, bgp);
				p.setInt(3, tamt);
				p.setInt(4, cost);
				p.setString(5, "no action");
				j=p.executeUpdate();
			}
			}
				if(j>0) {
					out.println("Successfully recorded");
					//out.println("<font color=red size=7><h3><center><b>Donor id is "+did+"</b></center></h3></font>");
					out.print("<form action=\"bdindex.html\">"
							+ "More donations to be recorded <input type=\"submit\" name=\"id\" value=\"Click here\"></form><br>"
							+ "<form action=\"aindex2.html\">"
							+"<br><input type=\"submit\" name=\"id\" value=\"Admin Homepage\"></form>"
							 +"<form action=\"index.html\">" 
								+"<input type=\"submit\" name=\"id\" value=\"Home Page\"></form>");
				}
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
	}

}
