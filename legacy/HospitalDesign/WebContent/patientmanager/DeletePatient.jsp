<%@page import="com.dao.Patientdao"%>
<%@page import="com.beans.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Delete Patient</h2>
		<%
			int pid = Integer.parseInt(request.getParameter("id"));
			ArrayList<Patient> list = Patientdao.getPatientByID(pid);
			Patient p1 = list.get(0);
			%>
		<form action="../Delete_Patient?id=<%=p1.getPatientRegistrationno() %>" method="post">

				<table border>
					<%
						for (Patient p : list) {
					%>


					<tr>
						<td>Patient_ID</td>
						<td id="id"><%=p.getPatientRegistrationno()%></td>
					</tr>
					<tr>
						<td>Patient_Name</td>
						<td><%=p.getPatientName()%></td>
					</tr>
					</tr>

					<tr>
						<td>AGE</td>
						<td><%=p.getPatientAge()%></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td><%=p.getPatientAddress()%></td>
					</tr>
					<tr>
						<td>CITY</td>
						<td><%=p.getPatientCity()%></td>
					</tr>

					<tr>
						<td>RELIGION</td>
						<td><%=p.getPatientReligion()%></td>
					</tr>
					<tr>
						<td>MOBILE</td>
						<td><%=p.getPatientMobile()%></td>
					</tr>
					<tr>
						<td>CONTACT</td>
						<td><%=p.getPatientTelephone()%></td>
					</tr>
					<tr>
						<td>BLOOD GROUP</td>
						<td><%=p.getPatientBloodgroup()%></td>
					</tr>
					<tr>
						<td>MARITAL STATUS</td>
						<td><%=p.getPatientMaritalStatus()%></td>
					</tr>
					<tr>
						<td>REGISTRATION DATE</td>
						<td><%=p.getPatientDateofregistraton()%></td>
					</tr>

					<%
						}
					%>
				</table>
				<button type="submit">Delete</button>
		</form>
	</div>
	</div>
	</div>
</body>
</html>