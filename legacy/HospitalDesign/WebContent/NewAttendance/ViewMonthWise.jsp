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
		<%
		int present=0,absent=0,totalday=0,leave=0,i=0;
		Connection con=MyCon.getConnection();
		String month=request.getParameter("at_month");
		String year=request.getParameter("year");
		String emp_id=request.getParameter("emp_id");
		String emp_name=request.getParameter("emp_name");
		String sql="select * from attendance where emp_id=? and month=? and year=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,emp_id);
		ps.setString(2,month);
		ps.setString(3,year);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){

			i++;
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
			
		}
	
		%>
		<table>
		<tr>
		<th align="left">Employee Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=emp_id %></td>
		</tr>
		<tr>
		<th align="left">Employee Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=emp_name%></td>
		</tr>
				<tr>
		<th align="left">Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=year%></td>
		</tr>
				<tr>
		<th align="left">Month&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td align="left"><%=month%></td>
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
		
		</div>
		</div>
		</div>
</body>
</html>