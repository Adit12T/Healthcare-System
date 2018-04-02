package employe;
import database.dbcon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		String id=request.getParameter("id");
		//System.out.println(id);
		 dbcon db = dbcon.getConnection();
		 String sql="delete from employee Where emp_id="+id+"";
		 db.insertOrUpdate(sql);
		 String sql1="delete from employee_experience Where emp_id="+id+"";
		 db.insertOrUpdate(sql1);
		 String sql2="delete from employee_specialization Where emp_id="+id+"";
		 db.insertOrUpdate(sql2);
		 String sql3="delete from employee_profetional_information Where emp_id="+id+"";
		 db.insertOrUpdate(sql3);
		 //response.sendRedirect("employe/empsearch.jsp");
		 response.sendRedirect("Employee/SearchEmp1.jsp?msg=ss");
	}

}
