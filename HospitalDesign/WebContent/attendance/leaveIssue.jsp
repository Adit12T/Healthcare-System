<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css"
	media="all">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
		<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
		<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>

	<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	$(function() {
		$( "#datepicker1" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>
</head>
<body>
	
	<%
		String id = request.getParameter("id");
	%>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Issue Leave</h2>

	<form action="../leaveServlet" method="get">
		<center>
			<table width="250">
				<tr>
					<td>Id</td>
					<td><input type="text" name="id" value="<%=id%>" required="required"></td>
				</tr>
				<tr>
					<td>Leave From</td>
					<td><input type="text" name="leavefrom" required="required" id="datepicker"></td>
				</tr>
				<tr>
					<td>Leave To</td>
					<td><input type="text" name="leaveto" required="required" id="datepicker1"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" id="submit" name="leave"
						value="Submit"></td>
				</tr>



			</table>



		</center>



	</form>
</div>
</div>
</div>


</body>
</html>