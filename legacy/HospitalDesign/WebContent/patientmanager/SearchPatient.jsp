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
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Search Patient</h2>

<form action="Patient_Update.jsp">
<table>
<tr><td width="350">
UPDATE PATIENT
</td>
<td>
<input type="text" name="pid" required="required">

</td><td>

<button type="submit">search</button></td>
</tr></table>
</form>




<form action="Patient_ByName.jsp">
<table>
<tr><td width="350">
SEARCH PATIENT BY NAME</td>
<td><input type="text" name="pname" required="required">
</td><td>
<button type="submit">search</button>
</td></tr></table>
</form>



<form action="Patient_ByDate.jsp">
<table>
<tr><td width="350">

SEARCH PATIENT BY DATE </td>
<td><input type="text" name="date" required="required">
</td><td>
<button type="submit">search</button>

</td></tr></table>
</form>

<form action="../Delete_Patient">
<table><tr><td width="350">

DELETE PATIENT BY ID </td>
<td><input type="text" name="id" required="required">
</td><td>
<button type="submit">search</button>
</td></tr></table>
</form>

<form action="Patient_ByID.jsp">
<table><tr><td width="350">

SEARCH PATIENT BY ID</td>
<td><input type="text" name="id" required="required">
</td><td>
<button type="submit">search</button>
</td></tr></table>
</form>
</div>
</div>
</div>


</body>
</html>