package BloodBank;
import database1.dbcon;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.Session;

/**
 * Servlet implementation class UpdatebbankServlet
 */
@WebServlet("/UpdatebbankServlet")
public class UpdatebbankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatebbankServlet() {
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
		String c=request.getParameter("t");
		int tq=0;
		System.out.println(c);
		
		String a=request.getParameter("action");
		int a1=Integer.parseInt(request.getParameter("q"));
		dbcon db= new dbcon();
		int q1= BloodBankBean.getbloodbyname(c);
		if (a.endsWith("Add")) {
			 tq=a1+q1;	
		}
		else{
			 tq=q1-a1;
		}
		try{
		String s="update  bloodbank_manager set bloodquantity ="+tq+" where bloodtypename='" +c+ "'";
		db.insertOrUpdate(s);
		//response.sendRedirect("BloodSearchServlet");
		}catch (Exception e) {
			// TODO: handle exception
		}
		response.getWriter().print("<div align='center'><font color='green'><h3>Successfully Perform.........</h3></font></div>");
		
		//response.sendRedirect("BloodSearchServlet");

	}

}
