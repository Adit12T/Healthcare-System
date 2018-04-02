<%@page import="java.util.List"%>
<%@page import="Inventory.InventoryBean"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
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
	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Company Wise Supply item Search</h2>
<form><center>
<table><tr><td>Company Name</td><td><input type="text" name="company"></td>
<td><input type="submit" value="search"></td></tr></table>
</center>
</form>


			<% 
			String company=request.getParameter("company");
			//String date=(String)session.getAttribute("exdate");
			InventoryBean i=new InventoryBean();
			if(company!=null){
			List record=i.searchSuppliedByCompany(company);
				if(record.size()>0){
			%>
			<center>


				<table class="table">
					<tr>
					<th>Supplier Name</th>
						<th>Item Type</th>
                        <th>Item Name</th>
                        <th>company Name</th>
                        <th>Supply Date</th>
                        <th> supplied Quantity</th>
						<th>Expiry Date</th>
						<th>paid Amount </th>
						<th>pending  Amount </th>
					<!-- 	<th>Action </th>
 -->


					</tr>

					<%Map map;
					for (int j = 0; j < record.size(); j++) {
						map = (Map) record.get(j);
						
		%>
		

					<tr>
					    <td><%=map.get("sname")%></td>
						<td><%=map.get("type")%></td>
						<td><%=map.get("name")%></td>
						<td><%=map.get("company")%></td>
						
						<td><%=map.get("date")%></td>
						
						
						<td><%=map.get("quantity")%></td>
						<td><%=map.get("exdate")%></td>
						<td><%=map.get("pa")%></td>
						<td><%=map.get("pena")%></td>
					<%-- 	<td><a href="../DeleteItemServlet?&s1=<%=map.get("exdate")%>&s2=<%=map.get("quantity")%>&s3=<%=map.get("type")%>&s4=<%=map.get("name")%>&s5=<%=map.get("company")%>
						&s6=<%=map.get("sname")%>&s7=<%=map.get("date")%>&s8=<%=map.get("rq")%>&s9=<%=map.get("id")%>&s10=<%=map.get("pq")%>&s11=<%=map.get("ta")%>&s12=<%=map.get("pa")%>&s13=<%=map.get("pena")%>&s14=supplied">Delete Quantity</a></td>

 --%>


					</tr>
				
			<%
				}
			}else{
				%>
				<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
				<%
			}}
			%>
				
				</table>

			</center>

		</div></div>
		</div>
</body>
</html>