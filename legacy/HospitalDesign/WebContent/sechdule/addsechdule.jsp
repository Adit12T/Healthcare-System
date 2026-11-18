<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="sechdule.SechduleDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	function show() {
		
		var data=document.getElementById("eid").value;	
		//var data=document.getElementById("se").value();
		
			//alert(data);
			var s="Choose option";
			if(s==data){
				alert("Please select");
				return false;   
			}
			return true;
	}
</script>

<body>

	<form action="../SechduleServlet" onSubmit="return show()">
	
		<table width="900" height="500" cellpadding="0" cellspacing="0"
			border="1">
			
			<tr>
				<td colspan="5">
					<!-- <input type="text" name="eid" value=""> --> 
					<select name="eid"id="eid">
					<option value="Choose option">Choose option</option>
						<%
							SechduleDao d = new SechduleDao();
							List re = d.getDoctor();
							Map map;
							for (int i = 0; i < re.size(); i++) {
								map = (Map) re.get(i);
						%>
						<option value="<%=map.get("empid")%>"><%=map.get("empname")%></option>
						<%
							}
						%>
				</select>



				</td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="Monday"> Monday
					</div>
				</td>
				<td width="253">Start Time <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select> : <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select> <select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select> <select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="TuesDay"> TuesDay
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select> <select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="Wednesday"> Wednesday
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="Thursday"> Thursday
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="Friday"> Friday
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="SaturDay"> SaturDay
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>
			<tr align="center" valign="middle">
				<td width="161">
					<div align="left">
						<input type="checkbox" name="visiting_day" align="left"
							value="Sunday"> Sunday
					</div>
				</td>
				<td width="253">Start Time: <select name="start_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="start_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="start_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
				<td width="290">End Time: <select name="end_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="end_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select><select name="end_shift">
						<option>AM</option>
						<option>PM</option>
				</select></td>
			</tr>


			<tr>
				<td colspan="3" align="center">
					<table>
						<tr>
							<td width="77">Paid OPD Charge</td>
						  <td width="175"><input name="paidcharge" value="0"></td>
							<td width="68">Start Time</td>
							<td width="197"> 
							  <select name="pstart_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select> : <select name="pstart_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select> <select name="pstart_shift">
						<option>AM</option>
						<option>PM</option>
				</select>
							
						  </td>

							<td width="27">
				<td width="258">End Time: 
				  <select name="pend_hr">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>: <select name="pend_minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
				</select> <select name="pend_shift">
						<option>AM</option>
						<option>PM</option>
				</select>
							
						  </td>
							
							
							<!-- 
							<td>Paid OPD Charge</td>
							<td><input name="paidcharge" value="0"></td>
							<td>Start Time</td>
							<td><input type="text" name="pst" value="00:00 AM">
							</td>
							<td>End Time</td>
							<td><input type="text" name="pet" value="00:00 PM">
							</td> -->

						</tr>
					</table>

				</td>
			</tr>


			<tr>
				<td colspan="3" align="center"><input type="submit"></td>
			</tr>
		</table>

	</form>
</body>
</html>