<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="database.DateConvert"%>
<%@page import="com.pathologypatient.patientresultsearchpendingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="../val/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript" src="../val/common.js"></script>
<script language="javascript" type="text/javascript" src="../val/iocl_reg.js"></script>
</head>
<body>
<div class="container_12">
		<div align="center" class="grid_10" style="width: 95%;">
			<div align="center" class="box round first grid" style="width: 95%;">
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
patientresultsearchpendingDao p=new patientresultsearchpendingDao();
List record=p.getgroupDetail(id, name);
%>
   <form action="../AddTestResultServlet">
<table width="479" height="450" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td height="121" align="left" valign="top"><table width="479" height="121" border="0" cellpadding="0" cellspacing="0">
   <tr>
    <td width="93" height="32">Test Name . </td>
	<td width="166"><%=p.testname %></td>
    <td width="220">Date: <%=DateConvert.convertDateToString(p.getTest_date()) %> </td>
  </tr>
  
  <tr>
    <td width="93" height="38">Name </td>
	<td colspan="1"><%=p.getPatient_name() %></td>
	<td>&nbsp;</td>
    </tr>
  <tr>
    <td height="51">Address</td>
    <td colspan="2" align="left" valign="middle"><%=p.getPatient_address() %></td> 
  </tr>
</table></td>
  </tr>
  <tr>
    <td height="230" align="center" valign="middle">
    <input type="hidden" name="pid" value="<%=id%>"> 
    <input type="hidden" name="tname" value="<%=p.testname%>">
        
  
    <%
    if(record.size()>0){
    	
    	
    out.print("<table><tr><td width='100'></td><td width='100'></td><td width='100'></td><td width='100'></td></tr>");
    Map map;
    for(int i=0;i<record.size();i++){
    map=(Map)record.get(i);
    String sss=((String)map.get("test_startrange"));
    if(sss.equalsIgnoreCase("na")){
    	
    }else{
    %>
   
    <tr>
   <%--  <td> <%=map.get("pathology_test_detail") %></td>
      <td><%=map.get("pathology_patient_id") %></td>
    	<td><%=map.get("test_id") %></td> 
    	<td><%=map.get("test_name") %></td>--%>
    	<td><%=map.get("test_content") %></td>
    	<td><%=map.get("test_startrange") %></td>
    	<td><%=map.get("test_endrange") %></td>
       	<td><input type="text" name="result" class="required"  maxlength="11" value="<%=map.get("test_result") %>" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)">
       		<input type="hidden" value="<%=map.get("pathology_test_detail")%>" name="pdi" readonly="readonly">
       	 </td>
    	
    </tr>	
    <%	}
    }
    out.print("</table>");
    }
    %>
    </td>
  </tr>
  <tr>
    <td>
    <div align="center" >
   <textarea name="remark" maxlength="200" class="required" onkeypress="return alphanumber(event)" onblur="convertToUpper(this.id)" rows="4" cols="50"></textarea> 
    </div>
    
    
    
    </td>
  </tr>
  
  <tr>
    <td>
    <div align="center" >
   <input type="submit"  > 
    </div>
    
    
    
    </td>
  </tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>