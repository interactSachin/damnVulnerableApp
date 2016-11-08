package dao;
import java.sql.*;

import javax.security.auth.login.CredentialExpiredException;

import bean.ConnectionProvider;
import bean.UserBean;
/**
 * @author Sachin
 *
 */
public class PrivilegedUser {
	ConnectionProvider provider = new ConnectionProvider();
	Connection con=provider.getCon();
	ResultSet rs = null;

	public UserBean validate(UserBean formUser) throws CredentialExpiredException{

		UserBean userObj = null;
		PreparedStatement pstmt = null;
		try{
			boolean status=false;

		
			pstmt = con.prepareStatement("Select * from employee where BINARY email=? and password=?");
			pstmt.setString(1, formUser.getEmail());
			pstmt.setString(2, formUser.getPassword());
			ResultSet rs =pstmt.executeQuery();
			status=rs.next();


			Statement stmt = con.createStatement();
			if(status){
				userObj= createUserObj(rs);
				if (formUser.getLastLogon() > userObj.getLastLogon()){
					String update="update employee set lastlogontime= " + formUser.getLastLogon() + " where name = \"" + userObj.getName()+"\"";
					stmt.executeUpdate(update);
					System.out.println("****** CEO/Account Logged in"+ userObj.getName());
				}
				else 
					throw new CredentialExpiredException();
			}
		}catch(SQLException e){
			System.out.println(e.getStackTrace());
		}
		finally{
			try { if (rs != null) rs.close(); } catch (Exception e) {};
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
			try { if (con != null) con.close(); } catch (Exception e) {};
		}
		return userObj;
	}

	private UserBean createUserObj(ResultSet rs){
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

	public ResultSet getUsers(){
		try{
			PreparedStatement pstmt = con.prepareStatement("select * from employee");
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}
		return rs;
	}
}
