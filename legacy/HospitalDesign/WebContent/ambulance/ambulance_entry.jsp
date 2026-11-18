<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance Entry</title>
<script src="../js/jquery-1.8.0.js"></script>
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
	<script type="text/javascript" src="jquery.validate.js"></script>
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!am_ent.name.value.match(/^[a-zA-Z]+$/)
				&& am_ent.name.value != "") {
			am_ent.name.value = "";
			am_ent.name.focus();
			alert("Please Enter only alphabets in Patient Name");
	}
	}
	</script>
<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>
	<script>
$(function(){
	$("#ambulance_intry").click(function(){
	$("#amb_ent").validate();
	
	});
	});

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
</head>
<body <%String msg = request.getParameter("msg");
			if (msg != null) {%>
	onload="message()" <%}%>>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Ambulance Entry</h2>
		<center>
			<form action="../AmbulanceEntryServlet" name="am_ent" id="amb_ent">
				<fieldset>

					<table>
						<tr>
							<th>Patient Name</th>
							<td><input type="text" name="name" class="required" onkeyup=" AllowAlphabet() " > </td>
							<th>Ambulance Type</th>
							<td><select name="atype">
									<option value="critical care ambulance">critical care
										ambulance</option>
									<option value=" critical care oxg">critical care oxg</option>
									<option value="general ambulance">general ambulance</option>
									<option value="Emergancy">Emergancy</option>
							</select></td>



						</tr>
						<tr>
							<th>Date</th>
							<td><input type="text" name="date" id="datepicker"  class="required"></td>
							<th>Time</th>
							<td><input type="text" name="time"  class="required"></td>
						</tr>
						<tr>

							<th>Contact No</th>
							<td><input type="text" name="cno" class="required" onKeyUp="return valtxt(this)"></td>

							<th>Address</th>
							<td><input type="text" name="add"  class="required"></td>
						</tr>
					</table>
				</fieldset>
				<input type="submit" value="Submit" id="ambulance_intry"> <input type="Reset"
					value="Clear">
			</form>
		</center>
		</div>
		</div>
		</div>
</body>
</html>