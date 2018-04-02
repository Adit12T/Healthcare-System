package Inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BloodBank.BloodBankBean;

import database.dbcon;

/**
 * Servlet implementation class SupplyServlet
 */
@WebServlet("/SupplyServlet")
public class SupplyServlet extends HttpServlet {
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
		String company =( request.getParameter("mcompany"));
		String type = request.getParameter("type");
		String iname = request.getParameter("iname");
		String date = request.getParameter("date");
		int rq =Integer.parseInt( request.getParameter("rq"));
		int sq =Integer.parseInt( request.getParameter("sq"));
		int pq=rq-sq;
		String edate = request.getParameter("edate");
		int tamount = Integer.parseInt(request.getParameter("tamount"));
		int pamount = Integer.parseInt(request.getParameter("pamount"));
		int pending=tamount-pamount;
		try {

			InventoryBean i = new InventoryBean();
			

			boolean j = i.saveSuppliedItem(sid, name, type, iname,company, date, rq, sq, pq, edate, tamount, pamount, pending);

		}

		catch (Exception e) {
			System.out.println(e);
		}


response.sendRedirect("Inventary/SuppliedItems.jsp?msg= submitted successfully");
		
	}

}
