<%@page import="Inventory.InventoryBean"%>
<%@page import="BloodBank.BloodBankBean"%>
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

	<div id="form_container">
		<h1>
			<a></a>
		</h1>
		<div class="form_description">
			<h2>Item Issue Report</h2>
			<p></p>
		</div>
		<form action="DrugIssueReport.jsp">
			<fieldset>
				<legend>Item Issue Report</legend>
				<center>
					<table>
						<tr>
							<th><label>Item type</label>
							<td><input type="text" name="type"></td>

							<th><label>Item Name</label>
							<td><input type="text" name="name"></td>
							<th><label>Mfg Company</label>
							<td><input type="text" name="com"></td>

							</td>
							<td><input type="submit" value="search">
						</tr>
					</table>
				</center>

			</fieldset>




		</form>
		<fieldset>
			<%
				String company = request.getParameter("com");
				String name = (request.getParameter("name"));
				String type = (request.getParameter("type"));
				if (name != null && type != null && company != null) {
					InventoryBean inv = new InventoryBean();
					List record = inv.getDrugIssueReport(name, type, company);
			%>
			<center>


				<table border="1">
					<tr>
						<th>Voucher no</th>
						<th>issue To</th>
						<th>Person Name</th>
						<th>Item Type</th>
						<th>Item Name</th>
						<th>Mfg Company</th>
						<th>Issue Date</th>
						<th>issued Quantity</th>


						<th>Paid Amount</th>
						<th>Pending Amount</th>
						<th>Action</th>
						


					</tr>

					<%
						Map map;
							for (int i = 0; i < record.size(); i++) {
								map = (Map) record.get(i);
					%>




					<tr>
						<td><%=map.get("s1")%></td>
						<td><%=map.get("s2")%></td>
						<td><%=map.get("s3")%></td>
						<td><%=map.get("s4")%></td>
						<td><%=map.get("s5")%></td>
						<td><%=map.get("s6")%></td>
						<td><%=map.get("s7")%></td>
						<td><%=map.get("s8")%></td>
						<td><%=map.get("s9")%></td>
						<td><%=map.get("s10")%></td>
                        <td><a
							href="../DeletePatient?t1=<%=map.get("s1")%>&t2=<%=map.get("s1")%>">Delete</a></td>

					</tr>
					<%
						}
					%>
				</table>

			</center>
			<%
				}
			%>
		</fieldset>
	</div>
</body>
</html>