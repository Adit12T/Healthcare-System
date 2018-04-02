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

</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
	<%
		NewissueitemDao d=(NewissueitemDao)session.getAttribute("i");
		if (d!= null) {
		//	d =  session.getAttribute("i");
	%>
	<table width="638" height="285" border="1" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="69"><img src="../img/logo.png" width="633" height="52"> </td>
		</tr>
		<tr>
			<td height="45" align="left" valign="top"><table width="631"
					height="44" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="122">Name :</td>
						<td width="192"><%=d.Name%></td>
						<td width="157" align="right">Bill No. </td>
						<td width="160"><%=d.billno%></td>
					</tr>
					<tr>
						<td>Date :</td>
						<td><%=DateConvert.convertDateToString(new Date())%></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="168">



				<table border="0" cellpadding="0" cellspacing="0">

					<tr>
						<td width="100"></td>
						<td width="200"></td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="100"></td>
					</tr>

					<%
						List record = d.record;
							Map map;
							int t = 0;
							for (int i = 0; i < record.size(); i++) {
								map = (Map) record.get(i);
								t = t + (Integer) map.get("total");
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=map.get("name")%></td>
						<td><%=map.get("quantity")%></td>
						<td><%=map.get("total")%></td>
						<td></td>

					</tr>


					<%
						}
					%>
					<tr>
						<td height="60"></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr style="font: normal;color: green;">
						<td></td>
						<td></td>
						<td>Total</td>
						<td><%=t%></td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><input type="hidden"
							name="total" value="<%=t%>"></td>
					</tr>

					<%%>
				</table>
			</td>
		</tr>
	</table>
	<%
	session.setAttribute("i", null);
		}
	%>
</div>
</div>
</div>

</body>
</html>