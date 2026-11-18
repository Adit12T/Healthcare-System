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
                            <%String sql="select emp_id,emp_name from employee where emp_id="+request.getSession().getAttribute("username")+""; 
				dbcon db=dbcon.getConnection();
				ResultSet rs=db.select(sql);
				while(rs.next()){
				%>
                            Hello <%=rs.getString(2)%>&nbsp;(ID - <%=rs.getString(1)%>)(Billing Account)
                            <%} %>
                            </li>
                            <li><a href="#">Logout</a></li>
                        </ul>
                        <br />
                        <span class="small grey">Last Login: 3 hours ago</span>
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
                <li class="ic-home"><a href="AdminHome.jsp" target="_top"><span>Home</span></a> </li>
                <li class="ic-dashboard"><a href="Employee/EmployeeManager.jsp" target="mainbody"><span>Employee</span></a> </li>
                <li class="ic-form-style"><a href="patientmanager/PatientManager.jsp"  target="mainbody"><span>Patient</span></a></li>
				<li class="ic-typography"><a href="Inventary/inventarymanager.jsp" target="mainbody"><span>Stock</span></a></li>
                <li class="ic-charts"><a href="BloodBank/BloodBankManager.jsp" target="mainbody"><span>Blood Bank</span></a></li>
                 <li class="ic-grid-tables"><a href="roommanager/RoomManager.jsp" target="mainbody"><span>Room</span></a></li>
                <li class="ic-notifications"><a href="OtherMgmt/ModuleManger.jsp" target="mainbody"><span>Other</span></a></li>

            </ul>
        </div>
         </div>
        <div class="clear">
        </div>
        </body>
</html>
        