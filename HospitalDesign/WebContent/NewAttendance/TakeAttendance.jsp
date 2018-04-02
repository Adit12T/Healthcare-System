<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href=css/layout.css"
	media="screen" />
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>
<div class="container_12">
		<div class="grid_10"  style="width: 97%;">
		<div class="box round first grid" style="height: 100%;">
		


<%Date d=new Date();
int year=d.getYear();
int month=d.getMonth();
SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
String datevalue=format.format(d);
Connection con=MyCon.getConnection();
String sql="select emp_id,emp_name from employee where status=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1, 0);
ResultSet rs=ps.executeQuery();
int i=0;
if(rs.next()){
rs.beforeFirst();
%>
<table class="table">
<tr>
<th>Employee Id</th><th>Employee Name</th><th>Attendance</th><th>Action</th>
</tr>


<%


while(rs.next()){

%>
<form action="../TakeAttendance" method="post">

<tr>
<td><%=rs.getInt(1)%><input type="hidden" name="emp_id" value="<%=rs.getInt(1)%>"> </td><td><%=rs.getString(2)%></td><td>Present<input type="radio" name="at_status" checked="checked" value="P">Absent<input type="radio" name="at_status" value="A">Leave<input type="radio" name="at_status" value="L"> </td><td><input type="submit" value="Submit"> </td>
</tr>

</form>
<%

	 }%>
</table>
<%}else{
	
	%>
	
	<div align="center"><font  color="red"><h3>No Record Found.............</h3></font></div>
	<%
	
} %>
</div>
</div>
</div>
</body>
</html>