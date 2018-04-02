package BloodBank;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbcon;

/**
 * Servlet implementation class updateDonerInfoServlet
 */
@WebServlet("/updateDonerInfoServlet")
public class updateDonerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		//HttpSession session =request.getSession();
		//String c=(String) session.getAttribute("n");
		String n=request.getParameter("name");
		//System.out.println(c);
		//String a=request.getParameter("b");
		String a=request.getParameter("age");
		String add=request.getParameter("add");
		String city=request.getParameter("city");
		String state =request.getParameter("state");
		String country =request.getParameter("country");
		String cno  =request.getParameter("cno");
		String email=request.getParameter("email");
		String ld  =request.getParameter("lddate");
		String date=request.getParameter("dob");
		String r  =request.getParameter("remark");
		//String email=request.getParameter("e");
	dbcon	db =dbcon.getConnection();
		String s="update  bloodbankdonor set donor_age='"+a+"',donor_address='"+add+"',donor_city='"+city+"',donor_state='"+state+"',donor_country='"+country+"',donor_mob='"+cno+"',donor_email='"+email+"',donor_lastddate='"+ld+"',donor_date ='"+date+"',donor_remark='"+r+"' where donor_username='" +n+ "'";
		db.insertOrUpdate(s);
		response.sendRedirect("BloodBank/BloodBank.jsp");
	}

}
