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

     <div class="grid_2" style="width: 100%">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                      <li><a class="menuitem" href="BloodAcceptor.jsp" target="subbody">Blood Acceptor Registration</a></li>
                        <li><a class="menuitem" href="BloodDoner.jsp" target="subbody">Blood Donor Registration</a></li>
                        <li><a class="menuitem" href="SearchBloodDoner.jsp" target="subbody">Search Blood Donor</a> </li>
               <!--          <li><a class="menuitem">View Salary</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
         <div class="clear">
    </div>
        </body>
</html>
        

 