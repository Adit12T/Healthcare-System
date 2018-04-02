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
	$("#sinfos").click(function(){
	$("#sinfo").validate();
	
	});
	});

</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!sup_reg.name.value.match(/^[a-zA-Z]+$/)
				&& sup_reg.name.value != "") {
			sup_reg.name.value = "";
			sup_reg.name.focus();
			alert("Please Enter only alphabets in Supplier Name");
		}
		if (!sup_reg.city.value.match(/^[a-zA-Z]+$/)
				&& sup_reg.city.value != "") {
			sup_reg.city.value = "";
			sup_reg.city.focus();
			alert("Please Enter only alphabets in City Name");
		}
		if (!sup_reg.state.value.match(/^[a-zA-Z]+$/)
				&& sup_reg.state.value != "") {
			sup_reg.state.value = "";
			sup_reg.state.focus();
			alert("Please Enter only alphabets in State Name");
		}
		if (!sup_reg.country.value.match(/^[a-zA-Z]+$/)
				&& sup_reg.country.value != "") {
			sup_reg.country.value = "";
			sup_reg.country.focus();
			alert("Please Enter only alphabets in country Name");
		}
	}
	</script>
	<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >11) {
		alert("Please enter 10 digit Mobile number.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact number.");
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
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
<script type="text/javascript">
function al()
{alert("submitted successfully!")}</script>
</head>
<body
<%String msg=request.getParameter("msg"); 
if(msg!=null){
%>
onload="al();"
<%} %>
>

	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Supplier Information</h2>
		
<form action="../SupplierInfoServlet" id="sinfo" name="sup_reg">
		<fieldset>
			<legend>Supplier Information </legend>
			<center>
						<table width="494" height="147">
					<tr>
						<th><label>Supplier Name</label></th>
						<td><input type="text" name="name" class="required" maxlength="20" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
						<th><label> City</label></th>
						<td><input type="text" name="city" class="required" maxlength="20" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
				  </tr>
					<tr>
						<th><label> Address</label></th>
						<td><textarea rows="3" cols="21" maxlength="100" name="add" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"class="required"></textarea></td>
					
						
					</tr>
					<tr>
					<th><label> State</label></th>
						<td><input type="text" name="state" maxlength="20" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
						<th><label> Country</label></th>
						<td><input type="text" name="country" maxlength="20" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>


					</tr>
					<tr>
					  <th height="40"><label> Contact No </label></th>
						<td><input type="text" name="cno" maxlength="10" class="required"  onkeypress="return number(event)"></td>
						<th><label> E-mail</label></th>
						<td><input type="text" name="email" maxlength="20" class="required email"></td>
					</tr>
		</table>
				<input type="submit" value="save" id="sinfos">
		</fieldset>
		</form>
	</div>
</div>
</div><%if(msg!=null){
%>
<div align="center" ><font color="green" ><h3>Successfully......</h3></font></div>
<%} %>

</body>
</html>