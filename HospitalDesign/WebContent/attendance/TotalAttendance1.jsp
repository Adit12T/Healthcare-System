<%@page import="java.sql.*,java.util.Date,java.util.*,java.text.*;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
</head> 
<body >
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Total Attendance</h2>
  </tr>
  
  
  
  
  
  <tr>
    <td colspan="5" height="15"></td>
    </tr>
  
  
  
 
    <% Date d=new Date();
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	String datevalue=format.format(d);
	String time=d.getHours()+":"+d.getMinutes();
    %>
    
  
  
  
  
    
    <%
		String id = request.getParameter("idd");

		System.out.println("date::" + id);

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/hmt", "root", "root");
		Statement st = con.createStatement();
		String sql = ("select emp_id,emp_name,attendance_date from attendance where emp_id= '"
				+ id + "' ");
		ResultSet rs = st.executeQuery(sql);
	%>
	<form method="post" action="ViewAttendance.jsp">
		<p align="center"></p>

			<table border="1" width="828" height="159" align="center">
				<thead>
					<tr>
						<th>ID<br></th>
						<th>FULL NAME<br></th>
						<th>DATE<br></th>

					</tr>
				</thead>
				<tbody align="center">

					<%
						int i = 0;
						while (rs.next()) {
							i++;
					%>

					<td><font color="#000000"><%=rs.getString(1)%></font></td>
					<td><font color="#000000"><%=rs.getString(2)%></font><br></td>
					<td><font color="#000000"><%=rs.getString(3)%></font><br></td>
					</tr>
					<%
						}
					%>
				
				<thead>
					<tr>
						<th><br></th>
						<th>Total Present<br></th>
						<th><%=i%><br></th>

					</tr>
				</thead>
				</tbody>
			</table>
	</form>
    
</div>
</div>
</div>
</body>
</html>
