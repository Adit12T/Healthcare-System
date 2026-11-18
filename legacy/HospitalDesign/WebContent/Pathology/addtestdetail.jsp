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
	
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

	
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="../jquery.validate.js"></script>

<script>
$(function(){
	$("#add_test_details").click(function(){
	$("#add_test_detail").validate();
	
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
<style type="text/css">
table th {
	text-align: left;
}
</style>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Add New Test Detail</h2>
	<form action="../AddTestDetail" method="post" id="add_test_detail">
		<fieldset>
			<legend>PATHOLOGY MANAGER DETAIL</legend>
			<table>
				
				
				<!-- <tr>
					<th>Test_ID</th>
					<td><input type="text" name="tid"></td>
				</tr> -->
				<tr>
					<th>Test_Name</th>
					<td><input type="text" maxlength="15" name="tname" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
				</tr>
				<tr>
					<th>Test_Content</th>
					<td><input type="text" maxlength="15" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" name="tcontent" class="required"></td>
				</tr>
				<tr>
					<th>Start_Range</th>
					<td><input type="text" name="srange" maxlength="5" class="required" 
onkeypress="return number(event)" value=""></td>
				</tr>
				<tr>
					<th>End_Range</th>
					<td><input type="text" name="erange" class="required" maxlength="5" 
onkeypress="return number(event)" value=""></td>
				</tr>
				<tr>
					<th>Test_Cost</th>
					<td><input type="text" name="tcost" class="required"  maxlength="4"
onkeypress="return number(event)" value=""></td>
				</tr>
				
				<tr>
								<th></th>
								<td><input type="submit" id="add_test_details"></td>
							</tr>
			</table>
		</fieldset>
	</form>
	
	<div align="center"><%String ss=request.getParameter("msg");
	if(ss!=null)out.print("<font color='grean' size='12'>"+ss+"</font>");
	%> </div>
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
	</table>
	 --%>
	 </div>
	 </div>
	 </div>
</body>
</html>