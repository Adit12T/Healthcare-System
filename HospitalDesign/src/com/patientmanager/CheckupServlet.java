package com.patientmanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckupServlet
 */
@WebServlet("/CheckupServlet")
public class CheckupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckupServlet() {
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
		String pid=request.getParameter("pid");
		String pn=request.getParameter("pn");
		String dr=request.getParameter("dr");
		String nr=request.getParameter("nr");
		String re=request.getParameter("re");
		String cost=request.getParameter("cost");
		String pa=request.getParameter("pa");
		if(pid !="" &&dr!=""&& nr!=""&& re!="" && cost!=""){
			CheckupDao cd=new CheckupDao();
			boolean b=cd.insert(pid, dr, nr, re, cost);
			if(b){
				response.sendRedirect("patientmanager/checkupdaily.jsp?pid="+pid+"&pname="+pn+"&pdatea="+pa+"&msg=success");
			return ;}
		}
		response.sendRedirect("patientmanager/checkupdaily.jsp?pid="+pid+"&pname="+pn+"&pdatea="+pa+"&msg=unsuccess please try again");
		
	}

}
