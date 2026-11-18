<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="room.floor.RoomTypeBean"%>
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
		alert("Please enter valid cost.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Cost.");
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
		<h2>Room Type</h2>
<form action="../RoomTypeServlet">
<br><br>
		<input type="hidden" name="value" value="add" required="required" >
		 Room Type Name<input maxlength="10"	type="text" name="roomtypename"  required="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)">
		 &nbsp;&nbsp;&nbsp;Room Cost<input maxlength="5"	type="text" name="roomtypecost" required="required" onkeypress="return number(event)" value="">
		  <input type="submit">
	</form>


<%	String msg=request.getParameter("msg");
if(msg!=null){
	%>
	<div align="center"><h3><%=msg %></h3></div>
	<%
}
RoomTypeBean fb = new RoomTypeBean();

List record = fb.showRoomType();
if(record.size()>0){
%>
	
	<table class="table">
	<tr>
	<th>Room Type Name</th><th>Room Cost</th>
	<th>Action</th>
	</tr>
	<%
	
		for (int i = 0; i < record.size(); i++) {
			Map map=(Map)record.get(i);
			%>
			<tr>
			<td><%out.print(map.get("room_type_name"));%></td>
			<td><%out.print(map.get("room_type_cost"));%></td>
			<td><a href="updateroomtype.jsp?id=<%out.print(map.get("room_type_id"));%>"><img	alt="Update Record" title="Update Record" src="../mg/icon_edit.png" width="15" height="15"></a></td>
			</tr>
			<% 
			
		}
	%>
	</table>
	<%}else{
		%>
		<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
		<%
	} %>
	</div>
	</div>
	</div>
</body>
</html>