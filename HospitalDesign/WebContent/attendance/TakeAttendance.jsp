<%@page import="java.sql.*,java.util.Date,java.util.*,java.text.*;"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><fmt:message key="title.doctorhome" /></title>
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
		<h2>Take Attendance</h2>







	
    <% Date d=new Date();
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	String datevalue=format.format(d);
	String time=d.getHours()+":"+d.getMinutes();
    %>
   




								<%
									/* this is to add after refresh botten */
								%>
								<tr>
									<td colspan="6" height="1" bgcolor="#CCCCCC"></td>
								</tr>
<tr>
<%
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection con = DriverManager.getConnection(
 			"jdbc:mysql://localhost:3306/hmt", "root", "root");
 	Statement st = con.createStatement();
 	ResultSet rs = null;
 	rs = st.executeQuery("select emp_id,emp_name from employee");
 	int i = 1;
 	String[] idd = new String[1000];
 	String[] nname = new String[1000];
 	String id = null, name = null, attendancedate = null;
 	while (rs.next()) {

 		id = rs.getString(1);
 		name = rs.getString(2);
 		idd[i] = id;
 		nname[i] = name;
 		i++;
 	}
 	int count = i - 1;
 	int l = 1;
 
 	String id1 = null;
 	String[] idd1 = new String[1000];
 	Statement st2 = con.createStatement();
 	String sql2 = "select emp_id from attendance where attendance_date='"
 			+ datevalue + "'  ";
 	rs = st2.executeQuery(sql2);
 	while (rs.next()) {
 		id1 = rs.getString(1);
 		idd1[l] = id1;
 		l++;
 	}
 	/*System.out.println("garvil bothra:"+attendancedate+"count"+count);
 	for(int j=1;j<=count;j++)
 	{
 		System.out.println("id is"+idd[j]);
 	}*/
 %>
							    <pg:paging indexSize="10" pageSize="2">
							<table>								
									<tr bgcolor="#CBE0F5">
									<td></td>
										<th><strong><font size="4" > Id </font></strong></th>
										<th><font size="4" >Full Name</font></th>
										<th><strong><font size="4">Check In</font></strong></th>
										<th><strong><font size="4">Check Out</font></strong></th>
									<td></td>
									</tr>
									<tr>
									<td colspan="6" height="1" bgcolor="#CCCCCC"></td>
								</tr>
								<tr> </tr>
								<tbody align="center">
								
									<%
										//int i = 1;
										for (int j = 1; j <= count; j++) {
									%>
									<pg:item>
									<td></td>
									<tr>
									<td> </td><td> </td><td> </td><td> </td><td> </td><td> </td>
									</tr>
									<tr bgcolor="#F7F7F7">
										<td></td>
										<td><strong> <font size="4"><%=idd[j]%></font></strong></td>
										<td><strong><font size="4"><%=nname[j]%></font></strong></td>
										<form method="get" action="../EmpAttendance">
											
											<input type="hidden" name="id" value="<%=idd[j]%>"> <input
												type="hidden" name="name" value="<%=nname[j]%>">
											<%
												if (idd[j].equals(idd1[j])) {
											%>
											<TD><INPUT type="submit" name="status" value="CheckIn"
												disabled="disabled" /></TD>
											<%
												} else {
											%>
											<TD><INPUT type="submit" name="status" value="CheckIn"  /></TD>
											<%
												
														}
													
											%>
											
										</form>
										<form method="get" action="../EmpAttendance">

											<%
												
											%>
											<input type="hidden" name="id" value="<%=idd[j]%>">
											<%
												if (idd[j].equals(idd1[j])) {
											%>
										
										<TD><INPUT type="submit" name="status" value="checkOut" /></TD>
										<%
											} else {
										%>
										<TD><INPUT type="submit" name="status" value="checkOut"
											disabled="disabled" /></TD>
										<%
											}
												
										%>
										
										</form>


									</tr>
									</pg:item>
									<%
										}
									%>
								</tbody>
							

</tr>

							</table> 
						
						<div style="background-color:;">
						<pg:index title="Pages">
							<pg:page>
								<p
									style="background: ; padding: 5px;  margin: 1px; color: black;"><%=thisPage%></p>
							</pg:page>

						</pg:index>

					</div>

				</pg:paging>
						
						
						</td>
					</tr>
				</table>

			</td>
		</tr>
		<tr>
			<td width="100%" height="1" valign="top" bgcolor="#B2D5EA"></td>
		</tr>
		
	</table>
	</div>
	</div>
	</div>
</body>
</html>
