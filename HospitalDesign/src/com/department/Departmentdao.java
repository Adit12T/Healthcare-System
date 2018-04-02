package com.department;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.conn.MyCon;

public class Departmentdao {
	public static boolean saveDepartment(String d) {

		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into department values(0,'"
							+d+ "')");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static boolean updateDepartment(Department_Beans d) {

		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("update `department` set `department_name`='"
							+ d.getDepartmentName()
							+ "' where `departmentid`='"
							+ d.getDepartmentid()
							+ "'");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static void removeDepartment(int did) {
		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("delete from `department` where `departmentid`='"
							+ did + "'");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static ArrayList<Department_Beans> selectDepartment() {
		Connection con = MyCon.getConnection();
		ArrayList<Department_Beans> list = new ArrayList<>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from `department");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Department_Beans d = new Department_Beans();
				d.setDepartmentid(rs.getInt(1));
				d.setDepartmentName(rs.getString(2));
				list.add(d);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}
