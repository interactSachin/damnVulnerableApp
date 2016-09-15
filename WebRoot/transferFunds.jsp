<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/HackMe/css/style.css">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward 
UserBean user= (UserBean)request.getSession().getAttribute("user");
if(null != user){
 %>
	<section id="work">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp"
				data-wow-delay="0.9s">
				<i class="icon-mobile medium-icon"></i>
				<h3>Transfer Funds</h3>
				<hr>
				<p>
				<form action="/HackMe/transferFunds" method="get">
					<table align="center">
						<tr>
							<td><input type="text" name="beneficiary"
								placeholder="Beneficiary Email" /> <br></td>
						</tr>
						<tr>
							<td><input type="text" name="amount" placeholder="Amount" />
								<br /></td>
						</tr>
						<br />
					</table>
				
						<input type="submit"
						value="Transfer Funds" />
					</form>


					</p>

				</div>
			</div>
		</div>
	</section>
	 <%}else{
		response.sendRedirect("LogoutServlet");
	}%>
	
</body>
</html>