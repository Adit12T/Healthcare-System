<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.dbcon"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance  Search</title>
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

<style type="text/css">
fieldset {
	border-color:#FDFBFC;
}
 #small_input{
width:50px;
}
#course{
width: 150px;
}
#pro{
text-align: center;
}
</style>

</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Ambulance Search</h2>
		<center>
	<% String atype="" ,dname="";
	int  cno=0;
	int id=Integer.parseInt(request.getParameter("t1"));
	session.setAttribute("ids", id);
	dbcon db = dbcon.getConnection();
	String sql="select * from ambulance_updation where ambulance_id="+id+"";
	ResultSet rs = db.select(sql);
	while(rs.next())
	{
	atype=rs.getString("ambulance_type");
	dname=rs.getString("driver_name");
	cno=rs.getInt("contact_no");
	}
	%>	
		
		
		
		
		
		<form action="../AmbulanceidupdateServlet"> 
		<fieldset>
		
		<table>
		<tr>
						
						<th>Ambulance Type</th>
 						<td>
						<input type="text" value="<%=atype%>" disabled="disabled">
						</td>
					</tr>
					

					<tr>
					    <th>Driver Name</th>
 						<td><input type="text" name="dname" value="<%=dname%>"></td>
						<th>Contact No</th>
						<td><input type="text" name="cno" value="<%=cno%>" ></td>
						
					
						
					</tr></table>
		</fieldset>
		<input type="submit" value="Update">
			<input type="Reset" value="Clear">
		</form>
		</center>
</div>
</div>
</div>
</body>
</html>