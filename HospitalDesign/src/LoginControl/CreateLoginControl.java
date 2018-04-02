package LoginControl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;

import database.dbcon;

/**
 * Servlet implementation class CreateLoginControl
 */
@WebServlet("/CreateLoginControl")
public class CreateLoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateLoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con=MyCon.getConnection();
		String emp_name="";
		int emp_id=Integer.parseInt(request.getParameter("emp_id"));
		String sql3="select emp_name from employee where emp_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql3);
			ps.setInt(1,emp_id);
			ResultSet rs3=ps.executeQuery();
			while(rs3.next()){
				emp_name=rs3.getString(1);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		dbcon db=dbcon.getConnection();
		String login_control=request.getParameter("login_control");
		String pass=request.getParameter("pass");
		String c_pass=request.getParameter("c_pass");
		String status="";
		
		String sql1="select control_type from login_control where control_type='"+login_control+"'";
		ResultSet rs1=db.select(sql1);
		try {
			while(rs1.next()){
				status=rs1.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		String sql="";
		if(pass.equals(c_pass)){
			
			if(status.equals("")){
			
		     sql="insert into login_control values("+emp_id+",'"+emp_name+"','"+login_control+"','"+pass+"')";
			}
			else{
			sql="update login_control set emp_id="+emp_id+",emp_name='"+emp_name+"',control_type='"+login_control+"',password='"+pass+"'";	
			}
		int flag=db.insertOrUpdate(sql);
		if(flag>0){
			response.getWriter().print("Add Successfully...");
		}
		else{
			response.getWriter().print("Please try Again...");
		}
		}
		else{
			response.getWriter().print("Please insert Correct Password..");
		}
	}

}
