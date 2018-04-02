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

<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#bdons").click(function(){
	$("#bdon").validate();
	
	});
	});

</script>
<script src="../js/setup.js" type="text/javascript"></script>


<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>

<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>
	
	
	
	<script>
	$(function() {
		$( "#datepicker1" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>
	
	
	
<script type="text/javascript">

function convertToUpper(ID){
	document.getElementById(ID).value=document.getElementById(ID).value.toUpperCase()
}

	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!bdon.name.value.match(/^[a-zA-Z]+$/)
				&& bdon.name.value != "") {
			bdon.name.value = "";
			bdon.name.focus();
			alert("Please Enter only alphabets in Donor Name");
		}
		if (!bdon.city.value.match(/^[a-zA-Z]+$/)
				&& bdon.city.value != "") {
			bdon.city.value = "";
			bdon.city.focus();
			alert("Please Enter only alphabets in City Name");
		}
		if (!bdon.state.value.match(/^[a-zA-Z]+$/)
				&& bdon.state.value != "") {
			bdon.state.value = "";
			bdon.state.focus();
			alert("Please Enter only alphabets in State Name");
		}
		if (!bdon.country.value.match(/^[a-zA-Z]+$/)
				&& bdon.country.value != "") {
			bdon.country.value = "";
			bdon.country.focus();
			alert("Please Enter only alphabets in Country Name");
		}
		if (!bdon.uname.value.match(/^[a-zA-Z]+$/)
				&& bdon.uname.value != "") {
			bdon.uname.value = "";
			bdon.uname.focus();
			alert("Please Enter only alphabets in Username");
		}
		
	}
	</script>
	<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >2) {
		alert("Please enter Valid Age.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Age.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<script type="text/javascript">
function valtxt1(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >3) {
		alert("Please enter Valid Quanlity.");
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
<script type="text/javascript">
function valtxt2(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >10) {
		alert("Please enter Valid Contact Number.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact Number.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<script type="text/javascript">
function valtxt3(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >3) {
		alert("Please enter Valid Contact Number.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact Number.");
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
th{
text-align: left;
width:120px;
padding: 8px;
}
</style>

<style type="text/css">
fieldset {
	margin: 0px;
	padding: 0px;
}


</style>
<script type="text/javascript">
function f1()
{
//alert("dsf");
	
	}

</script>
</head>
<body>

	<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Donor Registration</h2>
		<form action="../BloodDonerServlet" id="bdon" name="bdon">
			<%
				Date date = Calendar.getInstance().getTime();
				DateFormat formatter = new SimpleDateFormat("yyyy/mm/dd");
				String todaydate = formatter.format(date);
			%>
			<div align="right">
				<label>date</label><input type="text" name="date"
					value=<%=todaydate%>>
			</div>
				<fieldset>
					<legend>Personal Information</legend>
						<table>
							<tr>
								<th><label>Name</label></th>
								<td><input type="text" name="name" maxlength="25" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
								<th><label>Dob</label></th>
								<td><input type="text" name="dob" readonly="readonly" id="datepicker" placeholder="YYYY/MM/DD"  class="required"></td>
							</tr>
							<tr>
								<th><label>Gender</label></th>
								<td><label>Male</label><input type="radio"  name="gender" checked="checked"
									value="male"> <label>Female</label><input type="radio"
									name="gender" value="female"></td>
								<th><label>Age</label></th>
								<td><input type="text" name="age"  class="required" maxlength="2" 
onkeypress="return number(event)" value="" ></td>
							</tr>
							<tr>
								<th>Blood Group</th>
								<td><select name="bloodgroup" onchange="f1()">
										<option>O_positive</option>
										<option>O_negative</option>
										<option>A_positive</option>
										<option>A_negative</option>
										<option>B_positive</option>
										<option>B_negative</option>
										<option>AB_positive</option>
										<option>AB_negative</option>
								</select></td>
								<th><label>Weight</label></th>
								<td><input type="text" name="weight" maxlength="3" placeholder=" IN KG"  class="required" 
onkeypress="return number(event)" value="" ></td>

							</tr>
						</table>
				</fieldset>
				<fieldset>
					<legend>Contact Detail</legend>
						<table>
							<tr>
								<th><label>Address</label></th>
								<td><textarea rows="3" cols="15" name="add"  class="required" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"></textarea></td>
								<th><label>City</label></th>
								<td><input type="text" name="city"  class="required" maxlength="25" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
							</tr>
							<tr>
								<th><label>state</label></th>
								<td><input type="text" name="state"  class="required" maxlength="25" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
								<th><label>Country</label></th>
								<td><input type="text" name="country"  class="required" maxlength="25" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
							</tr>
							<tr>
								<th><label>Contact No</label></th>
								<td><input type="text" name="cno" maxlength="10" class="required" onkeypress="return number(event)" value=""  ></td>
								<th><label>E-mail</label></th>
								<td><input type="text" name="cno" maxlength="25" class="required email"  placeholder="xyz@domainname.com"></td>


							</tr>
						</table>
				</fieldset>
				<fieldset>
					<legend>Other Details</legend>
						<table>
							<tr>

								<th><label>User Name</label></th>
								<td><input type="text" name="uname"  class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
								<th><label>Remark</label></th>
								<td><input type="text" name="remark" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"  class="required"></td>


							</tr>

							<tr>
								<th><label>Password</label></th>
								<td><input type="password" name="password"  class="required"></td>
								<th><label>Conform Password</label></th>
								<td><input type="password" name="cpwd"  class="required"></td>



							</tr>

							<tr>
								<th><label>Last Donation Date</label></th>
								<td><input type="text" name="lddate" id="datepicker1" readonly="readonly" placeholder="YYYY/MM/DD"  class="required"></td>
								<th><label>Quantity</label></th>
								<td><input type="text" name="quantity" placeholder="in ml"  class="required" 
onkeypress="return number(event)" value=""  ></td>

							</tr>

						</table>

				</fieldset>
				<input type="submit" value="register" id="bdons">
		</form>
	</div>
	</div>
	</div>
</body>

</html>