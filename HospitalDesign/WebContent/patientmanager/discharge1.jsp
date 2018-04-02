<%@page import="database.DateConvert"%>
<%@page import="com.patientmanager.DischargeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%int i=Integer.parseInt(request.getParameter("id"));
DischargeBean dc=new DischargeBean();
dc.setData(i);

%>
<table width="554" height="399" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td height="171" align="center" valign="top"><table width="547" height="133" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="142">Patient Reg. No. </td>
        <td width="193"><%=dc.getPatientregno() %></td>
        <td width="125">Admit Date </td>
        <td width="77"><%=DateConvert.convertDateToString(dc.getAdmitdate()) %></td>
      </tr>
      <tr>
        <td>Patient Name </td>
        <td><%=dc.getPatientname() %></td>
        <td>DisCharge Date </td>
        <td><%=DateConvert.convertDateToString(dc.getDischargedate()) %></td>
      </tr>
      <tr>
        <td>Patient Age </td>
        <td><%=dc.getPatientage() %></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Patient Gander </td>
        <td><%=dc.getGender() %></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="164" align="right" valign="middle">
	<table width="397" height="35" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" height="35" align="left">Room Charge : <%=dc.getRoomtypecost() %> X <%=dc.getStaydays()%>  </td>
    <td width="112" align="right"><%=dc.getBedcost() %></td>
  </tr>
  <tr>
    <td width="100" height="35" align="left">Daily Check Charge</td>
    <td width="112" align="right"><%=dc.getDailycheckcost() %></td>
  </tr>
  <tr>
    <td width="100" height="35">Operation Cost</td>
    <td width="112" align="right"><%=dc.getOtcost() %></td>
  </tr>
  <tr >
    <td width="100" height="35" align="left"> Customer Paid: </td>
    <td  width="112" align="right"><font color ="#971010"> - <%=dc.getCustomerpaid() %></font></td>
  </tr>
  
</table>

	</td>
  </tr>
  <tr>
    <td align="right" ><font color ="#009900"><%=(dc.getTotalamount() -dc.getCustomerpaid())%></font> </td>
  </tr>
</table>
<div align="center"><form action="discharge2.jsp">
<input type="hidden" name="id" value="<%=i%>">
<input type="submit" value="submit"></form> </div>

</body>
</html>