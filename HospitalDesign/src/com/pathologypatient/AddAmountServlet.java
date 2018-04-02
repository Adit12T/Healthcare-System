package com.pathologypatient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class AddAmountServlet
 */
@WebServlet("/AddAmountServlet")
public class AddAmountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAmountServlet() {
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
		String remain = request.getParameter("remain");
		String pid = request.getParameter("pid");
		String old = request.getParameter("old");
		try {
			int total = Integer.parseInt(old) + Integer.parseInt(remain);
			String sql = "update pathology_patient set paid=" + total
					+ " where pathology_patient_id='" + pid + "'  ";

			dbcon db = dbcon.getConnection();
			int a = db.insertOrUpdate(sql);
			if (a > 0) {
				response.sendRedirect("Pathology/viewReultsearchgroup.jsp?id="+pid+"&s=Success");
				return;
			}

		} catch (Exception e) {
System.out.println(e);
		}
		response.sendRedirect("Pathology/viewReultsearchgroup.jsp?s=Try Again....");
	}

}
