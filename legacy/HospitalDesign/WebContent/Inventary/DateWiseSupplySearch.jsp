

<%@page import="Inventory.InventoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Inventory.StockDetailBean"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="pg" uri="/WEB-INF/taglib139.tld"%>
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
<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="tablecloth/tablecloth.js"></script>
<script src="../jquery-1.8.0.js" type="text/javascript"></script>
<link rel="stylesheet" href="../themes/base/jquery.ui.all.css">
	<script src="../ui/jquery.ui.core.js"></script>
	<script src="../ui/jquery.ui.widget.js"></script>
	<script src="../ui/jquery.ui.datepicker.js"></script>
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>





<script language="javascript" type="text/javascript">
var currentDate='2013:01:24';
var year='2013'; 
function display_emp(str5)
 {
   if(str5 == 'No')
	{ 
	 document.getElementById('experience_code').style.display='block';
	document.getElementById('edu_details').style.display='block';
	 document.getElementById('emp_details').style.display='none';
	 
	 
	}else if(str5 == 'Yes'){
	 document.getElementById('experience_code').style.display='none';
	 document.getElementById('edu_details').style.display='block';
	 document.getElementById('emp_details').style.display='block';
	}
   
 }
 
 function checkUserName(usercheck)
{
	var emailchk=/^.+@.+\..{2,3}$/;
	if(usercheck==''){		
			alert("Please Enter Your Email Id");
			document.getElementById('email').focus();
			return false;
	}
	if(usercheck!=''){
	if(!emailchk.test(usercheck)){		
			alert("This Email Address ID is not valid");
			return false;
	}

	$('#usercheck').html('<img src="images/ajax-loader.gif" />');
	$.post("checkuser.php", {email_id: usercheck} , function(data)
		{			
			   if (data != '' || data != undefined || data != null) 
			   {				   
				  $('#usercheck').html(data);	
			   }
          });
		  
   }
}
 
function check_relationship()
 {
   
  if(document.getElementById('marital_status').value=='Unmarried')
    {
	   document.getElementById('relationship2').style.display='block';
	   document.getElementById('relationship1').style.display='none';
	   document.getElementById('relationship').value='';
	  
	    
	 }else if(document.getElementById('marital_status').value!='Unmarried'){
	 
	  document.getElementById('relationship2').style.display='none';
	   document.getElementById('relationship1').style.display='block';
	    
	 
	 }
 
 }
 
 
 
 function handicap_hide()
 {
   if(document.getElementById('handicap').value=='No')
    {
	   document.getElementById('handicap_desc').style.display='none';
	   
	   document.getElementById('disable_percentage').value='';
	   document.getElementById('type_disable').value='';
	   document.getElementById('pwd_cert_no').value='';
	   document.getElementById('seldobday_pwd').value='';
	   document.getElementById('seldobmon_pwd').value='';
	   document.getElementById('seldobyear_pwd').value='';
	   document.getElementById('issue_by').value='';
	     

	 }
	 
	 if(document.getElementById('handicap').value=='Yes')
    {
	   document.getElementById('handicap_desc').style.display='block';
	    
	 }
 
 }
 
 
 
 
 function exservice_hide()
 {
   if(document.getElementById('exservice').value=='No')
    {
	   document.getElementById('exservice_desc').style.display='none';
	   document.getElementById('exservice_force').value='';
	   document.getElementById('selfrommon_ex').value='';
	   document.getElementById('selfromyr_ex').value='';
	   document.getElementById('seltomon_ex').value='';
	   document.getElementById('seltoyr_ex').value='';
	   document.getElementById('txtexser').value='';
	   
	 }
	 
	 if(document.getElementById('exservice').value=='Yes')
    {
	   document.getElementById('exservice_desc').style.display='block';
	    
	 }
 
 }
 
 function gender_change()
 {
 //alert(get_radio_value(document.reg_frm.optsex));
  pre_value=document.getElementById('name_pre').value;
  if(pre_value=='Mr'){
  //document.reg_frm.optsex[0].checked='true'; 
  document.getElementById('txtgender').innerHTML ='Male';
  document.getElementById('optsex').value='Male';    
  }else if(pre_value=='Ms' || pre_value=='Mrs'){
  //document.reg_frm.optsex[1].checked='true';   
  document.getElementById('optsex').value='Female'; 
  document.getElementById('txtgender').innerHTML ='Female';    
  }
 //alert(document.getElementById('name_pre').value);
 }
 
 function convertToUpper(ID){
	document.getElementById(ID).value=document.getElementById(ID).value.toUpperCase()
}

function hide_scst()
{
 cate_value=document.getElementById('txtccategory').value;
 if(cate_value==1){
   document.getElementById('sub_scst').style.display='none';
   //document.getElementById('sub_scst').style.visibility="hidden";
   }else if(cate_value!=1){
    document.getElementById('sub_scst').style.display='block';
	//document.getElementById('sub_scst').style.visibility="visible";
  }  
}

function otherreligion1(){
regli_value=document.getElementById('txtregl').value;
 if(regli_value=='7'){
 
   document.getElementById('otherreligion').style.display='block';
 
 }else{
 document.getElementById('otherreligion').style.display='none';
 }
}

function otherdegree(){
regli_value=document.getElementById('name_degree').value;
 if(regli_value=='Others'){
 
   document.getElementById('otherdegree').style.display='block';
 
 }else{
 document.getElementById('otherdegree').style.display='none';
 }
}



/*function dobcheck()
{
 

 if( (document.getElementById('seldobyear').value!='') && (document.getElementById('seldobmon').value!='') && (document.getElementById('seldobday').value!='') )
	{ 
	  		
		var BirthDate=document.getElementById('seldobday').value+'/'+document.getElementById('seldobmon').value+'/'+document.getElementById('seldobyear').value;
		if (isDate(BirthDate)==false){
			alert("Invalid Date Of Birth.");
			document.getElementById('seldobday').focus();
			return false;
		}else{
			
			var asOnDate = new Date(2013,06,30);			
			var varBDate = new Date(document.getElementById('seldobyear').value,document.getElementById('seldobmon').value,document.getElementById('seldobday').value);
			var dife = datediff(asOnDate, varBDate);
			//alert(dife[0]+"years "+dife[1]+"months "+dife[2]+"days");
			 if(document.getElementById('emp_iocl').value=='No' && document.getElementById('post_apply').value=='officers'){	
			//GEN Age checking code 
				if(document.getElementById('txtccategory').value==1){
		
				 if(document.getElementById('exservice').value=='Yes' || document.getElementById('handicap').value=='Yes')		 
				  {
					if(dife[0] >=36 || dife[0]<16)
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 26 ');
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  }
				  }else{
					  if(dife[0] >=26 || dife[0]<16)
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 26 ');
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  }
					  
				  }
				  
					 
				}
			
			
			   //SC/ST  Age checking code 
				if(document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 || document.getElementById('domi_jk').value=='Yes'){
					 
					 
				if(document.getElementById('exservice').value=='Yes' || document.getElementById('handicap').value=='Yes')		 
				  {
					if(dife[0] >=36 || dife[0]<16 )
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 31 '); 
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  }
				  }else{
					 if(dife[0] >=31 || dife[0]<16 )
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 31 '); 
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  } 
				  }
				}
			
			   //OBCAge checking code 
				if(document.getElementById('txtccategory').value==4){				
				
				if(document.getElementById('exservice').value=='Yes' || document.getElementById('handicap').value=='Yes')		 
				  {
					if(dife[0] >=36 || dife[0] < 16)
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 29 ');
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  }
				  }else{
					 if(dife[0] >=29 || dife[0] < 16)
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 29 ');
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  } 
					  
				  }
				}
				
				
		
		  }else if(document.getElementById('emp_iocl').value=='No' && document.getElementById('post_apply').value=='asst'){		    
			
		             if(dife[0] > 30)
					  {
						  //alert('your not eligible for this Posting , Age should be below or equal to 26 ');
						  alert('You are not eligible to apply due to age criteria');
						  document.getElementById('seldobyear').focus();
						  return false;
					  }
		     
		  }
		  
		  
		  
	
	  }
	
 }
}*/


function complete_course_hide()
{
 if(document.getElementById('complete_course').value=='Yes')
  { 
   document.getElementById('course_Not_completed').style.display='none';
	document.getElementById('course_completed').style.display='block';
  
   }else if(document.getElementById('complete_course').value=='No'){
    
	document.getElementById('course_Not_completed').style.display='block';
	document.getElementById('course_completed').style.display='none';
   }

}


function result_mark_check()
{
  
	 if(document.getElementById('result_mark').value > 100)
	   {	 
		alert("Invaild % of Marks");
		 document.getElementById('result_mark').value='';
		document.getElementById('result_mark').focus();
		return false;	
	   }
	   
	   var x=trim(document.getElementById('result_mark').value);
		 var anum=/(^\d+$)|(^\d+\.\d+$)/;
		//   var anum=/(^\d+$)/;
		  if (anum.test(x)){    
			return true;
		  }else{
			   alert("Invaild % of Marks,Please Enter Numeric value only");
			  document.getElementById('result_mark').value='';
			  document.getElementById('result_mark').focus();
			  return false;             
		  }
	 
}
 
</script>




<script>
$(function() {
	$("#datepicker").datepicker({
		showOn : "button",
		buttonImage : "../images/calendar.gif",
		buttonImageOnly : true

	});
});
	</script>

<script>
	$(function() {
		$( "#datepicker1" ).datepicker({
			showOn: "button",
			buttonImage: "../images/calendar.gif",
			buttonImageOnly: true
		});
	});

	</script>

<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
</head>
<body>

	<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
			<h2>DateWise Search</h2>
		<form action="DateWiseSupplySearch.jsp">
			<fieldset>
				<legend>Drug Report</legend>
				<center>
					<table>
						<tr>
							<th><label>From Date</label>
							<td><input type="text" name="fdate" placeholder="yyyy/mm/dd" id="datepicker" 
></td>
							<th><label>To Date</label>
							<td><input type="text" name="ldate" placeholder="yyyy/mm/dd" id="datepicker1"
></td>
							<td><input type="submit" value="search">
						</tr>
					</table>
				</center>

			</fieldset>
		</form>


		<%
			String fdate = request.getParameter("fdate");
			String ldate = request.getParameter("ldate");
			System.out.println(fdate + " " + ldate);
			if (fdate != null && ldate != null) {
				InventoryBean dwb = new InventoryBean();
				
				List record = dwb.getSupply(fdate, ldate);
				if(record.size()>0){
				//System.out.print(record.size());
				
		%>
		<center>

<fieldset>
				<table cellpadding="0" cellspacing="0" border="1" align="center" width="90%" class="table">
					<tr>
					<th>Supplier Name</th>
						<th>Item Type</th>
                        <th>Item Name</th>
                        <th>company Name</th>
                       
                        <th> supplied Quantity</th>
						
						<th>paid Amount </th>
						

					<!-- 	<th>Action </th> -->



					</tr>
<pg:paging indexSize="10" pageSize="2">
					<%Map map;
					for (int j = 0; j < record.size(); j++) {
						map = (Map) record.get(j);
						
		%>
		<pg:item>

					<tr>
					    <td><%=map.get("sname")%></td>
						<td><%=map.get("type")%></td>
						<td><%=map.get("name")%></td>
						<td><%=map.get("company")%></td>
						
						
						
						
						<td><%=map.get("quantity")%></td>
						
						<td><%=map.get("pa")%></td>
						

					<%-- 	<td><a href="../DeleteItemServlet?&s1=<%=map.get("exdate")%>&s2=<%=map.get("quantity")%>&s3=<%=map.get("type")%>&s4=<%=map.get("name")%>&s5=<%=map.get("company")%>
						&s6=<%=map.get("sname")%>&s7=<%=map.get("date")%>&s8=<%=map.get("rq")%>&s9=<%=map.get("id")%>&s10=<%=map.get("pq")%>&s11=<%=map.get("ta")%>&s12=<%=map.get("pa")%>&s13=<%=map.get("pena")%>&s14=date">Delete</a></td>
 --%>



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
		
					<%}else{
					%>
					<div align="center" ><font color="red" ><h3>No Record found......</h3></font></div>
					<%	
						
					}
			}
		%>

</table>
</fieldset>
</center>

</div>
</div>
</div>
</body>
</html>