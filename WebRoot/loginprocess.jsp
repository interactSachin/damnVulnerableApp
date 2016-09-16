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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward 
		try {
			UserDao userDao = new UserDao();
			UserBean user = userDao.validate(obj);
			if (null != user) {
				//if (user.getEmail().equals(obj.getEmail())) 
				{
					session.setAttribute("user", user);
					if (user.getRole().equalsIgnoreCase("admin")) {
						response.sendRedirect("adminProfile.jsp");//for list of emails
						return;
					} else if (user.getRole().equalsIgnoreCase("account")) {
						response.sendRedirect("accountProfile.jsp");//for transfering funds
						return;
					} else if (user.getRole().equalsIgnoreCase("ceo")) {
						response.sendRedirect("ceo.jsp");//for final flag
						return;
					} else if (user.getRole().equalsIgnoreCase("cfo")) {
						response.sendRedirect("cfo.jsp");//for checking salary
						return;
					} else {
						response.sendRedirect("profile.jsp");//for normal user
						return;
					}

				}
			} else {
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