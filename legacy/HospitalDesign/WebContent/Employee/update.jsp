<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.dbcon"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Updation</title>
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
<script>
$(function(){
	$("#imageField").click(function(){
	$("#sendemail").validate();
	
	});
	});

</script>
<script type="text/javascript">
	function AllowAlphabet(){
		if (!emp_reg.name.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.name.value != "") {
			emp_reg.name.value = "";
			emp_reg.name.focus();
			alert("Please Enter only alphabets in Employee Name");
		}
		if (!emp_reg.city.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.city.value != "") {
			emp_reg.city.value = "";
			emp_reg.city.focus();
			alert("Please Enter only alphabets in City Name");
		}
		if (!emp_reg.state.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.state.value != "") {
			emp_reg.state.value = "";
			emp_reg.state.focus();
			alert("Please Enter only alphabets in State Name");
		}
		if (!emp_reg.country.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.country.value != "") {
			emp_reg.country.value = "";
			emp_reg.country.focus();
			alert("Please Enter only alphabets in country Name");
		}
		if (!emp_reg.qua.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.qua.value != "") {
			emp_reg.qua.value = "";
			emp_reg.qua.focus();
			alert("Please Enter only alphabets in qualification Name");
		}
		if (!emp_reg.crs.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.crs.value != "") {
			emp_reg.crs.value = "";
			emp_reg.crs.focus();
			alert("Please Enter only alphabets in Course Name");
		}
		if (!emp_reg.uni.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.uni.value != "") {
			emp_reg.uni.value = "";
			emp_reg.uni.focus();
			alert("Please Enter only alphabets in University Name");
		}
		if (!emp_reg.clg.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.clg.value != "") {
			emp_reg.clg.value = "";
			emp_reg.clg.focus();
			alert("Please Enter only alphabets in College Name");
		}
		if (!emp_reg.strm.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.strm.value != "") {
			emp_reg.strm.value = "";
			emp_reg.strm.focus();
			alert("Please Enter only alphabets in Stream Name");
		}
		if (!emp_reg.lem.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.lem.value != "") {
			emp_reg.lem.value = "";
			emp_reg.lem.focus();
			alert("Please Enter only alphabets in Last Employeer Name");
		}
		if (!emp_reg.lpt.value.match(/^[a-zA-Z]+$/)
				&& emp_reg.lpt.value != "") {
			emp_reg.lpt.value = "";
			emp_reg.lpt.focus();
			alert("Please Enter only alphabets in last Post Name");
		}
		
	}

</script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<script type="text/javascript">
function valtxt(obj) {
	str = "0123456789-"
	l = obj.value.length;
	if (obj.value.length >11) {
		alert("Please enter 10 digit Mobile number.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Contact number.");
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
	if (obj.value.length >11) {
		alert("Please enter Valid Salary.");
		obj.value = "";
		obj.focus();
		return false;
	} else {
		for (i = 0; i <= l; i++) {
			if (str.indexOf(obj.value.charAt(i)) == -1) {
				alert("Please enter valid Salary.");
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
th{
text-align: left;
}
</style>
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
		<div class="grid_10"  style="width: 97%;">
		<div class="box round first grid">
		<h2>Update Employee Details</h2>
		<% String n="" ,dob="",joindate="",tele="",mob="",mstatus="",gender="",add="",city="",state="",country="",bgroup="",type="",
		email="", image="" ,last="",post="",exp="" ,spe="",lice="",dname="",bname = "", bno = "", pfno = "", panno = "",sal="";
		 String qtype[]=new String[100];
		 
		String cname[]=new String[100];String stream[]=new String[100],univer[]=new String[100],clgname[]=new String[100],cduration[]=new String[100],per[]=new String[100];
		 int salary=0,i=0,count=0;
		String id=request.getParameter("id");
		String ename=request.getParameter("ename");
	    //System.out.println("enm===>"+ename);
		session.setAttribute("ids", id);
	
		dbcon db = dbcon.getConnection();
		
		if(ename.equals("doctor")){
			String sql="select * from employee A ,employee_experience B,employee_specialization C,employee_profetional_information D, employee_account E where A.emp_id="+id+" and A.emp_id=B.emp_id and A.emp_id=C.emp_id and A.emp_id=D.emp_id and A.emp_id=E.emp_id ";
			ResultSet rs = db.select(sql);
			while(rs.next())
			{
			n=rs.getString("emp_name");
			dob=rs.getString("emp_dob");
			joindate=rs.getString("emp_jod");
		tele=rs.getString("emp_telephone");
		mob=rs.getString("emp_mobile");
		mstatus=rs.getString("emp_marrialstatus");
		gender=rs.getString("emp_gender");
		add=rs.getString("emp_address");
		city=rs.getString("emp_city");
		state=rs.getString("emp_state");
		country=rs.getString("emp_country");
		bgroup=rs.getString("emp_bloodgroup");
		type=rs.getString("emp_type");
		email=rs.getString("emp_email");
		image=rs.getString("emp_image");
		salary=rs.getInt("emp_salary");
		dname=rs.getString("emp_department");
		last=rs.getString("last_employer");
		post=rs.getString("post");
		sal=rs.getString("salary");
		exp=rs.getString("experience");
		bname=rs.getString("bank_name");
		bno=rs.getString("bank_account_no");
		pfno=rs.getString("pf_no");
		panno=rs.getString("pan_no");
		
		if(type.equals("doctor")){
		spe=rs.getString("specialization");
		lice=rs.getString("license_number");
		
		}
		qtype[i]=rs.getString("qualification_type");
		cname[i]=rs.getString("course_name");
		stream[i]=rs.getString("stream");
		univer[i]=rs.getString("university_name");
		clgname[i]=rs.getString("college_name");
		cduration[i]=rs.getString("course_duration");
		per[i]=rs.getString("percentage");
		
				i++;
			}
			count=i;
			//System.out.println(count);
			
		}else{
			String sql="select * from employee A ,employee_experience B,employee_profetional_information D,employee_account E where A.emp_id="+id+" and A.emp_id=B.emp_id and A.emp_id=D.emp_id and A.emp_id=E.emp_id";
			ResultSet rs = db.select(sql);
		
			while(rs.next())
			{
			n=rs.getString("emp_name");
			dob=rs.getString("emp_dob");
			joindate=rs.getString("emp_jod");
		tele=rs.getString("emp_telephone");
		mob=rs.getString("emp_mobile");
		mstatus=rs.getString("emp_marrialstatus");
		gender=rs.getString("emp_gender");
		add=rs.getString("emp_address");
		city=rs.getString("emp_city");
		state=rs.getString("emp_state");
		country=rs.getString("emp_country");
		bgroup=rs.getString("emp_bloodgroup");
		type=rs.getString("emp_type");
		email=rs.getString("emp_email");
		image=rs.getString("emp_image");
		salary=rs.getInt("emp_salary");
		dname=rs.getString("emp_department");
		last=rs.getString("last_employer");
		post=rs.getString("post");
		sal=rs.getString("salary");
		exp=rs.getString("experience");
		
		bname=rs.getString("bank_name");
		bno=rs.getString("bank_account_no");
		pfno=rs.getString("pf_no");
		panno=rs.getString("pan_no");
		
		qtype[i]=rs.getString("qualification_type");
		cname[i]=rs.getString("course_name");
		stream[i]=rs.getString("stream");
		univer[i]=rs.getString("university_name");
		clgname[i]=rs.getString("college_name");
		cduration[i]=rs.getString("course_duration");
		per[i]=rs.getString("percentage");
		
	
		
		
				i++;
			}}
			count=i;
			System.out.println(count);
			System.out.println(image);
		//	System.out.println(add);
			
		%>

		<form action="../UpdateServlet" name="emp_reg" id="sendemail"> 
			<fieldset>
				<legend>Personal Information</legend>
				<table>
					<tr>
						<th>Name</th>
						<td><input type="text" name="name" value="<%=n%>"  disabled="disabled"></td>
						<td></td><td><%-- <img alt="" src="../empimage/<%=image %>" width="100" height="100">  --%></td>
					</tr>
					<tr>
						<th>Date of Birth</th>
						<td><input type="text" name="dob"  disabled="disabled" value="<%=dob%>" ></td>
					</tr>
					<tr>
						<th>Address</th>
						<td><textarea rows="3" cols="20" name="add"  class="required" > <%=add %></textarea></td>
					</tr>
					<tr>
						<th>Mobile Number</th>
						<td><input type="text" name="mob"  value="<%=mob%>" class="required" onKeyUp="return valtxt(this)" onblur="return valtxt1(this)"></td>
						<th>Telephone Number</th>
						<td><input type="text" name="teno"  value="<%=tele%>" onKeyUp="return valtxt(this)" onblur="return valtxt1(this)"></td>
					</tr>
					<tr>
						<th>Gender</th>
						<td>Male<input type="radio"    name="gender" <%if(gender.endsWith("male")){%>checked="checked"<%}%>  value="male"  disabled="disabled">Female<input
							type="radio"  name="gender" <%if(gender.endsWith("female")){%>checked="checked"<%}%> value="female"   disabled="disabled" ></td>
						<th>Marital Status</th>
						<td>Married<input type="radio" name="mstatus"  <%if(mstatus.endsWith("married")){%>checked="checked"<%}%> value="married">UnMarried<input
							type="radio" name="mstatus"  <%if(mstatus.endsWith("unmarried")){%>checked="checked"<%}%>value="unmarried"></td>
					</tr>
					<tr>
						<th>Blood Group</th>
						<td><input type="text" name="bloodgroup"  value="<%=bgroup %>" disabled="disabled">
								</td>
						<th>Employee Type</th>
						<td><input type="text" name="emptype"  value="<%=type%>" disabled="disabled">
								</td>
					</tr>
					<tr>
						<th>Email Id</th>
						<td><input type="text" name="email"  value="<%=email%>"  class="required email"></td>
					</tr>
					<tr>
						<th>City</th>
						<td><input type="text" name="city"  value="<%=city%>"  class="required" onkeyup="AllowAlphabet();"></td>
					
						<th>State</th>
						<td><input type="text" name="state"  value="<%=state%>"  class="required" onkeyup="AllowAlphabet();"></td>
					
						<th>Country</th>
						<td><input type="text" name="country"  value="<%=country%>"  class="required" onkeyup="AllowAlphabet();"></td>
					</tr>
					<tr>
						<th>Joining Date</th>
						<td><input type="text" name="joindate"  value="<%=joindate%>"disabled="disabled" ></td>
					
						<th>Salary</th>
						<td><input type="text" name="salary"  value="<%=salary%>"  onKeyUp="return valtxt2(this)"> </td>
					</tr>
					<tr>
						<th>Image</th>
						<td><input type="file" name="image" ></td>
					</tr>
					<%if(type.equals("doctor")){ %>
			<th>License Number</th>
			<td><input type="text" name="lino" value="<%=lice %>" disabled="disabled"></td>
			<%} %>
			<th>Department Name</th>
			<td><input type="text" value="<%=dname%>" disabled="disabled"> </td></tr><tr>
				</table>
			</fieldset>
			<fieldset>
			<legend>Professional Information</legend>
			<table id="pro">
			<tr>
			<th><label>Qualification</label></th>
			<th>
			<label>Course Name</label></th>
			<th><label>University Name</label></th>
			<th><label>College Name</label></th>
			<th><label>Stream</label></th>
			<th><label>Passing Year</label></th>
			<th><label>Percentage</label></th>
			</tr>
			<%for(int j=0;j<count;j++)
				{
				%>
			<tr>
			<th>
			<input type="text" name="qualification"  id="small_input" value="<%=qtype[j]%>"disabled="disabled" >
			</th>
			<th>
			<input type="text" name="qualification"  id="small_input"  value="<%=cname[j]%>" disabled="disabled">
			</th>
			<th>
			<input type="text" name="university"  value="<%=univer[j]%>" disabled="disabled">
			</th>
			<th>
			<input type="text" name="clgname" value="<%=clgname[j]%>" disabled="disabled">
			</th>
			
			<th>
			<input type="text" name="stream" value="<%=stream[j]%>" disabled="disabled">
			</th>
			<th>
			<input type="text" name="passing" id="small_input" value="<%=cduration[j]%>" disabled="disabled">
			</th>
			<th>
			<input type="text" name="percentage"  id="small_input"  value="<%=per[j]%>" disabled="disabled">
			</th>
			</tr>
			<%} %>			</table>
			<table>
			<tr>
			<th><label>Specialization</label></th>
			<th>
			<%if(type.equals("doctor")){ %>
			<input type="text" name="specialization" value="<%=spe %>" disabled="disabled"></th>
   	<%} %>
			</tr>
			
			</table>
			</fieldset>
			<fieldset>
			<legend>Experience</legend>
			<table>
			<tr>
			<th>Experience</th>
			<td>
			<select name="exp">
			
			<option   value="<%=exp %>"><%=exp %></option>
			<option>Less than 1 year</option>
			<option>1 year</option>
			<option>2 year</option>
			<option>3 year</option>
			<option>4 year</option>
			<option>5 year</option>
			<option>6 year</option>
			<option>7 year</option>
			<option>8 year</option>
			<option>9 year</option>
			<option>10 year</option>
			<option>more than 10 year</option>
			</select>
			</td>
			</tr>
			<tr>
			<th>Last Employer</th>
			<td><input type="text" name="last_emp" value="<%=last%>" disabled="disabled"></td>
			
			<th>Post</th>
			<td><input type="text" name="last_post"  value="<%=post%>"  class="required" onkeyup="AllowAlphabet();"> </td>
			<th>Salary</th>
			<td><input type="text" name="last_salary"  value="<%=sal%>" disabled="disabled"> </td>
			</tr>
			</table>
			</fieldset>
			<fieldset>
				<legend>Account Detail</legend>
				<table>
					<tr>
						<th>Bank Name</th>
						<td><input type="text" name="bankname"  value="<%=bname%>" disabled="disabled"></td>
						<th>Bank Account Number</th>
					<td><input type="text" name="actno" value="<%=bno%>" disabled="disabled"></td>
					</tr>

					

					<th>PF Number</th>
					<td><input type="text" name="pfno"  value="<%=pfno%>"  disabled="disabled"></td>
					<th>Pan Number</th>
					<td><input type="text" name="panno"  value="<%=panno%>" disabled="disabled"></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<table align="center">
			<tr>
			<td>
			
			<input type="submit" value="Update" id="imageField">
			<input type="Reset" value="Clear">
			</td>
			</tr>
			</table>
			
		</form>

 </div>
        </div>
   </div>
   
</body>
</html>