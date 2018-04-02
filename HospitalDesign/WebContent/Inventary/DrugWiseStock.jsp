<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript">
	function AllowAlphabet() {
		if (!dws.name.value.match(/^[a-zA-Z]+$/) && dws.name.value != "") {
			dws.name.value = "";
			dws.name.focus();
			alert("Please Enter only alphabets in Medicine Name");
		}
	}
</script>
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
	<%
		String name = request.getParameter("name");

		System.out.print(name);
		ArrayList ar = new ArrayList();
		System.out.print(name);
		if (name != null) {

			try {

				dbcon db = dbcon.getConnection();
				String sql = "select * from stock where item_name='" + name
						+ "'";
				//String sql="select * from stock where mfg_company='"+name+"' or item_name='"+name+"' or item_type='"+name+"'";
				/*= "select * from stock where mfg_company='"
						+ company + "' or item_name='" + name
						+ "' or item_type='" + type + "'";
				 */

				ResultSet rs = db.select(sql);
				// System.out.println("ar");

				//select * from stock where mfg_company='' or item_name='CTZ' or item_type=''
				while (rs.next()) {
					System.out.println("ar");
					Map m = new HashMap();
					m.put("s1", rs.getInt("item_id"));
					m.put("s2", rs.getString("item_type"));
					m.put("s3", rs.getString("item_name"));
					m.put("s4", rs.getString("mfg_company"));
					m.put("s5", rs.getString("total_quantity"));

					ar.add(m);
					System.out.println("hello");
					//request.setAttribute("list", ar);

				}

			} catch (Exception e) {
				System.out.print(e);
			}
		}
	%>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
			<div class="box round first grid" style="width: 97%;">
				<h2>DrugWise Search</h2>
				<center>
					<table>
						<tr>

							<th><label>Item Name</label>
							<td>
								<form action="DrugWiseStock.jsp" name="dws">
									<input type="text" name="name" required="required">
							</td>



							<td><input type="submit" value="search"></td>
							</form>
						</tr>
					</table>
				</center>

				</fieldset>

				<fieldset>
					<%
						//System.out.print(ls);
						if (name != null)
							if (ar.size() > 0) {
								//	System.out.print("-"+ls.size());
					%>
					<center>

						<table class="table">
							<tr>
								<th>Item Id</th>
								<th>Item Type</th>
								<th>Item Name</th>
								<th>Mfg Company</th>
								<th>Total Quantity</th>





							</tr>

							<%
								Map map;
										for (int i = 0; i < ar.size(); i++) {
											map = (Map) ar.get(i);
							%>




							<tr>
								<td><%=map.get("s1")%></td>
								<td><%=map.get("s2")%></td>
								<td><%=map.get("s3")%></td>
								<td><%=map.get("s4")%></td>
								<td><%=map.get("s5")%></td>


							</tr>
							<%
								}
							%>
						</table>

					</center>
					<%
						} else {
					%>
					<div align="center">
						<font color="red"><h3>No Record found......</h3></font>
					</div>
					<%
						}
					%>
				</fieldset>
			</div>
		</div>
	</div>

</body>
</html>