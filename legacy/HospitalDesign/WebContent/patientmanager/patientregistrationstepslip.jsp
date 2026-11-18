<%@page import="java.util.Date"%>
<%@page import="database.DateConvert"%>
<%@page import="com.patientmanager.*"%>
<%@page import="com.dao.PatientInsidedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Up </title>
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
<script>
function printDiv()
{
  var divToPrint=document.getElementById('areaToPrint');
  newWin= window.open("");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Patient Registration</h2>
<%int id=Integer.parseInt(request.getParameter("id"));
PatientInsideSlipDao pd=new PatientInsideSlipDao(id);

%>
<table width="634" height="362" border="0" cellpadding="0" cellspacing="0"  id="areaToPrint" style="border: 1px solid;background-color:white;">
  <tr align="left" valign="top">
    <td width="627" height="213"  style="border-bottom:1px solid;">
	<fieldset><legend >Check Up</legend>
	<table width="592" height="113" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <th width="119">Patient Reg. No.</th>
    <td width="207"><%=pd.getPatientRegistrationno() %></td>
    <th width="116">Date</th>
    <td width="150"><%=DateConvert.convertDateToString(new Date()) %></td>
  </tr>
  <tr>
    <th>Patient Name </th>
    <td><%=pd.getPatientName() %></td>
    <th>Dr Name</th>
    <td><%=pd.getPatientdrname() %></td>
  </tr>
  <tr>
    <th>Patient Age </th>
    <td><%=pd.getPatientAge() %></td>
    <th>Department</th>
    <td><%=pd.getDepartment() %></td>
  </tr>
  <tr>
    <th>Token Number</th>
    <td><%=pd.getToken() %></td>
    <th>Disease Name </th>
    <td><%=pd.getDiseasename()%></td>
  </tr>
</table>
</fieldset>
	
	</td>
  </tr>
 
  <tr ><td width="400" height="400">
  
  </td></tr>
  
</table>
<input type="button" value="print" onclick="printDiv()">
</div>
</div>
        </div>
</body>
</html>