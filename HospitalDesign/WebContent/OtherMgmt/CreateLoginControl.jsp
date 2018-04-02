<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="../css/nav.css" media="screen" />
<script src="js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
</head>
<body>
	<div class="container_12" >
		<div class="grid_10">
			<div class="box round first grid" >
				<center>
				<form action="../CreateLoginControl" method="post">
				<table align="center">
				<tr>
				<th align="left">Employee Name</th>
				<td>
				<select name="emp_id">
				<%String sql="select emp_id,emp_name from employee where emp_type='staff'"; 
				dbcon db=dbcon.getConnection();
				ResultSet rs=db.select(sql);
				while(rs.next()){
				%>
				<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
				<%} %>
				</select>
				</td>
				</tr>
				<tr>
				<th align="left">Select Control</th>
				<td>
				<select name="login_control">
				<option value="Admin">Admin</option>
				<option value="Reception">Reception</option>
				<option value="BloodBank">BloodBank</option>
				<option value="Pathology">Pathology</option>
				<option value="Billing_Account">Billing Account</option>
				</select>
				</td>
				</tr>
				<tr>
				<th align="left">Password</th><td><input type="password" name="pass" required="required" > </td>
				</tr>
				<tr>
				<th align="left">Confirm Password</th><td><input type="password" name="c_pass" required="required"> </td>
				</tr>
				</table>
				<h3 align="center"><input type="submit" value="Submit"> </h3>
				</form>
				</center>
			</div>
		</div>
	</div>
</body>
</html>