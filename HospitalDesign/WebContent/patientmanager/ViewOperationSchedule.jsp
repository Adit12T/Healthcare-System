<%@page import="java.util.ArrayList"%>
<%@page import="OperationTheater.ViewOperationScheduleBean"%>
<%@page import="OperationTheater.ViewOperationScheduleDao"%>
<%@page import="OperationTheater.OperationRegistrationBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Operation Schedule</title>
	
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
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
<script src="../ui/jquery.ui.core.js"></script>
<script src="../ui/jquery.ui.widget.js"></script>
<script src="../ui/jquery.ui.datepicker.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			showOn : "button",
			buttonImage : "../images/calendar.gif",
			buttonImageOnly : true
		});
	});
	$(function() {
		$("#datepicker1").datepicker({
			showOn : "button",
			buttonImage : "../images/calendar.gif",
			buttonImageOnly : true
		});
	});
</script>

</head>
<body>
	<%-- <%
		String sql = "select * from operation_patient where (operation_date >='02/20/2013' and operation_date <='02/30/2013')";
	%> --%>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>View Operation Schedule</h2>
	<form action="ViewOperationSchedule.jsp" method="post">
			<table align="center">
				<tr>
					<th>Date From</th>
					<td><input type="text" name="date_from" id="datepicker"></td>
					<th>To Date</th>
					<td><input type="text" name="date_to" id="datepicker1"></td>
				</tr>
			</table>
			<h3 align="center">
				<input type="submit" value="Submit">
			</h3>
		</form>
		<table align="center" border="1" class="table">
			<tr>
				<th>Patient Id</th>
				<th>Patient Name</th>
				<th>Operation Type</th>
				<th>Operation Name</th>
				<th>Surgeon Name</th>
				<th>Date of Operation</th>
				<th>Time of Operation</th>
				<th>Action</th>
			</tr>
			<%
				List<OperationRegistrationBean> list1 = new ArrayList<OperationRegistrationBean>();
				ViewOperationScheduleDao dao2 = new ViewOperationScheduleDao();
				list1 = dao2.selectSchedule(
						(String) request.getParameter("date_from"),
						(String) request.getParameter("date_to"));
				for (OperationRegistrationBean vs : list1) {
			%>
			<tr>
				<td><%=vs.getPatient_id()%></td>
				<td><%=vs.getP_name()%></td>
				<td><%=vs.getOp_type()%></td>
				<td><%=vs.getOp_name()%></td>
				<td><%=vs.getSurgeon_name()%></td>
				<td><%=vs.getOp_date()%></td>
				<td><%=vs.getOp_time()%></td>
				<td><a href="UpdateOperationSchedule.jsp?oid=<%=vs.getId()%>">
						update</a> <%-- <a href="UpdateOperationSchedule.jsp" > <%=vs.getOp_time() %></a> --%></td>
			</tr>

			<%
				}
			%>
		</table>

	</div>
	</div>
	</div>
</body>
</html>