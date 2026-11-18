<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Inventory.IssueDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Quantity.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	return true;
}

</script>
<script type="text/javascript">
function valtxt2(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >11) {
		alert("Please enter Valid Amount.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Amount.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<style type="text/css">
table th,td {
	text-align: center;
}

</style>
</head>
<body>
	<%
		String name = request.getParameter("name");
		IssueDao is = new IssueDao();
		List reList = is.show(name);
		if(reList.size()>0){
	%>

	<table width="100%">
		<tr>
			<th width="100">Medicine name</th>
			<th width="100">Available Quantity</th>
			<th width="100">Request</th>
			<th width="100">Total Cost</th>
			<th width="100">Submit</th>

		</tr>
		</table>
		<%
			Map map;
			for (int i = 0; i < reList.size(); i++) {
				map = (Map) reList.get(i);
		%>

	<form action="../NewissueitemServelt">
<table  width="100%">		<tr>
			<%-- <td><%=map.get("item_id") %></td> --%>
			<%-- <td><%=map.get("item_type") %></td> --%>

			<td width="100"><input type="hidden" name="name"
				value="<%=map.get("item_name")%>"><%=map.get("item_name")%></td>
			<td width="100"><%=map.get("total_quantity")%></td>
			<td width="100"><input type="text" name="quantity" required="required"  onkeypress="return number(event)" value=""></td>
			<td width="100"><input type="text" name="total"  required="required"  onkeypress="return number(event)" value=""></td>
			<td width="100"><input type="submit"></td>

		</tr></table>
		</form>
		<%}
			}else{
			%>
			<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
			<%	
			}
		%>
	
</body>
</html>