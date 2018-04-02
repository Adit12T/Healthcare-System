<%@page import="room.floor.RoomTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>

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
<%
String id=request.getParameter("id");
RoomTypeBean r=new RoomTypeBean();
r.get(id);
%>
<form action="../RoomTypeServlet">
<input type="hidden" name="value" value="update" >
<table>
<tr><td>Room Type</td><td><input readonly="readonly" type="text" name="roomtypename"  value="<%=r.roomtypename %>"> </td></tr>
<tr><td>Room Cost</td><td><input type="text" name="roomtypecost" value="<%=r.roomtypcost%>"  onKeyUp="return valtxt(this)"> </td></tr>

<tr><td colspan="2"><input type="submit"> </td></tr>
</table>
</form> 
</body>
</html>