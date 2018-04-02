<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.DateFormat"  import="java.text.SimpleDateFormat" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/view.css"
	media="all">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
<script>
$(function(){
	$("#updoins").click(function(){
	$("#updoin").validate();
	
	});
	});

</script>
	<script type="text/javascript">
	function AllowAlphabet(){
		if (!bdon.name.value.match(/^[a-zA-Z]+$/)
				&& bdon.name.value != "") {
			bdon.name.value = "";
			bdon.name.focus();
			alert("Please Enter only alphabets in Donor Name");
		}
		if (!bdon.city.value.match(/^[a-zA-Z]+$/)
				&& bdon.city.value != "") {
			bdon.city.value = "";
			bdon.city.focus();
			alert("Please Enter only alphabets in City Name");
		}
		if (!bdon.state.value.match(/^[a-zA-Z]+$/)
				&& bdon.state.value != "") {
			bdon.state.value = "";
			bdon.state.focus();
			alert("Please Enter only alphabets in State Name");
		}
		if (!bdon.country.value.match(/^[a-zA-Z]+$/)
				&& bdon.country.value != "") {
			bdon.country.value = "";
			bdon.country.focus();
			alert("Please Enter only alphabets in Country Name");
		}
		if (!bdon.uname.value.match(/^[a-zA-Z]+$/)
				&& bdon.uname.value != "") {
			bdon.uname.value = "";
			bdon.uname.focus();
			alert("Please Enter only alphabets in Username");
		}
		
	}
	</script>
	<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >2) {
		alert("Please enter Valid Age.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Age.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<script type="text/javascript">
function valtxt1(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >3) {
		alert("Please enter Valid Quanlity.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Quantity.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<script type="text/javascript">
function valtxt2(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >10) {
		alert("Please enter Valid Contact Number.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact Number.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<script type="text/javascript">
function valtxt3(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >3) {
		alert("Please enter Valid Weight.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact Number.");
				obj.value = "";
				obj.focus();
				return false;
			}
		}
	}
	return true;
}
</script>
<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
table th{
width: 120px;
text-align: left;
}
</style>
</head>
<body>


<%  String n="",a="",b="",w="",m="",add="",c="",s="",co="",e="",r="",d="",l="",q="",dob="",g="";
String uname=request.getParameter("uname");

dbcon db=dbcon.getConnection();
String sql="select * from bloodbankdonor where donor_username='"+uname+"'" ;
ResultSet rs=db.select(sql);
while(rs.next()){
n=rs.getString("donor_name");
dob=rs.getString("donor_dob");
g=rs.getString("donor_gender");
 a=rs.getString("donor_age");
 b=rs.getString("donor_bloodgroup");
 w=rs.getString("donor_weight");
 m=rs.getString("donor_mob");
 add=rs.getString("donor_address");
 c=rs.getString("donor_city");
 s=rs.getString("donor_state");
 co=rs.getString("donor_country");
 e=rs.getString("donor_email");
r=rs.getString("donor_remark");
 d=rs.getString("donor_date");
 l=rs.getString("donor_lastddate");
 q=rs.getString("donor_quantity");


}
%>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Update Doner Registration</h2>
		<center>
		<form action="../updateDonerInfoServlet" method="post" name="bdon" id="updoin">
			
			<fieldset>
				<legend>Personal Information</legend>
					<table>
						<tr>
							<th><label>Name</label></th>
							<td><input type="text" name="name" value="<%=n %>" readonly="readonly"></td>
							<th><label>Dob</label></th>
							<td><input type="text" name="dob" id="dob" disabled="disabled" value="<%=dob %>"></td>
						</tr>
						<tr>
							<th><label>Gender</label></th>
							<td><label>Male</label><input type="radio" name="gender" <%if(g.endsWith("male")){ %> checked="checked"<%} %>
								value="male" disabled="disabled"> <label>Female</label><input type="radio"<%if(g.endsWith("female")){ %> checked="checked"<%} %>
								name="gender" value="female" disabled="disabled"></td>
							<th><label>Age</label></th>
							<td><input type="text" name="age"  value="<%=a %>"  onKeyUp="return valtxt(this)"  class="required"></td>
						</tr>
						<tr>
							<th>Blood Group</th>
						<td><select name="bloodgroup" value="<%=b %>" disabled="disabled"><option>O+</option>
								<option>O-</option>
								<option>A+</option>
								<option>A-</option>
								<option>B+</option>
								<option>B-</option>
								<option>AB+</option>
								<option>AB-</option>
								</select></td>
							<th><label>Weight</label></th>
							<td><input type="text" name="weight" value="<%=w %>"  class="required"  onKeyUp="return valtxt3(this)"></td>

						</tr>
					</table>
			</fieldset>
			<fieldset>
				<legend>Contact Detail</legend>
					<table>
						<tr>
							<th><label>Address</label></th>
							<td><textarea rows="3" cols="15" name="add" value=""  class="required"><%=add %>
							</textarea></td>
							<th><label>City</label></th>
							<td><input type="text" name="city" value="<%=c %>"  class="required" onkeyup=" AllowAlphabet();"></td>
						</tr>
						<tr>
							<th><label>state</label></th>
							<td><input type="text" name="state" value="<%=s %>"  class="required" onkeyup=" AllowAlphabet();"></td>
							<th><label>Country</label></th>
							<td><input type="text" name="country" value="<%=co %>"  class="required" onkeyup=" AllowAlphabet();"></td>
						</tr>
						<tr>
							<th><label>Contact No</label></th>
							<td><input type="text" name="cno" value="<%=m %>"  class="required"  onKeyUp="return valtxt2(this)"></td>
							<th><label>E-mail</label></th>
							<td><input type="text" name="cno" value="<%=e %>"  class="required email"> </td>


						</tr>
					</table>
			</fieldset>
			<fieldset>
				<legend>Other Details</legend>
					<table>
						

						<tr>
							<th><label>Last Donation Date</label></th>
							<td><input type="text" name="lddate" value="<%=l %>"  class="required"></td>
							<th><label>Quantity</label></th>
							<td><input type="text" name="quantity" value="<%=q %>"  class="required"  onKeyUp="return valtxt1(this)"></td>

						</tr>
						<tr>

							
							<th><label>Remark</label></th>
							<td><input type="text" name="remark" value="<%=r %>"  class="required" onkeyup=" AllowAlphabet();"></td>


						</tr>

					</table>

			</fieldset>
			<h5 align="center"><input type="submit" value="update" id="updoins"></h5>
		</center>
		</form></div>
		</div>
		</div>
		

</body>
</html>