package Inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class DeleteExpireStock
 */
@WebServlet("/DeleteExpireStock")
public class DeleteExpireStock extends HttpServlet {
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
		String name=request.getParameter("s4");
		String edate=request.getParameter("s1");
		String type=request.getParameter("s3");
		String company=request.getParameter("s5");
		String id=request.getParameter("id");
		InventoryBean i=new InventoryBean();
		String sql1="delete from expireitem where item_expiry_date='"+edate+"' and supplied_item_name='"+name+"'and supplied_item_type='"+type+"' and mfg_company='"+company+"'";
		int j=db.insertOrUpdate(sql1);
		response.sendRedirect("Inventary/ExpireStock.jsp?msg=s");
	}

}
