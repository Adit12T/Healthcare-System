package com.patientmanager;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetPatientInDoctor
 */
@WebServlet("/GetPatientInDoctor")
public class GetPatientInDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPatientInDoctor() {
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
		String s = request.getParameter("department");
		System.out.println(s);
		if (s != null) {
			System.out.println(s);
			PatientDao p=new PatientDao();
			List l=p.showDoctor(s);
			response.getOutputStream().print("<select style='width: 150PX'  name='drid'>");
			for (int i = 0; i < l.size(); i++) {
				Map map= (Map)l.get(i);
				response.getOutputStream().print("<option value='"+map.get("empid")+"'>"+ map.get("empname")+" </option>" );	
			}
			response.getOutputStream().print("</select>");
			
		}
	}

}
