package attendance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;

/**
 * Servlet implementation class TakeAttendance
 */
@WebServlet("/TakeAttendance")
public class TakeAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		try {
			int emp_id=Integer.parseInt(request.getParameter("emp_id"));
			String at_status=request.getParameter("at_status");
			Connection con=MyCon.getConnection();
			Date date2=new Date();
			int year1=date2.getYear() + 1900;
			int month1=date2.getMonth()+1;
			 Date d=new Date();
			  SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			String datevalue=format.format(d);
			String sql="insert into attendance values(?,?,?,?,?,?)";

				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, 0);
				ps.setInt(2, emp_id);
				ps.setInt(3,year1);
				ps.setInt(4, month1);
				ps.setString(5, datevalue);
				ps.setString(6, at_status);
				int flag=ps.executeUpdate();
				if(flag>0){
					String sql2="update employee set status=? where emp_id=?";
					PreparedStatement ps1=con.prepareStatement(sql2);
					ps1.setInt(1, 1);
					ps1.setInt(2,emp_id);
					ps1.executeUpdate();
					response.sendRedirect("NewAttendance/TakeAttendance.jsp?msg=Update Successful..");
				}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
