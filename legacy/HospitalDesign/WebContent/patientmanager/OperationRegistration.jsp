<%@page import="java.sql.SQLException"%>
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
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#op_regs").click(function(){
	$("#op_reg").validate();
	
	});
	});

</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!emp_reg.s_name.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.s_name.value != "") {
			emp_reg.s_name.value = "";
			emp_reg.s_name.focus();
			alert("Please Enter only alphabets in Surgeon Name");
		}
		if (!emp_reg.as_name.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.as_name.value != "") {
			emp_reg.as_name.value = "";
			emp_reg.as_name.focus();
			alert("Please Enter only alphabets in Assistant Surgeon Name");
		}
		if (!emp_reg.n_name.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.n_name.value != "") {
			emp_reg.n_name.value = "";
			emp_reg.n_name.focus();
			alert("Please Enter only alphabets in Nurse Name");
		}
		if (!emp_reg.ot_boy_name.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.ot_boy_name.value != "") {
			emp_reg.ot_boy_name.value = "";
			emp_reg.ot_boy_name.focus();
			alert("Please Enter only alphabets in OT boy Name");
		}
	}
	</script>
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
	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>Operation Registration</h2>
<form action="OperationRegistration.jsp" >
<table  align="center" cellspacing="15">
<tr>
<th>Patient Id</th><td><input type="text" name="p_id"></td><td><input type="submit" value="Submit"></td>
</tr>
</table>
</form>
<form action="../OperationRegistration" method="post" id="op_reg" name="emp_reg">
<input type="hidden" name="value" value="add">
<table cellspacing="15">

<%
String pp_id="",pp_name="",pp_address="",pp_gender="",pp_age="",pp_bg="";
Connection con=MyCon.getConnection();
String P_id=request.getParameter("p_id");
String sql="select * from patient where patient_registrationno =?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,P_id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
pp_id=rs.getString(1);
pp_name=rs.getString(2);
pp_address=rs.getString(7);
pp_gender=rs.getString(3);
pp_age=rs.getString(4);
pp_bg=rs.getString(12);
}
	%>
<tr>
<th>Patient Id</th><td><input type="text" name="pp_id" value="<%=pp_id%>" readonly="readonly"></td>
<th>Blood Group</th><td><input type="text" name="pp_bg" value="<%=pp_bg%>"  readonly="readonly"></td>
</tr>
<tr>
<th>Patient Name</th><td><input type="text" name="pp_name" value="<%=pp_name%>" readonly="readonly"></td>
<th>Address</th><td><input type="text" name="pp_address" value="<%=pp_address%>" readonly="readonly"></td>
</tr>
<tr>
<th>Gender</th><td><input type="text" name="pp_gender" value="<%=pp_gender %>" readonly="readonly"> </td>
<th>Age</th><td><input type="text" name="pp_age" value="<%=pp_age %>" readonly="readonly"> </td>
</tr>
<tr>
<th><label>Operation Type</label><br>
</th><td id="">
<%
String buffer="<select name='operation_type' id='o_type' onchange='getOname(this)'><option>Select Operation Type</option>";
String sql1="select distinct operation_type from operation_manager";
try {
	PreparedStatement ps1=MyCon.getConnection().prepareStatement(sql1);
ResultSet	rs1=ps1.executeQuery();
while(rs1.next()){
	
	buffer=buffer+"<option value='"+rs1.getString("operation_type")+"'>"+rs1.getString("operation_type")+"</option>";
}
buffer=buffer+"</select>";

out.print(buffer);
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	out.print(e1);
}
%>
</td>

<th align="left">Operation Name</th>
<td><select id="o_name" name="op_name" onchange="getOpCost(this)" style="width: 200px;">
<option>Select Operation Name</option>
</select></td>
</tr>
<tr>
<th>Operation Date</th><td><input type="text" name="o_date" id="datepicker"></td>
<th>Operation Time</th><td><input type="text" name="o_time"></td>
</tr>
<tr>
<th>Surgeon Name</th><td><input type="text" name="s_name" class="required" onkeyup="AllowAlphabet();"></td>
<th>Assistant Surgeon</th><td><input type="text" name="as_name"  class="required" onkeyup="AllowAlphabet();"></td>
</tr>
<tr>
<th>Nurse Name</th><td><input type="text" name="n_name"  class="required" onkeyup="AllowAlphabet();"></td>
<th>OT Boy</th><td><input type="text" name="ot_boy_name"  class="required" onkeyup="AllowAlphabet();"></td>
</tr>
<tr>
<th>Total Amount</th><td id="op_cost"> </td><th>Operation Theater</th><td><input type="text" name="op_theater"  class="required">
</tr>
<tr><th>Paid Amount</th><td><input type="text" name="ot_paid_amount"  class="required"></td></tr>
</table>
<h3 align="center"><input type="submit" value="Submit" id="op_regs"> </h3>
<br><br>
<h4 align="center">
<%
if(request.getSession().getAttribute("msg")!=null){
%>
<%=request.getSession().getAttribute("msg")%>
<%	
}
%></h4>
</form>
</div>
</div>
</div>
</body>
</html>