<%@page import="database.dbcon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%
%>

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


	<div id="form_container">
		<h1>
			<a></a>
		</h1>
		<div class="form_description">
			<h2>Blood Bank</h2>
			<p></p>
		</div>
		<div>
			<table width="900" height="561" border="0">
				<tr>
					<td width="250" height="423"><div id="webwidget_vertical_menu"
							class="webwidget_vertical_menu"
							style="max-height: 100px; margin-bottom: 400px">
							<ul>
								<li><a href="BloodDoner.jsp">Doner Registration</a>
								<li><a href="BloodAcceptor.jsp">Acceptor Registration</a>
								<li><a href="SearchBloodDoner.jsp">Search Doner</a>
								<li><a>admin/manager</a>


									<ul>
										<li><a href="BloodBankSearch.jsp">Check Bank Stock</a>
										<li><a href="Updatebbank.jsp">Update Stock</a></li>
									</ul>
									<li><a >Blood Tip</a>
							
							</li>
</ul>
							<div style="clear: both"></div>
						</div></td>
					<td width="576"></td>
					<td width="232">
						<h2 align="center">Doner Login</h2>
						<div style="margin-bottom: 300px">
							<form action="updateDonerInfo.jsp" onsubmit="test();">
								<table width="228" height="160" border="0">
									<tr>
										<td height="64">User Name</td>
										<td><input type="text" name="uname" id="uname"></td>
									</tr>
									<tr>
										<td height="59">Password</td>
										<td><input type="text" name="pwd" id="pwd"></td>
									</tr>
									<tr>
										<td></td>
										<td height="55"><input type="submit" value="login"
											onmouseover="test()"></br> <a href="UpdatePwd.jsp">forgot
												Password?</a></td>
									</tr>
								</table>
							</form>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>