<%@page import="java.util.Map"%>
<%@page import="database.DateConvert"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.patientDetailBean"%>
<%@page import="com.pathologypatient.patientresultsearchpendingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
patientresultsearchpendingDao pb=new patientresultsearchpendingDao();
List record=pb.getgroup(id);
%>
<table width="519" height="258" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="479" height="121" border="0" cellpadding="0" cellspacing="0">
   <tr>
    <td width="67" height="32">Biil No. </td>
	<td width="194"><%=pb.getPathology_patient_id() %></td>
    <td width="220">Date: <%=DateConvert.convertDateToString(pb.getTest_date()) %> </td>
  </tr>
  
  <tr>
    <td width="67" height="38">Name </td>
	<td colspan="1"><%=pb.getPatient_name() %></td>
	<td>&nbsp;</td>
    </tr>
  <tr>
    <td height="51">Address</td>
    <td colspan="2" align="left" valign="middle"><%=pb.getPatient_address() %></td> 
  </tr>
</table></td>
  </tr>
  <tr>
    <td><table align="right" >
    <tr height="50">
				<td ></td>	<td ></td>	<td ></td>	<td ></td>
				</tr>
    <%
    int amt=0;
    Map map;
			for(int i=0;i<record.size();i++){
				map=(Map)record.get(i);
			
				amt=amt+(Integer)map.get("test_amount") ;
				
				
				%>
				
				
				<tr>
				<td width="235"  align="right"><%=map.get("test_name") %></td>
				<%-- <td width="165" align="center"><%=map.get("test_amount") %></td> --%>
				<td width="165" align="center"><%=map.get("test_status") %></td>
				<td width="165" align="center"><%=map.get("test_remark") %></td>
				<td width="165" align="center"><a href="patientresultZ.jsp?id=<%= id%>&name=<%=map.get("test_name")%>" >View</a></td>
				</tr>
				
				
				
				<%
					}%>
					 <tr height="50">
				<td ></td>	<td ></td>	<td ></td>	<td ></td>
				</tr>
					</table></td>
  </tr>
  <tr>
    <td>
    
    <table align="right">
    <tr><td height="30"></td><td></td><td ></td><td ></td></tr>
					<tr><td ></td><td ></td><td>Total  Amount</td><td align="right" ><%=pb.getTotal() %></td></tr>
					<tr><td ></td><td ></td><td>Customer Paid - </td><td align="right"><%=pb.getPaid() %></td></tr>
					<tr style="font-style: oblique;color: red;"><td ></td><td ></td><td>Remaining Amount</td><td align="right"><%=(pb.getTotal()-pb.getPaid()) %></td></tr>
					<tr><td height="30" colspan="4" align="left" valign="middle">
					<%int totals=pb.getTotal()-pb.getPaid();
					
					if(totals>0){%>
					<form action="../AddAmountServlet">
					<input type="hidden" name="remain" value="<%=totals %>">
					<input type="hidden" name="old" value="<%=pb.getPaid() %>">
					<input type="hidden" name="pid" value="<%=id%>"> 
					 <input type="submit" ></form> <%} %> </td></tr>
    </table>
    
    </td>
  </tr>
  
</table>


</body>
</html>