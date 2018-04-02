package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.beans.PatientOutside;
import com.conn.MyCon;

public class PatientOutsidedao {
	
	static Connection con = MyCon.getConnection();
	
	
	public static Boolean saveInpatient(PatientOutside pout) {
		try {
			PreparedStatement ps = con.prepareStatement("insert into patient_outside values(?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, pout.getPatientRegistrationno());
			ps.setInt(3, pout.getDoctorId());
			ps.setString(4, pout.getDiseaseName());
			ps.setString(5, pout.getCheckUpDate());
			ps.setString(6, pout.getReferByDr());
			ps.setInt(7, pout.getCheckupNumber());
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
