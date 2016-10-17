package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.CommentBean;
import bean.ConnectionProvider;
import bean.UserBean;

/**
 * @author Sachin
 *
 */
public class CommentDao {
	ResultSet rs = null;
	ConnectionProvider provider = new ConnectionProvider();
	Connection con = provider.getCon();
	public ResultSet getComments(){
		try{
			PreparedStatement pstmt = con.prepareStatement("select comment from publicWall");
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}
		return rs;
	}
	
	public ResultSet getCommentsByReciever(UserBean user){
		try{
			String userEmail = user.getEmail();
			PreparedStatement pstmt = con.prepareStatement("select comment from publicWall where reciever =?");
			pstmt.setString(1, userEmail);
			
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			System.out.println(e.getStackTrace());
		}
		return rs;
	}
	public void addComment(CommentBean comment){
		PreparedStatement pstmt = null;
		try {
			//Vulnerability Cross Site Scripting input not sanitized
			pstmt = con.prepareStatement("INSERT INTO publicwall ( comment, senderId, reciever ) VALUES ( ?, ?, ?)");
			pstmt.setString(1, comment.getComment());
			pstmt.setString(2, comment.getUserId());
			pstmt.setString(3, comment.getReciever());
			pstmt.executeUpdate();
			System.out.println(comment.getUserId()+" commented on "+comment.getReciever());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			  try { if (rs != null) rs.close(); } catch (Exception e) {};
			    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
			    try { if (con != null) con.close(); } catch (Exception e) {};
		}
	
	}
}
