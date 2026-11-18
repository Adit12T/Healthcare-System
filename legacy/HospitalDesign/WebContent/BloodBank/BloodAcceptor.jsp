<%@page import="BloodBank.BloodBankBean"%>
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

	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/setup.js" type="text/javascript"></script>
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>


<script>
function convertToUpper(ID){
	document.getElementById(ID).value=document.getElementById(ID).value.toUpperCase()
}

$(function(){
	$("#bacts").click(function(){
	$("#bact").validate();
	
	});
	});

</script>

<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>

<script>
$(function() {
	$("#datepicker").datepicker({
		minDate : -9000000000000000,
		maxDate : 0,

		showOn : "button",
		buttonImage : "../images/calendar.gif",
		buttonImageOnly : true

	});
});
	</script>
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
width: 100px;
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
<script type="text/javascript">
	function AllowAlphabet(){
		if (!blac.name.value.match(/^[a-zA-Z]+$/)
				&& blac.name.value != "") {
			blac.name.value = "";
			blac.name.focus();
			alert("Please Enter only alphabets in Acceptor Name");
		}
		if (!blac.city.value.match(/^[a-zA-Z]+$/)
				&& blac.city.value != "") {
			blac.city.value = "";
			blac.city.focus();
			alert("Please Enter only alphabets in City Name");
		}
		if (!blac.state.value.match(/^[a-zA-Z]+$/)
				&& blac.state.value != "") {
			blac.state.value = "";
			blac.state.focus();
			alert("Please Enter only alphabets in State Name");
		}
		if (!blac.country.value.match(/^[a-zA-Z]+$/)
				&& blac.country.value != "") {
			blac.country.value = "";
			blac.country.focus();
			alert("Please Enter only alphabets in Country Name");
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
</head>
<body>

	<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Blood Acceptor Registration</h2>
		<form action="../BloodAcceptorServlet" id="bact" name="blac">
				<%
					Date date = Calendar.getInstance().getTime();
					DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
					String todaydate = formatter.format(date);
				%>
				<div align="right">
					<label>date</label><input type="text" name="date"
						value=<%=todaydate%> readonly="readonly">
				</div>

				<fieldset>
					<legend>Personal Information</legend>
						<table>
							<tr>
								<th ><label >Name</label></th>
								<td><input type="text" name="name" maxlength="25" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
								<th><label>DOB</label></th>
								<td><input type="text" id="datepicker" name="dob" class="required" readonly="readonly"></td>
							</tr>
							<tr>
								<th><label>Gender</label></th>
								<td><label>Male</label><input type="radio" name="gender" value="Male" checked="checked">
									<label>Female</label><input type="radio" value="Female" name="gender">
								</td>
								<th><label>Age</label></th>
								<td><input type="text" name="age"  class="required" maxlength="2"
onkeypress="return number(event)" value="" ></td>
							</tr>
							<tr>
								<th>Blood Group</th>
								<td><select name="bloodgroup" style="width:145px;">
										<option>O_positive</option>
										<option>O_negative</option>
										<option>A_positive</option>
										<option>A_negative</option>
										<option>B_positive</option>
										<option>B_negative</option>
										<option>AB_positive</option>
										<option>AB_negative</option>
								</select></td>
							</tr>
						</table>
				</fieldset>
				<fieldset>
					<legend>Contact Detail</legend>
						<table>
							<tr>
								<th><label>Address</label></th>
								<td><textarea rows="3" cols="21" name="address"  class="required" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"></textarea></td>
								<th><label>City</label></th>
								<td><input type="text" name="city"  class="required"  maxlength="15" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
							</tr>
							<tr>
								<th><label>state</label></th>
								<td><input type="text" name="state"  class="required" maxlength="15"onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
								<th><label>Country</label></th>
								<td><input type="text" name="country"  class="required" maxlength="20"onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" ></td>
							</tr>
							<tr>
								<th><label>Contact No</label></th>
								<td><input type="text" name="cno" maxlength="10" class="required" onkeypress="return number(event)" value=""></td>
								<th><label>E-mail</label></th>
								<td><input type="text" name="email" maxlength="25" class="required email" value="" ></td>


							</tr>
						</table>
				</fieldset>
				<fieldset>
					<legend>Other Details</legend>

						<table>
							<tr>


								<th><label>Quantity</label></th>
								<td><input type="text" name="quantity"  class="required"  onkeypress="return number(event)" value="" maxlength="4"></td>

							</tr>


						</table>

				</fieldset>
				<input type="submit" value="register" id="bacts">
		</form>

	
	
	<%-- <fieldset>
<legend>Blood Record</legend>
	<% if (BloodBankBean.getblood()!= null)

	{
		List ls = BloodBankBean.getblood();
		//System.out.print(ls);
		
%>
<table  class="table">
	<tr>
		<th>BloodGroupId</th>
		<th>BloodGroupType</th>
		<th>BloodGroupQuantity</th>
		
		
		
	</tr>

	<%Map map;
		for (int i = 0; i < ls.size(); i++) {
				 map = (Map) ls.get(i);
	%><tr>
	<td><%=map.get("id")%></td>
	<td><%=map.get("type")%></td>

	<td><%=map.get("quantity")%></td>

		
	</tr>
	<% 
		}
	%>
</table>
<%
	}%> 
			</fieldset> --%>
	</div>
	</div>
	</div>
</body>

</html>