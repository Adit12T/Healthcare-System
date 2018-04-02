<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<html>
<head>

	<!-- General Metas -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
	<title>Login Form</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/skeleton.css">
	<link rel="stylesheet" href="css/layout1.css">
	
</head>
<body>
	<!-- Primary Page Layout -->

	<div class="container">
		
		<div class="form-bg">
			<form action="Login" method="post">
				<h2>Login</h2>
				<p><input type="text" placeholder="Username" name="uname"></p>
				<p><input type="password" placeholder="Password" name="pass"></p>
				<p>
				<select name="user_type">
				<%String sql="select control_type from login_control"; 
				dbcon db=dbcon.getConnection();
				ResultSet rs=db.select(sql);
				while(rs.next()){
				%>
				<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				
				<%} %>
				</select> </p>
				<button type="submit"></button>
			</form>
		</div>
<h4 align="center" style="color: red;">
<%if(request.getAttribute("msg")!=null){ %>
<%=request.getAttribute("msg")%>
<%} %>
</h4>	


	</div><!-- container -->

	<!-- JS  -->

	
<!-- End Document -->
</body>
</html>