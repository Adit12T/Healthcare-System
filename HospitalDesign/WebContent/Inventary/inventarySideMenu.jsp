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
    <script type="text/javascript" src="../js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="../js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
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
                   

                          <li><a class="menuitem" href="TotalStock.jsp" target="subbody">Total Stock</a>
                         <ul class="submenu">
                                <li><a  href="TotalStock.jsp" target="subbody">Show</a> </li>
                              
                               <li><a  href="DrugWiseStock.jsp" target="subbody">Search BY name</a> </li>
                               <li><a  href="ExpireStock.jsp" target="subbody">Expired Stock</a> </li>
                          
                            </ul>
                         </li>
                            <li><a class="menuitem">Issue Item</a>
                       
                                          <ul class="submenu">
                         <li><a  href="newissueitem.jsp" target="subbody">Add Issue Item</a> </li>
                                <li><a  href="showissue.jsp" target="subbody">Show Issue</a> </li>
                                
                              
                            </ul>
                        </li>
                        <li><a class="menuitem" href="" target="subbody">Purchase Item</a>
                        
                         <ul class="submenu">
                                <li><a  href="SuppliedItems.jsp" target="subbody">Add purchase</a> </li>
                       
                       <li><a  href="DrugWiseSupplySearch.jsp" target="subbody">Search By Drug Name </a> </li>
                                <li><a  href="CompanyWiseSupplyItemSearch.jsp" target="subbody">Search By company </a> </li>
                                <li><a  href="DateWiseSupplySearch.jsp" target="subbody">Search By Date </a> </li>
                            </ul>
                         </li>
                        
                        <li><a class="menuitem" href="" target="subbody">Supplier </a>
                        
                         <ul class="submenu">
                             
                                <li><a  href="SupplierInfo.jsp" target="subbody">Add Supplier Information</a> </li>
                                <li><a  href="showSupplier.jsp" target="subbody">Supplier Information</a> </li>
                            </ul>
                         </li>
                         
                    </ul>
                </div>
            </div>
        </div>
         <div class="clear">
    </div>
        </body>
</html>
        

 