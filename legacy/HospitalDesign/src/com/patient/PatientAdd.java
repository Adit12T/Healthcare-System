package com.patient;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Patient;
import com.beans.PatientInside;
import com.beans.PatientOutside;
import com.dao.*;

/**
 * Servlet implementation class PatientAdd
 */
@WebServlet("/PatientAdd")
public class PatientAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientAdd() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		boolean bol = false;
		
		String name =request.getParameter("pname");
		String mob=request.getParameter("pmobile");
		String age =request.getParameter("age");

		Patient p = new Patient();
		p.setPatientRegistrationno(0);
		p.setPatientName(request.getParameter("pname"));
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
		p.setPatientDisease(request.getParameter("disease"));
		p.setPatientDateofregistraton(request.getParameter("regdate"));

		bol = Patientdao.addPatient(p);
		System.out.println("bol=>"+bol);
		if (bol) {
			
			ArrayList<Patient> ls = Patientdao.getpatientIDByNameMobileAge(name, mob, age);
			Patient p1=ls.get(0);
			int pid = p1.getPatientRegistrationno();
			System.out.println(pid);
			if (request.getParameter("patient").endsWith("in")) {

				PatientInside pin = new PatientInside();
				pin.setAdmisionId(0);
				pin.setPatientId(pid);
				pin.setDoctorId(Integer.parseInt(request.getParameter("din")));
				pin.setBedId(Integer.parseInt(request.getParameter("bedid")));
				pin.setAdmisionDate(request.getParameter("regdatein"));

				PatientInsidedao.saveInpatient(pin);


			} else {
				PatientOutside pout = new PatientOutside();
				pout.setOutsideId(0);
				pout.setPatientRegistrationno(pid);
				pout.setDoctorId(Integer.parseInt(request.getParameter("dout")));
				pout.setDiseaseName(request.getParameter("dis_out"));
				pout.setCheckUpDate(request.getParameter("checkdate"));
				pout.setReferByDr(request.getParameter("refer"));
				pout.setCheckupNumber(Integer.parseInt(request
						.getParameter("checkno")));

			System.out.println(	PatientOutsidedao.saveInpatient(pout));
			
			}
			response.sendRedirect("SearchPatient.jsp");
		}
	}
}
