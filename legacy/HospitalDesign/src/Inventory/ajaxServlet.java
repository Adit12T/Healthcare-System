package Inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class ajaxServlet
 */
@WebServlet("/ajaxServlet")
public class ajaxServlet extends HttpServlet {
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
		dbcon db=dbcon.getConnection();
		System.out.println("Come ---------------------");
		String state1=request.getParameter("t1");
		 // String state2=request.getParameter("t2");
		  String sql="select * from stock where item_type='"+state1+"'";
	      ResultSet rs=db.select(sql);
	    		  String  x="";
	    		  try{
	      while(rs.next())
	        {
	           x +=rs.getString(3)+":";
	    	  
	        }
	    		  }
	    		  catch (Exception e) {
					// TODO: handle exception
				}
	      PrintWriter out=response.getWriter();
	      out.print(x);
	}

}
