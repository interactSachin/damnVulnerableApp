<%@page import="util.UserUtil"%>
<%@page import="javax.security.auth.login.CredentialExpiredException"%>
<%@page import="bean.UserBean"%>
<%@page import="dao.CommentDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
p.small {
    line-height: 0.7;
}

p.big {
    line-height: 1.8;
}
</style>
</head>
<body><p class="small">
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward 
UserBean user= (UserBean)request.getSession().getAttribute("user");
if(null != user){
CommentDao commentDao = new CommentDao();
	ResultSet rs = commentDao.getCommentObjByReciever(user);
	//Vulnerability 2
	while(rs.next()){%>
	<br><br><tr><td><%UserUtil userUtil = new UserUtil();%> 
	<%=userUtil.getUser(rs.getInt("senderId")).getName()+ "</td>"	%> Says:
	<%=rs.getString("comment")+ "</td>"	%>
	
	
	<%} %>
	</p><form action="commentProcess.jsp" method="post">
	<input type="text" name="comment" style="width: 358px; height: 139px; maxlength="128" placeholder="Message">
	<br><input type="text" name="reciever" style="width: 200px; height: 20px; maxlength="25" placeholder="To">
	<br><input type="submit" value="Comment">
	<input type="submit" name="Flush Inbox" value="Flush Inbox" />
	 <%}else{
		response.sendRedirect("LogoutServlet");
	}%>
</form>
</body>
</html>