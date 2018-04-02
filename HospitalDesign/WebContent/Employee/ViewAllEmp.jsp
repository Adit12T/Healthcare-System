<%@page import="database.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Employee</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />
<link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>


<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
 <script src="../js/table/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
 <script type="text/javascript" src="../js/table/table.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th{
text-align: left;
}
</style>
<script type="text/javascript">
 function showData(value){ 

	xmlHttp=GetXmlHttpObject();
	/* if (value=="")
	{
	document.getElementById("mydiv").innerHTML="";
	return;
	} */
	var url="SearchEmployeeContent.jsp";
	url=url+"?name="+value;
	xmlHttp.onreadystatechange=stateChanged ;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
	
}
	function stateChanged() { 
		
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
	    var showdata = xmlHttp.responseText; 
	    document.getElementById("mydiv").innerHTML= showdata;
	    
		}
		
	}
	function GetXmlHttpObject(){
	var xmlHttp=null;
	try {
	  xmlHttp=new XMLHttpRequest();
	 }
	catch (e) {
	 try  {
	  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  }
	 catch (e)  {
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	 }
	return xmlHttp;
	}
  </script>

</head>
<body>
<div class="container_12">
		<div class="grid_10"  style="width: 97%;">
		<div class="box round first grid" style="height: 100%;">
		 <%
		 PreparedStatement ps=null;
ResultSet rs=null;
dbcon db=dbcon.getConnection();
String sql=null;
if(request.getParameter("name")!=null)
{

%>
<% 

	String name = request.getParameter("name").toString();
sql="select * from employee where emp_name like '"+name+"%' OR emp_id like '"+name+"%' OR emp_department like '"+name+"%'";	

}
else{
	
	sql="select * from employee order by emp_id desc ";
	 
	%>
	
	
		 <table align="center" width="500">
		 <tr><th>Employee Name : </th><td><input type="text" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)" maxlength="10" name="name" id="name" onkeyup="showData(this.value);"> </td>
		 <td width="100"></td>
		 <td><%String smg=request.getParameter("msg");
		 
		 if(smg!=null) out.print("<font color='green' ><h3>"+smg+"</h3</font>");%></td>
		 </tr>
		 
		 </table>
<%} 
rs=db.select(sql);
if(rs.next()){
	rs.beforeFirst();
	%>
<div id="mydiv" style="margin-top:0px ">
                    <table class="table">
                    <thead>
                    <tr>
                    <th>Employee Id</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Date of Joining</th>
                    <th>Designation</th>
                    <th>Department</th>
                    <th>Contact No</th>
                    </tr>
                    </thead>
                    <pg:paging indexSize="10" pageSize="2">
                    
		<%
		while(rs.next()){
		%>
			<pg:item>
		
		<tbody>
		   <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(14)%></td>
                    <td><%=rs.getString(18)%></td>
                    <td><%=rs.getString(6)%></td>
                    </tr>
		</tbody>
		</pg:item>
		<%} %>
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
		</div>
		<%}else{
			%><div align="center" ><font color="red" ><h3>No Record found......</h3></font></div><%
			
		} %>
		</div>
		</div>
		</div>
	
</body>
</html>