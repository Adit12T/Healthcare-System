package room.floor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RoomTypeServlet
 */
@WebServlet("/RoomTypeServlet")
public class RoomTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomTypeServlet() {
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
		//String roomtypename, String roomtypecost
		if (value.equalsIgnoreCase("add")) {
			String roomtypename=request.getParameter("roomtypename");
			String roomtypecost=request.getParameter("roomtypecost");
			RoomTypeBean rtb=new RoomTypeBean();
			boolean flag=rtb.save(roomtypename, roomtypecost);
			if(flag){
				response.sendRedirect("roommanager/roomtype.jsp?msg="+rtb.ms);
			}else{
				response.sendRedirect("roommanager/roomtype.jsp?msg="+rtb.ms);
			}
			
		}
		if (value.equalsIgnoreCase("update")) {
			String roomtypename=request.getParameter("roomtypename");
			String roomtypecost=request.getParameter("roomtypecost");
			RoomTypeBean rtb=new RoomTypeBean();
			boolean flag=rtb.update(roomtypename, roomtypecost);
			if(flag){
				response.sendRedirect("roommanager/roomtype.jsp?msg="+rtb.ms);
				//response.sendRedirect("roommanager/roomtype.jsp");
			}else{
			response.sendRedirect("roommanager/roomtype.jsp?msg="+rtb.ms);}
		}
	}

}
