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
<title>View Attendance</title>
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
<%
Date date2=new Date();
int year1=date2.getYear() + 1900;
int month1=date2.getMonth()+1;
String[] month = new String[12];
month[0] = "January";
month[1] = "February";
month[2] = "March";
month[3] = "April";
month[4] = "May";
month[5] = "June";
month[6] = "July";
month[7] = "August";
month[8] = "September";
month[9] = "October";
month[10] = "November";
month[11] = "December";
%>
<h3 align="center"> Attendance for the Month Of <%=month[date2.getMonth()]%>/<%=date2.getYear() + 1900%></h3>
<% 
int present=0,absent=0,totalday=0,leave=0;
 
String id=request.getParameter("emp_id");
String emp_name=request.getParameter("emp_name");
/* System.out.print(emp_name); */
Connection con=MyCon.getConnection();
String sql="select * from attendance where emp_id=? and month=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,id);
ps.setInt(2,month1);
ResultSet rs=ps.executeQuery();
while(rs.next()){

	totalday++;
	if(rs.getString("a_status").equals("P")){
		present++;
	}
	else if(rs.getString("a_status").equals("L")){
		leave++;
	}
	else {
		absent++;
	}
	
} %>
<table  align="center">
<tr>
<th align="left">Employee Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=id %></td>
</tr>
<tr>
<th align="left">Employee Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=emp_name %></td>
</tr>
</table>
<table align="center"  border="1" class="table" width="400">
<tr>
<th>Present</th><th>Absent</th><th>Leave</th>
</tr>
<tr>
<td><%=present %></td><td><%=absent %></td><td><%=leave %></td>
</tr>
</table>
<h4 align="center">Total Days&nbsp;&nbsp;&nbsp;<%=totalday %></h4>
<h5 align="center"><a href="ViewPreviousrecord.jsp?emp_id1=<%=id %>&name=<%=emp_name%> ">View Previous Record</a> </h5>
</div>
</div>
</div>
</body>
</html>