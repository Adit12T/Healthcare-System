<%@page import="com.dao.Patientdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.*"%>
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
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ArrayList list = Patientdao.getPatientByID(pid);
	Patient p = (Patient) list.get(0);
%>
</head>
<body>

	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Patient Update</h2>
		<form action="../Update_Patient" method="post">

			<fieldset >
				<table>
					<tr>
						<td>PATIENT_ID</td>
						<td><input type="text" name="pid" readonly="readonly"
							value="<%=p.getPatientRegistrationno()%>" style="width: 150PX"></td>
						<td>PATIENT_NAME</td>
						<td><input type="text" name="pname"
							value="<%=p.getPatientName()%>" style="width: 150PX" readonly="readonly"></td>
					</tr>

					<tr>
						<td>Gender</td>
						<td>Male<input type="radio" disabled="disabled" name="gen" value="male"<%if(p.getPatientGender().endsWith("male")){ %> checked="checked"<%} %> >Female<input
							type="radio" name="gen" disabled="disabled" value="female" <%if(p.getPatientGender().endsWith("female")){ %> checked="checked"<%} %>></td>
						<td>AGE</td>
						<td><input type="text" name="age"
							value="<%=p.getPatientAge()%>" style="width: 150PX"  readonly="readonly"></td>
					</tr>
					<tr>
						<td>Marital Status</td>
						<td>Married<input type="radio"  name="m_s" value="yes"<%if(p.getPatientMaritalStatus().endsWith("yes")){ %> checked="checked"<%} %>>UnMarried<input
							type="radio" name="m_s" value="no" <%if(p.getPatientMaritalStatus().endsWith("no")){ %> checked="checked"<%} %>></td>
						<td>Father/Husband</td>
						<td><input type="text" name="f_h" value="<%=p.getPatientFatherHusband() %>"
							style="width: 150PX"  readonly="readonly"></td>
					</tr>

					<tr>
						<td>ADDRESS</td>
						<td><textarea rows="" name="add" cols="16"><%=p.getPatientAddress()%></textarea></td>
						<td>CITY</td>
						<td><input rows="" name="city"
							value="<%=p.getPatientCity()%>" ></td>
					</tr>

					<tr>
						<td>RELIGION</td>
						<td><input type="text" name="religion"
							value="<%=p.getPatientReligion()%>" style="width: 150PX"  readonly="readonly"></td>
						<td>MOBILE</td>
						<td><input type="text" name="pmobile"
							value="<%=p.getPatientMobile()%>" 
							style="width: 150PX"></td>
					</tr>
					<tr>
						<td>CONTACT</td>
						<td><input type="text" name="pcontact"
							value="<%=p.getPatientTelephone()%>" 
							style="width: 150PX" maxlength="10"></td>
						<td>BLOOD GROUP</td>
						<td><input type="text" name="pbg"
							value="<%=p.getPatientBloodgroup()%>" 
							style="width: 150PX"  readonly="readonly"></td>
					</tr>
					<tr>
						<td>Disease</td>
						<td><input type="text" name="disease" value="<%=p.getPatientDisease() %>"
							required=required style="width: 150PX"></td>
						<td>REGISTRATION DATE</td>
						<td><input type="date" name="regdate"
							value="<%=p.getPatientDateofregistraton()%>" style="width: 150PX"  readonly="readonly"></td>
					</tr>

					<tr>

						<td><input type="submit" name="submit" value="Submit"></td>
						<td><input type="reset" name="reset" value="Reset"></td>
					</tr>
				</table>



			</fieldset>

		</form>

	</div>
</div>
</div>



</body>
</html>