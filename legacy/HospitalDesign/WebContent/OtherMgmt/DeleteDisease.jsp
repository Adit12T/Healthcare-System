<%@page import="com.disease.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.disease.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DELETE DISEASE</title>
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
		<h2>Delete Disease</h2>
<form action="../DeleteDisease" method="post">
  <fieldset>
  Diseas ID<input type="text" name="id">
   
  
 <button type="submit">delete</button>  
 </fieldset>
  </form>
  <fieldset>
  <table border="">
  <tr>
  <th>DiseaseID</th>
  <th>DiseaseName</th>
  <th>DepartmentName</th>
  </tr>
  
<% ArrayList<Disease_Beans> ls = Diseasedao.slectDisease();
   for(int i=0;i<ls.size();i++ )
   {Disease_Beans d =ls.get(i);
%>
<tr>
<td><%=d.getDiseaseid() %></td>
<td><%=d.getDiseaseName() %></td>
<td><%=d.getDiseaseDepartment()%></td>
</tr>
<%} %>
</table>
</fieldset>
</div>
</div>
</div>
</body>
</html>