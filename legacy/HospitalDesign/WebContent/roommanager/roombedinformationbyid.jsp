<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="room.floor.RoomBedInfoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="800" height="40" cellpadding="0" cellspacing="0" border="1"  >
<%
int bid=Integer.parseInt(request.getParameter("bid"));
RoomBedInfoBean rbb=new RoomBedInfoBean ();
List record=rbb.showById(bid);%>
<tr height="30"><th>Room Type</th>
	<!-- <th>Room Cost</th> -->
	<th>Room Name</th>
	<th>Bed</th>
	<th  colspan="2">Activation /De-Activation </th></tr>
<%
Map map;
for (int i = 0; i < record.size(); i++) {
	map = (Map) record.get(i);
	String status=(String)map.get("bedstatus");
	%>
	<form  action="../BedUpdateServlet">
	<input type="hidden" name="update" value="updatestatus">
	<input type="hidden" name="bid" value="<%=map.get("bedid") %>">
	<tr align="center" valign="middle">
	<!-- <td></td> -->
	<%-- <td><%=map.get("roomfloor") %></td> --%>
	<%-- <td><%=map.get("bedcapacity") %></td> --%>
	<td><%=map.get("roomtypename") %></td>
	<%-- <td><%=map.get("roomtypecost") %></td> --%>
	<td><%=map.get("roomnumber") %></td>
	<td><%=map.get("bednumber") %></td>
	
	<td>
	Activate<input type="radio" name='status' value="activate"  <%if(status.equalsIgnoreCase("activate")){out.print("checked='checked'");} %>>
	De-Activate<input type="radio" name='status' value="deactivate" <%if(status.equalsIgnoreCase("deactivate")){out.print("checked='checked'");} %>>
	</td>
	<td><input type="submit"> </td>
	
	</tr>
	</form>
	
	<%
	}
%>
</table>
</body>
</html>