package com.patient;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MyCon;
import com.dao.Patientdao;

/**
 * Servlet implementation class Delete_Patient
 */
@WebServlet("/Delete_Patient")
public class Delete_Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("hello");
		int pid = Integer.parseInt(request.getParameter("id"));
		boolean f=Patientdao.deletePatient(pid);
		if(f)
			response.getWriter().print("<div align='center'>successfully</div>");
		else
			response.getWriter().print("<div align='center'>No record Found</dive>");
		
	}

}
