<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance Search</title>
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
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="../demos.css">
	<script>
	$(function() {
		$( "#pname" ).datepicker({ minDate: "-12M", maxDate: "0" ,
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true});
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
#action th{
width: 250px;
}
#action td{
width: 300px;
}
</style>
<script type="text/javascript">
	function rd1() {
		document.getElementById("pname").style.display = 'block';
		document.getElementById("atype").style.display = 'none';

	}

	function rd3() {
		document.getElementById("pname").style.display = 'none';
		document.getElementById("atype").style.display = 'block';
	}
</script>
</head>
<body>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2> Search Ambulance Running Detail</h2>
		<form action=" ../AmbulanceSearchServlet" target="search">
			<fieldset>
				<center>
					<table id="action">
						<tr>
							<td>By Date<input type="radio" name="r" onclick="rd1()"
								checked="checked" value="bypname"></td><td> <input type="text"
								name="pname" id="pname" readonly="readonly"></td>
						</tr>
						</table>
						<table id="action">
						<!-- <tr>
							<th>By Time<input type="radio" name="r" onclick="rd2()"
								value="bydname"></th><td> <input type="text" name="dname"
								id="dname" style="display: none;"></td>
						</tr> -->
						<tr>
							<td>By Ambulance Type<input type="radio" name="r"
								onclick="rd3()" value="byatype"></td><td> <select name="atype"
								id="atype" style="display: none;"><option value="">choose
										option</option>
									<option value="critical care ambulance">critical care
										ambulance</option>
									<option value=" critical care oxg">critical care oxg</option>
									<option value="general ambulance">general ambulance</option>
									<option value="Emergancy">Emergancy</option>
							</select></td>

						</tr>


					</table>
					<input type="submit" value="Search" >
				</center>

			</fieldset>
			<iframe src="searchcontain.jsp" name="search" width="100%" style="height: 900px;"></iframe>
		</form>
		</div>
		</div>
		</div>
</body>
</html>