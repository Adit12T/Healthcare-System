<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add operation</title>
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
	$("#addops").click(function(){
	$("#addop").validate();
	
	});
	});

</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!addop.o_type.value.match(/^[a-zA-Z]+$/)
				&& addop.o_type.value != "") {
			addop.o_type.value = "";
			addop.o_type.focus();
			alert("Please Enter only alphabets in Operation Type");
		}
		if (!addop.o_name.value.match(/^[a-zA-Z]+$/)
				&& addop.o_name.value != "") {
			addop.o_name.value = "";
			addop.o_name.focus();
			alert("Please Enter only alphabets in Operation Name");
		}
	}
</script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >15) {
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
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Add New Operation</h2>
<form action="../AddOperation" id="addop" name="addop">
<table align="center">
<tr>
<th>Operation Type</th><td><input type="text" name="o_type" class="required" onkeyup="AllowAlphabet()"> </td>
</tr>
<tr>
<th>Operation Name</th><td><input type="text" name="o_name" class="required" onkeyup="AllowAlphabet()"> </td>
</tr>
<tr>
<th>Operation Cost</th><td><input type="text" name="o_cost" class="required"  onKeyUp="return valtxt(this)"> </td>
</tr>
</table>
<h3 align="center"><input type="submit" id="addops"> </h3>
</form>
</div>
</div>
</div>
</body>
</html>