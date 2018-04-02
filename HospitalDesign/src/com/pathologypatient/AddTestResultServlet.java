package com.pathologypatient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTestResultServlet
 */
@WebServlet("/AddTestResultServlet")
public class AddTestResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestResultServlet() {
        super();
      
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
		String pid=request.getParameter("pid");
		String tname=request.getParameter("tname");
		String pdi[]=request.getParameterValues("pdi");
		String result[]=request.getParameterValues("result");
		String remark=request.getParameter("remark");
		AddTestResultDao ad=new AddTestResultDao();
		ad.savegroup(pid, tname, remark, pdi, result);
		response.sendRedirect("Pathology/patientresultZ.jsp?id="+pid+"&name="+tname+"");
		
	}

}
