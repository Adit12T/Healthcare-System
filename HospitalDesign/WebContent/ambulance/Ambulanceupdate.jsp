<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
      <%@page import="java.util.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ambulance Update Information</title>
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
<script type="text/javascript" src="../js/jquery.js"></script>

<style type="text/css">
fieldset {
	border-color:#FDFBFC;
}
 #small_input{
width:50px;
}
#course{
width: 150px;
}
#pro{
text-align: center;
}
</style>
<script type="text/javascript">



	function showData(value) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "../AmbulanceupsearchServlet";
		url = url + "?atype=" + value;
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);

	}
	function stateChanged() {

		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var showdata = xmlHttp.responseText;
			document.getElementById("mydiv").innerHTML = showdata;

		}

	}
	function GetXmlHttpObject() {
		var xmlHttp = null;
		try {
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
</script>


<script type="text/javascript">
function message()

{
	alert("Update Successfully");
	
}
</script>
</head>
<body <% String msg=request.getParameter("msg");
if(msg!=null)
{%>
onload="message()"

<% }
	%>>
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Ambulance Update Information</h2>
	<center>

		<fieldset>


			<table>

				<tr>
						<th>Ambulance Type</th>
						<td><select name="atype" id="a1"
							onchange="showData(this.value)">
								<option value="">choose option</option>
								<option value="critical care ambulance">critical care
									ambulance</option>
								<option value="critical care oxg">critical care oxg</option>
								<option value="general ambulance">general ambulance</option>
								<option value="Emergancy">Emergancy</option>
						</select></td>
					

				</tr>
			</table>
			<div id="mydiv" style="margin-top: 50px"></div>
			</fieldset>
			</center>
			</div>
			</div>
			</div>
			
</body>
</html>