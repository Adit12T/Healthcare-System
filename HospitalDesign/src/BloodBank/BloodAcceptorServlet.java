package BloodBank;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class BloodAccepterServlet
 */
@WebServlet("/BloodAcceptorServlet")
public class BloodAcceptorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = 0;

		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String bloodgroup = request.getParameter("bloodgroup");
		String mobile = request.getParameter("cno");

		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String email = request.getParameter("email");
		String adate = request.getParameter("date");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int s1 = 0;

		try {

			BloodBankBean b = new BloodBankBean();

			boolean i = b.saveacceptorData(id, name, dob, gender, age,
					bloodgroup, mobile, address, city, state, country, email,
					adate, quantity);
			if(i){
				response.getWriter().print("<div align='center'><h3><font color='green'>Registered Successfully....</font></h3></div>");
			}

		}

		catch (Exception e) {
			System.out.println(e);
		}

	}

}
