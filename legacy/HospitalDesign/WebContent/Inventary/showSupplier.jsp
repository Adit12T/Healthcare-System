<%@page import="database.StringConvert"%>
<%@page import="database.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../OtherMgmt/css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../OtherMgmt/css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../OtherMgmt/css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../OtherMgmt/css/layout.css"
	media="screen" />

	<link href="../OtherMgmt/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="../OtherMgmt/tablecloth/tablecloth.js"></script>
<link rel="stylesheet" type="text/css" href="../OtherMgmt/css/nav.css"
	media="screen" /></head>
<body>
       <%String sql = "select * from supplierinfo";

		
				dbcon db=dbcon.getConnection();
			ResultSet rs=db.select(sql);
			if(rs.next()){
				rs.beforeFirst();
			
			 %>        

	<table class="table">
	
	<tr>
	<th>supplier id</th>
	<th> name</th>
	<th>address</th>
	<th>city</th>
	<th>state</th>
	<th>country</th>

	<th>Contact No</th>
	<th>Email Id</th>
	</tr>
	  <pg:paging indexSize="10" pageSize="5">
	<%
		
			
			
			
			while(rs.next()){
				%>
				<pg:item>
				<tr>
				<td><%=rs.getInt("supplyer_id") %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_name")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_address")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_city")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_state")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_country")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_contactno")) %></td>
				<td><%=StringConvert.convert(rs.getString("supplyer_email")) %></td>
				</tr>
				</pg:item>
				
				<%
					
				
				
			}
			
			
			
			
			
		
	%>
	<div style="background-color:;">
						<pg:index title="Pages">
							<pg:page>
								<p
									style="background: ; padding: 5px;  margin: 1px; color: black;"><%=thisPage%></p>
							</pg:page>

						</pg:index>

					</div>

				</pg:paging>
	</table>
	<%}else{
		%>
		<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
		<%
	} %>
</body>
</html>