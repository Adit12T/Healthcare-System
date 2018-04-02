package OperationTheater;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewOperationSchedule
 */
@WebServlet("/ViewOperationSchedule")
public class ViewOperationSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOperationSchedule() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ViewOperationScheduleBean operationScheduleBean=new ViewOperationScheduleBean();
		operationScheduleBean.setDate_from(request.getParameter("date_from"));
		operationScheduleBean.setDate_to(request.getParameter("date_to"));
		
		ViewOperationScheduleDao  dao=new ViewOperationScheduleDao();
	//1	dao.selectSchedule();
		response.sendRedirect("patientmanager/ViewOperationSchedule.jsp");
		
	}

}
