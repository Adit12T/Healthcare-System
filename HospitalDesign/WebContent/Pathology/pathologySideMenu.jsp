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
					<li><a class="menuitem" href="#" target="subbody"> Test</a>
						<ul class="submenu">
							<li><a href="addtestdetail.jsp"
								target="subbody">Add  New Test</a></li>
							<li><a href="showTest.jsp"
								target="subbody"> Show Test</a></li>
						</ul></li>

					<li><a class="menuitem">Patient Test</a>
						<ul class="submenu">
							<li><a href="add_patient_test.jsp" target="subbody">Add
									patient Test</a></li>
										<li><a href="patientresultsearch.jsp" target="subbody">Add
									patient Reuslt</a></li>
						
							<!-- <li><a href="../sechdule/sechduledisplay.jsp"
								target="subbody">View Schedule</a></li> -->

						</ul></li>

					<li><a class="menuitem">Patient Result</a>
						<ul class="submenu">
							<li><a href="viewReultsearch.jsp" target="subbody">Patient Reuslt</a></li>
							

						</ul>
					</li>


					

				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>


