package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
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
	
	public UserBean getUser(int uid){
		ConnectionProvider provider = new ConnectionProvider();
		Connection con=provider.getCon();
		ResultSet rs = null;
		PreparedStatement pstmt = null ;
		UserBean userBean = null;
		try {
			pstmt = con.prepareStatement("Select * from employee where id=?");
			pstmt.setInt(1, uid);
			rs= pstmt.executeQuery();
			Boolean status=rs.next();
			if(status){
				userBean=createUserObj(rs);
			}
			
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}finally{
			try { if (rs != null) rs.close(); } catch (Exception e) {};
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
			try { if (con != null) con.close(); } catch (Exception e) {};
		}
		return userBean;
	}
	
	public static UserBean createUserObj(ResultSet rs){
		UserBean user = new UserBean();
		try {
			user.setId(rs.getString("id"));
			user.setEmail(rs.getString("email"));
			user.setName(rs.getString("name"));
			user.setBalance(rs.getString("balance"));
			user.setLastLogon(rs.getLong("lastLogonTime"));
			user.setImage(rs.getString("image"));
			user.setRole(rs.getString("role"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;

	}
}
