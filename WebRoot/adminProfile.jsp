<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserDao"%>
<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<meta charset="utf-8">
<title>Admin</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="stylesheet" href="/HackMe/css/bootstrap.min.css">
<link rel="stylesheet" href="/HackMe/css/font-awesome.min.css">
<link rel="stylesheet" href="/HackMe/css/animate.min.css">
<link rel="stylesheet" href="/HackMe/css/et-line-font.css">
<link rel="stylesheet" href="/HackMe/css/nivo-lightbox.css">
<link rel="stylesheet"
	href="/HackMe/css/nivo_themes/default/default.css">
<link rel="stylesheet" href="/HackMe/css/style.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500'
	rel='stylesheet' type='text/css'>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<section class="navbar navbar-fixed-top custom-navbar"
		role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">STARK INDUSTRIES</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<a class="navbar-brand" href="LogoutServlet">Logout</a>
			</ul>
		</div>
	</div>
	</section>


	<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<br> <br> <br> <br> <br>
				<table align="center">
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Department</th>
					</tr>
					<%
						response.setHeader("Cache-Control",
								"no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
						response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
						response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward 
						UserBean user = (UserBean) request.getSession()
								.getAttribute("user");
						if (null != user) {
							UserDao userDao = new UserDao();
							ResultSet rs = userDao.getUsers();
							while (rs.next()) {
					%>
					<%=" <tr><td>" + rs.getString("name")
							+ "</td><td>" + rs.getString("email")
							+ "</td><td>" + rs.getString("role")
							+ "</td></tr>"%>
					<%
						}
					%>

					<%
						} else {
							response.sendRedirect("LogoutServlet");
						}
					%>
				</table>
			</div>
		</div>
	</div>
	</section>

	<script src="/HackMe/js/jquery.js"></script>
	<script src="/HackMe/js/bootstrap.min.js"></script>
	<script src="/HackMe/js/smoothscroll.js"></script>
	<script src="/HackMe/js/isotope.js"></script>
	<script src="/HackMe/js/imagesloaded.min.js"></script>
	<script src="/HackMe/js/nivo-lightbox.min.js"></script>
	<script src="/HackMe/js/jquery.backstretch.min.js"></script>
	<script src="/HackMe/js/wow.min.js"></script>
	<script src="/HackMe/js/custom.js"></script>
</body>
</html>