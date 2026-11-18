<%@page import="database.DateConvert"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.AddpatienttestDao"%>
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
			<h2>Add Patient Test</h2>
<%if (session.getAttribute("pathology") != null) {
	System.out.print("hello");
	AddpatienttestDao d=(AddpatienttestDao)session.getAttribute("pathology");
	List record=d.getGroupData();
	Map map;
//	System.out.print(record.size());
%>
<table width="485" height="469" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td height="94" align="left" valign="top"><table width="479" height="121" border="0" cellpadding="0" cellspacing="0">
   <tr>
    <td width="67" height="32">Biil No. </td>
	<td width="194"><%=d.patientid %></td>
    <td width="220">Date: <%=DateConvert.convertDateToString(new Date()) %> </td>
  </tr>
  
  <tr>
    <td width="67" height="38">Name </td>
	<td colspan="1"><%=d.name %></td>
	<td>Time : <%=new Date().getHours()+":"+new Date().getMinutes()%></td>
    </tr>
  <tr>
    <td height="51">Address</td>
    <td colspan="2" align="left" valign="middle"><%=d.address %></td> 
  </tr>
</table>
</td>
  </tr>
  <tr align="center">
    <td height="277">
    <table align="right" >
    <%
    int amt=0;
			for(int i=0;i<record.size();i++){
				map=(Map)record.get(i);
				
				amt=amt+(Integer)map.get("amount") ;
				%>
				
				
				<tr>
				<td width="235"  align="right"><%=map.get("name") %></td>
				<td width="165" align="center"><%=map.get("amount") %></td>
				</tr>
				
				
				
				<%
					}%>
					<tr><td ></td><td ></td></tr>
					<tr><td height="30"></td><td ></td></tr>
					<tr><td align="right"><font  color="red">Total</font></td><td align="center"><font  color="red"><%=d.total %></font></td>
					</tr>
					<tr><td align="right"><font  color="red">Customer Paid</font></td><td align="center"><font  color="red"><%=d.paid %> </font></td>
					</tr>
					</table>
			
    
    </td>
  </tr>
  <tr>
    <td height="95" align="center" valign="middle">
  <!--   <input type="submit"> -->
    
    </td>
  </tr>
</table>

	
			<%
			
			
		}
	%>
	</div>
	</div>
	</div>
</body>
</html>