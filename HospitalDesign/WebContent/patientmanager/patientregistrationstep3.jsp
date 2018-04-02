<%@page import="database.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<script> 
function openerNew(val){
	//document.getElementById("btnStartTest").disabled = true;
    var params =  'top=0, left=0';
    params += ', width='+screen.width+', height='+screen.height+',statusbar=no,toolbar=no,location=no,directories=no,menubar=no,resizable=no';
    params += ', scrollbars=yes, status=no, fullscreen=yes';
    newwin=window.open("patientregistrationstepslip.jsp?id="+val,"_blank",params);
    if (window.focus) {newwin.focus()
 	
    }
        return false;
}
</script>

</head>
<body>

		
		<h2>Patient Registration</h2>

<%
PatientBean p=(PatientBean)session.getAttribute("patientinfo");

%>
<div style="clear: none;"></div>

<table width="634" height="362" border="1" cellpadding="0" cellspacing="0">
  <tr align="left" valign="top">
    <td width="627" height="213">
	<fieldset><legend >Patient Information</legend>
	<table width="592" height="100" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="119">Patient Reg. No.</td>
    <td width="207"><%=p.getPatientRegistrationno() %></td>
    <td width="116">Date</td>
    <td width="150"><%=DateConvert.convertDateToString(p.getPatientDateofregistraton()) %></td>
  </tr>
  <tr>
    <td>Patient Name </td>
    <td><%=p.getPatientName() %></td>
    <td>Time</td>
    <td><%=p.getPatientDateofregistraton().getHours()+":"+p.getPatientDateofregistraton().getMinutes() %></td>
  </tr>
  <tr>
    <td>Patient Age </td>
    <td><%=p.getPatientAge() %></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</fieldset>
	
	</td>
  </tr>
 
  <tr><td>
   <fieldset><legend>
  Disease Information
  </legend>
  
  <table width="586" height="75" border="1" cellpadding="0" cellspacing="0">
 <tr align="center" valign="top">
 <td width="70" >Serial No. </td>
    <td width="137">Disease Name </td>
    <td width="169">Doctor Name </td>
    <td width="166">Department</td>
	<td width="104">Token Number</td>
	
  </tr>
 <%
 List record=p.record;
 Map map;
 for(int i=0;i <record.size();i++)
 {
	map=(Map)record.get(i); 
 %>
  <tr valign="middle" align="center">
  <td ><%=i+1 %></td>
    <td width="137"><%=map.get("diseasename") %></td>
    <td width="169"><%=map.get("empname") %></td>
    <td width="166"><%=map.get("diseasename") %></td>
    <td width="104">
    
    <input type="button" onclick="openerNew(this.value)" name="s" value="<%=map.get("no") %>">
    <%-- <a   href="patientregistrationstepslip.jsp?id=<%=map.get("no") %>"><%=map.get("token") %></a> --%></td>
  </tr>

<%} %>
  </table>
  </fieldset>


  </td></tr>
    <!-- <tr><td></td></tr>
	  <tr><td></td></tr> -->
  
  
  
</table>

     
</body>
</html>