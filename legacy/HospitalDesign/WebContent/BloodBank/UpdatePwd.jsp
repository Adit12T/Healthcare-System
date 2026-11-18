<link rel="stylesheet" type="text/css" href="css/view.css"
	media="all">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/layout.css"
	media="screen" />


<link rel="stylesheet" type="text/css" href="css/nav.css"
	media="screen" />

<style type="text/css">
fieldset {
	border-color: #FDFBFC;
}

#percentage {
	width: 50px;
}
</style>
</head>
<body>


	<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
			<h2>Update Password</h2>
<center>

		<form action="../UpdatePwdServlet" onsubmit="test();">
			<table border="0">
				<tr>
					<td height="64">User Name</td>
					<td><input type="text" name="uname" id="uname"></td>
				</tr>
				<tr>
					<td height="59">Password</td>
					<td><input type="text" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td height="59">ConfirmPassword</td>
					<td><input type="text" name="pwd" id="cpwd"></td>
				</tr>
				<tr>
			<td></td>
				<td height="55"><input type="submit" value="login"
					onmouseover="test()"></td>
				</tr></table>
		</form>
	</center>
	</div>
	</div>
	</div>
</body>
</html>