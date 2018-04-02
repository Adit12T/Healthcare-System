<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

</head>
<%if(request.getSession().getAttribute("username")!=null){ %>
<frameset rows="25%,*,5%" border="0" framespacing="0">
<frame src="PathHeader.jsp" name="mainmenu">
<frameset cols="*" border="0">
<frame src="AdminContent.jsp" name="mainbody">
</frameset>
<frame src="Footer.jsp">
</frameset>
<%}
else{
	response.sendRedirect("index.jsp");
}
%>
<body bgcolor="green">

</body>
</html>