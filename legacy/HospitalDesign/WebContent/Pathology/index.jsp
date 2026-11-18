<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<pre>
<a href="PathologyTestReport\addpathologytestreport.jsp">add new testreport</a>
<a href="PathologyTestReport\deletepathologytestreport.jsp">delete testreport</a>
<a href="PathologyTestReport\updatepathologytestreport.jsp">update testreport</a>
<a href="PathologyTestDetail\addtestdetail.jsp">add new test</a>
<a href="PathologyTestDetail\deletetestdetail.jsp">delete test</a>
<a href="PathologyTestDetail\updatetestdetail.jsp">update test</a>
</pre>
<form action="PathologyManager\reportlist.jsp">
get final report by patient id <input type="text" name="pid">
<button type="submit">get report</button>
</form>

<form action="PathologyTestReport\addresult.jsp">
add result by patient id <input type="text" name="pid">
<button type="submit">add report result</button>
</form>

</body>
</html>