<%@page import="java.sql.*"%>

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
		<h2>View Salary By ID</h2>
	<%
		//String Status = request.getParameter("status");
		//String dat = request.getParameter("ddate");
		String id = request.getParameter("id");

		System.out.println("ID::" + id);

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/hmt", "root", "root");
		Statement st = con.createStatement();
		String sql = ("select emp_id,netsalary,pay_date from salary where emp_id= '"
				+ id + "' ");
		ResultSet rs = st.executeQuery(sql);
	%>

	<form method="post" action="ViewAttendance.jsp">


		<tr>
			<table border="1" width="828" height="159" align="center">
				<thead>
					<tr>
						<th>ID<br></th>
						<th>Net Salary<br></th>
						<th>Pay Date<br></th>

					</tr>
				</thead>
				<tbody align="center">

					<%
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%><br></td>
						<td><%=rs.getString(3)%><br></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
	</form>
</div>
</div>
</div>
</body>
</html>