<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.dbcon"%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
<script src="js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
</head>
<body>
<div class="container_12">
        <div class="grid_12 header-repeat">
            <div id="branding">
                <div class="floatleft">
                    <img src="img/logo.png" alt="Logo" /></div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft">
                            <li>
                            <%String sql="select emp_id,emp_name from login_control where emp_name=?"; 
				Connection con=MyCon.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, request.getSession().getAttribute("recusername").toString());
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
				%>
                            Hello <%=rs.getString(2)%>&nbsp;(ID - <%=rs.getString(1)%>)(Reception Account)
                            <%} %>
                            </li>
                            <li><a href="Logout" target="_top">Logout</a></li>
                        </ul>
                        <br />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="grid_12">
            <ul class="nav main">
                <li class="ic-home"><a href="ReceptionHome.jsp" target="_top"><span>Home</span></a> </li>
                <li class="ic-dashboard"><a href="Employee/RecEmpManager.jsp" target="mainbody"><span>Employee Mgmt</span></a> </li>
                <li class="ic-form-style"><a href="patientmanager/RecPatientManager.jsp"  target="mainbody"><span>Patient Mgmt</span></a></li>
                <li class="ic-charts"><a href="BloodBank/BloodBankManager.jsp" target="mainbody"><span>Blood Bank</span></a></li>
                <li class="ic-charts"><a href="NewAttendance/RecAttendanceManager.jsp" target="mainbody"><span>Attendance</span></a></li>
                <li class="ic-notifications"><a href="OtherMgmt/RecManager.jsp" target="mainbody"><span>Other Managements</span></a></li>
                 <li class="ic-notifications"><a href="ambulance/RecManager.jsp" target="mainbody"><span>Ambulance</span></a></li>

            </ul>
        </div>
         </div>
        <div class="clear">
        </div>
        
        </body>
</html>
        