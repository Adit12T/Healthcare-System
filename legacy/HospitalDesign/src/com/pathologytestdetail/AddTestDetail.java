package com.pathologytestdetail;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

import database.DataBean;

/**
 * Servlet implementation class AddTestDetail
 */
@WebServlet("/AddTestDetail")
public class AddTestDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tname = request.getParameter("tname");
		
		String tcontent = request.getParameter("tcontent");
		String srange = request.getParameter("srange");
		String erange = request.getParameter("erange");
		int tcost = Integer.parseInt(request.getParameter("tcost"));
		
		try {
			if (tname != null  & tcontent != null & srange != null & erange != null ) {
				DataBean b = new DataBean();
				boolean flag = b.savePathologyTestDetail(tname,tcontent,srange,erange,tcost);
				if (flag) {
					
					
								
					
					response.sendRedirect("Pathology/addtestdetail.jsp?msg="+b.m);
					
				} else {
					response.sendRedirect("Pathology/addtestdetail.jsp?msg="+b.m);
					
				}

			}
		} catch (Exception e) {
			System.out.println(e);
		}// TODO Auto-generated method stub
	}

}
