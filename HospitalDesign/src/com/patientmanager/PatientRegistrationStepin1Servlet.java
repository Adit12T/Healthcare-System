package com.patientmanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PatientRegistrationStepin1Servlet
 */
@WebServlet("/PatientRegistrationStepin1Servlet")
public class PatientRegistrationStepin1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientRegistrationStepin1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String doctorid=request.getParameter("drid");
		String department=request.getParameter("dept");
		String roomtype=request.getParameter("roomtype");
		String bedid=request.getParameter("bedid");
		String diseasename=request.getParameter("diseasename");
		PatientBean p=(PatientBean)session.getAttribute("patientinfo");
		if (doctorid != null & bedid != null & diseasename !=null) {
			if (p != null) {
			boolean flag=	p.saveRecordInside(Integer.parseInt(doctorid), diseasename, Integer.parseInt(bedid));
				if(flag)
					response.sendRedirect("patientmanager/patientregistrationstepin2.jsp");
			
			// System.out.println();
				// System.out.println("id= "+doctorid+"  "+department+"  "+roomtype+"  "+bedid);
			} else {
				response.sendRedirect("patientmanager/patientregistrationstep1.jsp");
			}
		}else {
			response.sendRedirect("patientmanager/patientregistrationstepin1.jsp");
			
		}
	}

}
