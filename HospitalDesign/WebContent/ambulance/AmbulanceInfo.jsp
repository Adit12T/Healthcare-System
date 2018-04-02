<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance Information</title>
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
<script src="../js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#ambulance_info").click(function(){
	$("#amb_inf").validate();
	
	});
	});

</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!ambinf.dname.value.match(/^[a-zA-Z]+$/)
				&& ambinf.dname.value != "") {
			ambinf.dname.value = "";
			ambinf.dname.focus();
			alert("Please Enter only alphabets in Driver Name");
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

#small_input {
	width: 50px;
}

#course {
	width: 150px;
}

#pro {
	text-align: center;
}
</style>
<script type="text/javascript">
	function message()

	{
		alert("Inserted Successfully");

	}
</script>
</head>
<body <%String msg = request.getParameter("msg");
			if (msg != null) {%>
	onload="message()" <%}%>>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Ambulance Information</h2>
		<center>
			<form action="../AmbulanceInfoServlet" id="ambulance_info" name="ambinf">
				<fieldset>

					<table>
						<tr>

							<th>Ambulance Type</th>
							<td><select name="atype">
									<option value="critical care ambulance">critical care
										ambulance</option>
									<option value=" critical care oxg">critical care oxg</option>
									<option value="general ambulance">general ambulance</option>
									<option value="Emergancy">Emergancy</option>
							</select></td>
							<th>
						</tr>


						<tr>
							<th>Driver Name</th>
							<td><input type="text" name="dname" class="required" onkeyup=" AllowAlphabet() " ></td>
							<th>Contact No</th>
							<td><input type="text" name="cno" class="required" onKeyUp="return valtxt(this)"> </td>



						</tr>
					</table>
				</fieldset>
				<input type="submit" value="Submit" id="amb_inf"> <input type="Reset"
					value="Clear">
			</form>
		</center>
		</div>
		</div>
		</div>
</body>
</html>