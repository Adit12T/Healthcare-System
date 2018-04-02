package com.disease;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.conn.MyCon;

public class Diseasedao {
	public static boolean saveDisease(Disease_Beans d) {

		try {
			Connection con = MyCon.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into diseaseinformation values(0,'"
							+ d.getDiseaseName()
							+ "','"
							+ d.getDiseaseDepartment() + "')");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

	public static boolean updateDisease(Disease_Beans d) {

		try {
			Connection con = MyCon.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update `diseaseinformation` set `disease_name`='"
							+ d.getDiseaseName()
							+ "',`disease_department`='"
							+ d.getDiseaseDepartment()
							+ "' where `diseaseid`='" + d.getDiseaseid() + "'");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

	public static void removeDisease(int did) {
		try {
			Connection con = MyCon.getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from diseaseinformation where `diseaseid`='"
							+ did + "'");
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static ArrayList<Disease_Beans> slectDisease() {
		ArrayList<Disease_Beans> list = new ArrayList<>();
		try {
			Connection con = MyCon.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * from diseaseinformation ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Disease_Beans d = new Disease_Beans();
				d.setDiseaseid(rs.getInt(1));
				d.setDiseaseName(rs.getString(2));
				d.setDiseaseDepartment(rs.getString(3));
				list.add(d);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

	public static ArrayList<Disease_Beans> slectDiseaseById(int did) {
		ArrayList<Disease_Beans> list = new ArrayList<>();
		try {
			Connection con = MyCon.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * from diseaseinformation where `diseaseid`='"
							+ did + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Disease_Beans d = new Disease_Beans();
				d.setDiseaseid(rs.getInt(1));
				d.setDiseaseName(rs.getString(2));
				d.setDiseaseDepartment(rs.getString(3));
				list.add(d);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

}
