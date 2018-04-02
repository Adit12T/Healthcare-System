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
</head>
<body><%PatientDischargeDao pd=new PatientDischargeDao();
String s=request.getParameter("name");
List record=pd.show(s);
if(record.size()>0){
%>
<table width="911" height="53" border="1" cellpadding="0" cellspacing="0" class="table">
  <tr>
  <th width="55">S.No.</th>
    <th width="89">Admit Date </th>
    <th width="91">Patint reg.No </th>
    <th width="159">Patient Name </th>
    <th width="77">Room No </th>
    <th width="65">Bed No </th>
    <th width="141">Dr Name </th>
    <th width="139">Disease Name </th>
    <th width="75">Daily Detail </th>
  </tr>
  <%
 // System.out.print(record);
  Map map;
  for(int i=0;i<record.size();i++){
	  map=(Map)record.get(i);
	  String adate=DateConvert.convertDateToString((Date)map.get("admitdate") );
	  %>
	  <tr>
	    <td><%= i+1 %></td>
	    <td> <%=map.get("admitdate") %></td>
	    <td> <%=map.get("patientro") %></td>
	    <td> <%=map.get("patientname") %></td>
	    <td> <%=map.get("roomno") %></td>
	    <td> <%=map.get("bedname") %></td>
	    <td> <%=map.get("empname") %></td>
	    <td> <%=map.get("diseasename") %></td>
	    <td> <a href="checkupdaily.jsp?pid=<%=map.get("patientro")%> &pname=<%=map.get("patientname")%>&pdatea=<%=adate%>"><img	alt="Check-up" title="Check-up" src="../mg/icon_edit.png" width="15" height="15"></a></td>
	  
  </tr><% }%>
</table><%}else{
	%>
	<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
	
	<%
} %>
</body>
</html>