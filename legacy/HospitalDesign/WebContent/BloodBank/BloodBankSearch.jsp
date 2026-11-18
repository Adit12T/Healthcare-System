<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th{
text-align: left;
width:120px;
padding: 8px;
}
</style>
<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
</head>
<body>

	<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Blood Acceptor Registration</h2>

<form action="../BloodSearchServlet">
<!-- 
<center><input type="submit" value="Check blood Stock"/></center>
 --><fieldset>
<legend>Blood Record</legend>
<center>
	<% if (request.getAttribute("list") != null)

	{
		List ls = (List) request.getAttribute("list");
		//System.out.print(ls);
		
%>
<table border="1">
	<tr>
		<th>BloodGroupId</th>
		<th>BloodGroupType</th>
		<th>BloodGroupQuantity</th>
		<th>Action</th>
		
		
	</tr>

	<%Map map;
		for (int i = 0; i < ls.size(); i++) {
				 map = (Map) ls.get(i);
	%><tr>
	<td><%=map.get("id")%></td>
	<td><%=map.get("type")%></td>

	<td><%=map.get("quantity")%></td>
<td><a href=" BloodBank/Updatebbank.jsp?t=<%=map.get("type")%>" > <img	alt="Update Record" title="Update Record" src="./mg/icon_edit.png" width="15" height="15"></a></td>
		
	</tr>
	<% 
		}
	%>
</table>
</center>
<%
	}%> 
			</fieldset>
</form>
</div></div></div>
</body>
</html>