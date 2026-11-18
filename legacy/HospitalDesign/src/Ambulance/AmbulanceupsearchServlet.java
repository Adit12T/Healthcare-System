package Ambulance;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbcon;

/**
 * Servlet implementation class AmbulanceupsearchServlet
 */
@WebServlet("/AmbulanceupsearchServlet")
public class AmbulanceupsearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmbulanceupsearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		/*// TODO Auto-generated method stub
		dbcon db = dbcon.getConnection();
		//System.out.println("a");
		HttpSession s=request.getSession();
		//String a1=(String) s.getAttribute("t1");
		
		String a=request.getParameter("t1");
		//System.out.println(a);
		//ArrayList ls = new ArrayList();
		try {String sql="select * from ambulance_manager where ambulance_type='"+a+"'";
		ResultSet rs = db.select(sql);
		//int s1;
			
		String b="";
		String c="";
		//String d="";
		
			while (rs.next()) {
				//d=rs.getString(2);
			b=rs.getString(3);
				c=rs.getString(4);
				System.out.println(b);
				System.out.println(c);
				//Map m = new HashMap();
				//m.put("cost",rs.getInt(3));
				//m.put("quantity", rs.getInt(4));
				//ls.add(m);
				
				
	} request.setAttribute("l", a);
			request.setAttribute("l1", b);
	request.setAttribute("l2", c);
			//s.setAttribute("l1", b);
	//s.setAttribute("l2", c);
	//System.out.println(l1);
			//request.setAttribute("list", ls);
			RequestDispatcher rd = request.getRequestDispatcher("ambulance/Ambulanceupdate.jsp");
						
				rd.forward(request, response);	*/
		
		
		
		String name = request.getParameter("atype");
		if (name != null) {

			dbcon db = dbcon.getConnection();

			try {
				String sql = "select * from ambulance_manager where ambulance_type='"
						+ name + "'";
				ResultSet rs = db.select(sql);
				while (rs.next()) {
				response.getWriter().print("<form action='../AmbulanceupdateServlet'>");
				response.getWriter().print("<table width='200' border='1' cellspacing='0' cellpadding='0'>");
				response.getWriter().print("<tr>");
				response.getWriter().print("<th> Ambulance Type</th>");
				response.getWriter().print("<th> Cost Per Kilo</th>");
				response.getWriter().print("<th>Number Of Ambulance</th>");
				response.getWriter().print("<th>Action</th>");
				response.getWriter().print("</tr>");
				response.getWriter().print("<tr>");
				response.getWriter().print("<td><input name='fname' value='"+	name+"'/></td>");
				
				response.getWriter().print("<td><input name='fcost' value='"+	rs.getString(3)+"'/></td>");
				response.getWriter().print("<td> <input name='fquantity' value='"+	rs.getString(4)+"'/></td>");
				
				response.getWriter().print("<td><input type='submit' value ='update' ></td>");
				response.getWriter().print("</tr>");
				response.getWriter().print("</table>");
				response.getWriter().print("</form>");
				
				}
				//response.sendRedirect("ambulance/ambulancedemo.jsp");

		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}}}
