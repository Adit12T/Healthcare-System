<%@page import="database.DateConvert"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Inventory.NewissueitemDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

</head>
<body>



<form action="../NewIssueServletSaveData">


<table width="638" height="285" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td height="69">&nbsp;</td>
  </tr>
  <tr>
    <td height="45" align="left" valign="top"><table width="631" height="44" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="122">Name : </td>
        <td width="192"><input type="text" name="name" maxlength="20" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
        <td width="157">&nbsp;</td>
        <td width="160">&nbsp;</td>
      </tr>
      <tr>
        <td>Date :</td>
        <td><%=DateConvert.convertDateToString(new Date()) %></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="168">



<table border="0" cellpadding="0" cellspacing="0">

	<tr><td width="100"></td><td width="200"></td><td width="100"></td><td width="100"></td><td width="100"></td></tr>
	
		<%
			NewissueitemDao d;
			if (session.getAttribute("i") != null) {
				d = (NewissueitemDao) session.getAttribute("i");
				if(request.getParameter("id")!=null)
				{
				d.delete(request.getParameter("id"));	
				}	
				List record = d.record;
				Map map;int t=0;
				for (int i = 0; i < record.size(); i++) {
					map = (Map) record.get(i);
					t=t+(Integer)map.get("total");
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=map.get("name")%></td>
			<td><%=map.get("quantity")%></td>
			<td><%=map.get("total")%></td>
<td><a href="newissueitem1.jsp?id=<%=i%>">Delete</a> </td>

		</tr>


		<%
			}
				%>
				<tr ><td height="60"></td><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td>Total</td><td><%=t %></td></tr>
				<tr><td colspan="4" height="10"> </td></tr>
				<tr><td colspan="4" align="center">
				<input type="hidden" name="total"value="<%=t%>"> 
				<input type="submit"> </td></tr>
				
				<%
			} 
				
		%>
	</table>
</td>
  </tr>
</table>

</form>

<%String msg=request.getParameter("msg");

if(msg!=null)
out.print("<div align='center'><font color='red'>"+msg+"</font></div> ");
%>

</body>
</html>