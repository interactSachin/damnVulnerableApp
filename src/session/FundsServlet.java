package session;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ConnectionProvider;
import bean.UserBean;

/**
 * @author Sachin
 *
 */
public class FundsServlet extends HttpServlet { 
	PrintWriter out;
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
		resp.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		resp.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward 

		resp.setContentType("text/html");
		String to= req.getParameter("beneficiary");
		HttpSession session = req.getSession();

		req.getRequestDispatcher("transferFunds.jsp").include(req, resp);

		UserBean user = (UserBean) session.getAttribute("user");

		if(null!= user){
			String from= user.getEmail();
			String amount = req.getParameter("amount");
			String newBalance= transferFund(user, to, amount);
			if(null!=newBalance){
				user.setBalance(newBalance);
				session.setAttribute("user", user);
				out=resp.getWriter(); 
				String redirect;
				if(user.getName().equalsIgnoreCase("admin"))
					redirect="adminProfile.jsp";
				if(user.getName().equalsIgnoreCase("account"))
					redirect="accountProfile.jsp";
				else
					redirect="/HackMe/profile.jsp";

				out.println("Transfer Successfull!!<br><a href="+redirect+"><h3>Go to Profile</h3></a>");
				}
			else
				out.println("Insufficient Balance/Invalid beneficiary, try again.");
		}
		out.close();
	}

	String transferFund(UserBean user, String to, String amount) {
		
		Connection con= null;
		try {
			ConnectionProvider provider = new ConnectionProvider();
			con = provider.getCon();
			int remainingBalance;
			PreparedStatement pstmt = con.prepareStatement("SELECT balance from employee where email=?");
			pstmt.setString(1, user.getEmail());
			ResultSet rs = pstmt.executeQuery();
			int balance=0;
			while (rs.next()){
				balance= rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			PreparedStatement pstmt2 = con.prepareStatement("SELECT balance from employee where email=?");
			pstmt2.setString(1, to);
			ResultSet rs2 = pstmt2.executeQuery();
			int beneficiaryBalance=0;
			while (rs2.next()){
				beneficiaryBalance= rs2.getInt(1);
			}
			rs2.close();
			pstmt2.close();
			boolean isValidEmail= isValideEmail(to);
			if(!(Integer.parseInt(amount)>balance) && isValidEmail){
				PreparedStatement deductPstmt = con.prepareStatement("UPDATE employee SET balance=? WHERE email=?");
				deductPstmt.setInt(1, (balance-Integer.parseInt(amount)));
				deductPstmt.setString(2, user.getEmail());
				deductPstmt.executeUpdate();
				remainingBalance= balance-Integer.parseInt(amount);
				user.setBalance(String.valueOf(remainingBalance));

				PreparedStatement creditPstmt = con.prepareStatement("UPDATE employee SET balance=? WHERE email=?");
				beneficiaryBalance+=Integer.parseInt(amount);
				creditPstmt.setInt(1, (beneficiaryBalance));
				creditPstmt.setString(2, to);
				creditPstmt.executeUpdate();
				//creditPstmt.close();
			}
			else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		    try { if (con != null) con.close(); } catch (Exception e) {};
		}
		//truncate comment wall if attack succeeds to avoid unnecessary requests
		if(user.getRole().equalsIgnoreCase("account")){
			String deleteQuery = "delete FROM testdb.publicwall WHERE comment like '%\"http://10.95.104.79:8080/HackMe/transferFunds?beneficiary=%'";
			Statement stmt =null;
			try {
				ConnectionProvider provider = new ConnectionProvider();
				con = provider.getCon();
				stmt= con.createStatement();
				 stmt.executeUpdate(deleteQuery);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try { if (stmt != null) stmt.close(); } catch (Exception e) {};
				try { if (con != null) con.close(); } catch (Exception e) {};
			}
			
			
		}
		return user.getBalance();
	}
	
	private boolean isValideEmail(String email){
		
		Statement stmt;
		boolean status=false;
		Connection con= null;
		try {
			ConnectionProvider provider = new ConnectionProvider();
			con = provider.getCon();
			stmt = con.createStatement();
			String query = "Select * from employee where BINARY email=\""+email+"\"";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			status=rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
}
