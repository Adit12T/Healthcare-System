package com.patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Patient;
import com.dao.Patientdao;

/**
 * Servlet implementation class Update_Patient
 */
@WebServlet("/Update_Patient")
public class Update_Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		boolean bol=false;
		
		Patient p=new Patient();
	 	p.setPatientRegistrationno(Integer.parseInt( request.getParameter("pid")));		
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

	bol = Patientdao.UpdatePatient(p);
	
	}

}
