<%@page import="room.bedbook.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="room.floor.RoomBedInfoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>

</head>
<body>


	<%
		String roomtype = request.getParameter("roomtype");// "general"; // =
		System.out.print(roomtype);
		//out.print(roomtype);
		if (roomtype != null) {
			AvailableBookBean ab = new AvailableBookBean();

			Map map;

			out.print(" <table border='1'  cellpadding='0' cellspacing='0' class='table'>");
			out.print("<tr align='center' valign='middle'>");
			out.print("<th width='100'>Room Type</th>");
			out.print("<th width='100'>Room Cost</th>");
			out.print("<th width='80'>Room Floor</th>");
			out.print("<th width='100'>Room Number</th>");
			out.print("<th width='100'>Bed Capacity</th>");
			out.print("<th width='400'>Room bed</th>");
			out.print("</tr>");
			List record = ab.showRoomInfo(roomtype);
			Map maps;
			//System.out.print("-------"+record);
			for (int i = 0; i < record.size(); i++) {
				map = (Map) record.get(i);
				
				out.print("<tr align='center' valign='middle'>");
				out.print("<td>" + (String) map.get("roomtypename")
						+ "</td>");
				out.print("<td>" +  map.get("roomtypecost")
						+ "</td>");
				out.print("<td>" + (String) map.get("roomfloor") + "</td>");
				out.print("<td>" + (String) map.get("roomnumber") + "</td>");
				out.print("<td>" + map.get("bedcapacity") + "</td>");

				
				
				out.print("<td align='left'>");

				List re = ab.showBedInfoByRoomID((String) map
						.get("roomnumber"));
				//System.out.print("*****************"+re);
				for (int j = 0; j < re.size(); j++) {
					
					maps = (Map) re.get(j);
				/*	int bid=(int)maps.get("bedid");
					String bedname=(String)maps.get("bednumber");
					String bedoccupystatus=(String)maps.get("occupystatus");
					String bedstatus=(String)maps.get("bedstatus");
					*/
						
					if(((String)maps.get("occupystatus")).equalsIgnoreCase("0") && ((String)maps.get("bedstatus")).equalsIgnoreCase("Activate"))
					out.print("<input type='radio' name='bedid' value="+ maps.get("bedid") +">"+ maps.get("bednumber") + " ");//&nbsp;&nbsp
					
				}
				out.print("</td></tr>");
			}
			out.print("<tr align='center'><td  colspan='6'><input type='submit'> </td></tr>");
			out.print("</table>");
			
		}
	%>
<!-- <table > <tr><td></td></tr></table> -->
	<%-- <%
	
		String roomtype="general"; // = request.getParameter("roomtype");
		System.out.print(roomtype);
		out.print(roomtype);
	if (roomtype != null) {
			AvailableBookBean ab = new AvailableBookBean();

			Map map;
			
		/* 		
				
	
			 */
				%>
	   <table border='1' cellpadding='0' cellspacing='0'>
		<tr align='center' valign='middle'>
			<td>Room Type</td>
			<td>Room Cost</td>
			<td>Room Floor</td>
			<td>Room Number</td>
			<td>Bed Capacity</td>
			<td>Room bed</td>
		</tr>
		<%
			List record = ab.showRoomInfo(roomtype);
					Map maps;
					for (int i = 0; i < record.size(); i++) {
						map = (Map) record.get(i);
		%>
		<tr align="center" valign="middle">
			<td><%=map.get("roomtypename")%></td>
			<td><%=map.get("roomtypecost")%></td>
			<td><%=map.get("roomfloor")%></td>
			<td><%=map.get("roomnumber")%></td>
			<td><%=map.get("bedcapacity")%></td>
			<td>
				<%
					List re = ab.showBedInfoByRoomID((String) map
										.get("roomnumber"));
								for (int j = 0; j < re.size(); j++) {
									maps = (Map) re.get(j);
				%> <a href="availablebed_stepforward.jsp?bid=<%=maps.get("bedid")%>"><%=maps.get("bednumber")%></a>
				<%
					}
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		
		}
	%> --%>
</body>
</html>