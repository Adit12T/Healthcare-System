package Inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class SupplierInfoServlet
 */
@WebServlet("/SupplierInfoServlet")
public class SupplierInfoServlet extends HttpServlet {
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
		dbcon db=dbcon.getConnection();
		int sid=0;;
		String name = request.getParameter("name");
		String add =( request.getParameter("add"));
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String cno = request.getParameter("cno");
		String email = request.getParameter("email");
		InventoryBean i=new InventoryBean();
		boolean j=i.saveSupplierInfo(sid, name, add, city, state, country, cno, email);
		response.sendRedirect("Inventary/SupplierInfo.jsp?msg= submitted successfully");
	}
	
}
