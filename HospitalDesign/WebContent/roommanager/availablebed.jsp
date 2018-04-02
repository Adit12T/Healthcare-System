<%@page import="room.bedbook.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="room.floor.RoomBedInfoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
</head>
<body>
<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Available Bed</h2>
	<%
		
	
	
			AvailableBookBean ab = new AvailableBookBean();

			Map map;	Map maps;
			
	%>


	<table border="1" cellpadding="0" cellspacing="0" class="table">
		<tr align="center" valign="middle">
			<th>Room Type</th>
			<th>Room Cost</th>
			<th>Room Floor</th>
			<th>Room Number</th>
			<th>Bed Capacity</th>
			<th>Room bed</th>
		</tr>
		<%
			List record = ab.showRoomInfo();
				
					for (int i = 0; i < record.size(); i++) {
						map = (Map) record.get(i);
						
		%>
		<tr align="center" valign="middle">
			<td><%=map.get("roomtypename")%></td>
			<td><%=map.get("roomtypecost")%></td>
			<td><%=map.get("roomfloor")%></td>
			<td><%=map.get("roomnumber")%></td>
			<td><%=map.get("bedcapacity")%></td>
			<td>
				<%
					List re = ab.showBedInfoByRoomID((String) map
										.get("roomnumber"));
								for (int j = 0; j < re.size(); j++) {
									maps = (Map) re.get(j);
				%> <a href="#"><%=maps.get("bednumber")%></a>
				<%
					}
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</div>
</div>
</div>
</body>
</html>