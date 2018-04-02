<%@page import="java.util.Map"%>
<%@page import="com.pathologypatient.PatientresultZDao"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.patientresultsearchpendingDao"%>
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
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
<%String id=request.getParameter("id");
String name=request.getParameter("name");

PatientresultZDao p=new PatientresultZDao();
List record=p.getgroupDetail(id, name); %>
<table width="700" height="539" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="444" height="96" align="left" valign="top"><img src="report.JPG"></td>
  </tr>
   <tr>
    <td height="54">
	<table width="695" height="41" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">Name : </td>
    <td width="272"><%=p.getPatient_name() %></td>
    <td width="116"></td>
	<td width="84" align="left">Test Name : </td>
    <td width="148"><%=name %></td>
  </tr>
  <tr>
    <td>Address</td>
    <td><%=p.getPatient_address() %></td>
     <td></td>
	<td align="left">Test Date : </td>
    <td><%=p.getTest_date() %></td>
  </tr>
</table>

	
	</td>
  </tr>
 
  <tr>
    <td align="center" valign="top">
    
    <table width="560" height="32" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="180" height="30">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="180">&nbsp;</td>
     <td width="180">&nbsp;</td>
  </tr>
  <%
  Map map;
  for(int i=0;i<record.size();i++)
  {
	 map=(Map)record.get(i); 
	 
	
	  %>
	   <tr>
    <td width="180" height="30"><%=map.get("test_content") %></td>
     <td width="180" height="30"><%=map.get("test_startrange") %></td>
      <td width="180" height="30"><%=map.get("test_endrange") %></td>
       <td width="180" height="30"><%=map.get("test_result") %></td>
    
  </tr>
	  <%
	  
  }
  
  %>
  <tr>
    <td colspan="4" height="100"></td>
  </tr>
  <tr height="100" style="font-style:oblique;color: red;   ">
    <td align="left" width="200" valign="top">Remark : </td><td colspan="3" align="left" valign="top"><%=p.remark %></td>
  </tr>
  
</table>
    
    </td>
  </tr>
 
</table>
</div>
</div>
</div>
</body>
</html>