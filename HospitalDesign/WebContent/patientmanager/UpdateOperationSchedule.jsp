<%@page import="OperationTheater.OperationRegistrationBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Operation Registration</title>
	
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
<script type="text/javascript" src="../jquery.validate.js"></script>
<script>
$(function(){
	$("#up_op_scs").click(function(){
	$("#up_op_sc").validate();
	
	});
	});

</script>
		<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
		
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>

	<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>
	<script>
	$(document).ready(function() {

		$.ajax({
			url : "../GetOperationType",

			async : false,
			dataType : "text",
			type : "post",
			success : function(result) {
				$("#o_type").html(result);

			},
			error : function(error) {
				$("#o_type").html(result);
			}
		});

	});
</script>
	<script type="text/javascript">
	function getOname(str) {

		var data = "operation_type=" + str.value;
		$("#loadimg").append(
				"<img alt='Loading' src='img/ajax-loader1.gif' id='loading'>");
		$.ajax({
			url : "../GetOperationName",
			data : data,
			async : false,
			dataType : "text",
			type : "post",
			success : function(result) {
				$("#o_name").html(result);

				$("#loading").fadeOut(1000, function() {
					$(this).remove();

				});

			},
			error : function(error) {
				$("#o_name").html(result);
			}
		});

	}
</script>
<script type="text/javascript">
	function getOpCost(str) {

		var data = "op_name=" + str.value;
		$("#loadimg").append(
				"<img alt='Loading' src='img/ajax-loader1.gif' id='loading'>");
		$.ajax({
			url : "../GetOperationCost",
			data : data,
			async : false,
			dataType : "text",
			type : "post",
			success : function(result) {
				$("#op_cost").html(result);

				$("#loading").fadeOut(1000, function() {
					$(this).remove();

				});

			},
			error : function(error) {
				$("#op_cost").html(result);
			}
		});

	}
</script>
</head>
<body>
<%int oid=Integer.parseInt(request.getParameter("oid")) ;
OperationRegistrationBean orb=new OperationRegistrationBean(oid);


if(orb!=null){

%>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Update Operation Registration</h2>

<form action="../OperationRegistration" method="post" id="up_op_sc">
<input type="hidden" name="value" value="update">
<input type="hidden" name="oid" value="<%=oid%>">
<table cellspacing="15">



<tr>
<th>Patient Id</th><td><input type="text" name="pp_id" value="<%=orb.getPatient_id()%>" readonly="readonly"></td>
<th>Blood Group</th><td><input type="text" name="pp_bg" value="<%=orb.getBlood_group()%>" readonly="readonly"></td>
</tr>
<tr>
<th>Patient Name</th><td><input type="text" name="pp_name" value="<%=orb.getP_name()%>" readonly="readonly"></td>
<th>Address</th><td><input type="text" name="pp_address" value="<%=orb.getP_address()%>" readonly="readonly"></td>
</tr>
<tr>
<th>Gender</th><td><input type="text" name="pp_gender" value="<%=orb.getP_gender() %>" readonly="readonly"> </td>
<th>Age</th><td><input type="text" name="pp_age" value="<%=orb.getP_age() %>" readonly="readonly"> </td>
</tr>
<tr>
<th><label>Operation Type</label><br>
</th><td><input type="text" name="operation_type" value="<%=orb.getOp_type()%>" readonly="readonly"></td>

<th align="left">Operation Name</th>
<td><input type="text" name="op_name" value="<%=orb.getOp_name()%>" readonly="readonly"> </td>
</tr>
<tr>
<th>Operation Date</th><td><input type="text" name="o_date" id="datepicker" value="<%=orb.getOp_date()%>"></td>
<th>Operation Time</th><td><input type="text" name="o_time" value="<%=orb.getOp_time()%>"></td>
</tr>
<tr>
<th>Surgeon Name</th><td><input type="text" name="s_name" value="<%=orb.getSurgeon_name()%>" readonly="readonly"></td>
<th>Assistant Surgeon</th><td><input type="text" name="as_name" value="<%=orb.getAsurgeon_name()%>"  class="required"></td>
</tr>
<tr>
<th>Nurse Name</th><td><input type="text" name="n_name" value="<%=orb.getNurse_name()%>"  class="required"></td>
<th>OT Boy</th><td><input type="text" name="ot_boy_name" value="<%=orb.getOt_boy_name()%>"  class="required"></td>
</tr>
<tr>
<th>Total Amount</th><td><input type="text" name="o_cost" value="<%=orb.getTotal_cost()%>" readonly="readonly"> </td><th>Operation Theater</th><td><input type="text" name="op_theater" value="<%=orb.getOp_theater()%>">
</tr>
<tr><th>Paid Amount</th><td><input type="text" name="ot_paid_amount" value="<%=orb.getPaid_cost()%>" class="required"></td></tr>
</table>
<h3 align="center"><input type="submit" value="Submit" id="up_op_scs"> <%String msg=request.getParameter("msg");
if(msg!=null)out.print(msg);
%></h3>
<br><br>
</form>
</div>
</div>
</div>
<%} %>
</body>
</html>