package room.floor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RoomNumberServlet
 */
@WebServlet("/RoomNumberServlet")
public class RoomNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomNumberServlet() {
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
		if (value.equalsIgnoreCase("add")) {
			String floorname = request.getParameter("floor");
			String roomtypeid = request.getParameter("roomtypeid");
			String roomnumber = request.getParameter("roomnumber");
			String bedcapacity = request.getParameter("bedcapacity");
			String status = request.getParameter("status");
			RoomNumberBean rnb = new RoomNumberBean();
			boolean flag = rnb.save(floorname, roomtypeid, roomnumber,
					bedcapacity, status);
			if (flag) {
				
				response.sendRedirect("roommanager/roomnumber.jsp?msg="+rnb.msgs);
			//	response.getWriter().print("SuccessFully .................");
			} else
				response.sendRedirect("roommanager/roomnumber.jsp?msg="+rnb.msgs);
				//response.getWriter().print("Already Exist .................");
			// response.sendRedirect("Already Exist");

		}
	}

}
