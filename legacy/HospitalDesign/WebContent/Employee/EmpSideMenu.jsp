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
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript"
	src="../js/jquery-ui/jquery.ui.core.min.js"></script>
<script src="../js/jquery-ui/jquery.ui.widget.min.js"
	type="text/javascript"></script>
<script src="../js/jquery-ui/jquery.ui.accordion.min.js"
	type="text/javascript"></script>
<script src="../js/jquery-ui/jquery.effects.core.min.js"
	type="text/javascript"></script>
<script src="../js/jquery-ui/jquery.effects.slide.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
#sub1,#sub2 {
	display: none;
}
</style>
<script type="text/javascript">
	function view() {
		document.getElementById("sub1").style.display = 'block';
		document.getElementById("sub2").style.display = 'none';
	}
	function view1() {
		document.getElementById("sub2").style.display = 'block';
		document.getElementById("sub1").style.display = 'none';
	}
</script>
</head>
<body>

	<div class="grid_2" style="width: 100%">
		<div class="box sidemenu">
			<div class="block" id="section-menu">
				<ul class="section menu">
					<li><a class="menuitem" href="#" target="subbody">
							Employee</a>
						<ul class="submenu">
							<li><a href="EmployeeRegistration.jsp" target="subbody">Add
									New Employee</a></li>
							<li><a href="SearchEmp.jsp" target="subbody">Search
									Employee</a></li>
										<li><a href="ViewAllEmp.jsp" target="subbody">Search Doctor</a></li>

						</ul></li>

					<li><a class="menuitem">Doctor Schedule</a>
						<ul class="submenu">
							<li><a href="../sechdule/addsechdule.jsp" target="subbody">Add
									Schedule</a></li>
							<li><a href="../sechdule/sechduledisplay.jsp"
								target="subbody">View Schedule</a></li>
							<li><a href="../sechdule/showfordelete.jsp" target="subbody">Delete
									Schedule</a></li>

						</ul></li>



				<!-- 	<li><a class="menuitem" onClick="view()">View Attendance</a>
						<ul class="submenu">
							<li><a href="../attendance/SearchById.jsp" target="subbody">By
									Id</a></li>
							<li><a href="../attendance/SearchByDate.jsp"
								target="subbody">By Date</a></li>

						</ul></li>
					<li><a class="menuitem" onClick="view1()">View Salary</a>
						<ul class="submenu" id="sub2">
							<li><a href="../attendance/SearchSalaryId.jsp"
								target="subbody">By Id</a></li>
							<li><a href="../attendance/SearchSalaryDate.jsp"
								target="subbody">By Date</a></li>

						</ul></li> -->

				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>


