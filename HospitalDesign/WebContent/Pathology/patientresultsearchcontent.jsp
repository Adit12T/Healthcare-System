		<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.AddResultDao"%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>	<%String s = request.getParameter("name");
			AddResultDao ad = new AddResultDao();
			List record = ad.showAll(s);
			if(record.size()>0){
			%>
<table class="table">
						<thead>
							<tr>
								<th>Bill No</th>
								<th>Name</th>
								<th>Address</th>
								<th>Test Date</th>
								<th>Total Amount</th>
								<th>Paid Amount</th>
								<th>Action</th>
							</tr>
						</thead>
						<%
							
							for (int i = 0; i < record.size(); i++) {
								Map map = (Map) record.get(i);
						%>


						<tbody>
							<tr>
								<td><%=map.get("billid")%></td>
								<td><%=map.get("name")%></td>
								<td><%=map.get("address")%></td>
								<td><%=map.get("date")%></td>
								<td><%=map.get("total")%></td>
								<td><%=map.get("paid")%></td>
								<td><a href="patientresultsearchpending.jsp?id=<%=map.get("billid")%> "> <img	alt="Update Record" title="Update Record" src="../mg/icon_edit.png" width="15" height="15"> </a></td>
								
							</tr>
						</tbody>

						<%
							}
						%>
					</table>
					<%}else{%>
					<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
					<%} %>
					
</body>
</html>