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

</head>
<body>

	<div class="grid_2" style="width: 100%">
		<div class="box sidemenu">
			<div class="block" id="section-menu">
				<ul class="section menu">
					<li><a class="menuitem">Department</a>
						<ul class="submenu">
							<li><a href="AddDepartment.jsp" target="subbody">Add New
									Department</a></li>
							<li><a href="DeleteDepartment.jsp" target="subbody">Delete
									Department</a></li>
							<li><a href="UpdateDepartment.jsp" target="subbody">Update
									Department</a></li>

						</ul></li>
					<li><a class="menuitem" href="BloodDoner.jsp" target="subbody">Disease</a>
						<ul class="submenu">
							<li><a href="AddDisease.jsp" target="subbody">Add New
									Disease</a></li>
							<li><a href="UpdateDisease.jsp" target="subbody">Update
									Disease</a></li>
							<li><a href="DeleteDisease.jsp" target="subbody">Delete
									Disease</a></li>

						</ul></li>
					<li><a class="menuitem" href="SearchBloodDoner.jsp"
						target="subbody">Expenditure</a>
						<ul class="submenu">
							<li><a href="AddExpenditure.jsp" target="subbody">Add
									Expenditure</a></li>
							<li><a href="UpdateExpenditure.jsp" target="subbody">Update
									Expenditure</a></li>
							<li><a href="DeleteExpenditure.jsp" target="subbody">Delete
									Expenditure</a></li>
						</ul></li>
					<li><a class="menuitem" href="SearchBloodDoner.jsp"
						target="subbody">Login Control</a>
						<ul class="submenu">
							<li><a href="CreateLoginControl.jsp" target="subbody">Add
									New User</a></li>
							<li><a href="ViewAllUser.jsp" target="subbody">View All
									User</a></li>

							<!-- ViewAllUser.jsp -->
						</ul></li>
					<li><a class="menuitem" href="SearchBloodDoner.jsp"
						target="subbody">Old Record</a>
						<ul class="submenu">
							<li><a href="../old_record/olddischargerecord.jsp" target="subbody">Discharge</a></li>
							<li><a href="../old_record/oldotrecord.jsp" target="subbody">OT Record</a></li>
							<li><a href="../old_record/OldPatient.jsp" target="subbody">Old Patient Record</a></li>

							<!-- ViewAllUser.jsp -->
						</ul></li>



				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>


