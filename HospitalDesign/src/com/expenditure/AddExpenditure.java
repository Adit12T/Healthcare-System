package com.expenditure;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddExpenditure
 */
@WebServlet("/AddExpenditure")
public class AddExpenditure extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExpenditure() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		
		String item = request.getParameter("item");
		String date = request.getParameter("date");
		String cost = request.getParameter("cost");
		String remark = request.getParameter("remark");
		
		Expenditure_Beans e = new Expenditure_Beans(0, item, date, cost, remark); 
		Expendituredao.saveExpenditure(e);
		response.sendRedirect("OtherMgmt/AddExpenditure.jsp");

	}

}
