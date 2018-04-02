package room.floor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FloorServlet
 */
@WebServlet("/FloorServlet")
public class FloorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FloorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("value");
		String s;
		if (value.equalsIgnoreCase("add")) {
			String floorname = request.getParameter("floornumber");
			FloorBean fb = new FloorBean();
			boolean flag = fb.saveFloor(floorname);
			
			if (flag){
				s="<font color='green'>Success...........</font>";
				response.sendRedirect("roommanager/addfloor.jsp?s="+s);
				}
			else{
				s="<font color='green'>already Exist...........</font>";
				response.sendRedirect("roommanager/addfloor.jsp?s="+s);
				}
		}else{
			s="<font color='green'>some error...........</font>";
			response.sendRedirect("roommanager/addfloor.jsp?s="+s);}
	}

}
