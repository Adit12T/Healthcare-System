<%@page import="com.dao.Patientdao"%>
<%@page import="com.beans.Patient"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
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
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Patient Detail List</h2>
<%
	String date = request.getParameter("date");
  ArrayList<Patient> list = Patientdao.getPatientByDate(date);
		%>
				<table border class="table">
					<tr>
						<th>PATIENT_ID</th>
						<th>PATIENT_NAME</th>
						<th>AGE</th>
						<th>ADDRESS</th>
						<th>CITY</th>
						<th>RELIGION</th>
						<th>MOBILE</th>
						<th>CONTACT</th>
						<th>BLOOD GROUP</th>
						<th>MARITAL STATUS</th>
						<th>REGISTRATION DATE</th>
						<th>ACTION</th>
				</tr>	
				<%
				for (Patient p : list) { %>
				<tr>
				<td><%=p.getPatientRegistrationno() %></td>
				<td><a href="Patient_ByID.jsp?id=<%=p.getPatientRegistrationno()%>" ><%=p.getPatientName() %></a></td>
				<td><%=p.getPatientAge() %></td>
				<td><%=p.getPatientAddress() %></td>
				<td><%=p.getPatientCity() %></td>
				<td><%=p.getPatientReligion() %></td>
				<td><%=p.getPatientMobile() %></td>
				<td><%=p.getPatientTelephone() %></td>
				<td><%=p.getPatientBloodgroup() %></td>
				<td><%=p.getPatientMaritalStatus() %></td>
				<td><%=p.getPatientDateofregistraton()%></td>
				<td><a href="DeletePatient.jsp?id=<%=p.getPatientRegistrationno()%>" ondblclick="a()">Delete</a></td>
				</tr>
				
				<%} %>
				</table>
	</div>
</div>
</div>
</body>
</html>