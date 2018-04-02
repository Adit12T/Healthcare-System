<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/view.css"
	media="all">
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>




<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>

<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>

<style type="text/css">
#fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>


<script type="text/javascript">

	function clicks(value) {

		xmlHttp = GetXmlHttpObject();
		/* if (value=="")
		{
		document.getElementById("mydiv").innerHTML="";
		return;
		} */
		//var a=document.getElementById("a").value;
		var url = "../ajaxServlet";
		url = url + "?t1=" + value;
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);

	}
	function stateChanged() {

		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			var showdata = xmlHttp.responseText;
			
			
			
				var arr = showdata;
				var arr1 = arr.split(":");

				//alert(arr);
				document.f1.iname.options.length = 0;
				for ( var i = 0; i < arr1.length - 1; i++) {

					document.f1.iname.options[i] = new Option(arr1[i], arr1[i]);

				}

			
			
			
			
			//document.getElementById("mydiv").innerHTML = showdata;

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













<script>

	function al(msg) {
		alert(msg);

	}
	function a2() {
		alert("sorry requested amount is not available!");

	}
	
</script>
<script src="jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="../jquery.validate.js"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script>
$(function(){
	$("#imageField").click(function(){
	$("#send").validate();
	
	});
	});

</script>
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="../jquery.validate.js"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script>
$(function(){
	$("#imageField").click(function(){
	$("#send").validate();
	
	});
	});

</script>
</head>
<body
	<%String msg = request.getParameter("msg");

			if (msg != null) {%>
	onload="al('<%=msg%>');" <%}%>>
	<div id="form_container">
		<h1>
			<a></a>
		</h1>
		<div class="form_description">
			<h2>Item Issue</h2>
			<p></p>
		</div>
		<form action="../IssueItemServlet" name="f1" id="send">
			<fieldset>
				<legend>Issue Item Information </legend>
				<center>
					<table>
						<tr>
							<th><label> Name</label></th>
							<td><input type="text" name="name" placeholder="Person Name" class="required"></td>
							<th><label> Mfg company</label></th>
							<td><input type="text" name="mcompany" placeholder="Company Name" class="required"> </textarea></td>
						</tr>
						<tr>
							<th><label> Item Type</label></th>
							<td><select name="type" onchange="clicks(this.value);">
									<option>select item type</option>
									<%
										dbcon db = dbcon.getConnection();
										String sql = "select item_type from stock";
										ResultSet rs = db.select(sql);
										while (rs.next()) {
											String itype = rs.getString("item_type");
									%>
									<option value=<%=itype%>><%=itype%></option>
									<%
										}
									%>

							</select></td>
							<th><label> Item Name</label></th>
							<td><select name="iname" id="iname" placeholder="Item Name" class="required">
									<option value="select">select</option>
							</select></td>

						</tr>
						<tr>

							<th><label> Date of issue</label></th>
							<td><input type="text" name="date" id="datepicker" class="required"></td>
							<th><label>Requested Quantity</label></th>
							<td><input type="text" name="rq" id="rq" class="required" ></td>


						</tr>
						<tr>

							<th><label> Issue Quantity</label></th>
							<td><input type="text" name="sq" class="required"></td>

						</tr>
						<tr>

							<th><label> Total Amount</label></th>
							<td><input type="text" name="tamount" class="required"></td>
							<th><label>Paid Amount</label></th>
							<td><input type="text" name="pamount" class="required"></td>
						</tr>

					</table>
					<input type="submit" value="save" id="imageField">
			</fieldset>
		</form>
	</div>


</body>
</html>