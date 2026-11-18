<%@page import="java.util.List"%>
<%@page import="room.floor.FloorBean"%>
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

	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
	
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >11) {
		alert("Please enter valid floor.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid floor.");
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
		<h2>Add New Floor</h2>

	<form action="../FloorServlet">
		<input type="hidden" name="value" value="add"> <input
			type="text" name="floornumber" ononkeypress="return number(event)" value=""> <input type="submit">
	</form>


<br>
<%
String msg=request.getParameter("s");
if(msg!=null)
	
%><dive align='center'><h3><%=msg %></h3></div><%
	%>
	<br>
	<%
		FloorBean fb = new FloorBean();

		List record = fb.showFloor();
%>
<table class="table" width="500">
<tr><td>Serial No.</td><td> Floor number</td>
<%
		for (int i = 0; i < record.size(); i++) {
			%>
			<tr><td><%=i+1 %></td><td><%=record.get(i) %> </td></tr>
			
			<%
		}
	%>
	</table>
	</div>
	</div>
	</div>
</body>
</html>