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
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#up_test_details").click(function(){
	$("#up_test_detail").validate();
	
	});
	});

</script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >11) {
		alert("Please enter valid cost.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Cost.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}

</script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Update Test Detail</h2>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		pathologyBean pb = new pathologyBean();
		pb.getmethod(id);
	%>
	<form action="../UpdateTestDetail" method="post" id="up_test_detail">
	
				<input readonly="readonly" type="hidden" name="tid"
						value="<%=pb.getTest_id()%>">
		<fieldset>
			
			<table>
				
				
				

				<tr>
					<th>Test_Name</th>
					<td><input type="text" name="tname"
						value="<%=pb.getTest_name()%>" readonly="readonly" class="required"></td>
				</tr>
				<tr>
					<th>Test_Content</th>
					<td><input type="text" name="tcontent" readonly="readonly"
						value="<%=pb.getTest_content()%>" class="required"></td>
				</tr>
				<tr>
					<th>Start_Range</th>
					<td><input type="text" name="srange" 
						value="<%=pb.getStart_range()%>" class="required"></td>
				</tr>
				<tr>
					<th>End_Range</th>
					<td><input type="text" name="erange"
						value="<%=pb.getEnd_range()%>" class="required"></td>
				</tr>
				<tr>
					<th>Test_Cost</th>
					<td><input type="text" name="tcost"
						value="<%=pb.getTest_cost()%>" class="required" onKeyUp="return valtxt(this)"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" value="update" id="up_test_details"></td>
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
	<%-- <table border="" bgcolor="#FDFBFC">
	
	<th>Test_ID</th>
	<th>Test_Name</th>
	<th>Test_Content</th>
	<th>Start_Range</th>
	<th>End_Range</th>
	
	</tr>
	<%
		String sql = "select * from pathelogy_test_detail ";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		while (rs.next()) {
	%>


	
		<tr>
		    
		
			<td><%=rs.getString(1)%></td>
		
		
			<td><%=rs.getString(2)%></td>
		
		
			<td><%=rs.getString(3)%></td>
		
		
			<td><%=rs.getString(4)%></td>
			
			<td><%=rs.getString(5)%></td>
			
			
		</tr>

	
	<%
		}
	%>
	</table> --%>
	</div>
	</div>
	</div>
</body>
</html>