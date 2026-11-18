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
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Patient Profile</h2>
		<form>
				<table border>
					<%
						int pid =Integer.parseInt( request.getParameter("id"));
						ArrayList<Patient> list = Patientdao.getPatientByID(pid);
						for (Patient p : list) {
					%>
					<tr>
						<th>Patient_ID</th>
						<td><%=p.getPatientRegistrationno()%></td>
					</tr>
					<tr>
						<th>Patient_Name</th>
						<td><%=p.getPatientName()%></td>
					
					</tr>
					
					<tr>
						<th>Gender</th>
						<td><%=p.getPatientGender() %></td>
					</tr>	
					
					<tr>
						<th>Age</th>
						<td><%=p.getPatientAge() %></td>
					</tr>
					<tr>
						<th>Marital Status</th>
						<td><%=p.getPatientMaritalStatus() %></td>
					</tr>	
					<tr>
						<th>Father/Husband</th>
						<td><%=p.getPatientFatherHusband() %></td>
					</tr>	
					
					
					<tr>
						<th>Address</th>
						<td><%=p.getPatientAddress() %></td>
					</tr>
					<tr>
						<th>City</th>
						<td><%=p.getPatientCity() %></td>
					</tr>
				
					<tr>
						<th>Religion</th>
						<td><%=p.getPatientReligion() %></td>
					</tr>
					<tr>
						<td>Mobile</td>
						<th><%=p.getPatientMobile() %></th>
					</tr>
					<tr>
						<th>Contact</th>
						<td><%=p.getPatientTelephone() %></td>
					</tr>
					<tr>
						<th>Blood Group</th>
						<td><%=p.getPatientBloodgroup() %></td>
					</tr>
					<tr>
						<th>Registration Date</th>
						<td><%=p.getPatientDateofregistraton() %></td>
					</tr>			
					
					<%
						}
					%>
				</table>
		</form>
	</div>
	</div>
	</div>
</body>
</html>