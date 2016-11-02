package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.ConnectionProvider;
import bean.UserBean;

public class UserUtil {
	
	public int getLiveSalary(UserBean user){
		ConnectionProvider provider = new ConnectionProvider();
		Connection con=provider.getCon();
		ResultSet rs = null;
		PreparedStatement pstmt = null ;
		int salary = 0;
		try {
			pstmt = con.prepareStatement("Select balance from testdb.employee where BINARY email=?");
			pstmt.setString(1, user.getEmail());
			rs = pstmt.executeQuery();
			rs.next();
			salary= rs.getInt(1);
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}finally{
			try { if (rs != null) rs.close(); } catch (Exception e) {};
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
			try { if (con != null) con.close(); } catch (Exception e) {};
		}
		return salary;
	}
}
