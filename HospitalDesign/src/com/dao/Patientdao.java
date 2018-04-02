package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.beans.Patient;
import com.conn.MyCon;

public class Patientdao {
	// Current date*****************
	static Date dNow = new Date();
	static SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
	static String date = ft.format(dNow);

	// End Date*********************
	static Connection con = MyCon.getConnection();

	public static boolean addPatient(Patient p) {
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, p.getPatientName());
			ps.setString(3, p.getPatientGender());
			ps.setString(4, p.getPatientAge());
			ps.setString(5, p.getPatientMaritalStatus());
			ps.setString(6, p.getPatientFatherHusband());
			ps.setString(7, p.getPatientAddress());
			ps.setString(8, p.getPatientCity());
			ps.setString(9, p.getPatientReligion());
			ps.setString(10, p.getPatientMobile());
			ps.setString(11, p.getPatientTelephone());
			ps.setString(12, p.getPatientBloodgroup());
			ps.setString(13, p.getPatientDisease());
			ps.setString(14, p.getPatientDateofregistraton());

			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {

		}
		return false;

	}

	public static boolean UpdatePatient(Patient p) {
		try {
			PreparedStatement ps = con
					.prepareStatement("update `patient` set `patient_name`=?,`patient_gender`=?,`patient_age`=?,`patient_marital_status`=?,`patient_father_husband`=?,`patient_address`=?,`patient_city`=?,`patient_religion`=?,`patient_mobile`=?,`patient_telephone`=?,`patient_bloodgroup`=?,`patient_disease`=?,`patient_dateofregistraton`=? where `patient_registrationno`=?");

			ps.setString(1, p.getPatientName());
			ps.setString(2, p.getPatientGender());
			ps.setString(3, p.getPatientAge());
			ps.setString(4, p.getPatientMaritalStatus());
			ps.setString(5, p.getPatientFatherHusband());
			ps.setString(6, p.getPatientAddress());
			ps.setString(7, p.getPatientCity());
			ps.setString(8, p.getPatientReligion());
			ps.setString(9, p.getPatientMobile());
			ps.setString(10, p.getPatientTelephone());
			ps.setString(11, p.getPatientBloodgroup());
			ps.setString(12, p.getPatientDisease());
			ps.setString(13, p.getPatientDateofregistraton());
			ps.setInt(14, p.getPatientRegistrationno());

			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {

		}
		return false;
	}

	public static boolean deletePatient(int pid) {
		try {
			PreparedStatement ps = con
					.prepareStatement("delete from `patient` where `patient_registrationno`="
							+ pid + "");
			PreparedStatement ps1 = con
					.prepareStatement("delete from `patient_inside` where `patient_id`='"
							+ pid + "'");
			PreparedStatement ps2 = con
					.prepareStatement("delete from `patient_outside` where `patient_registrationno`="
							+ pid + "");

			int a = ps.executeUpdate();
			ps1.executeUpdate();
			ps2.executeUpdate();
			if (a > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public static ArrayList<Patient> getPatientByID(int pid) {
		ArrayList<Patient> list = new ArrayList<Patient>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from Patient where patient_registrationno="
							+ pid + "");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Patient p = new Patient();

				p.setPatientRegistrationno(rs.getInt("patient_registrationno"));
				p.setPatientName(rs.getString("patient_name"));
				p.setPatientGender(rs.getString("patient_gender"));
				p.setPatientAge(rs.getString("patient_age"));
				p.setPatientMaritalStatus(rs
						.getString("patient_marital_status"));
				p.setPatientFatherHusband(rs
						.getString("patient_father_husband"));
				p.setPatientAddress(rs.getString("patient_address"));
				p.setPatientCity(rs.getString("patient_city"));
				p.setPatientReligion(rs.getString("patient_religion"));
				p.setPatientMobile(rs.getString("patient_mobile"));
				p.setPatientTelephone(rs.getString("patient_telephone"));
				p.setPatientBloodgroup(rs.getString("patient_bloodgroup"));
				p.setPatientDisease(rs.getString("patient_disease"));
				p.setPatientDateofregistraton(rs
						.getString("patient_dateofregistraton"));

				list.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public static ArrayList<Patient> getPatientByName(String pname) {
		ArrayList<Patient> list = new ArrayList<Patient>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from patient where patient_name='"
							+ pname + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Patient p = new Patient();

				p.setPatientRegistrationno(rs.getInt("patient_registrationno"));
				p.setPatientName(rs.getString("patient_name"));
				p.setPatientGender(rs.getString("patient_gender"));
				p.setPatientAge(rs.getString("patient_age"));
				p.setPatientMaritalStatus(rs
						.getString("patient_marital_status"));
				p.setPatientFatherHusband(rs
						.getString("patient_father_husband"));
				p.setPatientAddress(rs.getString("patient_address"));
				p.setPatientCity(rs.getString("patient_city"));
				p.setPatientReligion(rs.getString("patient_religion"));
				p.setPatientMobile(rs.getString("patient_mobile"));
				p.setPatientTelephone(rs.getString("patient_telephone"));
				p.setPatientBloodgroup(rs.getString("patient_bloodgroup"));
				p.setPatientDisease(rs.getString("patient_disease"));
				p.setPatientDateofregistraton(rs
						.getString("patient_dateofregistraton"));

				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public static ArrayList<Patient> getPatientByDate(String pdate) {
		ArrayList<Patient> list = new ArrayList<Patient>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from Patient where patient_dateofregistraton='"
							+ pdate + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Patient p = new Patient();

				p.setPatientRegistrationno(rs.getInt("patient_registrationno"));
				p.setPatientName(rs.getString("patient_name"));
				p.setPatientGender(rs.getString("patient_gender"));
				p.setPatientAge(rs.getString("patient_age"));
				p.setPatientMaritalStatus(rs
						.getString("patient_marital_status"));
				p.setPatientFatherHusband(rs
						.getString("patient_father_husband"));
				p.setPatientAddress(rs.getString("patient_address"));
				p.setPatientCity(rs.getString("patient_city"));
				p.setPatientReligion(rs.getString("patient_religion"));
				p.setPatientMobile(rs.getString("patient_mobile"));
				p.setPatientTelephone(rs.getString("patient_telephone"));
				p.setPatientBloodgroup(rs.getString("patient_bloodgroup"));
				p.setPatientDisease(rs.getString("patient_disease"));
				p.setPatientDateofregistraton(rs
						.getString("patient_dateofregistraton"));

				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public static ArrayList<Patient> getpatientIDByNameMobileAge(String name,
			String mob, String age) {
		ArrayList<Patient> list = new ArrayList<>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from patient where `patient_name`='"
							+ name
							+ "' and `patient_mobile`='"
							+ mob
							+ "' and `patient_age`='" + age + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Patient p = new Patient();

				p.setPatientRegistrationno(rs.getInt("patient_registrationno"));
				p.setPatientName(rs.getString("patient_name"));
				p.setPatientGender(rs.getString("patient_gender"));
				p.setPatientAge(rs.getString("patient_age"));
				p.setPatientMaritalStatus(rs
						.getString("patient_marital_status"));
				p.setPatientFatherHusband(rs
						.getString("patient_father_husband"));
				p.setPatientAddress(rs.getString("patient_address"));
				p.setPatientCity(rs.getString("patient_city"));
				p.setPatientReligion(rs.getString("patient_religion"));
				p.setPatientMobile(rs.getString("patient_mobile"));
				p.setPatientTelephone(rs.getString("patient_telephone"));
				p.setPatientBloodgroup(rs.getString("patient_bloodgroup"));
				p.setPatientDisease(rs.getString("patient_disease"));
				p.setPatientDateofregistraton(rs
						.getString("patient_dateofregistraton"));

				list.add(p);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;

	}

}
