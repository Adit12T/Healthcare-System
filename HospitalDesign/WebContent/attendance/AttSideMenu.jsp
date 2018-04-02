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

<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
#sub1,#sub2{
display: none;
}
</style>
<script type="text/javascript">
function view(){
	document.getElementById("sub1").style.display = 'block';
	document.getElementById("sub2").style.display = 'none';
}
function view1(){
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
					<li><a class="menuitem" href="TakeAttendance.jsp"
						target="subbody">Take Attendance</a></li>
					<li><a class="menuitem"  onclick="view()">View Attendance</a>
						<ul class="submenu"  id="sub1">
							<li><a href="SearchById.jsp" target="subbody">By Id</a></li>
							<li><a href="SearchByDate.jsp" target="subbody">By Date</a>
							</li>

						</ul></li>
					<li><a class="menuitem" href="Salary.jsp" target="subbody">Issue
							Salary</a></li>
					<li><a class="menuitem"  onclick="view1()">View Salary</a>
						<ul class="submenu"  id="sub2">
							<li><a href="SearchSalaryId.jsp" target="subbody">By Id</a></li>
							<li><a href="SearchSalaryDate.jsp" target="subbody">By
									Date</a></li>

						</ul></li>
					<li><a class="menuitem" href="Issue_Leave.jsp"
						target="subbody">Give Leave</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>


