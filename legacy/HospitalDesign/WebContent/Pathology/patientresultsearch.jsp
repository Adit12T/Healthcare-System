<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.AddResultDao"%>
<%@page import="database.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Employee</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script src="../js/table/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/table/table.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th {
	text-align: left;
}
</style>
<script type="text/javascript">
	function showData(value) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		var url = "patientresultsearchcontent.jsp";
		url = url + "?name=" + value;
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

</head>
<body>

<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Patient Test</h2>
		
	<table align="center">
		<tr>
			<th>Search By name </th>
			<td><input type="text" name="name" id="name"
				onkeyup="showData(this.value);"></td>
		</tr>
	</table>

	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
			<div class="box round first grid" style="height: 100%;">

				<div id="mydiv" style="margin-top: 0px">
					
					<%String s = request.getParameter("name");
					AddResultDao ad = new AddResultDao();
					List record = ad.showAll(s); 
					if(record.size()>0){
					%>
					
					<table class="table">
						<thead>
							<tr>
								<th>Bill No</th>
								<th>Name</th>
								<th>Address</th>
								<th>Test Date</th>
								<th>Total Amount</th>
								<th>Paid Amount</th>
								<th>Action</th>
							</tr>
						</thead>
						<%
							
							for (int i = 0; i < record.size(); i++) {
								Map map = (Map) record.get(i);
						%>


						<tbody>
							<tr>
								<td><%=map.get("billid")%></td>
								<td><%=map.get("name")%></td>
								<td><%=map.get("address")%></td>
								<td><%=map.get("date")%></td>
								<td><%=map.get("total")%></td>
								<td><%=map.get("paid")%></td>
								<td><a href="patientresultsearchpending.jsp?id=<%=map.get("billid")%> "> <img	alt="Update Record" title="Update Record" src="../mg/icon_edit.png" width="15" height="15"> </a></td>
								
							</tr>
						</tbody>

						<%
							}
						%>
					</table>
					<%}else{
						%><div align="center" ><font color="red" ><h3>No Record found......</h3></font></div><%
					} %>
				</div>
			</div>
		</div>
	</div>

</body>
</html>