package BloodBank;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbcon;

/**
 * Servlet implementation class DonorSearch
 */
@WebServlet("/DonorSearch")
public class DonorSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu
		String bg=request.getParameter("bloodgroup");
		System.out.println(bg);
		String city=request.getParameter("city");
		dbcon db=dbcon.getConnection();
		String sql="select donor_name,donor_dob,donor_gender,donor_age,donor_bloodgroup,donor_mob,donor_address,donor_city,donor_email,donor_lastddate from bloodbankdonor where donor_bloodgroup='"+bg+"' and donor_city='"+city+"'";
		ResultSet rs=db.select(sql);
		ArrayList ls=new ArrayList();
		ArrayList ls1=new ArrayList();
		try{
		while(rs.next())
		{Map m=new HashMap();
		   // m.put("id",rs.getInt("donorid"));
		    m.put("name", rs.getString("donor_name"));
		    m.put("dob", rs.getString("donor_dob"));
		    m.put("gender",rs.getString("donor_gender"));
		    m.put("age", rs.getString("donor_age"));
		    m.put("bloodgroup", rs.getString("donor_bloodgroup"));
		    m.put("mobile", rs.getString("donor_mob"));
		    m.put("address",rs.getString("donor_address"));
		    m.put("city", rs.getString("donor_city"));
		    //m.put("state", rs.getString("donor_state"));
		    m.put("email", rs.getString("donor_email"));
		    m.put("lastdate",rs.getString("donor_lastddate"));
		   // m.put("age", rs.getString("doner_age"));
		 
		    ls.add(m);
		    System.out.println(ls);
		    request.setAttribute("list", ls);
		    

		}
		
		RequestDispatcher rd=request.getRequestDispatcher("BloodBank/SearchBloodDoner.jsp");
		rd.forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}
