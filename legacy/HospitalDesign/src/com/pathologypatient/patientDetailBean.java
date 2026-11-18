package com.pathologypatient;

import java.sql.ResultSet;
import java.util.Date;

import database.dbcon;

public class patientDetailBean {

	int pathology_patient_id;
	String patient_name;
	String patient_address;
	int total;
	int paid;
	String p_status;
	Date test_date;
	
	
	
	public int getPathology_patient_id() {
		return pathology_patient_id;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public String getPatient_address() {
		return patient_address;
	}

	public int getTotal() {
		return total;
	}

	public int getPaid() {
		return paid;
	}

	public String getP_status() {
		return p_status;
	}

	public Date getTest_date() {
		return test_date;
	}

	

	dbcon db = dbcon.getConnection();

	public void setMethod(int a) {
//System.out.println(a);
		String sql = "select * from pathology_patient where pathology_patient_id="
				+ a;
		ResultSet rss; 
		rss = db.select(sql);
		try {
			if (rss.next()) {
				pathology_patient_id = rss.getInt("pathology_patient_id");
				patient_name = rss.getString("patient_name");
				patient_address = rss.getString("patient_address");
				total = rss.getInt("total");
				paid = rss.getInt("paid");
				p_status = rss.getString("p_status");
				test_date = rss.getDate("test_date");
			}

		} catch (Exception e) {
			System.out.println("sub="+e);
		}

	}

}
