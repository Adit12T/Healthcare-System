package room.bedbook;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookingServlet() {
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
		HttpSession session = request.getSession();
		BookbedBean book = null;

		String value = request.getParameter("value");
		if (value.endsWith("pid")) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			if (session.getAttribute("book") == null) {
				book = new BookbedBean();
				book.setPid(pid);
				session.setAttribute("book", book);

			} else {

				book = (BookbedBean) session.getAttribute("book");
				book.setPid(pid);
			}
			response.sendRedirect("roommanager/availablebed.jsp");
		}
		if (value.equalsIgnoreCase("bid")) {
			
		}

	}

}
