package com.patientmanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddPatientDiseaseDoctorServlet
 */
@WebServlet("/AddPatientDiseaseDoctorServlet")
public class AddPatientDiseaseDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPatientDiseaseDoctorServlet() {
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
		HttpSession session = request.getSession();
		System.out.println("a dd----------------------------");
		String emi = request.getParameter("empid");
		String di = request.getParameter("diseaseid");
		if (emi != null & di != null) {
			System.out.println(emi+"  "+di);
			int empid = Integer.parseInt(emi);
			int diseaseid = Integer.parseInt(di);

			if (session.getAttribute("patientinfo") != null) {
				PatientBean bean = (PatientBean) session
						.getAttribute("patientinfo");
				 boolean flag=bean.addDis(empid, diseaseid);
				// boolean flag=bean.AddPatientDiseaseDoctorServlet(empid,
				// empname, diseasename, department);
				/*
				 **/
				 if(flag){ response.getWriter().print("<font color='green' align='center'><h3>Add successfully</h3></font>"); 
				 		 }
				 else{
					 
					 response.getWriter().print("<font color='red' >Some Error please Try again</font>");
					 //response.sendRedirect("patientmanager/patientregistrationstep2.jsp");
				 }
				 

			}
		}
	}

}
