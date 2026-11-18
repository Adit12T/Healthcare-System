<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Inventory.InventoryBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function print() {
		PrinterJob
		job = PrinterJob.getPrinterJob();
		PrintRequestAttributeSet
		atts = new HashPrintRequestAttributeSet();
		atts.add(DialogTypeSelection.NATIVE);

		if (job.printDialog(atts)) {
			PrintService
			newlyUsedService = job.getPrintService();
			DocPrintJob
			docJob = newlyUsedService.createPrintJob();
			// print the passed javax.print.SimpleDoc object.
			docJob.print(simpleDoc, atts);
		}
	}
</script>
</head>
<body>
	<form action="IssuedItem.jsp">
		<%
			dbcon db = dbcon.getConnection();
			String sql = "select * from issuediteminfo";
			ResultSet rs = db.select(sql);
			int vno = 0;
			String name = "";

			while (rs.next()) {
				vno = rs.getInt("voucher_no");
				name = rs.getString("person_name");

			}
		%>

		<%
			InventoryBean i = new InventoryBean();
			List record = i.getPatient(vno, name);
		%>

		<center>
			<h2>Patient Slip</h2>

			<table border="0">
				<%
					Map map;
					for (int j = 0; j < record.size(); j++) {
						map = (Map) record.get(j);
				%>



				<tr>
					
					<th>Voucher no</th>
				
					<td><%=map.get("s1")%></td>
				</tr>
				<tr>

	
					<th>Person Name</th>

					<td><%=map.get("s3")%></td>
				</tr>
				<tr>

					<th>Item Type</th>
	
					<td><%=map.get("s4")%></td>
				</tr>
				<tr>
	
					<th>Item Name</th>

					<td><%=map.get("s5")%></td>
				</tr>
				<tr>
				
					<th>Issue Date</th>
	
					<td><%=map.get("s7")%></td>
				</tr>

				<tr>


					<th>Paid Amount</th>
		
					<td><%=map.get("s9")%></td>
				</tr>

				







				<%
					}
				%>
				<tr>
					<td><input type="submit" onclick="print();" value="print"></td>
					<td><input type="submit" value="back"></td>
				</tr>
			</table>
		</center>


	</form>
</body>
</html>