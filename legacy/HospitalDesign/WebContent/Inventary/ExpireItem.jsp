<%@page import="Inventory.InventoryBean"%>
<%@page import="java.sql.ResultSet" import="java.util.Calendar"%>
<%@page import="database.dbcon" import=" database.DateConvert"
	import=" java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DateFormat"
	import="java.text.SimpleDateFormat" import="java.util.*"%>
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
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>

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
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Expire Item Report</h2>
		<form action="">
			<fieldset>
				<legend>Expire Item Report</legend>
				<center>


					

				</center>

			</fieldset>
		</form>
		<fieldset>
			<% String type=(String)request.getAttribute("s1");
			String name=(String)request.getAttribute("s2");
			String company=(String)request.getAttribute("s3");
			String date=(String)session.getAttribute("exdate");
			InventoryBean i=new InventoryBean();
			List record=i.getExItem();
				
			%>
			<center>


				<table border="1" class="table">
					<tr>
						
						<th>Item Type</th>


						<th>Item Name</th>




						<th>Quantity</th>
						<th>Action</th>



					</tr>

					<%Map map;
					for (int j = 0; j < record.size(); j++) {
						map = (Map) record.get(j);
						
		%>
		

					<tr>
						
						<td><%=map.get("type")%></td>
						<td><%=map.get("name")%></td>
						<td><%=map.get("quantity")%></td>
						<td><a href="../DeleteItemServlet?&s1=<%=map.get("exdate")%>&s2=<%=map.get("quantity")%>&s3=<%=map.get("type")%>&s4=<%=map.get("name")%>&s5=<%=map.get("company")%>">Delete Quantity</a></td>




					</tr>
				
			<%
				}
			%>
				
				</table>

			</center>
		</fieldset>
		</div>
		</div>
		</div>
		</body>
</html>