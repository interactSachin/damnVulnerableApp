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
	
	public ResultSet getCommentObjByReciever(UserBean user){
		try{
			String userEmail = user.getEmail();
			PreparedStatement pstmt = con.prepareStatement("select * from publicWall where reciever =?");
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
			pstmt.setString(2, comment.getSenderId());
			pstmt.setString(3, comment.getReciever());
			pstmt.executeUpdate();
			System.out.println(comment.getSenderId()+" commented on "+comment.getReciever());
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
	
	public static CommentBean createCommentObj(ResultSet rs){
		CommentBean cmntObj = new CommentBean();
		try {
			cmntObj.setComment(rs.getString("comment"));
			cmntObj.setCommentId(rs.getString("cmtId"));
			cmntObj.setSenderId(rs.getString("sendeId"));
			cmntObj.setReciever(rs.getString("reciever"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cmntObj;

	}
	
	public void flushCommentByUser(String reciever){
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement("Delete from testdb.publicwall where reciever= ?");
			pstmt.setString(1, reciever);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
