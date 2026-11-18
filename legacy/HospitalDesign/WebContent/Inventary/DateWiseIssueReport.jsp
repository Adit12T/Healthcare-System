<%@page import="Inventory.StockDetailBean"%>
<%@page import="Inventory.DateWiseBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/view.css"
	media="all">

<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
</head>
<body>

	<div id="form_container">
		<h1>
			<a></a>
		</h1>
		<div class="form_description">
			<h2>DateWise Search</h2>
			<p></p>
		</div>
		<form action="DateWiseIssueReport.jsp">
			<fieldset>
				<legend>Drug Report</legend>
				<center>
					<table>
						<tr>
							<th><label>From Date</label>
							<td><input type="text" name="fdate"></td>
							<th><label>To Date</label>
							<td><input type="text" name="ldate"></td>
							<td><input type="submit" value="search">
						</tr>
					</table>
				</center>

			</fieldset>
		</form>

<table>
		<%
			String fdate = request.getParameter("fdate");
			String ldate = request.getParameter("ldate");
			System.out.print(fdate + " " + ldate+"  ");
			if (fdate != null && ldate != null) {
				DateWiseBean dwb = new DateWiseBean();
				
				List record = dwb.showDetail(fdate, ldate);
				System.out.print(record.size());
				StockDetailBean st;
		%>
		<tr>
			<th>Item Id</th>
			<th>Item Name</th>
			<th>Supply Quantity</th>
			<th>Issue Quantity</th>
			<th>Total Quantity</th>


		</tr>

		<%
			for (int i = 0; i < record.size(); i++) {
					st = (StockDetailBean) record.get(i);
		%>

		<tr>
			<td><%=st.getItemid()%></td>

			<td><%=st.getItemname()%></td>
			<td><%=st.getSuppiled()%></td>
			<td><%=st.getIssue()%></td>
			<td><%=st.getTotal()%></td>


		</tr>

		<%
			}
			}
		%>

</table>




		<%-- <fieldset>
		<% if (request.getAttribute("list") != null)

	{
		List ls = (List) request.getAttribute("list");
		System.out.print(ls);
		int r=ls.size();%>
		<center>
	<h4><label value=><%=r %> record found</label></h4>	
	<table border="0" >
	<tr>
		<th>Item Name</th>
		<th>Supply Quantity</th>
		<th>Issue Quantity</th>
		<th>Total Quantity</th>
		
		
	</tr>	

<% Map map;
		for (int i = 0; i < ls.size(); i++) {
				 map = (Map) ls.get(i);
				 
	%>
	
	
	
	
	<tr>
	<td> <%=map.get("s1")%></td>
	<td> <%=map.get("s2")%></td>
	<td> <%=map.get("s3")%></td>
	<td> <%=map.get("s4")%></td>
	</tr>
	<% 
		}
	%>
	</table>
	
	</center>
<%} %>
</fieldset>
			
 --%>

</div>
</body>
</html>