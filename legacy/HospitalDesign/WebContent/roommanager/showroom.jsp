<%@page import="room.floor.RoomBedInfoBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="room.floor.RoomNumberBean"%>
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

<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
	<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

	
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
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
<%
String id=request.getParameter("id");
if(id!=null){
	RoomNumberBean r=new RoomNumberBean();
	String msg=r.deleteRoom(id);
	out.print("<div align='center'>"+msg+"</div>");
}
%>
	<div class="container_12">
		<div class="grid_10">
			<div class="box round first grid">
				<h2>Room Number</h2>
				<%
					RoomBedInfoBean rbi = new RoomBedInfoBean();
					List record = rbi.showRoomInfo();

					if (record.size() > 0) {
						Map maps;
				%>

				<table border="1" cellpadding="0" cellspacing="0" class="table">
					<tr align="center" valign="middle">
						<th>Room Type</th>
						<th>Room Cost</th>
						<th>Room Floor</th>
						<th>Room Number</th>
						<th>Bed Capacity</th>
							<th>Action</th> 
					</tr>
					<%
						for (int i = 0; i < record.size(); i++) {
								maps = (Map) record.get(i);
					%>


					<tr align="center" valign="middle">
						<td><%=maps.get("roomtypename")%></td>
						<td><%=maps.get("roomtypecost")%></td>
						<td><%=maps.get("roomfloor")%></td>
						<td><%=maps.get("roomnumber")%></td>
						<td><%=maps.get("bedcapacity")%></td>
						<td><a  href="showroom.jsp?id=<%=maps.get("roomid")%>"><img	alt="delete" src="../mg/imgclose.jpg" width="15" height="15"></a></td>
					</tr>


					<%
						}
					%>

				</table>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>