<%@page import="oldrecord.Patient_old_Discharge"%>
<%@page import="oldrecord.Patient_old"%>
<%@page import="java.util.Date"%>
<%@page import="database.DateConvert"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.patientmanager.PatientDischargeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="../tablecloth/tablecloth.css" rel="stylesheet"
	type="text/css" media="screen" />
<script type="text/javascript" src="../tablecloth/tablecloth.js"></script>
</head>
<body>
	<%
		Patient_old_Discharge po = new Patient_old_Discharge();
		;
		String s = request.getParameter("name");
		List record = po.getOldPatient(s);
		if (record.size() > 0) {
	%>
	<table width="911" height="53" border="1" cellpadding="0"
		cellspacing="0" class="table">
		<tr>
			<th width="55">S.No.</th>
			<th width="89">Reg Date</th>
			<th width="91">Patient reg.No</th>
			<th width="159">Patient Name</th>
			<th width="75">Age</th>
			<th width="77">Mob.</th>
			<th width="65">Tel.</th>
			<th width="141">Address</th>
			<th width="139">City</th>
			<th width="139">admit date</th>
			<th width="139">Discharge date</th>
			<th width="139">Total Amount</th>

		</tr>
		<%
			//  System.out.print(record);
				Map map;
				for (int i = 0; i < record.size(); i++) {
					map = (Map) record.get(i);
		%>
		<tr>
		<tr>
			<td><%=i + 1%></td>
			<td><%=map.get("patient_dateofregistraton")%></td>
			<td><%=map.get("patient_registrationno")%></td>
			<td><%=map.get("patient_name")%></td>
			<td><%=map.get("patient_age")%></td>
			<td><%=map.get("patient_mobile")%></td>
			<td><%=map.get("patient_telephone")%></td>
			<td><%=map.get("patient_address")%></td>
			<td><%=map.get("patient_city")%></td>
			<td><%=map.get("admitdate")%></td>
			<td><%=map.get("dischargedate")%></td>
			<td><%=map.get("totalamount")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
%>
<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
<%
		}
	%>
	</div>

</body>
</html>