package Inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbcon;

/**
 * Servlet implementation class DeleteItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

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
		int quantity=0;
		int d=0;
		int k=0;
String sql2="select * from stock";
ResultSet rs=db.select(sql2);
try{
while (rs.next()){
	d=rs.getInt("total_quantity");
	
}}catch (Exception e) {
	// TODO: handle exception
}
		//String edate=(String)(session.getAttribute("exdate"));
		//System.out.println(date);
		//int sr=Integer.parseInt(request.getParameter("s1"));
		int q=Integer.parseInt(request.getParameter("s2"));
		String name=request.getParameter("s4");
		String edate=request.getParameter("s1");
		String type=request.getParameter("s3");
		String company=request.getParameter("s5");
		int quant=q-d;
		if(quant>0){k=quant;}
		else{k=0;}
		//System.out.println(sr);
		String sql="update stock set total_quantity="+k+" where item_name='"+name+"'and item_type='"+type+"' and mfg_company='"+company+"'";
		int i=db.insertOrUpdate(sql);
		System.out.println(sql);
		String sql1="delete from itemsupplied where item_expiry_date='"+edate+"' and supplied_item_name='"+name+"'and supplied_item_type='"+type+"' and mfg_company='"+company+"'";
		int j=db.insertOrUpdate(sql1);
		
		
		response.sendRedirect("Inventary/ExpireItem.jsp");
	}

}
