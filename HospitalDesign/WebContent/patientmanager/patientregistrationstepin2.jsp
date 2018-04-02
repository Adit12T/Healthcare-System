<%@page import="java.util.Date"%>
<%@page import="database.DateConvert"%>
<%@page import="com.patientmanager.PatientBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
		<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>

<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
</head>
<body>

<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Patient Registration</h2>


	<%
		PatientBean p = (PatientBean) session.getAttribute("patientinfo");
		if (p != null) {
	%>
	<table width="278" height="127" border="1" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="159">Patient Id</td>
			<td width="113"><%=p.getPatientRegistrationno()%></td>
		</tr>
		<tr>
			<td>Patient Name</td>
			<td><%=p.getPatientName()%></td>
		</tr>
		<tr>
			<td>Patient Age</td>
			<td><%=p.getPatientAge()%></td>
		</tr>
		<tr>
			<td>Patient Admit Date</td>
			<td><%=DateConvert.convertDateToString(p.getPatientDateofregistraton())%></td>
		</tr>
		<tr>
			<td>Patient Room Number</td>
			<td><%=p.getRoomno()%></td>
		</tr>
		<tr>
			<td>Patient Bed Number</td>
			<td><%=p.getBedno()%></td>
		</tr>
		<tr>
			<td>Doctor Name</td>
			<td><%=p.getInsideidDrName()%></td>
		</tr>

		<tr>
			<td>Patient Disease Name</td>
			<td><%=p.getPatientDisease()%></td>
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