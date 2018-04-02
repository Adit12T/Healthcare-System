package OperationTheater;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;

import database.dbcon;

/**
 * Servlet implementation class AddOperation
 */
@WebServlet("/AddOperation")
public class AddOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOperation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String o_type=request.getParameter("o_type");
		String o_name=request.getParameter("o_name");
		String o_cost=request.getParameter("o_cost");
		String sql="insert into operation_manager values(?,?,?,?)";
		Connection con=MyCon.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setString(2, o_type);
			ps.setString(3, o_name);
			ps.setString(4, o_cost);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
