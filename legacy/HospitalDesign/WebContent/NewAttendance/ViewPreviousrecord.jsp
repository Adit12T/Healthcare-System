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
<title></title>
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
String emp_id=request.getParameter("emp_id1");
String name=request.getParameter("name");
Connection con=MyCon.getConnection();
%>
<table align="center" cellspacing="10">
<tr>
<th align="left">Employee Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td><%=emp_id %></td>
</tr>
<tr>
<th align="left">Employee Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td><%=name%></td>
</tr>
</table>
<form action="ViewMonthWise.jsp" target="_blank">
<h4 align="center">Select Month <select name="at_month">
<%

String sql="select distinct month from attendance where emp_id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,emp_id);
ResultSet rs=ps.executeQuery();
int m_indicator=0;
String m_name="";
while(rs.next()){
	m_indicator=rs.getInt(1);
	if(m_indicator==1){
		m_name="January";
	}else if(m_indicator==2){
		m_name="February";
	}else if(m_indicator==3){
		m_name="March";
	}else if(m_indicator==4){
		m_name="April";
	}else if(m_indicator==5){
		m_name="May";
	}else if(m_indicator==6){
		m_name="June";
	}else if(m_indicator==7){
		m_name="July";
	}else if(m_indicator==8){
		m_name="August";
	}else if(m_indicator==9){
		m_name="September";
	}else if(m_indicator==10){
		m_name="October";
	}else if(m_indicator==11){
		m_name="November";
	}else if(m_indicator==12){
		m_name="December";
	}
%>
<option value="<%=rs.getInt(1)%>"><%=m_name%></option>
<%} %>
</select>
<select name="year">
<%
String sql1="select distinct year from attendance where emp_id=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setString(1,emp_id);
ResultSet rs1=ps1.executeQuery();
String y_indicator="";

while(rs1.next()){
%>
<option value="<%=rs1.getInt(1)%>"><%=rs1.getInt(1)%></option>
<%} %>
</select>
</h4>

<input type="hidden" name="emp_id" value="<%=emp_id%>">
<input type="hidden" name="emp_name" value="<%=name%>">
<h4 align="center"><input type="submit" value="Submit"> </h4>
</form>
</div>
</div>
</div>
</body>
</html>