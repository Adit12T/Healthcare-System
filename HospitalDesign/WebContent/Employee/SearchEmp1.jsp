<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page3</title>
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
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/table/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="../js/table/table.js"></script>
<style type="text/css">
th {
	text-align: center;
}

#table-111 {
	font-size: 15px;
	border: solid 1px;
	background-color: #096484;
	color: white;
}

#table-111 th {
	padding: 3px;
	text-align: center;
}

#table-222 {
	background-color: #CCD8FF;
}

#table-222:HOVER {
	background-color: #EBEEF8;
}

#table-222 td {
	text-align: center;
}
</style>
<script type="text/javascript">
	function message()

	{
		alert("Deleted Successfully");

	}
</script>
</head>
<body <%String msg = request.getParameter("msg");
			if (msg != null) {%>
	onload="message()" <%}%>>

	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
			<div class="box round first grid">
				<h2>Employee Detail</h2>
				<div class="block">
					<form action="">
						<fieldset>
							<%
								if (request.getAttribute("list") != null)

								{
									List ls = (List) request.getAttribute("list");
									if (ls.size() > 0) {
										//System.out.print(ls.size());
							%>
							<table class="table">
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>DOB</th>
									<th>Gender</th>
									<th>Address</th>
									<th>Email Id</th>
									<th>Department Name</th>
									<th>Employee Type</th>
									<th>Action</th>


								</tr>

								<%
									Map map;
											for (int i = 0; i < ls.size(); i++) {
												map = (Map) ls.get(i);
								%><tr>
									<td><%=map.get("id")%></td>
									<td><a
										href="Employee/doctordetail.jsp?name=<%=map.get("name")%>"><%=map.get("name")%></a></td>

									<td><%=map.get("dob")%></td>
									<td><%=map.get("gender")%></td>
									<td><%=map.get("address")%></td>
									<td><%=map.get("email")%></td>
									<td><%=map.get("dname")%></td>
									<td><%=map.get("ename")%></td>

									<td><a
										href="Employee/update.jsp?id=<%=map.get("id")%>&ename=<%=map.get("ename")%> "><img	alt="Update Record" title="Update Record" src="./mg/icon_edit.png" width="15" height="15"></a>&nbsp;&nbsp;&nbsp;
						<a href="DeleteServlet?id=<%=map.get("id")%>"><img	alt="Delete" title="Delete" src="./mg/imgclose.jpg" width="15" height="15"></a></td>

								</tr>
								<%
									}
								%>
							</table>

							<%
								}
									else{
									%>
									<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
									<%	
									}
								}else{
									%>
									<div align="center" ><font color="red" ><h3>Try Again......</h3></font></div>
									<%
								}
							%>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>