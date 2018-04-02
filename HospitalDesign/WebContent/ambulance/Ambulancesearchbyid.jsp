<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance Search</title>
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
<script type="text/javascript" src="../js/jquery.js"></script>

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
</style>
<script type="text/javascript">
	function message()

	{
		alert("Update Successfully");

	}
</script>
</head>
<body
	<%String msg = request.getParameter("msg");
			if (msg != null) {%>
	onload="message()" <%}%>>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Ambulance Search</h2>
			<center>
		<form action="Ambulancesearchbyid1.jsp">
			<fieldset>
			<table align="center">
			<tr>
			<th>Select Ambulance Id</th>
			<td>
			<select name="t1">
			
			
<%
Connection con=MyCon.getConnection();
String sql="select * from ambulance_manager";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%></option>
<%} %> 
		</select>
			</td>
			</tr>
			
			</table>
			<h4 align="center"><input type="submit"
					value="search"></h4>
		</fieldset>
		</form>
		</center>
		</div>
		</div>
		</div>
</body>
</html>