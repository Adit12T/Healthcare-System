<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>


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
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Update Stock</h2>
		<form action="../UpdateStockServlet">
		<center>
					<table>
						<tr>
							
							<th><label>Item Type</label></th>
							<td><input type="text" name="type" readonly="readonly" value="<%=request.getParameter("t1")%>"></td>
							<th><label>Item Name</label></th>
							<td><input type="text" name="name"  readonly="readonly" value="<%=request.getParameter("t2")%>"></td>
													</tr>
						<tr>
						<th><label>Mfg Company</label></th>
							<td><input type="text" name="cp"  readonly="readonly" value="<%=request.getParameter("t3")%>"></td>
						<th><label>Quantity</label></th>
							<td><input type="text" name="q" onkeypress="return number(event)" value=""></td>
						<%int quantity=Integer.parseInt(request.getParameter("t4"));
						session.setAttribute("tq", quantity);
						%>
							
						</tr>
				    </table>
				    <input type="submit" name="s" value="add">
				    <input type="submit" name="s" value="remove">
			   </center>
</form>
</div>
</div>
</div>
</body>
</html>