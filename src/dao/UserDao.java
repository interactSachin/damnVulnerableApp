package dao;
import java.sql.*;

import javax.security.auth.login.CredentialExpiredException;

import util.UserUtil;
import bean.ConnectionProvider;
import bean.UserBean;
/**
 * @author Sachin
 *
 */
public class UserDao {
	ConnectionProvider provider = new ConnectionProvider();
	Connection con=provider.getCon();
	ResultSet rs = null;

	public UserBean validate(UserBean formUser) throws SQLException,CredentialExpiredException{

		UserBean userObj = null;
		Statement stmt= null; 

		boolean status=false;

		stmt = con.createStatement();
		//Vulnerability SQL Injection
		String query = "Select * from employee where BINARY email =\""+formUser.getEmail()+"\" and password =\""+formUser.getPassword()+"\"";
		ResultSet rs = stmt.executeQuery(query);
		status=rs.next();
		if(status){
			userObj= UserUtil.createUserObj(rs);

			if(userObj.getRole().equals("ceo")||userObj.getRole().equals("account")){
				return null;
			}

			if (formUser.getLastLogon() > userObj.getLastLogon()){
				String update="update employee set lastlogontime= " + formUser.getLastLogon() + " where name = \"" + userObj.getName()+"\"";
				stmt.executeUpdate(update);
				System.out.println("** User logged in: "+userObj.getName());
			}
			else 
				throw new CredentialExpiredException();



			try { if (rs != null) rs.close(); } catch (Exception e) {};
			try { if (stmt != null) stmt.close(); } catch (Exception e) {};
			try { if (con != null) con.close(); } catch (Exception e) {};
		}
		return userObj;
	}


	public ResultSet getUsers(){
		try{
			PreparedStatement pstmt = con.prepareStatement("select * from employee");
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}
		finally{
			//try { if (con != null) con.close(); } catch (Exception e) {};
		}
		return rs;
	}

}
