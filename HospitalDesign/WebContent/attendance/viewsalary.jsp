<%@ page language="java"
	import="java.util.*,java.util.Date,java.sql.*,java.text.*"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><fmt:message key="title.doctorhome" /></title>

<%
	int i = 0,j = 0,days=0;
	String joindate = "", bankname = "", bankno = "", pfno = "", panno = "", esi = "",mon="";
	float  k = 0,pf = 0, sal = 0, netsal = 0, hra = 0, ca = 0, ma = 0, sa = 0, ea = 0, total1, total11, total2, pt;
%>
</head>
<body>
<div class="container_12">
		<div class="grid_10" style="width: 97%;">
		<div class="box round first grid" style="width: 97%;">
		<h2>View Salary</h2>

	<%
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		String datevalue = format.format(d);
		
		String time = d.getHours() + ":" + d.getMinutes();
	%>

	<form method="post">
		<%
		
		String[] month = new String[12];
		month[0] = "January";
		month[1] = "February";
		month[2] = "March";
		month[3] = "April";
		month[4] = "May";
		month[5] = "June";
		month[6] = "July";
		month[7] = "August";
		month[8] = "September";
		month[9] = "October";
		month[10] = "November";
		month[11] = "December";
	
			String datefrom = request.getParameter("from");
			String dateto = request.getParameter("to");
			String id = request.getParameter("id");
			String name = null;
			//float pf ,sal,netsal;

			String totalpre = null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/hmt", "root", "root");
			Statement st = con.createStatement();
			String sql = "select sum(attendance_date) from attendance where emp_id= '"
					+ id
					+ "' && attendance_date>='"
					+ datefrom
					+ "' && attendance_date<='" + dateto + "' ";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				i = Integer.parseInt(rs.getString(1));
			}
			Statement st1 = con.createStatement();
			String sql1 = "select emp_id,emp_name,emp_jod,emp_salary from employee where emp_id='"
					+ id + "'";
			ResultSet rs1 = st1.executeQuery(sql1);
			while (rs1.next()) {
				name = rs1.getString(2);
				joindate = rs1.getString(3);
				k=rs1.getInt(4);
			}
			/*Statement st2 = con.createStatement();
			String sql2 = "select cost from perday where emp_id='" + id + "'";
			ResultSet rs2 = st1.executeQuery(sql2);
			while (rs2.next()) {
				k = Integer.parseInt(rs2.getString(1));
			}*/
			Statement st6 = con.createStatement();
			String sql6 = "select * from employee_leave where emp_id='"
					+ id + "' ";
			ResultSet rs6 = st6.executeQuery(sql6);
			while (rs6.next()) {
				days = rs6.getInt(5);
				}
			Statement st4 = con.createStatement();
			String sql4 = "select * from employee_account where emp_id='" + id
					+ "'";
			ResultSet rs4 = st4.executeQuery(sql4);
			while (rs4.next()) {
				bankname = rs4.getString(3);
				bankno = rs4.getString(4);
				pfno = rs4.getString(5);
				panno = rs4.getString(6);
				esi = "";//rs4.getString(7);
			}
			k=k/30;
			
			j = i / 2;
			j=days+j;
			sal = j * k;
			hra = (sal * 20) / 100;
			ca = (sal * 8) / 100;
			ma = (sal * 25) / 200;
			sa = (sal * 11) / 100;
			ea = (sal * 2) / 100;
			total1 = sal + hra + ca + ma + sa;
			total11 = hra + ca + ma + sa;

			pt = 2500 / 12;
			pf = (sal * 12) / 100;
			total2 = pf + pt;

			netsal = total1 - total2;

			Statement st3 = con.createStatement();
			String sql3 = "insert into salary (emp_id,total_days,salary,hra,ca,ma,sa,ea,pf,netsalary,pay_date,month) values ('"
					+ id+ "','"	+ j	+ "','"	+ sal+ "','"
					+ hra
					+ "','"
					+ ca
					+ "','"
					+ ma
					+ "','"
					+ sa
					+ "','"
					+ ea
					+ "','"
					+ pf
					+ "','"+ netsal+"', '" +datevalue + "', '" +month[d.getMonth()] + "' )";
			st3.executeUpdate(sql3);
		%>

		


		<p align="center">
			<b><font size="10">Central Hospital</font></b>
		</p>
		<p align="center">
			<b><font size="5"> Pay Slip for the Month Of <%=month[d.getMonth()]%>/<%=d.getYear() + 1900%></font></b>
		</p>
		<table align="center" border="0" width="900">
			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>
			<tr>
				<td>Working Day</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right">30</td>
				<td width="10"></td>
				<td>Net Payable Day</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"><%=j%></td>
			</tr>
			<tr>
				<td>Employee Id</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"enter" ><%=id%></td>
				<td width="10"></td>
				<td>Designation</td>
				<td></td>
				<td width="10"></td>
				<td align="center"></td>
			</tr>
			<tr>
				<td>Employee Nmae</td>
				<td>:</td>
				<td width="10"></td>
				<td align="center"><%=name%></td>
				<td width="10"></td>
				<td>Department</td>
				<td>:</td>
				<td width="10"></td>
				<td align="center"></td>
			</tr>
			<tr>
				<td>PAN</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"><%=panno%></td>
				<td align="center" width="10"></td>
				<td>Pay Mode</td>
				<td>:</td>
				<td width="10"></td>
				<td align="center">Monthly</td>
			</tr>
			<tr>
				<td>Join Date</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"><%=joindate%></td>
				<td align="center" width="10"></td>
				<td>Bank Name</td>
				<td>:</td>
				<td width="10"></td>
				<td align="center"><%=bankname%></td>
			</tr>
			<tr>
				<td>PF No.</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"><%=pfno%></td>
				<td width="10"></td>
				<td>Account No.</td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"><%=bankno%></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td width="10"></td>
				<td align="center"></td>
				<td width="10"></td>
				<td></td>
				<td>:</td>
				<td width="10"></td>
				<td align="right"></td>
			</tr>

			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>
		</table>

		<table align="center" border="0" width="900">
			<tr>
				<td width="250">Basic Salary</td>
				<td align="right" width="35">####</td>
				<td width="10"></td>
				<td align="right" width="150"><%=sal%></td>

				<td width="10"></td>
				<td width="250">PF</td>
				<td align="right" width="35"><%=pf%></td>
				<td width="10"></td>
				<td align="right"><%=pf%></td>
			</tr>
			<tr>
				<td width="250">H.R.A.</td>
				<td align="right" width="35"><%=hra%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=hra%></td>
				<td width="10"></td>
				<td width="250">Advance</td>
				<td align="right" width="35">####</td>
				<td width="10"></td>
				<td align="right">0.0</td>
			</tr>
			<tr>
				<td width="250">Conveyance Allowance</td>
				<td align="right" width="35"><%=ca%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=ca%></td>
				<td width="10"></td>
				<td width="250">Professional Tax</td>
				<td align="right" width="35"><%=pt%></td>
				<td width="10"></td>
				<td align="right"><%=pt%></td>
			</tr>
			<tr>
				<td width="250">Medical Allowance</td>
				<td align="right" width="35"><%=ma%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=ma%></td>
				<td width="10"></td>
				<td width="250">TDS</td>
				<td align="right" width="35">####</td>
				<td width="10"></td>
				<td align="right"></td>
			</tr>
			<tr>
				<td width="250">Special Allowance</td>
				<td align="right" width="35"><%=sa%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=sa%></td>
				<td width="10"></td>
				<td width="250"></td>
				<td align="right" width="35"></td>
				<td width="10"></td>
				<td align="right"></td>
			</tr>
			<tr>
				<td width="250">Medical Allowance</td>
				<td align="right" width="35"><%=ea%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=ea%></td>
				<td width="10"></td>
				<td width="250"></td>
				<td align="right" width="35"></td>
				<td width="10"></td>
				<td align="right"></td>
			</tr>
			<tr>
				<td width="250"></td>
				<td align="right" width="35"></td>
				<td width="10"></td>
				<td align="right" width="150"></td>
				<td width="10"></td>
				<td width="250"></td>
				<td align="right" width="35"></td>
				<td width="10"></td>
				<td align="right"></td>
			</tr>
			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>
			<tr>
				<td width="250"><b>Total</b></td>
				<td align="right" width="35"><%=total11%></td>
				<td width="10"></td>
				<td align="right" width="150"><%=total1%></td>
				<td width="10"></td>
				<td width="250"><b>Total</b></td>
				<td align="right" width="35"><%=total2%></td>
				<td width="10"></td>
				<td align="right"><%=total2%></td>
			</tr>
			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>

		</table>
		<table align="center" border="0" width="900">
			<tr>
				<td width="100"><b>Net Pay</b></td>
				<td width="45">:</td>
				<td width="10"></td>
				<td><b><%=netsal%> RS<b></td>
			</tr>
			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>
		</table>
		<table align="center" border="0" width="900">
			<tr>
				<td width="750"></td>
				<td width="150" align="center">Name</td>
			</tr>
			<tr>
				<td width="750"></td>
				<td width="150" align="right"><b>Aurhorised Signatory</b></td>
			</tr>
			<tr>
				<td align="center" colspan="9" height="1" bgcolor="#CCCCCC"></td>
			</tr>
		</table>
	</form>

</div>
</div>
</div>
</body>
</html>
