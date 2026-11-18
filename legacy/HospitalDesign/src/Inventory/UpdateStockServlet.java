package Inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbcon;

/**
 * Servlet implementation class UpdateStockServlet
 */
@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s2 = "", s3 = "", s4 = "";
		int totalquantity = 0, id = 0;
		int bd=0;
		HttpSession session=request.getSession();
		 totalquantity = (Integer)(session.getAttribute("tq"));
		
		dbcon db = dbcon.getConnection();
		String iname = request.getParameter("name");
		String type = request.getParameter("type");
		String company = request.getParameter("cp");
		String update = request.getParameter("s");
		
		
		int quantity = Integer.parseInt(request.getParameter("q"));
	

				
					if (update.equals("add")) {
						 bd = totalquantity + quantity;

						String sql = "update  stock set total_quantity=" + bd
								+ " where item_name='" + iname
								+ "'and item_type='" + type
								+ "' and mfg_company='" + company + "'";
						
						db.insertOrUpdate(sql);
					} else if (update.equals("remove")) {
						 bd = totalquantity - quantity;
						if (bd > 0) {
							String sql = "update  stock set total_quantity="
									+ bd + " where item_name='" + iname
									+ "'and item_type='" + type
									+ "' and mfg_company='" + company + "'";
							
							db.insertOrUpdate(sql);
						}
						
					}

				 
			if(bd<0)
			{
				response.sendRedirect("Inventary/TotalStock.jsp?msg=sorry you have insufficient quantity in stock to remove!");
			}
			else

		response.sendRedirect("Inventary/TotalStock.jsp?msg=stock updated successfully!");

	}
}
