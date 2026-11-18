package com.patientmanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Patient;

/**
 * Servlet implementation class PatientRegistration
 */
@WebServlet("/PatientRegistrationServlet")
public class PatientRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientRegistrationServlet() {
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
		
		/*System.out.println(request.getParameter("pname")+" "+request.getParameter("pmobile")
				+" "+request.getParameter("age")
				+" "+request.getParameter("gen")
				+" "+request.getParameter("m_s")
				+" "+request.getParameter("f_h")
				+" "+request.getParameter("add")
				+" "+request.getParameter("city")
				+" "+request.getParameter("religion")
				+" "+request.getParameter("pmobile")
				+" "+request.getParameter("pcontact")
				+" "+request.getParameter("pbg")
				+" "+request.getParameter("patient")
				
				+" "+request.getParameter("value") );*/
		
		String value = request.getParameter("value");
		try {
			HttpSession session = request.getSession();
			if (value!=null && value.equalsIgnoreCase("step1")) {

				PatientBean p = new PatientBean();
				String name = request.getParameter("pname");
				String mob = request.getParameter("pmobile");
				String age = request.getParameter("age");
				p.setPatientName(request.getParameter("pname"));
				p.setPatientreferdr(request.getParameter("pref"));
				p.setPatientGender(request.getParameter("gen"));
				p.setPatientAge(request.getParameter("age"));
				p.setPatientMaritalStatus(request.getParameter("m_s"));
				p.setPatientFatherHusband(request.getParameter("f_h"));
				p.setPatientAddress(request.getParameter("add"));
				p.setPatientCity(request.getParameter("city"));
				p.setPatientReligion(request.getParameter("religion"));
				p.setPatientMobile(request.getParameter("pmobile"));
				p.setPatientTelephone(request.getParameter("pcontact"));
				p.setPatientBloodgroup(request.getParameter("pbg"));

				 session.setAttribute("patientinfo", p);
				String patient = request.getParameter("patient");
				if (patient.equalsIgnoreCase("out")) {
					/*---------*/
					response.sendRedirect("patientmanager/patientregistrationstep2.jsp");

				} else {
					response.sendRedirect("patientmanager/patientregistrationstepin1.jsp");
				}

			}
			if (value.equalsIgnoreCase("step2")) {
				System.out.println("--------------");
				PatientBean p=(PatientBean)session.getAttribute("patientinfo");
				
				if(p!=null){
					System.out.println(p);
					boolean flag= p.saveReord();
					if (flag)
					response.sendRedirect("patientmanager/patientregistrationstep3.jsp");
					else
						response.sendRedirect("patientmanager/patientregistrationstep1.jsp");
				}
				
			}
			if (value.equalsIgnoreCase("step3")) {
			}

		} catch (Exception e) {
			response.sendRedirect("patientmanager/patientregistrationstep1.jsp");
			System.out.println(e);
		}
	}
}
