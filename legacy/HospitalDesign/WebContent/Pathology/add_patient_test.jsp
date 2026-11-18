<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.pathologypatient.DisplayTest"%>
<%@page import="database.DateConvert"%>
<%@page import="database1.DateConvertdata"%>
<%@page import="java.util.Date"%>
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
	<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>

	
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.validate.js"></script>

<script>
function convertToUpper(ID){
	document.getElementById(ID).value=document.getElementById(ID).value.toUpperCase()
}

$(function(){
	$("#add_p_tests").click(function(){
	$("#add_p_test").validate();
	
	});
	});

</script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>Add Patient Test</h2>
<form action="../addpatienttestservlet" id="add_p_test">
<table width="816" height="292" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="605" height="86"><table width="688" height="34" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50">Name : </td>
    <td width="144"><input type="text" name="name" id="name" class="required" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)"></td>
    <td width="70" align="right"> Address : </td>
    <td width="144"><input type="text" name="address" id="add" class="required" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"></td>
    <td width="120">Date :<%=DateConvert.convertDateToString(new Date())%> </td>
    
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td>
	
	<%
	DisplayTest d=new DisplayTest();
	List l=d.getTestDetial();
	if(l.size()>0){
		Map map;
		out.print("<table>");
		for(int i=0,k=0;i<l.size();i++)
		{
			out.print("<tr>");
			for(int j=0;l.size()>k & j<=5;j++,k++){
			map=(Map)l.get(k);	
				%>
				<td width="200">
				<input type="checkbox" name="test_id" value="<%=map.get("test_id")%>"><%= map.get("test_content")%>&nbsp;&nbsp;&nbsp;<font color ="red"><%=map.get("test_cost")%></font>
				
				</td>
				<%
			}
			out.print("</tr>");
		}%>
		<tr >
		<td colspan="6" align="center"><input type="submit" id="add_p_tests"> </td>
		</tr>
		<%
		out.print("</table>");
		
		
	}else{
		
		out.print("<font color='red' size='12'>Please Create Test</font>");
		
	}
	%>
	
	
	
	
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>