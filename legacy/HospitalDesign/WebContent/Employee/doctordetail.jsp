<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="database.dbcon"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th {
	text-align: left;
	font-size: 15px;
}

td {
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="container_12">
		<div class="grid_10">
			<div class="box round first grid">
				<h2>Employee Detail</h2>
				<%
					String name = "", dob = "", joindate = " ", teno = "", mno = "", msta = "", gen = "", add = "", city = "", state = "", country = "", bgroup = "", emp = "", empmail = "", image = "";
					int sal = 0, id = 0;
					String a = request.getParameter("name");

					dbcon db = dbcon.getConnection();
					String sql = "select * from employee where emp_name='" + a + "'";

					ResultSet rs = db.select(sql);
					while (rs.next()) {
						id = rs.getInt(1);
						name = rs.getString(2);
						dob = rs.getString(3);
						joindate = rs.getString(4);
						teno = rs.getString(5);
						mno = rs.getString(6);
						msta = rs.getString(7);
						gen = rs.getString(8);
						add = rs.getString(9);
						city = rs.getString(10);
						state = rs.getString(11);
						country = rs.getString(12);
						bgroup = rs.getString(13);
						emp = rs.getString(14);
						empmail = rs.getString(15);
						image = rs.getString(16);
						sal = rs.getInt(17);

					}
				%>

<%-- <table>
<tr>
<th><img alt="" src="../empimage/<%=image%>" width="100" height="100"> </th>
</tr>
</table> --%>
				<center>
					<table cellspacing="12">
						<tr>
							<th>Employee ID:-</th>
							<td>
								<%
									out.print(id);
								%>

							</td>
						</tr>
						<tr>
							<th>Name:-</th>
							<td>
								<%
									out.print(name);
								%>

							</td>
						</tr>
						<tr>
							<th>DOB:-</th>
							<td>
								<%
									out.print(dob);
								%>

							</td>
						</tr>
						<tr>
							<th>join Date:-</th>
							<td>
								<%
									out.print(joindate);
								%>

							</td>
						</tr>
						<tr>
							<th>Telephone No:-</th>
							<td>
								<%
									out.print(teno);
								%>

							</td>
						</tr>
						<tr>
							<th>Mobile No:-</th>
							<td>
								<%
									out.print(mno);
								%>

							</td>
						</tr>
						<tr>
							<th>Marriatal Status:-</th>
							<td>
								<%
									out.print(msta);
								%>

							</td>
						</tr>
						<tr>
							<th>Gender:-</th>
							<td>
								<%
									out.print(gen);
								%>

							</td>
						</tr>
						<tr>
							<th>Address:-</th>
							<td>
								<%
									out.print(add);
								%>

							</td>
						</tr>

						<tr>
							<th>city:-</th>
							<td>
								<%
									out.print(city);
								%>

							</td>
						</tr>
						<tr>
							<th>State:-</th>
							<td>
								<%
									out.print(state);
								%>

							</td>
						</tr>
						<tr>
							<th>Country:-</th>
							<td>
								<%
									out.print(country);
								%>

							</td>
						</tr>
						<tr>
							<th>Blood Group:-</th>
							<td>
								<%
									out.print(bgroup);
								%>

							</td>
						</tr>
						<tr>
							<th>Employee Type:-</th>
							<td>
								<%
									out.print(emp);
								%>

							</td>
						</tr>
						<tr>
							<th>Employee Email:-</th>
							<td>
								<%
									out.print(empmail);
								%>

							</td>
						</tr>

						<tr>
							<th>Salary:-</th>
							<td>
								<%
									out.print(sal);
								%>

							</td>
						</tr>
					</table>
				</center>
			 </div>
        </div>
   </div>
   
</body>
</html>