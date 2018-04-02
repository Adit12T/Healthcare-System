<%@page import="database.DateConvert"%>
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


<script src="../jquery-1.8.0.js"></script>


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
<script src="../js/setup.js" type="text/javascript"></script>
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="../jquery.validate.js"></script>
	<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script type="text/javascript">
$(function(){
	$("#imageField").click(function(){
	$("#send").validate();
	
	});
	});

</script>
</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
<%
String sql="select * from issuediteminfo order by issue_date DESC";
dbcon db=dbcon.getConnection();
ResultSet rs=db.select(sql);
if(rs.next()){
	rs.beforeFirst();

%>
<table class="table">
<tr><th width="100">Serial No.</th><th width="100">Bill no</th><th width="100">Person Name</th><th width="100">Date</th><th width="100">Amount</th></tr>
  <pg:paging indexSize="10" pageSize="2">
<%int i=1;
while(rs.next()){
	
	
	int bill=rs.getInt("billno");
	String pr=rs.getString("person_name");
	String issue_date=DateConvert.convertDateToString(rs.getDate("issue_date"));
	int amount=rs.getInt("total_amount");
	%>
	<pg:item>
	<tr>
	<td><%=i++ %></td>
	<td><%=bill %></td>
	<td><%=pr %></td>
	<td><%=issue_date %></td>
	<td><%=amount %></td>
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
</div>
</div>
</div>
</body>
</html>