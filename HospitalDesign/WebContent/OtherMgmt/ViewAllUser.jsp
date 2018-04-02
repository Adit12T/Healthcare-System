<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All User</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<link href="../tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="../tablecloth/tablecloth.js"></script>
</head>
<body>
	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
				<h2>View All User</h2>
		<table class="table">
		<tr>
		<th>Employee Id</th><th>Employee Name</th><th>Control Type</th><th>Password</th>
		</tr>
		
		<%
		String sql="select * from login_control";
		dbcon db=dbcon.getConnection();
		ResultSet rs=db.select(sql);
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getInt(1) %></td>	<td><%=rs.getString(2) %></td>	<td><%=rs.getString(3) %></td>	<td><%=rs.getString(4) %></td>
		</tr>
		<%} %>
		</table>
			</div>
		</div>
	</div>
</body>
</html>