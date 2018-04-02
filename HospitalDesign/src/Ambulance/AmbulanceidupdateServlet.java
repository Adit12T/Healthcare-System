package Ambulance;

import java.io.IOException;
import database.dbcon;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AmbulanceidupdateServlet
 */
@WebServlet("/AmbulanceidupdateServlet")
public class AmbulanceidupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmbulanceidupdateServlet() {
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
		
		
		HttpSession session=request.getSession();
		 String id1= session.getAttribute("ids").toString();
		 int id=Integer.parseInt(id1);
		// String at=request.getParameter("add");
		 String dname=request.getParameter("dname");
		String cno=request.getParameter("cno");
		 dbcon db = dbcon.getConnection();
		 String sql = "update  ambulance_updation set driver_name='"+dname+"', contact_no='"+cno+"' where ambulance_id="+id+"";
		 db.insertOrUpdate(sql);
		 response.sendRedirect("ambulance/Ambulancesearchbyid.jsp?msg=ss");
	}

}
