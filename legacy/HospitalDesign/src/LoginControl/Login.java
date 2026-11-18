package LoginControl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;

import database.dbcon;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		String username="",password="";
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String u_type=request.getParameter("user_type");
		String sql="select * from login_control where control_type='"+u_type+"'";
		dbcon db=dbcon.getConnection();
		ResultSet rs=db.select(sql);
		try {
			while(rs.next()){
				username=rs.getString(1);
				password=rs.getString(3);
				if(rs.getString(2).equalsIgnoreCase(uname)){
					if(rs.getString(4).equals(pass)){
						
						request.getSession().setAttribute("username", uname);
						if(u_type.equals("Admin")){
							request.getSession().setAttribute("adminusername", uname);
							response.sendRedirect("AdminHome.jsp");
						}else if(u_type.equals("Reception")){
							request.getSession().setAttribute("recusername", uname);
							
							Date d=new Date();
						    SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
							String datevalue=format.format(d);
							Connection con=MyCon.getConnection();
							String sql1="select c_date from employee";
							PreparedStatement ps=con.prepareStatement(sql1);
							/*ps.setString(1, datevalue);*/
							ResultSet rs1=ps.executeQuery();
							String st="";
							while(rs1.next()){
								st=rs1.getString(1);
							}
							if(!st.equals(datevalue)){
								String sql2="update employee set status=?,c_date=?";
								PreparedStatement ps1=con.prepareStatement(sql2);
								ps1.setInt(1, 0);
								ps1.setString(2,datevalue);
								ps1.executeUpdate();
							}
							
							response.sendRedirect("ReceptionHome.jsp");
						}else if(u_type.equals("BloodBank")){
							request.getSession().setAttribute("bloodusername", uname);
							response.sendRedirect("BloodBankHome.jsp");
						}else if(u_type.equals("Pathology")){
							request.getSession().setAttribute("pathusername", uname);
							response.sendRedirect("PathologyHome.jsp");
						}else if(u_type.equals("Billing_Account")){
							request.getSession().setAttribute("billusername", uname);
							response.sendRedirect("BillingAccountHome.jsp");
						}
						
					}else{
						request.setAttribute("msg", "PLease Enter Correct Password....");
						RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
					}
				}else{
					request.setAttribute("msg", "PLease Enter Correct Username....");
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print("Amit Amiy");
		}
		
	}

}
