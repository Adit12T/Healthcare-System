package Inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class DeletePatient
 */
@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int vno=Integer.parseInt(request.getParameter("t1"));
		String name=request.getParameter("t2");
		dbcon db=dbcon.getConnection();
		String sql="delete from issuediteminfo where voucher_no="+vno+" and  person_name='"+ name+"'";
		db.insertOrUpdate(sql);
		response.sendRedirect("Inventary/PatientWiseDrugIssue.jsp?msg=sorry you have insufficient quantity in stock to remove!");
	}

}
