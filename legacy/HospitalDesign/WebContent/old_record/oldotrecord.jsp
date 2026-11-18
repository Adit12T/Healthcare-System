<%@page import="oldrecord.Patient_old_Ot"%>
<%@page import="oldrecord.Patient_old_Discharge"%>
<%@page import="oldrecord.Patient_old"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.patientmanager.*"%>
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

<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" /><script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<link href="../tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="../tablecloth/tablecloth.js"></script>
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
	var url="oldotsearchrecord.jsp";
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
		 <table >
		 <tr><td>Patient Name</td><td><input type="text" name="name" id="name" maxlength="10" onkeyup="showData(this.value);" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)"> </td></tr>
		 </table>
  <div id="mydiv" style="margin-top:0px ">    
  <%Patient_old_Ot po=new Patient_old_Ot();;
  String s=request.getParameter("name");
  List record=po.getOldPatient(s);
  if(record.size()>0){%>      
<table width="911" height="53" border="1" cellpadding="0" cellspacing="0" class="table">
  <tr>
  <th width="55">S.No.</th>
    <th width="89">Reg Date </th>
    <th width="91">Patient reg.No </th>
    <th width="159">Patient Name </th>
    <th width="75">Age </th>
    <th width="77"> Mob. </th>
    <th width="65"> Tel. </th>
    <th width="141"> Address</th>
    <th width="139"> City </th>
     <th width="139"> Operation Date </th>
    <th width="139"> Operation Name</th>
    <th width="139"> Total Amount </th>
  </tr>
     <pg:paging indexSize="10" pageSize="2">
  <%
 // System.out.print(record);
  Map map;
  for(int i=0;i<record.size();i++){
	  map=(Map)record.get(i);
	//  map.get("admitid") ;
	  
	
  %>
   <pg:item>
  <tr>
    <td><%= i+1 %></td>
    <td> <%=map.get("patient_dateofregistraton") %></td>
    <td> <%=map.get("patient_registrationno") %></td>
    <td> <%=map.get("patient_name") %></td>
    <td> <%=map.get("patient_age") %></td>
    <td> <%=map.get("patient_mobile") %></td>
    <td> <%=map.get("patient_telephone") %></td>
    <td> <%=map.get("patient_address") %></td>
    <td> <%=map.get("patient_city") %></td>
    
    <td> <%=map.get("operation_date") %></td>
    <td> <%=map.get("operation_name") %></td>
    <td> <%=map.get("paid_operation_cost") %></td>
    
    <%-- <td> <a href="discharge1.jsp?id=<%=map.get("patient_city") %>">Click</a></td> --%>
  </tr>
   </pg:item>
  <% }%>
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
        </div>
   </div>
</body>
</html>
