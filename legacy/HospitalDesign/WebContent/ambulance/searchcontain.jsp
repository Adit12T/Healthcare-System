<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>
<fieldset>
				<%
					if (request.getAttribute("list") != null)

					{
						List ls = (List) request.getAttribute("list");
						//System.out.print(ls.size());
				%>
				<table class="table">
					<tr>
						<th>Ambulance Id</th>
						<th>Ambulance Type</th>
						<th>Patient Id</th>
						<th>Patient Name</th>

						<th>Date</th>
						<th>Time</th>
						<th>Address</th>
						<th>Contact</th>
						<th>Action</th>



					</tr>

					<%
						Map map;
							for (int i = 0; i < ls.size(); i++) {
								map = (Map) ls.get(i);
					%><tr>
						<td><%=map.get("id")%></td>
						<td><%=map.get("atype")%></td>
						<td><%=map.get("pid")%></td>
						<td><%=map.get("pname")%></td>

						<td><%=map.get("date")%></td>
						<td><%=map.get("time")%></td>
						<td><%=map.get("add")%></td>
						<td><%=map.get("cno")%></td>
						<td><a href="DeleteAmbulanceServlet?id=<%=map.get("id")%>&date=<%=map.get("date")%> ">delete</a></td>
					</tr>
					<%
						}
					%>
				</table>

				<%
					}
				%>

			</fieldset>
</body>
</html>