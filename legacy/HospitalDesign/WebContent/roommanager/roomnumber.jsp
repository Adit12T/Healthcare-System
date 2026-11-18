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

	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>


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
		<h2>Room Number</h2>
	<%
		RoomNumberBean rnb = new RoomNumberBean();
		List floor = rnb.showFloor();
		List roomtype = rnb.showRoomType();
	%>

	<form action="../RoomNumberServlet">
		<input type="hidden" name="value" value="add">
		<table>
			<tr>
				<td>Select Floor</td>

				<td><select name="floor">
						<%
							for (int i = 0; i < floor.size(); i++)
								out.print("<option>" + floor.get(i) + "</option>");
						%>
				</td>
				</select>
			</tr>
			<tr>
				<td>Select Room Type</td>
				<td><select name="roomtypeid">
						<%
							Map map;
							for (int i = 0; i < roomtype.size(); i++) {
								map = (Map) roomtype.get(i);
						%>
						<option value="<%=map.get("room_type_id")%>"><%=map.get("room_type_name")%></option>
						<%
							}
						%>
				</td>
				</select>


				</td>
			</tr>
			<tr>
				<td>Enter Room Number</td>
				<td><input type="text" name="roomnumber" required="required" maxlength="4" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"></td>
			</tr>
			<tr>
				<td>Enter Capacity</td>
				<td><input type="text" name="bedcapacity" placeholder="Should be Number" maxlength="2" required="required" onkeypress="return number(event)" ><input type="hidden" name="status" value="activate"
					checked="checked"></td>
			</tr>
		<!--	<tr>
				<td>Room Status</td>
				<td>Activate<input type="radio" name="status" value="activate"
					checked="checked"> De-Activate<input type="radio"
					name="status" value="deactivate">
				</td>
			</tr>-->
			<tr bgcolor="red">
				<td><input type="submit"></td>
				<td><input type="reset"></td>
			</tr>
		</table>

	</form>
	<%String msg=request.getParameter("msg");
	if(msg!=null){
		%>
		<div align="center"><h3><%=msg %></h3></div>
		<%
	}%>
	
	
	<%-- 
<%
			RoomBedInfoBean rbi = new RoomBedInfoBean();
			List record = rbi.showRoomInfo();
			%>
		<table border="1" cellpadding="0" cellspacing="0" class="table">
		<tr align="center" valign="middle">
			<th>Room Type</th>
			<th>Room Cost</th>
			<th>Room Floor</th>
			<th>Room Number</th>
			<th>Bed Capacity</th>
		<!-- 	<th>Room bed</th> -->
		</tr>
		<%
			Map maps;
			for (int i = 0; i < record.size(); i++) {
				maps = (Map) record.get(i);
		%>


		<tr align="center" valign="middle">
			<td><%=maps.get("roomtypename")%></td>
			<td><%=maps.get("roomtypecost")%></td>
			<td><%=maps.get("roomfloor")%></td>
			<td><%=maps.get("roomnumber")%></td>
			<td><%=maps.get("bedcapacity")%></td>
			<!-- <td>
				
			</td> -->
		</tr>


		<%
			}
		%>
		
	</table>
 --%>
		</div>
		</div>
		</div>
</body>
</html>