<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="sechdule.SechduleDao"%>
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
</script>
<style type="text/css">
th {
	text-align: left;
}
</style>
</head>
<body>
	<%
		SechduleDao d = new SechduleDao();
		String ids = request.getParameter("id");
		if (ids != null) {
			boolean f = d.deleteRecord(ids);
			String msg = "";
			String cl="red";
			if (f) {
				cl="green";
				msg = "Successfully Deleted Record";
			} else {
				msg = "Try Again................";
			}
	%>
	<table align="center">
		<tr>
			<td align="center" valign="middle"><font color='<%= cl%>>'> <h3><%=msg%></h3></font>
		</tr>
	</table>

	<%
		} else {
	%>
	<table border="1" cellpadding="0" cellspacing="0" class="table">
		<tr valign="top" align="center">

			<th> ID</th>
			<th>Name</th>
			<th>Specialization</th>
			<th>Department</th>
			<th>Working day</th>
			<th>Action</th>
		</tr>


		<%
			//SechduleDao d = new SechduleDao();
				List re = d.getAllDoctorForsechdule();
				Map map;

				for (int i = 0; i < re.size(); i++) {
					map = (Map) re.get(i);
					Integer id = (Integer) map.get("empid");
					System.out.print("id=  " + id);
					int idd = id;
		%>
		<tr>


			<td><%=map.get("empid")%></td>
			<td><%=map.get("empname")%></td>
			<td><%=map.get("empspecialization")%></td>
			<td><%=map.get("empdepartment")%></td>
			<td>

				<table cellpadding="2" cellspacing="2">
					<%
						List rd = d.getSechduleByID(idd);
								Map maps;
								//System.out.println("size="+rd.size());
								for (int j = 0; j < rd.size(); j++) {
									maps = (Map) rd.get(j);
					%>
					<tr>
						<td><%=maps.get("empday")%></td>
						<td><%=maps.get("empstarthr")%>: <%=maps.get("emstartminute")%>
							<%=maps.get("emstartshift")%></td>
						<td><%=maps.get("empendhr")%>: <%=maps.get("empendminute")%>
							<%=maps.get("empendshift")%></td>
						<td>Payed OPD</td>
						<td><font color="#991010"> <%=maps.get("emppayedstart")%>
								To <%=maps.get("emppayedend")%> Charge <%=maps.get("emppayedcost")%></font></td>
					</tr>

					<%
						}
					%>

				</table>

			</td>
			<td><a title="Delete"
				href="showfordelete.jsp?id=<%=map.get("empid")%>"><img
					alt="delete" src="../mg/imgclose.jpg" width="20" height="20">
			</a></td>
			<%-- 	<td><%=map.get("") %></td>
			<td><%=map.get("") %></td>
			 --%>
		</tr>


		<%
			}
		%>
	</table>
	<%
		}
	%>
</body>
</html>