package Ambulance;

import java.io.IOException;
import database.dbcon;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AmbulanceInfoServlet
 */
@WebServlet("/AmbulanceInfoServlet")
public class AmbulanceInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmbulanceInfoServlet() {
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
		//int pid =0;
		int aid=0;
		String amtype = request.getParameter("atype");
		//String ptype = request.getParameter("ptype");
		String dname = request.getParameter("dname");
		//String date = request.getParameter("date");
		int cno = Integer.parseInt(request.getParameter("cno"));
		//int charge = Integer.parseInt(request.getParameter("charge"));
		//int tamount=0;

		try {
			
			
				AmbulanceBean b = new AmbulanceBean();
				
				
				
				boolean i = b.saveDatainfo( aid,amtype,dname, cno);
				if(i)
				response.sendRedirect("ambulance/AmbulanceInfo.jsp?msg=ss");
				
	}
		catch (Exception e) {
			System.out.println(e);
		}
	}

}
