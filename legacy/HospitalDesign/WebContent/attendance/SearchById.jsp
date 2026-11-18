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
		<h2>View Attendance By ID</h2>
<form method="post" action="TotalAttendance1.jsp" name="f1">
		<div align="center"></div>
		<p align="center">
			<font size="5"><strong>ID</strong> </font>
		</p>
		<p align="center">
			
		</p>
		<div align="center">
			By id <input type="text" name="idd" required="required"> <br> <br>
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
