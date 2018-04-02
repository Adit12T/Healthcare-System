package Inventory;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewissueitemServelt
 */
@WebServlet("/NewissueitemServelt")
public class NewissueitemServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewissueitemServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String name=request.getParameter("name");
		String quantity=request.getParameter("quantity");
		String totalcost=request.getParameter("total");
	
		System.out.println("-----------------------------------");
		HttpSession session=request.getSession();
		NewissueitemDao d; 
		if(session.getAttribute("i")==null){
			d=new NewissueitemDao();
			d.save(name, quantity, totalcost);
			session.setAttribute("i",d);
			}
			else{
				d=(NewissueitemDao)session.getAttribute("i");
		
				d.save(name, quantity, totalcost);
			}
			response.sendRedirect("Inventary/newissueitem.jsp");
			
		
		
		
	}

}
