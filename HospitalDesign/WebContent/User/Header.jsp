
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<header>
	<div id="logo">
		<div id="logo_text">
			<h1>
				<a href="index.html">Central<span class="logo_colour">Hospital</span></a>
			</h1>
			<h2>A hospital bed is a parked taxi with the meter running.</h2>
		</div>
	</div>
	<nav>
		<ul class="sf-menu" id="nav">
			<li class="selected"><a href="index.html">Home</a></li>
			<li><a href="examples.html">About Us</a></li>
			<li><a href="page.html">Departments</a>
				<ul>
					<%
						String sql = "select * from department";
						dbcon db = dbcon.getConnection();
						ResultSet rs = db.select(sql);
						while (rs.next()) {
					%>
					<li><a
						href="department_detail.jsp?dept_name=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></li>
					<%
						}
					%>
				</ul></li>
			<li><a href="another_page.html">Facilities</a>
				<ul>
					<li><a href="OPD.jsp">OPD</a></li>
					<li><a href="IPD.jsp">IPD</a></li>
					<li><a href="#">Emergency Services</a></li>
					<li><a href="#">ICU</a></li>
					 <li><a href="#">Pathology</a></li>
					  <li><a href="#">Operation Theater</a></li>
				</ul></li>
			<li><a href="../sechdule/sechduledisplay.jsp">Doctor's Schedule</a></li>

			<li><a href="#">Contact Us</a></li>
		</ul>
	</nav>
</header>