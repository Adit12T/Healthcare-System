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

     <div class="grid_2" style="width: 100%;">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                      <li><a class="menuitem" href="patientregistrationstep1.jsp" target="subbody">Patient Registration</a></li>
                    
                        <li><a class="menuitem" href="checkupdailyinterface.jsp" target="subbody">Daily Check-Up</a></li>
                            <li><a class="menuitem" href="admitrecord.jsp" target="subbody">Admit Record</a></li>
                            <li><a class="menuitem" href="patientadmit.jsp" target="subbody">Patient Discharge </a></li>
                              <li><a class="menuitem" href="../old_record/OldPatient.jsp" target="subbody">Search Old Patient</a></li>
                    </ul>
                </div>
            </div>
        </div>
         <div class="clear">
    </div>
        </body>
</html>
        

 