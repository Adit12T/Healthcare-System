<%@page import="database.dbcon"%>
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
<title>View All Employee</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
 <script src="../js/table/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
 <script type="text/javascript" src="../js/table/table.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th{
text-align: left;
}
</style>

</head>
<body>
		 <%
		 PreparedStatement ps=null;
ResultSet rs=null;
dbcon db=dbcon.getConnection();
String sql=null;
if(request.getParameter("name")!=null)
{

%>
<% 

	String name = request.getParameter("name").toString();
sql="select * from employee where emp_name like '"+name+"%' OR emp_id like '"+name+"%' OR emp_department like '"+name+"%'";	

}
else{
	
	sql="select * from employee";
	 
	%>
	
	
		 <table align="center">
		 <tr><th>Search Employee</th><td><input type="text" name="name" id="name" onkeyup="showData(this.value);"> </td></tr>
		 </table>
<%} 
rs=db.select(sql);
%>
<div id="mydiv" style="margin-top:0px ">
                    <table class="table">
                    <thead>
                    <tr>
                    <th>Employee Id</th>
                    <th>Name</th>
                    <th>Date of Joining</th>
                    <th>Designation</th>
                    <th>Department</th>
                    <th>Contact No</th>
                    <th>Action</th>
                    </tr>
                    </thead>
                    
		<%
		while(rs.next()){
		%>
		
		<tbody>
		   <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(14)%></td>
                    <td><%=rs.getString(18)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><a href="ViewAttendance.jsp?emp_id=<%=rs.getString(1)%>&emp_name=<%=rs.getString(2)%> ">View Attendance</a> </td>
                    </tr>
		</tbody>
		<%} %>


		
		</table>
	
</body>
</html>