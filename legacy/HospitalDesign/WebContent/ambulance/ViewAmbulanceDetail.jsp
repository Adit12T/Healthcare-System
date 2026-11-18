<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
			<div class="box round first grid">
				<h2>Ambulance Detail</h2>
				<table class="table" >
				<tr>
				<th>Ambulance Type</th><th>Ambulance Quantity</th><th>Cost</th>
				</tr>
				
				<%
				dbcon db=dbcon.getConnection();
				String sql="select * from ambulance_manager";
				ResultSet rs=db.select(sql);
				while(rs.next()){
				%>
				<tr>
				<td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
				</tr>
				<%} %>
				</table>
</div>
</div>
</div>
</body>
</html>