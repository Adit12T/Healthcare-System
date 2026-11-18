package OperationTheater;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;

/**
 * Servlet implementation class GetOperationType
 */
@WebServlet("/GetOperationType")
public class GetOperationType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOperationType() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String buffer="<select name='operation_type' id='o_type' onchange='getOname(this)'><option>Select Operation Type</option>";
		String sql="select distinct operation_type from operation_manager";
		try {
			PreparedStatement ps=MyCon.getConnection().prepareStatement(sql);
		ResultSet	rs=ps.executeQuery();
		while(rs.next()){
			
			buffer=buffer+"<option value='"+rs.getString("operation_type")+"'>"+rs.getString("operation_type")+"</option>";
		}
		buffer=buffer+"</select>";
		
		response.getOutputStream().print(buffer);
	//	out.print(buffer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print(e);
		}
	
	}

}
