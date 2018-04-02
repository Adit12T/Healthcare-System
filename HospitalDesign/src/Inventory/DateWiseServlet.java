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
 * Servlet implementation class DateWiseServlet
 */
@WebServlet("/DateWiseServlet")
public class DateWiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DateWiseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		//String fdate="";
		String fdate = request.getParameter("fdate");
		String ldate = request.getParameter("ldate");
		// TODO Auto-generated method stub
		dbcon db = dbcon.getConnection();
		String sql = "select s.supplied_item_name,s.supplied_quantity,i.issue_quantity,st.total_quantity from itemsupplied s,issuediteminfo i ,stock st where  s.item_id=i.item_id and s.item_id=st.item_id and s.supplied date<='"
				+ fdate + "' and s.supplied_date >'" + ldate + "'";
		ResultSet rs = db.select(sql);
		try {
			ArrayList ar = new ArrayList();

			while (rs.next()) {

				Map m = new HashMap();

				m.put("s1", rs.getString("supplied_item_name"));
				m.put("s2", rs.getString("supplied_quantity"));
				m.put("s3", rs.getString("issue_quantity"));
				m.put("s4", rs.getString("total_quantity"));

				ar.add(m);
				request.setAttribute("list", ar);

			}

		//	RequestDispatcher rd = request
					//.getRequestDispatcher("Inventary/DrugWiseStock.jsp");
			//rd.forward(request, response);

			// ar.add(rs.getString("supplied_item_name"));
			// ar.add(rs.getInt("supplied_quantity"));
			// ar.add(rs.getInt("issue_quantity"));
			// ar.add(rs.getInt("total_quantity"));
			// System.out.println(ar);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
