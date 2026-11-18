<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.DateFormat"  import="java.text.SimpleDateFormat" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
</head>
<body>

<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Search Blood Donor</h2>
		<form action="SearchBloodDoner.jsp" method="get">
			<fieldset>
				<legend>Find a Doner</legend>
				
				<center>
				
					<table border="0">
						<tr>
							<th><label>City</label></th>
							<td>
							<select name="city">
							<%
							   dbcon db=dbcon.getConnection();
							String sql="select donor_city from bloodbankdonor";
							ResultSet rs=db.select(sql);
						out.print(rs);
							while(rs.next())
							{%>
							<option value=<%=rs.getString("donor_city") %>><%=rs.getString("donor_city") %></option>
							<% 
							}
							%>
							</select>
						
							<th>Blood Group</th>
						<td><select name="bloodgroup">	
						<option>o_positive</option>
										<option>O_negative</option>
										<option>A_positive</option>
										<option>A_negative</option>
										<option>B_positive</option>
										<option>B_negative</option>
										<option>AB_positive</option>
										<option>AB_negative</option>
								</select></td>
								</tr>
					</table>
				</center>
			</fieldset>
		<center>	<input type="submit" value="search" align="center"></center>
			</form>
			<br><br>
<h2>Search Result</h2>

	<%
	
	
	
	String bg=request.getParameter("bloodgroup");
	System.out.println(bg);
	String city=request.getParameter("city");
	System.out.println(city);
	dbcon db1=dbcon.getConnection();
	String sql1="select donor_name,donor_dob,donor_gender,donor_age,donor_bloodgroup,donor_mob,donor_address,donor_city,donor_email,donor_lastddate from bloodbankdonor where donor_bloodgroup='"+bg+"' and donor_city='"+city+"'";
	ResultSet rs1=db.select(sql1);
	ArrayList ls1=new ArrayList();
	ArrayList ls2=new ArrayList();
if(bg !=null && bg!="" && city !=null && city!=""){
	try{
	while(rs1.next())
	{Map m=new HashMap();
	   // m.put("id",rs.getInt("donorid"));
	    m.put("name", rs1.getString("donor_name"));
	    m.put("dob", rs1.getString("donor_dob"));
	    m.put("gender",rs1.getString("donor_gender"));
	    m.put("age", rs1.getString("donor_age"));
	    m.put("bloodgroup", rs1.getString("donor_bloodgroup"));
	    m.put("mobile", rs1.getString("donor_mob"));
	    m.put("address",rs1.getString("donor_address"));
	    m.put("city", rs1.getString("donor_city"));
	    //m.put("state", rs.getString("donor_state"));
	    m.put("email", rs1.getString("donor_email"));
	    m.put("lastdate",rs1.getString("donor_lastddate"));
	   // m.put("age", rs.getString("doner_age"));
	 
	    ls1.add(m);
	    System.out.println(ls1);

	    

	}
	
	
	}catch (Exception e) {
		// TODO: handle exception
	}
	
}
	
	
	
	
	
	
	
	if (ls1.size()>0)

	{
		List ls = ls1;
		System.out.print(ls);
		int r=ls.size();%>
		<center>
	<h4><label value=><%=r %> record found</label></h4>	
	<table border="0" class="table">
	<tr>
	<th align="left">Name</th>
	<th align="left">Date of Birth</th>
	<th align="left">Gender</th>
	<th align="left">BloodGroup</th>
	<th align="left">Age</th>
	<th align="left">Contact no</th>
	<th align="left">Address</th>
	<th align="left">City</th>
	<th align="left">E-Mail</th>
	<th align="left">Last Doneted Date</th>
	</tr>
		<% 

Map map;
		for (int i = 0; i < ls.size(); i++) {
				 map = (Map) ls.get(i);
				 
	%>

	<tr>
		<td align="left"><%=map.get("name")%></td>
		<td align="left"><%=map.get("dob")%></td>
		<td align="left"><%=map.get("gender")%></td>
		<td align="left"><%=map.get("bloodgroup")%></td>
		<td align="left"><%=map.get("age")%></td>
		<td align="left"><%=map.get("mobile")%></td>
		<td align="left"><%=map.get("address")%></td>
		<td align="left"><%=map.get("city")%></td>
		<td align="left"><%=map.get("email")%></td>
		<td align="left"><%=map.get("lastdate")%></td>
	</tr>


	<% 
		}
	%>
	</table>
</center>
<%
	}%> 
		</fieldset>
</div>
</div>
</div>	
</body>
</html>