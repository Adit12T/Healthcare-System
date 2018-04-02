package employe;
import database.dbcon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbcon;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		
		HttpSession session=request.getSession();
		 String id1=(String) session.getAttribute("ids");
		// session.setAttribute("n", id1);
		 String add=request.getParameter("add");
		 String mno=request.getParameter("mob");
		 String tno=request.getParameter("teno");
		 String mstatus=request.getParameter("mstatus");
		 String email=request.getParameter("email");
		 String city=request.getParameter("city");
		 String state=request.getParameter("state");
		 String country=request.getParameter("country");
		 int salary=Integer.parseInt(request.getParameter("salary"));
		 String image=request.getParameter("image");
		 String exp=request.getParameter("exp");
		 //String last=request.getParameter("last_emp");
		 String post=request.getParameter("last_post");
		 
		 String bname=request.getParameter("bankname");
		 String bno=request.getParameter("actno");
		 String pfno=request.getParameter("pfno");
		 String panno=request.getParameter("panno");
		 
		 
		 //System.out.println(id1);
		 dbcon db = dbcon.getConnection();
		 
		//RegistrationBean b = new RegistrationBean();
		 String sql = "update  employee set emp_address='"+add+"',emp_mobile='"+mno+"',emp_telephone='"+tno+"',emp_marrialstatus='"+mstatus+"',emp_email='"+email+"',emp_city='"+city+"',emp_state='"+state+"',emp_country='"+country+"',emp_salary="+salary+",emp_image='"+image+"' where emp_id="+id1+"";
		 db.insertOrUpdate(sql);
		 String sql1 = "update  employee_experience set post='"+post+"',experience='"+exp+"' where emp_id="+id1+"";
		 db.insertOrUpdate(sql1);
		// String sql2 = "update  employee_account set bank_name='"+bname+"',bank_account_no='"+bno+"',pf_no='"+pfno+"',pan_no='"+panno+"' where emp_id="+id1+"";
		// db.insertOrUpdate(sql2);
		//response.sendRedirect("employe/update.jsp");
		//response.sendRedirect("employe/update.jsp?msg=ss");
			
	}

}
