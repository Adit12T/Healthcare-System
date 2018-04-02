package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class dbcon {

	static private Connection con;
	static private dbcon db;
	private ResultSet rs;
	private Statement st;

	private dbcon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/hmt", "root", "root");
			st = con.createStatement();

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public static dbcon getConnection() {
		try {
			if (db == null) {
				db = new dbcon();
			}
		} catch (Exception e) {
			System.out.println("connection error" + e);
		}
		return db;

	}

	public ResultSet select(String sql) {

		try {

			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public int insertOrUpdate(String sql) {
		int a = 0;
		System.out.println(sql);
		try {
			a = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	public static Connection getPreparedStatement() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/hmt", "root", "root");

		} catch (Exception e) {
			// TODO: handle exception
		}
		return con;
	}
}
