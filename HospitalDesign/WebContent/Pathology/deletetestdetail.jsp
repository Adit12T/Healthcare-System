<%@page import="com.pathologytestdetail.pathologyBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
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
			<h2>Delete Test Detail</h2>
<%
		int id = Integer.parseInt(request.getParameter("id"));
		pathologyBean pb = new pathologyBean();
		pb.getmethod(id);
	%>
	<form action="../DeleteTestDetail" method="post">
		<fieldset>
			<legend>PATHOLOGY MANAGER DETAIL</legend>
			<table>
				<tr>
					<th>Test_ID</th>
					<td><input readonly="readonly" type="text" name="tid"
						value="<%=pb.getTest_id()%>"></td>
				</tr>

				<tr>
					<th>Test_Name</th>
					<td><input type="text" name="tname"readonly="readonly"
						value="<%=pb.getTest_name()%>"></td>
				</tr>
				<tr>
					<th>Test_Content</th>
					<td><input type="text" name="tcontent"readonly="readonly"
						value="<%=pb.getTest_content()%>"></td>
				</tr>
				<tr>
					<th>Start_Range</th>
					<td><input type="text" name="srange"readonly="readonly"
						value="<%=pb.getStart_range()%>"></td>
				</tr>
				<tr>
					<th>End_Range</th>
					<td><input type="text" name="erange"readonly="readonly"
						value="<%=pb.getEnd_range()%>"></td>
				</tr>
				<tr>
					<th>Test_Cost</th>
					<td><input type="text" name="tcost"readonly="readonly"
						value="<%=pb.getTest_cost()%>"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" value="Delete"></td>
				</tr>
			</table>
		</fieldset>

	</form>
	<div align="center">
		<%
			String msg = request.getParameter("msg");
			if (msg != null) {
				if (msg.equalsIgnoreCase("sucess")) {
		%>
		<font color="green"> Update Successfully </font>
		<%
			} else {
		%>
		<font color="green"> Try Again </font>
		<%
			}
			}
		%>
	</div>
</div>
</div>
</div>
</body>
</html>