<%@page import="dao.PrivilegedUser"%>
<%@page import="dao.UserDao"%>
<%@page import="javax.security.auth.login.CredentialExpiredException"%>
<html>
<head />
<body>
	<%@page import="bean.UserBean"%>
	<jsp:useBean id="obj" class="bean.UserBean" />

	<jsp:setProperty property="*" name="obj" />

	<%
		//response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
			response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
			response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
			response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward 
			try {
		PrivilegedUser superUserDao = new PrivilegedUser();
		UserBean user = superUserDao.validate(obj);
		if (null != user && user.getRole().equalsIgnoreCase("ceo")) {

				session.setAttribute("user", user);
				response.sendRedirect("ceo.jsp");//for final flag
				
		}
		else if(null != user && user.getRole().equalsIgnoreCase("account")){
			session.setAttribute("user", user);
			response.sendRedirect("accountProfile.jsp"); //for account page
		}
		else {
			out.print("<p align=\"center\">Sorry, email or password error</p>");
	%>
	<jsp:include page="index.jsp"></jsp:include>
	<%
		}
		} catch (CredentialExpiredException e) {
			out.print("Sorry, session is expired");
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	%>
</body>
</html>