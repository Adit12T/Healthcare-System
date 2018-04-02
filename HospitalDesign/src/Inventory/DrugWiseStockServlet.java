package Inventory;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class DrugWiseStockServlet
 */
@WebServlet("/DrugWiseStockServlet")
public class DrugWiseStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrugWiseStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubd
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//int a=Integer.parseInt(request.getParameter("id"));
		String company = request.getParameter("com");
		String name = (request.getParameter("name"));
		String type = (request.getParameter("type"));
		try {
			dbcon db = dbcon.getConnection();
			System.out.println("ar");
			String sql = "select * from stock where mfg_company='"
					+ company + "' and item_name='" + name
					+ "' and item_type='" + type + "'";
			ResultSet rs = db.select(sql);
			// System.out.println("ar");

			ArrayList ar = new ArrayList();

			while (rs.next()) {

				Map m = new HashMap();
				m.put("s1", rs.getString("item_id"));
				m.put("s2", rs.getString("item_type"));
				m.put("s3", rs.getString("item_name"));
				m.put("s4", rs.getString("mfg_company"));
				m.put("s5", rs.getString("total_quantity"));

				ar.add(m);
				request.setAttribute("list", ar);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		RequestDispatcher rd = request
				.getRequestDispatcher("Inventary/DrugWiseStock.jsp");
		rd.forward(request, response);


}
}