package room.floor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BedUpdateServlet
 */
@WebServlet("/BedUpdateServlet")
public class BedUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BedUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value=request.getParameter("update");
		if(value.equalsIgnoreCase("updatestatus")){
			BedUpdateBean bub=new BedUpdateBean();
			int id=Integer.parseInt(request.getParameter("bid"));
			String status=request.getParameter("status");
			bub.updateStatus(id, status);
			response.sendRedirect("roommanager/roombedinformation.jsp?msg="+bub.msg);
		}
	}

}
