<%@page import="java.util.ArrayList"%>
<%@page import="com.expenditure.*"%>
<%@page import="com.expenditure.Expenditure_Beans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE EXPENDITURE</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />

	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
</head>
<body>
<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Update Expenditure</h2>
<form action="../UpdateExpenditure" method="post">
  <fieldset>
  Expenditure ID<input type="text" name="id" required="required">
  Item<input type="text" name="item" required="required">
   Date<input type="text" name="date" required="required">  
   Cost<input type="text" name="cost" required="required">
  Remark<input type="text" name="remark" required="required"> 
 <button type="submit">update</button>  
 </fieldset>
  </form>
  <fieldset>
  <table border="" class="table">
  <tr>
  <th>Expenditure_id</th>
  <th>Item</th>
  <th>Date</th>
  <th>Cost</th>
  <th>Remark</th>
  </tr>
  
<% ArrayList<Expenditure_Beans> ls = Expendituredao.getExpenditure();
   for(int i=0;i<ls.size();i++ )
   {Expenditure_Beans e =ls.get(i);
%>
<tr>
<td><%=e.getEId() %></td>
<td><%=e.getEItem() %></td>
<td><%=e.getEDate()%></td>
<td><%=e.getECost() %></td>
<td><%=e.getERemark() %></td>

</tr>
<%} %>
</table>
</fieldset>
</div>
</div>
</div>
</body>
</html>