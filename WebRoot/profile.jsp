<%@page import="bean.UserBean"%>
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<meta charset="utf-8">
<title>Profile</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" href="/HackMe/css/bootstrap.min.css">
<link rel="stylesheet" href="/HackMe/css/font-awesome.min.css">
<link rel="stylesheet" href="/HackMe/css/animate.min.css">
<link rel="stylesheet" href="/HackMe/css/et-line-font.css">
<link rel="stylesheet" href="/HackMe/css/nivo-lightbox.css">
<link rel="stylesheet" href="/HackMe/css/nivo_themes/default/default.css">
<link rel="stylesheet" href="/HackMe/css/style.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500'
	rel='stylesheet' type='text/css'>
	<style>
p.small {
    line-height: 1.0;
}

p.big {
    line-height: 1.8;
}
</style>
</head>

<body>
	<div class="preloader">
		<div class="sk-spinner sk-spinner-circle">
			<div class="sk-circle1 sk-circle"></div>
			<div class="sk-circle2 sk-circle"></div>
			<div class="sk-circle3 sk-circle"></div>
			<div class="sk-circle4 sk-circle"></div>
			<div class="sk-circle5 sk-circle"></div>
			<div class="sk-circle6 sk-circle"></div>
			<div class="sk-circle7 sk-circle"></div>
			<div class="sk-circle8 sk-circle"></div>
			<div class="sk-circle9 sk-circle"></div>
			<div class="sk-circle10 sk-circle"></div>
			<div class="sk-circle11 sk-circle"></div>
			<div class="sk-circle12 sk-circle"></div>
		</div>
	</div>
	<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward 

UserBean user= (UserBean)request.getSession().getAttribute("user");
String userPic;
if(null==user||user.getImage()==null){
	userPic="default";
}
else{
	userPic=user.getImage();
}
%>
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
			<br><a href="/HackMe/transferFunds.jsp"><h3>Transfer Funds</h3></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<a class="navbar-brand" href="LogoutServlet">Logout</a><img src="/HackMe/images/<%=userPic%>.jpeg" height="100" width="100">
			</ul>
		</div>
	</div>
	</section>

	<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">

<%				
if (null != user){
out.println("<p class=\"big\"><br><br><br><br><h3>Hi " + user.getName() + " you are successfully logged in</h3>");
out.print("<br> Balance in your account is: " + user.getBalance()+"</p>");
}
else{
	response.sendRedirect("LogoutServlet");
}
%>
				<br>
				<jsp:include page="commentWall.jsp"></jsp:include>
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