package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.beans.PatientInside;
import com.conn.MyCon;

public class PatientInsidedao {

	static Connection con = MyCon.getConnection();

	public static Boolean saveInpatient(PatientInside pin) {
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into patient_inside values(?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, pin.getPatientId());
			ps.setInt(3, pin.getDoctorId());
			ps.setInt(4, pin.getBedId());
			ps.setString(5, pin.getAdmisionDate());
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

}
