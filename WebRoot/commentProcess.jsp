<%@page import="bean.UserBean"%>
<%@page import="bean.CommentBean"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%
	//response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward 
	UserBean userBean= (UserBean)session.getAttribute("user");
	if(null!=userBean){
	try {
			CommentBean comment = new CommentBean();
			comment.setComment(request.getParameter("comment"));
			
			comment.setUserId(userBean.getId());
			CommentDao commentDao = new CommentDao();
			commentDao.addComment(comment);
			if(userBean.getName().equalsIgnoreCase("admin"))
				response.sendRedirect("adminProfile.jsp");
			if(userBean.getName().equalsIgnoreCase("account"))
				response.sendRedirect("accountProfile.jsp");
			else
				response.sendRedirect("profile.jsp");
			}catch(Exception e){
				out.println(e.getStackTrace());
			}
	}else{
		response.sendRedirect("LogoutServlet");
	}
	%>
</body>
</html>