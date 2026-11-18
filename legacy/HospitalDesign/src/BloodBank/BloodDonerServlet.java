package BloodBank;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BloodDonerServlet
 */
@WebServlet("/BloodDonerServlet")
public class BloodDonerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubd
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id =0;
		
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String bloodgroup = request.getParameter("bloodgroup");
		String weight = request.getParameter("weight");
	    String mobile = request.getParameter("cno");
	    
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String email = request.getParameter("email");
		String remark = request.getParameter("remark");
		String date = request.getParameter("date");
		String lastdate = request.getParameter("lddate");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		String confirmpwd = request.getParameter("cpwd");

		try {
			
			
				 BloodBankBean b = new BloodBankBean();
				
				
				
				boolean i = b.savedonerData(id, name, dob,gender, age, bloodgroup, weight, mobile, address, city, state, country, email, remark, date, lastdate, quantity, username, password, confirmpwd);		//dbcon db = dbcon.getConnection();
				//String s="select max(emp_id )from employee ";
				//ResultSet rs = db.select(s);
				
				//while (rs.next()) {
					//s1=rs.getInt(1);
					//System.out.println(s1);
				//}
				//boolean j=b.saveData1(expid, s1, lastemp, lastpost, PreSalary, exp);
				//boolean k=b.saveData2(profid, s1, qtype, cname, uname, clgname,stream,passyear,percentage);
				if(i){
					response.getWriter().print("Registered Successfully....");
				}
		}
			
			

catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
