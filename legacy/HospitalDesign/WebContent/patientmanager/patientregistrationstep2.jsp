<%@page import="java.util.List"%>
<%@page import="com.patientmanager.*"%>
<%@page import="com.beans.Patient"%>
<%@page import="com.disease.Disease_Beans"%>
<%@page import="java.util.ArrayList"%>
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


<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
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
<style type="text/css">
#disease tr td{
font-weight: bold;
padding: 10px;
}
</style>
</head>
<script type="text/javascript">
	function addData(empid, diseaseid) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "../AddPatientDiseaseDoctorServlet";
		url = url + "?empid=" + empid + "&diseaseid=" + diseaseid;
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
		//alert("asdasd" + empid);

	}

	function showData(value) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "../GetPatientDiseaseDoctorServlet";
		url = url + "?disease=" + value;
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
	<%-- <%

PatientDao pd=new PatientDao();
List record=pd.getDisease("");

%>

	<form action="../PatientRegistrationServlet" method="post">
		<input type="hidden" value="step2" name="value">
</form>
 --%>



	<table width="690" height="35" id="disease" >
		

		<%
			ArrayList<Disease_Beans> ls = PatientDao.slectDisease();
			for (int i = 0, k = 0; k < ls.size(); i++) {

				out.print("<tr>");

				for (int j = 0; j < 5 && k < ls.size(); j++, k++) {
					Disease_Beans d = ls.get(k);
		%>

		<td><input type="checkbox" name="disease" id="disease"
			onchange="showData(this.value)" value="<%=d.getDiseaseName()%>" /> <%-- <%=d.getDiseaseid()%></td><td> --%>
			<%=d.getDiseaseName()%></td>
		<%-- 			<td><%=d.getDiseaseDepartment()%></td> --%>

		<%
			}
				out.print("</tr>");
			}
		%>
	</table>
	<br><br>
	<table width="50%" align="center">
		<tr align="center" valign="middle">
			<td>
				<form action="../PatientRegistrationServlet" method="get">
					<input type="hidden" value="step2" name="value">
					<input type="submit" value="Submit">
				</form>
			</td>
		</tr>
	</table>
	<table align="center">
		<tr >
			<td colspan="5" align="center">
				<div id="mydiv" style="margin-top: 50px"></div>

			</td>

		</tr>
	</table>

	<!-- 	</form>  -->
</div>
        </div>
</div>
</body>
</html>