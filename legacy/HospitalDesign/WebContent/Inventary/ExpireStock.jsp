<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Inventory.InventoryBean"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
<script type="text/javascript">
	function al() {
		alert("record deleted successfully")
	}
</script>
</head>
<body 
<%String msg = request.getParameter("msg");

			if (msg != null) {%>
	onload="al();" <%}%>>

	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Expire Stock</h2>
		<form action="">

		</form>
	

			<% 
			
			//String date=(String)session.getAttribute("exdate");
			InventoryBean i=new InventoryBean();
			
			
			List record=i.getExItem();
				if(record.size()>0 ){
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
						<!-- <th>Action </th> -->



					</tr>
 <pg:paging indexSize="10" pageSize="2">
					<%Map map;
					for (int j = 0; j < record.size(); j++) {
						map = (Map) record.get(j);
						
		%>
		<pg:item>

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
					<%-- 	<td><a href="../DeleteExpireStock?&s1=<%=map.get("exdate")%>&s2=<%=map.get("quantity")%>&s3=<%=map.get("type")%>&s4=<%=map.get("name")%>&s5=<%=map.get("company")%>
						&s6=<%=map.get("sname")%>&s7=<%=map.get("date")%>&s8=<%=map.get("rq")%>&id=<%=map.get("id")%>&s10=<%=map.get("pq")%>&s11=<%=map.get("ta")%>&s12=<%=map.get("pa")%>&s13=<%=map.get("pena")%>&s14=expirestock">Delete</a></td>

 --%>


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

			</center>
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