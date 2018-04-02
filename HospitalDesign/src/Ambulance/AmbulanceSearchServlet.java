package Ambulance;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import database.dbcon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AmbulanceSearchServlet
 */
@WebServlet("/AmbulanceSearchServlet")
public class AmbulanceSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DateTimeFormat = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmbulanceSearchServlet() {
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
		// TODO Auto-generated method stub
		
		
		
		dbcon db = dbcon.getConnection();
		String pname= request.getParameter("pname");
		String time=request.getParameter("dname");
		String atype=request.getParameter("atype");
		String n=request.getParameter("r");
		//System.out.println(pname);
		 ArrayList ls = new ArrayList();
		/* Date pname1 = new Date(0);

		 DatatypeMessageFormatter formatter = DateTimeFormat.forPattern("YYYY/MM/dd");
		 System.out.println("pname = " + formatter.print(pname1));
		 System.out.println("year = " + pname1.getYear());*/
		
		if(n.equals("bypname"))
		{
			String sql="select * from ambulance_info where date='"+pname+"'";
			ResultSet rs = db.select(sql);
			//int s1;
			
			
			try {
				while (rs.next()) {
					Map m = new HashMap();
					m.put("id",rs.getInt(1));
					m.put("atype", rs.getString(2));
					m.put("pid", rs.getInt(3));
					m.put("pname", rs.getString(4));
					m.put("date", rs.getString(5));
					m.put("time", rs.getString(6));
					m.put("add", rs.getString(7));
					m.put("cno", rs.getInt(8));
					//m.put("ename", rs.getString(14));
					ls.add(m);
}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
			else if(n.equals("byatype"))
			{
				String sql="select * from ambulance_info where ambulance_type='"+atype+"'";
				ResultSet rs = db.select(sql);
				//int s1;
				
				
				try {
					while (rs.next()) {
						Map m = new HashMap();
						m.put("id",rs.getInt(1));
						m.put("atype", rs.getString(2));
						m.put("pid", rs.getInt(3));
						m.put("pname", rs.getString(4));
						m.put("date", rs.getString(5));
						m.put("time", rs.getString(6));
						m.put("add", rs.getString(7));
						m.put("cno", rs.getInt(8));
						//m.put("dname", rs1.getString(18));
						//m.put("ename", rs.getString(14));
						ls.add(m);
	}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		
		
			
			{
				String sql="select * from ambulance_info where time='"+time+"'";
				ResultSet rs = db.select(sql);
				//int s1;
				
				
				try {
					while (rs.next()) {
						Map m = new HashMap();
						m.put("id",rs.getInt(1));
						m.put("atype", rs.getString(2));
						m.put("pid", rs.getInt(3));
						m.put("pname", rs.getString(4));
						m.put("date", rs.getString(5));
						m.put("time", rs.getString(6));
						m.put("add", rs.getString(7));
						m.put("cno", rs.getInt(8));
						//m.put("dname", rs1.getString(18));
						//m.put("ename", rs.getString(14));
						ls.add(m);
	}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	
		request.setAttribute("list", ls);
		RequestDispatcher rd = request.getRequestDispatcher("ambulance/searchcontain.jsp");
					
			rd.forward(request, response);

	}
}
