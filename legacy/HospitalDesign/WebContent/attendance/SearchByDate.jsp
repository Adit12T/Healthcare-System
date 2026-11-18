<%@page import="java.sql.*,java.util.Date,java.util.*,java.text.*;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><fmt:message key="title.doctorhome"/></title>
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
	<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
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
</head> 
<body >

    <% Date d=new Date();
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	String datevalue=format.format(d);
	String time=d.getHours()+":"+d.getMinutes();
    %>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Search Attendance By Date</h2>
<form method="post" action="TotalAttendance.jsp" name="f1">
		<div align="center"></div>
		<p align="center">
			<font size="5"><strong>By Date</strong> </font>
		</p>
		<p align="center">
			
		</p>
		<div align="center">
			choose date <input type="text" required="required" placeholder="MM/DD/YYYY" name="ddate" id="datepicker"> <br> <br>
			<br>
		</div>
		<div id="respond" align="center">
		
			<input type="submit" id="submit" name="tot" value="View Atendence">

		</div>
	</form>
	</div>
	</div>
	</div>
</body>
</html>
