<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Accounts</title>
<meta http-equiv="refresh" content="10" >
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward 
UserBean userBean= (UserBean)session.getAttribute("user");
if(null==userBean)
{
	response.sendRedirect("LogoutServlet");
}
%>
<jsp:include page="/profile.jsp"></jsp:include>
</body>

</html>