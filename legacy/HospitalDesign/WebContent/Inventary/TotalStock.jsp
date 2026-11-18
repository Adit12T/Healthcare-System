<%@page import="Inventory.InventoryBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />

<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
<script type="text/javascript">
function al(msg) {
	alert(msg);

}</script>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body <%String msg = request.getParameter("msg");

			if (msg != null) {%>
	onload="al('<%=msg%>');" <%}%>>

	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Current Stock</h2>
		
			
			
				<% 
			InventoryBean i=new InventoryBean();
				List record=i.getStock();
				if(record.size()>0){
				
			%><form action="">
				<center>
					
					<table class="table">
						<tr>
							<th>Item Id</th>
							<th>Item Type</th>
							<th>Item Name</th>
							<th>Total Quantity</th>
							<th>unit_per_pack</th>
							
							<th>action</th>

						</tr>
<pg:paging indexSize="10" pageSize="5">
						<%
							Map map;
								for (int j = 0; j < record.size(); j++) {
									map = (Map) record.get(j);
						%>
<pg:item>



						<tr>
							<td><%=map.get("s1")%></td>
							<td><%=map.get("s2")%></td>
							<td><%=map.get("s3")%></td>
							<td><%=map.get("s4")%></td>
							<td><%=map.get("s5")%></td>
							<td><a href="updatestock.jsp?t1=<%=map.get("s2")%>&t2=<%=map.get("s3")%>&t3=<%=map.get("s4")%>&t4=<%=map.get("s5")%>"><img	alt="Edit Record" title="Edit" src="../mg/icon_edit.png" width="15" height="15"></a></td>
							

						</tr>
							</pg:item>
						<%
							}
						%>
						<div style="background-color:;">
						<pg:index title="Pages">
							<pg:page>
								<p
									style="background: ; padding: 5px;  margin: 1px; color: black;"><%=thisPage%></p>
							</pg:page>

						</pg:index>

					</div>

				</pg:paging>
					</table>

				</center></form>
				<%}else{
					%>
					<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
					<%
					
				} %>
		
		</div>
		</div>
		</div>
</body>
</html>