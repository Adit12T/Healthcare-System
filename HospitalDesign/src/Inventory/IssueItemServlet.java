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
 * Servlet implementation class IssueItemServlet
 */
@WebServlet("/IssueItemServlet")
public class IssueItemServlet extends HttpServlet {
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
				HttpSession session=request.getSession();
				int vno=0;
				//String issueto = request.getParameter("name");
				String personname =(String) request.getParameter("pname");
				System.out.println(personname);
				String company = (String)(request.getParameter("mcompany"));
				System.out.println(company);
				String itemtype =(String)request.getParameter("type");
				String itemname = (String)request.getParameter("name");
				String itemdate = request.getParameter("date");
				int tquantity =Integer.parseInt(request.getParameter("tq"));
				InventoryBean i = new InventoryBean();
				//int issueq= Integer.parseInt(request.getParameter("iq"));
				//int tamount = Integer.parseInt(request.getParameter("tamount"));
				
System.out.println(personname);
System.out.println(company);
System.out.println(itemtype);
System.out.println(itemname);
System.out.println(itemdate);
System.out.println(tquantity);
System.out.println(request.getParameter("iq"));
System.out.println(request.getParameter("tamount"));

				int s=0;
				
				try {

					
				/*	if(issueq!=0&&issueq<tquantity){


					
					
						boolean j =true; i.saveissuedata(vno,  personname,  itemtype, itemname,company, itemdate, 
								 issueq,  tamount);
					response.sendRedirect("Inventary/IssueItem1.jsp?msg= submitted successfully");	
					
					}
*/				
				}
				catch (Exception e) {
					System.out.println(e);
				}

			

		}

		
		
		// TODO Auto-generated method stub
	/*	dbcon db=dbcon.getConnection();
		int vno=0;;
		String issueto = request.getParameter("name");
		String personname = request.getParameter("name");
		String company = (request.getParameter("mcompany"));
		String itemtype = request.getParameter("type");
		String itemname = request.getParameter("iname");
		String itemdate = request.getParameter("date");
		int rquantity = Integer.parseInt(request.getParameter("rq"));
		
		int issueq= Integer.parseInt(request.getParameter("sq"));
		int tamount = Integer.parseInt(request.getParameter("tamount"));
		int pamount = Integer.parseInt(request.getParameter("pamount"));
		
		int penamount=tamount-pamount;
		int pendingq=rquantity-issueq;
		int s=0;
		
		try {

			InventoryBean i = new InventoryBean();
			
			String sql="select * from stock where item_type='"+itemtype+"' and item_name='"+itemname+"'";
			ResultSet rs=db.select(sql);
			while(rs.next())
			{
				s=rs.getInt("total_quantity");
				
				
			}
			if(rquantity<s)
			{
				boolean j = i.saveissuedata(vno, issueto, personname,  itemtype, itemname,company, itemdate, 
						rquantity, issueq, pendingq, tamount, pamount, penamount);
			response.sendRedirect("Inventary/IssuedItem.jsp?msg= submitted successfully");	
			}
			else{
				response.sendRedirect("Inventary/IssuedItem.jsp?msg=sory!");

		}
		}
		catch (Exception e) {
			System.out.println(e);
		}
*/
	}


