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
  
  
  
  
  
	
	
	
	
    
  
  

    <% Date d=new Date();
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	String datevalue=format.format(d);
	String time=d.getHours()+":"+d.getMinutes();
    %>
   
  
  
  
  
 
    
    
    <%
    	String Status=request.getParameter("status");
        String dat = request.getParameter("ddate");
		String id=request.getParameter("emp_id");
        
        System.out.println("date::" +dat);
	
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hmt", "root", "root");
		Statement st = con.createStatement();
		String sql = ("select emp_id,emp_name from attendance where attendance_date= '"+dat+"' ");
		ResultSet rs = st.executeQuery(sql);
		
		%>
		
		<form method="post" action="ViewAttendance.jsp">
		<p align="center">

			
		</p>

		<tr>
			<table border="1" width="828" height="159" align="center">
			<thead>
          <tr>
            <th>Full Name<br></th>
            <th>ID<br></th>

          </tr>
        </thead>
				<tbody align="center">
					
					<%
						
						while (rs.next()) {
							
					%>
					
					<td><font color="#000000"><%=rs.getString(1)%></font></td>
					<td><font color="#000000"><%=rs.getString(2)%></font><br></td>
					</tr>
					<%
						}
						
					%>
					
				</tbody>
			</table>
			
	</form>
    
  
</div>
</div>
</div>
</body>
</html>
