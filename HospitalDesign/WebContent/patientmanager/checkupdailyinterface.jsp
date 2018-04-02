<%@page import="java.util.Date"%>
<%@page import="database.DateConvert"%>
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
	media="screen" />
	<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>
	
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
	var url="searchcontent.jsp";
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
		 <table align="center">
		 <tr><th>Patient Name : </th><td><input type="text" name="name" id="name" onkeyup="showData(this.value);" onkeypress="return alphadothyphen(event)" onblur="convertToUpper(this.id)" maxlength="10"> </td></tr>
		 </table>
  <div id="mydiv" style="margin-top:0px ">
  <%PatientDischargeDao pd=new PatientDischargeDao();
  String s=request.getParameter("name");
  List record=pd.show(s);
  if(record.size()>0){%>
  
            
<table width="911" height="53" border="1" cellpadding="0" cellspacing="0" class="table">
  <tr>
  <th width="55">S.No.</th>
    <th width="89">Admit Date </th>
    <th width="91">Patint reg.No </th>
    <th width="159">Patient Name </th>
    <th width="77">Room No </th>
    <th width="65">Bed No </th>
    <th width="141">Dr Name </th>
    <th width="139">Disease Name </th>
    <th width="75">Daily detail </th>
  </tr>
     <pg:paging indexSize="10" pageSize="2">
  <%
  //System.out.print(record);
  Map map;
  for(int i=0;i<record.size();i++){
	  map=(Map)record.get(i);
	  String adate=DateConvert.convertDateToString((Date)map.get("admitdate") );
  %>
  	<pg:item>
  <tr>
    <td><%= i+1 %></td>
    <td> <%=map.get("admitdate") %></td>
    <td> <%=map.get("patientro") %></td>
    <td> <%=map.get("patientname") %></td>
    <td> <%=map.get("roomno") %></td>
    <td> <%=map.get("bedname") %></td>
    <td> <%=map.get("empname") %></td>
    <td> <%=map.get("diseasename") %></td>
    <td> <a href="checkupdaily.jsp?pid=<%=map.get("patientro")%> &pname=<%=map.get("patientname")%>&pdatea=<%=adate%>"><img	alt="Check-up" title="Check-up" src="../mg/icon_edit.png" width="15" height="15"></a></td>
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
