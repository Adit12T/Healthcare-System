<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="database.DateConvert"%>
<%@page import="java.util.Date"%>
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
</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>View Leave</h2>
	<form method="post" action="ViewLeave.jsp" name="f1">


		<div align="center">

			Choose Month <select name="mon"><option>Select</option>
				<option>January</option>
				<option>February</option>
				<option>March</option>
				<option>April</option>
				<option>May</option>
				<option>June</option>
				<option>July</option>
				<option>August</option>
				<option>September</option>
				<option>October</option>
				<option>November</option>
				<option>December</option>

			</select> Choose Year<input type="text" name="yr"> <br> <br>
			<br>
		</div>
		<div id="respond" align="center">

			<input type="submit" id="submit" name="tot" value="Search">

		</div>
	</form>
	<%
		String month1 = request.getParameter("mon");
		String year1 = request.getParameter("yr");

		String sql = "select * from employee_leave where  month='" + month1
				+ "' and year='" + year1 + "'   ";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/hmt", "root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
	%>




	<table>
		<tr>
			<th>Employee Id</th>
			<th>Leave From</th>
			<th>Leave To</th>
			<th>Total Days</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>

	</table>
	<%
		}
	%>
	</div>
	</div>
	</div>
</body>
</html>