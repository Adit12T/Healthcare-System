<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
table th,td {
	text-align: left;
}
</style>
</head>
<body>
	<%
		int present = 0, absent = 0, totalday = 0, leave = 0;
		Date d = new Date();
		int year = d.getYear();
		int month = d.getMonth();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String datevalue = format.format(d);
		Connection con = MyCon.getConnection();
		String emp_id = request.getParameter("emp_id");
		String emp_name = request.getParameter("emp_name");
		String issue_date = request.getParameter("s_issue_date");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		int salary = Integer.parseInt(request.getParameter("salary"));
		double perday = salary / 30;
	%>
	<table>
		<tr>
			<th>Employee Id</th>
			<td><%=emp_id%></td>
		</tr>
		<tr>
			<th>Employee Name</th>
			<td><%=emp_name%></td>
		</tr>
		<tr>
			<th>last Salary Issue Date</th>
			<td><%=date1%></td>
		</tr>
		<tr>
			<th>Current Date</th>
			<td><%=datevalue%></td>
		</tr>
	</table>
	<%
		String sql = "select * from attendance where (date >? and date <=?) and emp_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, date1);
		ps.setString(2, datevalue);
		ps.setString(3, emp_id);
		ResultSet rs = ps.executeQuery();
		int i = 0;
		while (rs.next()) {
			i++;
			totalday++;
			if (rs.getString("a_status").equals("P")) {
				present++;
			} else if (rs.getString("a_status").equals("L")) {
				leave++;
			} else {
				absent++;
			}
	%>
	<%
		}
		int sal_days = present + leave;
		double t_sal = sal_days * perday;
	%>
	<form action="Generate_Salary.jsp">
		<input type="hidden" name="emp_id" value="<%=emp_id%>"> <input
			type="hidden" name="emp_name" value="<%=emp_name%>"> <input
			type="hidden" name="issue_date" value="<%=datevalue%>"> <input
			type="hidden" name="date1" value="<%=date1%>"> <input
			type="hidden" name="date2" value="<%=date2%>"> <input
			type="hidden" name="amount" value="<%=perday%>"> <input
			type="hidden" name="sal_day" value="<%=sal_days%>"> <input
			type="hidden" name="leave" value="<%=leave%>"> <input
			type="hidden" name="absent" value="<%=absent%>"> <input
			type="hidden" name="present" value="<%=present%>">
			 <input
			type="hidden" name="emp_name" value="<%=emp_name%>">
		<table border="1" align="center">
			<tr>
				<th>Total Working Days</th>
				<th>Total Present</th>
				<th>Total Absent</th>
				<th>Total Leave</th>
			</tr>
			<tr>
				<td><%=i%></td>
				<td><%=present%></td>
				<td><%=absent%></td>
				<td><%=leave%></td>
			</tr>
		</table>
		<h4 align="center">
			Net Salary &nbsp;&nbsp;&nbsp;&nbsp;<%=t_sal%></h4>
		<%
			if (t_sal > 0) {
		%><input type="submit" value="Generate Salary">
		<%
			}
		%>
	</form>
</body>
</html>