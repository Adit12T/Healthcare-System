<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
                                         <li><a class="menuitem" href="addfloor.jsp" target="subbody">ADD floor</a></li>
                        <li><a class="menuitem" href="roomtype.jsp" target="subbody"> Add Room Type</a></li>
			 <li><a class="menuitem" href="roomnumber.jsp" target="subbody"> Add Room</a></li>
                        <li><a class="menuitem" href="showroom.jsp" target="subbody"> Show Room</a></li>
                       
                        <li><a class="menuitem" href="roombedinformation.jsp" target="subbody">Bed De- / Activation</a></li>
                        <li><a class="menuitem" href="availablebed.jsp" target="subbody">Available Bed</a></li>

                    </ul>
                </div>
            </div>
        </div>
         <div class="clear">
    </div>
</body>
</html>