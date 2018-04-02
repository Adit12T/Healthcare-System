<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="database.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IssueItem1</title>


<script src="../jquery-1.8.0.js"></script>


<link rel="stylesheet" type="text/css" href="css/view.css"
	media="all">
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
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="../jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
	$("#imageField").click(function(){
	$("#send").validate();
	
	});
	});

</script>
<script type="text/javascript">
 function showData(value){ 

	xmlHttp=GetXmlHttpObject();
	/* if (value=="")
	{
	document.getElementById("mydiv").innerHTML="";
	return;
	} */
	var url="IssueItem1.jsp";
	url=url+"?iname="+value;
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
  <script>

	function al(msg) {
		alert(msg);

	}
	function a2() {
		alert("sorry requested amount is not available!");

	}
	
</script>

</head>
<body <%String msg = request.getParameter("msg");

			if (msg != null) {%>
	onload="al('<%=msg%>');" <%}%>>
<%ResultSet rs=null; %>

<form action="../IssueItemServlet" id="send" name="issueitem">		
<center>

		 <%
		 PreparedStatement ps=null;

dbcon db=dbcon.getConnection();
String sql=null;
if(request.getParameter("iname")!=null)
{

%>

<% 

	String iname = request.getParameter("iname").toString();
sql="select * from stock where item_name like '"+iname+"%' ";	

}
else{
	
	sql="select * from stock";
	 
	%>
	
	<%
				Date date = Calendar.getInstance().getTime();
				DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
				String todaydate = formatter.format(date);
			%>
			<div align="right">
				<label>date</label><input type="text" name="date"
					value=<%=todaydate%>>
			</div>
		 <table align="center">
		 <tr><th>Search item</th><td><input type="text" name="iname" id="iname" onkeyup="showData(this.value); " > </td>
		 <th>Person Name</th><td><input type="text" name="pname" id="pname" > </td>
		 <th>Total Amount</th><td><input type="text" name="tamount" id="tamount"  > </td>
		</tr>
		 </table>
		
		
<%} 
rs=db.select(sql);
String name="",company="",type="";int tq=0, id=0;
%>
<div id="mydiv" style="margin-top:40px ">
                    <table class="table" border="1" cellspacing="0" align="center">
                    <thead>
                    <tr>
                    <th>Item Id</th>
                    <th>Item Type</th>
                    <th>Item Name</th>
                    <th>Mfg Company</th>
                    <th>Total Quantity</th>
                    <th>Issued Quantity</th>
                    
                   
                    </tr>
                    </thead>
		<%
		while(rs.next()){
			id=rs.getInt(1);
			type=rs.getString(2);
			name=rs.getString(3);
			company=rs.getString(4);
			tq=rs.getInt(5);
		%>
		
		<tbody>
		   <tr>
                    <td><%=id%></td>
                    <td><input type="hidden" value="<%=type%>" name=type> <%=type%></td>
                    <td><input type="hidden" value="<%=name%>" name=name><%=name%></td>
                    <td><input type="hidden" value="<%=company%>" name=mcompany><%=company%></td>
                    <td><input type="hidden" value="<%=tq%>" name=tq><%=tq%></td>
                    <td><input type="text" name="iq" >
</td>
                    
                    </tr>
		</tbody>
		
		<%
        }
		//request.setAttribute("type",type);
		
        %>

		
		
		 </table>
		  <input type="submit" id="imageField">
		</div>
		 
		
	</center>
	</form>	
</body>
</html>