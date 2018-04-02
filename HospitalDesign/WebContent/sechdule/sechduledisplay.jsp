<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="sechdule.SechduleDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<th>Dr ID</th>
			<th>Dr name</th>
			<th>Dr Specialization</th>
			<th>Dr Department</th>
			<th>Working day</th>
		</tr>


		<%
			SechduleDao d = new SechduleDao();
			List re = d.getAllDoctorForsechdule();
			Map map;
			
			for (int i = 0; i < re.size(); i++) {
				map = (Map) re.get(i);
				Integer id=(Integer)map.get("empid");
				System.out.print("id=  "+id);
				int idd=id;
		%>
		<tr>


			<td><%=map.get("empid")%></td>
			<td><%=map.get("empname")%></td>
			<td><%=map.get("empspecialization")%></td>
			<td><%=map.get("empdepartment")%></td>
			<td>
				
					<table cellpadding="2" cellspacing="2">
						<%
							List rd = d.getSechduleByID(idd);
								Map maps;
								//System.out.println("size="+rd.size());
								for (int j = 0; j < rd.size(); j++) {
									maps = (Map) rd.get(j);
						%>
						<tr>
						<td><%=maps.get("empday")%></td><td>
						 <%=maps.get("empstarthr")%>: 
						<%=maps.get("emstartminute")%>
						<%=maps.get("emstartshift")%></td><td>
						<%=maps.get("empendhr")%>:
						 <%=maps.get("empendminute")%>
							<%=maps.get("empendshift")%></td><td >Payed OPD</td><td><font color="#991010">
							 <%=maps.get("emppayedstart")%> To
							  <%=maps.get("emppayedend")%> Charge
							<%=maps.get("emppayedcost")%></font></td></tr>

						<%
							}
						%>
					
				</table>

			</td>
			<%-- 	<td><%=map.get("") %></td>
			<td><%=map.get("") %></td>
			 --%>
		</tr>


		<%
			}
		%>
	</table>
</body>
</html>