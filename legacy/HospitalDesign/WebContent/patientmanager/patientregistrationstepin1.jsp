<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.patientmanager.*"%>
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


<script type="text/javascript">
	function addData(valuess) {
		//alert("as"+valuess);
		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "availablebed.jsp";
		url = url + "?roomtype=" + valuess;
		xmlHttp.onreadystatechange = stateChangeds;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);

	}
	function stateChangeds() {

		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var showdatas = xmlHttp.responseText;
			document.getElementById("bedmydiv").innerHTML = showdatas;

		}

	}

	function showData(value) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "../GetPatientInDoctor";
		url = url + "?department=" + value;
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);

	}
	function stateChanged() {

		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var showdata = xmlHttp.responseText;
			document.getElementById("mydiv").innerHTML = showdata;

		}

	}
	function GetXmlHttpObject() {
		var xmlHttp = null;
		try {
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
</script>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Patient Registration</h2>
	<form action="../PatientRegistrationStepin1Servlet" method="get">
		<table border="1" cellpadding="0" cellspacing="0">

			<tr>
				<td><fieldset>
						<legend> Department Information</legend>
						<table width="728" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="133">Select Department</td>
								<td width="224"><select style="width: 150PX" name='dept'
									onchange="showData(this.value)">

										<%
											PatientDao p = new PatientDao();
											List l = p.showDepartment();
											for (int i = 0; i < l.size(); i++) {
										%>
										<option><%=l.get(i)%>
										</option>
										<%
											}
										%>
								</select></td>
								<td width="179">Doctor Name</td>
								<td width="182" id="mydiv"><select style="width: 150PX"
									name='drid'>
										<option></option>
								</select></td>
							</tr>

						</table>
					</fieldset></td>
			</tr>
			<tr>
				<td>

					<fieldset>
						<legend>Room Type</legend>
						<table width="728" border="0" cellpadding="0" cellspacing="0">
							<tr>
							<td width="129">Disease Name</td>
							<td align="center" width="161"><input type="text" name="diseasename"></td>
								<td width="188" align="right">Select Room Type</td>
								
								<td width="250" align="left"><select style="width: 150PX"
									onchange="addData(this.value)" name='roomtype'>
										<%
											List record = p.showRoomType();

											for (int j = 0; j < record.size(); j++) {
												Map map = (Map) record.get(j);
										%>
										<option><%=map.get("room_type_name")%></option>
										<%
											}
										%>
							  </select></td>
							</tr>
						</table>

					</fieldset>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td id="bedmydiv"></td>
			</tr>

		</table>
	</form>
	</div>
        </div>
 </div>
</body>
</html>