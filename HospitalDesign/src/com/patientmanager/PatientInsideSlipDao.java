package com.patientmanager;

import java.sql.ResultSet;
import java.util.Date;

import database.DateConvert;
import database.dbcon;

public class PatientInsideSlipDao {
	private int patientRegistrationno;

	public int getPatientRegistrationno() {
		return patientRegistrationno;
	}

	public void setPatientRegistrationno(int patientRegistrationno) {
		this.patientRegistrationno = patientRegistrationno;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}

	public String getPatientAge() {
		return patientAge;
	}

	public void setPatientAge(String patientAge) {
		this.patientAge = patientAge;
	}

	public String getPatientMaritalStatus() {
		return patientMaritalStatus;
	}

	public void setPatientMaritalStatus(String patientMaritalStatus) {
		this.patientMaritalStatus = patientMaritalStatus;
	}

	public String getPatientFatherHusband() {
		return patientFatherHusband;
	}

	public void setPatientFatherHusband(String patientFatherHusband) {
		this.patientFatherHusband = patientFatherHusband;
	}

	public String getPatientAddress() {
		return patientAddress;
	}

	public void setPatientAddress(String patientAddress) {
		this.patientAddress = patientAddress;
	}

	public String getPatientCity() {
		return patientCity;
	}

	public void setPatientCity(String patientCity) {
		this.patientCity = patientCity;
	}

	public String getPatientReligion() {
		return patientReligion;
	}

	public void setPatientReligion(String patientReligion) {
		this.patientReligion = patientReligion;
	}

	public String getPatientMobile() {
		return patientMobile;
	}

	public void setPatientMobile(String patientMobile) {
		this.patientMobile = patientMobile;
	}

	public String getPatientTelephone() {
		return patientTelephone;
	}

	public void setPatientTelephone(String patientTelephone) {
		this.patientTelephone = patientTelephone;
	}

	public String getPatientBloodgroup() {
		return patientBloodgroup;
	}

	public void setPatientBloodgroup(String patientBloodgroup) {
		this.patientBloodgroup = patientBloodgroup;
	}

	public String getPatientDisease() {
		return patientDisease;
	}

	public void setPatientDisease(String patientDisease) {
		this.patientDisease = patientDisease;
	}

	public String getPatientreferdr() {
		return patientreferdr;
	}

	public void setPatientreferdr(String patientreferdr) {
		this.patientreferdr = patientreferdr;
	}

	public String getPatientdrname() {
		return patientdrname;
	}

	public void setPatientdrname(String patientdrname) {
		this.patientdrname = patientdrname;
	}

	public String getDiseasename() {
		return diseasename;
	}

	public void setDiseasename(String diseasename) {
		this.diseasename = diseasename;
	}

	public String getPatientRegDate() {
		return patientRegDate;
	}

	public void setPatientRegDate(String patientRegDate) {
		this.patientRegDate = patientRegDate;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getToken() {
		return token;
	}

	public void setToken(int token) {
		this.token = token;
	}

	public String getRefer_by_dr() {
		return refer_by_dr;
	}

	public void setRefer_by_dr(String refer_by_dr) {
		this.refer_by_dr = refer_by_dr;
	}

	private String patientName;
	private String patientGender;
	private String patientAge;
	private String patientMaritalStatus;
	private String patientFatherHusband;
	private String patientAddress;
	private String patientCity;
	private String patientReligion;
	private String patientMobile;
	private String patientTelephone;
	private String patientBloodgroup;
	private String patientDisease;
	private String patientreferdr;
	private String patientdrname;
	private String diseasename;
	private String patientRegDate;
	private String department;
	private int token;
	private String refer_by_dr;

	public PatientInsideSlipDao() {
		// TODO Auto-generated constructor stub
	}

	public PatientInsideSlipDao(int id) {
		dbcon db = dbcon.getConnection();
		String s = "select p.patient_registrationno,p.patient_name,patient_age,p.patient_gender,p.patient_bloodgroup" +
				",e.emp_name,e.emp_department,po.checkup_number,po.checkup_number" +
				",po.refer_by_dr,po.check_up_date,po.disease_name" +
				" from patient p ,patient_outside po ,employee e where e.emp_id=po.doctor_id and p.patient_registrationno=po.patient_registrationno and po.outside_id="
				+ id;
		ResultSet rs = db.select(s);
		try {
			while (rs.next()) {
				patientRegistrationno = rs.getInt("patient_registrationno");
				patientName = rs.getString("patient_name");
				//patientGender = rs.getString("patient_gender");
				patientBloodgroup = rs.getString("patient_bloodgroup");
				//patientReligion = rs.getString("patient_religion");
				//patientCity = rs.getString("patient_city");
				//patientAddress = rs.getString("patient_address");
				//patientMaritalStatus = rs.getString("patient_marital_status");
				patientAge = rs.getString("patient_age");
				patientdrname = rs.getString("emp_name");
				//Date d=(rs.getDate("checkup_number"));
				//patientRegDate = DateConvert.convertDateToString((d));
				department = rs.getString("emp_department");
				token = rs.getInt("checkup_number");
				diseasename=rs.getString("disease_name");
				refer_by_dr = rs.getString("refer_by_dr");

			}

		} catch (Exception e) {
		System.out.println(e);
		}
	}

}
