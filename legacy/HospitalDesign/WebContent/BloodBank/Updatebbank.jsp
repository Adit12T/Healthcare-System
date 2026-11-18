<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css"
	media="all">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
	
	
	<script src="../jquery-1.8.0.js" type="text/javascript"></script>
	<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

	
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#upbloods").click(function(){
	$("#upblood").validate();
	
	});
	});

</script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >3) {
		alert("Please enter Valid Quantity.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Quantity.");
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
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Update Blood Bank</h2>
		<form action="../UpdatebbankServlet" id="upblood" name="upbld">
			<center>
				<table>
				<tr>
				<th>Blood Type</th><td><input type="text" name="t" value="<%=request.getParameter("t")%>" readonly="readonly"></td>
				</tr>
				<tr>
				<th>Action</th><td><select
					name="action">
					<option>Add</option>
					<option>Delete</option>
				</select>
				</td>
				</tr>
				<tr>
				<th>Blood Quantity</th><td><input type="text" name="q" class="required" maxlength="5" onkeypress="return number(event)" value=""> </td>
				</tr>
				</table>
				 <input type="submit" value="add" id="upbloods">

			</center>
		</form>
		</div>
		</div>
		</div>
</body>
</html>