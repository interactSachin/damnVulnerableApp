<head>
<link rel="stylesheet" href="/HackMe/css/style.css">
</head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 25%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}
</style>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward
	%>
	<section id="work">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp"
					data-wow-delay="0.9s">
					<i class="icon-mobile medium-icon"></i>
					<h3>Damn Vulnerable Login</h3>
					<hr>
					<p>
					<form action="/HackMe/loginprocess.jsp" method="post">
						<table align="center">
							<tr>
								<td><input type="text" name="email"
									placeholder="Email" /> <br></td>
							</tr>
							<tr>
								<td><input type="password" name="password"
									placeholder="Password" /> <br /></td>
							</tr>
							<br />
						</table>
						<input type="hidden" name="lastLogon"
							value="<%=System.currentTimeMillis()%>" /> <input type="submit"
							value="Login" />
					</form>


					</p>

				</div>
			</div>
		</div>
	</section>
<!--
admin adminPass
-->
</body>