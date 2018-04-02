package com.pathologypatient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addpatienttestservlet
 */
@WebServlet("/addpatienttestservlet")
public class addpatienttestservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpatienttestservlet() {
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

		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String [] test_id=request.getParameterValues("test_id");
		HttpSession session=request.getSession();
		AddpatienttestDao ad=new AddpatienttestDao();
		ad.save(test_id, name, address);
		session.setAttribute("pathology", ad);
		response.sendRedirect("Pathology/add_patient_test2.jsp");
		
	}

}
