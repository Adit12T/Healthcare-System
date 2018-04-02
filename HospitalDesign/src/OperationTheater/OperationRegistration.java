package OperationTheater;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OperationRegistration
 */
@WebServlet("/OperationRegistration")
public class OperationRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OperationRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String value = request.getParameter("value");
		OperationRegistrationBean registrationBean = new OperationRegistrationBean();
		registrationBean.setId(0);
		registrationBean.setOp_date(request.getParameter("o_date"));
		registrationBean.setOp_time(request.getParameter("o_time"));
		registrationBean.setOp_type(request.getParameter("operation_type"));
		registrationBean.setOp_name(request.getParameter("op_name"));
		registrationBean.setPatient_id(Integer.parseInt(request
				.getParameter("pp_id")));
		registrationBean.setTotal_cost(Integer.parseInt(request
				.getParameter("o_cost")));
		registrationBean.setPaid_cost(Integer.parseInt(request
				.getParameter("ot_paid_amount")));
		registrationBean.setSurgeon_name(request.getParameter("s_name"));
		registrationBean.setAsurgeon_name(request.getParameter("as_name"));
		registrationBean.setNurse_name(request.getParameter("n_name"));
		registrationBean.setOt_boy_name(request.getParameter("ot_boy_name"));
		registrationBean.setOp_theater(request.getParameter("op_theater"));
		OperationDao operationDao = new OperationDao();

		if (value.equalsIgnoreCase("add")) {
			int flag = operationDao.OperationReg(registrationBean);
			HttpSession hs = request.getSession();
			if (flag != 0) {
				hs.setAttribute("msg", "Registration Successfully....");
				response.sendRedirect("patientmanager/OperationRegistration.jsp");

			} else {
				hs.setAttribute("msg", "Not registered...");
				response.sendRedirect("patientmanager/OperationRegistration.jsp");
			}
		} else {
			int id=Integer.parseInt(request.getParameter("oid"));
			registrationBean.setId(id);
			int a=operationDao.updateOperationDetail(registrationBean);
			if(a>0)
				response.sendRedirect("patientmanager/UpdateOperationSchedule.jsp?oid="+id+"&msg='Success'");
			else
				response.sendRedirect("patientmanager/UpdateOperationSchedule.jsp?oid="+id+"&msg='Please Reset value'");
		}

	}
}
