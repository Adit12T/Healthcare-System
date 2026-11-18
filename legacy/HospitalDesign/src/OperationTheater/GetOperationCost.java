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
 * Servlet implementation class GetOperationCost
 */
@WebServlet("/GetOperationCost")
public class GetOperationCost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOperationCost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String op_name=request.getParameter("op_name");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String buffer="";
		String sql="select operation_cost from operation_manager where operation_name=?";
		try {
			PreparedStatement ps=MyCon.getConnection().prepareStatement(sql);
			ps.setString(1,op_name);
		ResultSet	rs=ps.executeQuery();
		while(rs.next()){
			
			buffer="<input type='text'name='o_cost'  readonly='readonly' value='"+rs.getString("operation_cost")+"'>";
		}
		
		out.print(buffer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print(e);
		}

		}
	
	
	}


