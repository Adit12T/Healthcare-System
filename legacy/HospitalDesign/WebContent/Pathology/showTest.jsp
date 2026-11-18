<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologytestdetail.pathologyBean"%>
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
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script src="../js/table/jquery.dataTables.min.js"></script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Show All Test</h2>
<table width="725" height="65" border="0" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <th width="75">Serial No. </th>
    <th width="235">Category</th>
    <th width="178">Content</th>
    <th width="113">Cost</th>
    
    <th width="124">Action</th>
  </tr>
  
  <%
  pathologyBean pb=new pathologyBean();
  List l=pb.show();
  Map map;
  for(int i=0;i<l.size();i++){
  map=(Map)l.get(i);
  %>
 
  <tr>
    <td><%=i+1 %></td>
    <td><%=map.get("test_name") %></td>
    <td><%=map.get("test_content") %></td>
    <td><%=map.get("test_cost") %></td>
    
    <td><a href="updatetestdetail.jsp?id=<%=map.get("test_id")%>"><img	alt="Update Record" title="Update Record" src="../mg/icon_edit.png" width="15" height="15"></a>&nbsp;&nbsp;&nbsp;<a href="deletetestdetail.jsp?id=<%=map.get("test_id")%>"><img alt="Delete" title="Delete" src="../mg/imgclose.jpg" width="15" height="15"></a> </td>
    
    
   
  </tr>
  <%} %>
</table>
</div>
</div>
</div>
</body>
</html>