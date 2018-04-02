package com.patientmanager;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetPatientDiseaseDoctorServlet
 */
@WebServlet("/GetPatientDiseaseDoctorServlet")
public class GetPatientDiseaseDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPatientDiseaseDoctorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		String diseasename = request.getParameter("disease");
		
		System.out.println(diseasename);
		//System.out.println(request.getParameter("value1"));
		// HttpSession session=request.getSession();

		// PatientBean bean=(PatientBean)session.getAttribute("patient");
		if (diseasename != null) {

			PatientDao pd = new PatientDao();
			List record = pd.getDisease(diseasename);

			if (record.size()>0) {
				response.getWriter()
						.print("<table width='694' height='62' border='1' align='center' cellpadding='0' cellspacing='0' class='table'>");
				response.getWriter().print("<tr>");
				response.getWriter()
						.print("  <th>Doctor Id</th>   <th>Doctor Name</th>   <th>Doctor Department</th>  <th>Disease Name</th>");
				response.getWriter().print("  <th>Add</th></tr>");

				Map map;
				for (int i = 0; i < record.size(); i++) {
					map = (Map) record.get(i);
					int empid=(int)map.get("empid");
					int diseaseid=(int)map.get("diseaseid");
					String name=(String)map.get("empname");
					String dis=(String)map.get("diseasename");
					String dep=(String)map.get("empdepartment");
					
					
					response.getWriter().print("<tr valign='middle'>");
					
					response.getWriter().print(
							"<td>" + map.get("empid") + "</td>");
					response.getWriter().print(
							"<td>" + map.get("empname") + "</td>");
					response.getWriter().print(
							"<td>" + map.get("empdepartment") + "</td>");
					response.getWriter().print(
							"<td>" + map.get("diseasename") + "</td>");
					
					response.getWriter().print(
							"<td>"
					+"<input type='radio' name='drid'  onchange='addData("+empid+","+diseaseid+")'>"+ "</td>");
					
					
					response.getWriter().print("</tr>");
				}
				response.getWriter().print("</table>");

			}
			else{
				response.getWriter().print("");
			}
		} else {
			response.sendRedirect("patientmanager/patientregistrationstep1.jsp");
		}

	}

}
