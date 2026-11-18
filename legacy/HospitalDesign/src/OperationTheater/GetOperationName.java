package OperationTheater;

import java.io.IOException;
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
 * Servlet implementation class GetOperationName
 */
@WebServlet("/GetOperationName")
public class GetOperationName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOperationName() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String o_type=request.getParameter("operation_type");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String buffer="<option>Select Operation Name</option>";
		String sql="select id,operation_name from operation_manager where operation_type=?";
		try {
			PreparedStatement ps=MyCon.getConnection().prepareStatement(sql);
			ps.setString(1,o_type);
		ResultSet	rs=ps.executeQuery();
		while(rs.next()){
			
			buffer=buffer+"<option value='"+rs.getString("operation_name")+"'>"+rs.getString("operation_name")+"</option>";
		}
		
		out.print(buffer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print(e);
		}

		}
	
	}


