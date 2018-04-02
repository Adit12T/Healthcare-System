package Inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewIssueServletSaveData
 */
@WebServlet("/NewIssueServletSaveData")
public class NewIssueServletSaveData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewIssueServletSaveData() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name=request.getParameter("name");
		String total=request.getParameter("total");
		HttpSession session=request.getSession();
		if(Name!=null & Name!=""){
		NewissueitemDao d;
		if(session.getAttribute("i")!=null){
			
			d=(NewissueitemDao)session.getAttribute("i");
			d.Name=Name;
			d.Total=total;
			NewIssueServletSaveDataDao n=new NewIssueServletSaveDataDao();
			boolean f =n.saveData(d,Name,total);
			if(f){
				d.billno=n.getbill(Name, total);
				response.sendRedirect("Inventary/newissueitem2.jsp?msg=Success");
				}
			else
				response.sendRedirect("Inventary/newissueitem1.jsp?msg=error");
		}
		}
		else{
			response.sendRedirect("Inventary/newissueitem1.jsp?msg=Enter Name");
		}
	}
}
