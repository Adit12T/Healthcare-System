package Ambulance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.dbcon;
/**
 * Servlet implementation class AmbulanceupdateServlet
 */
@WebServlet("/AmbulanceupdateServlet")
public class AmbulanceupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmbulanceupdateServlet() {
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
		String atype=request.getParameter("fname");
		String cost=request.getParameter("fcost");
		String quantity=request.getParameter("fquantity");
		//System.out.println("jjyj");
		String sql = "update  ambulance_manager set costper_kilo='"+cost+"',ambulance_quantity='"+quantity+"' where ambulance_type='"+atype+"'";
		 db.insertOrUpdate(sql);
		 response.sendRedirect("ambulance/Ambulanceupdate.jsp?msg=ss");
	}

}
