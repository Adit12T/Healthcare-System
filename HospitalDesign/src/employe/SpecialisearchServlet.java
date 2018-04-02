package employe;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import database.dbcon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class SpecialisearchServlet
 */
@WebServlet("/SpecialisearchServlet")
public class SpecialisearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpecialisearchServlet() {
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
		// TODO Auto-generated method stub
		
		
		
		
		try { ArrayList ls = new ArrayList();
			dbcon db = dbcon.getConnection();
			String n= request.getParameter("specialization");
			String n1=request.getParameter("s1");
			//String n2=request.getParameter("id");
			String n3=request.getParameter("name");
			
			//select  A.emp_name from  employee A,employee_specialization AB where A.emp_id=AB.emp_id and (A.emp_id=null  or A.emp_name='rohit' or  AB.specialization='consultant orthodontist')   ;
			//String sql = "select * from  employee A,employee_specialization AB where A.emp_id=AB.emp_id and (A.emp_id="+n1+" or A.emp_name='"+n2+"'or AB.specialization='"+n+"')";
             if(n1.equals("search"))
             {
			String sql="select emp_id from employee_specialization where specialization='"+n+"'";
			ResultSet rs = db.select(sql);
			int s1;
			
			
			while (rs.next()) {
				
				Class.forName("com.mysql.jdbc.Driver");

				java.sql.Connection cn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/hmt", "root", "root");
						
				s1=Integer.parseInt( rs.getString("emp_id"));
				
				String sql1="select * from employee where emp_id='"+s1+"'";
				
				
				
				
				java.sql.Statement st =  cn.createStatement();
				ResultSet rs1 = st.executeQuery(sql1);
				while(rs1.next())
				{
					//String e=rs1.getString(2);
				
				Map m = new HashMap();
				m.put("id",rs1.getInt(1));
				m.put("name", rs1.getString(2));
				m.put("dob", rs1.getString(3));
				m.put("gender", rs1.getString(8));
				m.put("address", rs1.getString(9));
				m.put("ename", rs1.getString("emp_type"));
				m.put("email", rs1.getString(15));
				m.put("dname", rs1.getString(18));
				//m.put("ename", rs.getString(14));
				ls.add(m);
				
				
			
			//System.out.println(ls);
			}}}
            /* if(n1.equals("Go"))
             {String sql="select * from employee where emp_id="+n2+"";
 			ResultSet rs = db.select(sql);
 			while(rs.next()){
 				Map m = new HashMap();
				m.put("id",rs.getInt(1));
				m.put("name", rs.getString(2));
				m.put("dob", rs.getString(3));
				m.put("gender", rs.getString(8));
				m.put("address", rs.getString(9));
				m.put("email", rs.getString(15));
				m.put("dname", rs.getString(18));
				ls.add(m);
 				
 			}
             
             }*/else
            // if(n1.equals("Go"))
             {String sql="select * from employee where emp_type='"+n3+"'";
 			ResultSet rs = db.select(sql);
 			while(rs.next()){
 				Map m = new HashMap();
				m.put("id",rs.getInt(1));
				m.put("name", rs.getString(2));
				m.put("dob", rs.getString(3));
				m.put("gender", rs.getString(8));
				m.put("address", rs.getString(9));
				m.put("ename", rs.getString(14));
				m.put("email", rs.getString(15));
				m.put("dname", rs.getString(18));
				
				ls.add(m);
 				
 			}
             
             }
             
             
             request.setAttribute("list", ls);
			RequestDispatcher rd = request.getRequestDispatcher("Employee/SearchEmp1.jsp");
						
				rd.forward(request, response);
			
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
