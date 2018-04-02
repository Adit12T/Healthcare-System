package com.patientmanager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class PatientBean {
	public List record;
	private int patientRegistrationno;
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
	private int insideid;
	private String insideidDrName;
	private String roomno;
	private String bedno;

	public String getInsideidDrName() {
		return insideidDrName;
	}

	public void setInsideidDrName(String insideidDrName) {
		this.insideidDrName = insideidDrName;
	}

	public String getBedno() {
		return bedno;
	}

	public void setBedno(String bedno) {
		this.bedno = bedno;
	}

	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public int getInsideid() {
		return insideid;
	}

	public void setInsideid(int insideid) {
		this.insideid = insideid;
	}

	public String getPatientreferdr() {
		return patientreferdr;
	}

	public void setPatientreferdr(String patientreferdr) {
		this.patientreferdr = patientreferdr;
	}

	private java.util.Date patientDateofregistraton = new Date();;

	public Integer getPatientRegistrationno() {
		return this.patientRegistrationno;
	}

	public void setPatientRegistrationno(Integer patientRegistrationno) {
		this.patientRegistrationno = patientRegistrationno;
	}

	public String getPatientName() {
		return this.patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientAge() {
		return this.patientAge;
	}

	public void setPatientAge(String patientAge) {
		this.patientAge = patientAge;
	}

	public String getPatientAddress() {
		return this.patientAddress;
	}

	public void setPatientAddress(String patientAddress) {
		this.patientAddress = patientAddress;
	}

	public String getPatientCity() {
		return this.patientCity;
	}

	public void setPatientCity(String patientCity) {
		this.patientCity = patientCity;
	}

	public String getPatientReligion() {
		return this.patientReligion;
	}

	public void setPatientReligion(String patientReligion) {
		this.patientReligion = patientReligion;
	}

	public String getPatientMobile() {
		return this.patientMobile;
	}

	public void setPatientMobile(String patientMobile) {
		this.patientMobile = patientMobile;
	}

	public String getPatientTelephone() {
		return this.patientTelephone;
	}

	public void setPatientTelephone(String patientTelephone) {
		this.patientTelephone = patientTelephone;
	}

	public String getPatientBloodgroup() {
		return this.patientBloodgroup;
	}

	public void setPatientBloodgroup(String patientBloodgroup) {
		this.patientBloodgroup = patientBloodgroup;
	}

	public String getPatientDisease() {
		return this.patientDisease;
	}

	public void setPatientDisease(String patientDisease) {
		this.patientDisease = patientDisease;
	}

	public Date getPatientDateofregistraton() {
		return this.patientDateofregistraton;
	}

	public void setPatientDateofregistraton(Date patientDateofregistraton) {
		this.patientDateofregistraton = patientDateofregistraton;
	}

	public void setPatientRegistrationno(int patientRegistrationno) {
		this.patientRegistrationno = patientRegistrationno;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
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

	public PatientBean() {
		record = new ArrayList();
	}

	public int getId() {
		int id = 0;
		String sql = "select * from patient where patient_name=? and patient_gender=? and patient_address=? and patient_city=? and patient_dateofregistraton=?";
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			ps.setString(1, patientName);
			ps.setString(2, patientGender);
			ps.setString(3, patientAddress);
			ps.setString(4, patientCity);
			ps.setDate(5, new java.sql.Date(patientDateofregistraton.getTime()));

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt("patient_registrationno");
				System.out.println("pateint no " + patientRegistrationno);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;

	}

	public boolean saveReord() {

		try {
			PreparedStatement pss;
			PreparedStatement ps = dbcon
					.getPreparedStatement()
					.prepareStatement(
							"insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, getPatientName());
			ps.setString(3, getPatientGender());
			ps.setString(4, getPatientAge());
			ps.setString(5, getPatientMaritalStatus());
			ps.setString(6, getPatientFatherHusband());
			ps.setString(7, getPatientAddress());
			ps.setString(8, getPatientCity());
			ps.setString(9, getPatientReligion());
			ps.setString(10, getPatientMobile());
			ps.setString(11, getPatientTelephone());
			ps.setString(12, getPatientBloodgroup());
			ps.setString(13, getPatientDisease());

			ps.setDate(14,
					new java.sql.Date(patientDateofregistraton.getTime()));

			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println("outsside");
				patientRegistrationno = getId();
				System.out.println(getId() + "pateint no "
						+ patientRegistrationno);
				Map map;
				String sql = "insert into patient_outside values(?,?,?,?,?,?,?)";
				pss = dbcon.getPreparedStatement().prepareStatement(sql);

				for (int j = 0; j < record.size(); j++) {
					map = (Map) record.get(j);
					int emp = (int) map.get("empid");
					String names = (String) map.get("diseasename");

					System.out.println(emp + "          " + names);
					System.out.println(map);
					pss.setInt(1, 0);
					pss.setInt(2, patientRegistrationno);
					pss.setInt(3, emp);
					pss.setString(4, names);
					pss.setDate(
							5,
							new java.sql.Date(patientDateofregistraton
									.getTime()));
					pss.setString(6, patientreferdr);
					pss.setInt(7, 15);
					i = pss.executeUpdate();
					if (i > 0) {
						int tk = getToken(emp);
						map.put("token", tk);
						map.put("no", getnumber(emp, tk));

					}
				}

				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public boolean saveRecordInside(int drid, String diseaname, int bedid) {

		try {

			PreparedStatement pss;
			PreparedStatement ps = dbcon
					.getPreparedStatement()
					.prepareStatement(
							"insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, getPatientName());
			ps.setString(3, getPatientGender());
			ps.setString(4, getPatientAge());
			ps.setString(5, getPatientMaritalStatus());
			ps.setString(6, getPatientFatherHusband());
			ps.setString(7, getPatientAddress());
			ps.setString(8, getPatientCity());
			ps.setString(9, getPatientReligion());
			ps.setString(10, getPatientMobile());
			ps.setString(11, getPatientTelephone());
			ps.setString(12, getPatientBloodgroup());
			ps.setString(13, getPatientDisease());

			ps.setDate(14,
					new java.sql.Date(patientDateofregistraton.getTime()));

			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println("Inside");
				patientRegistrationno = getId();
				System.out.println(getId() + "pateint no "
						+ patientRegistrationno);
				Map map;
				String sql = "insert into patient_inside values(?,?,?,?,?,?)";
				pss = dbcon.getPreparedStatement().prepareStatement(sql);
				this.patientDisease = diseaname;
				pss.setInt(1, 0);
				pss.setInt(2, patientRegistrationno);
				pss.setInt(3, drid);
				pss.setInt(4, bedid);
				pss.setString(5, diseaname);
				pss.setDate(6,
						new java.sql.Date(patientDateofregistraton.getTime()));

				i = pss.executeUpdate();
				if (i > 0) {
					getInsdeId(drid, bedid);
					setvalueofbed(bedid,"1");
					return true;

				}

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public void getInsdeId(int drid, int bedid) {
		PreparedStatement ps;
		String sql = "select * from patient_inside,employee,room_info,room_bed_info where room_info.room_id=room_bed_info.room_id  and  employee.emp_id=patient_inside.doctor_id and patient_inside.patient_id=? and patient_inside.doctor_id=? and room_bed_info.bed_id=patient_inside.bed_id and patient_inside.bed_id=? and patient_inside.admision_date=? ";
		try {
			ps = dbcon.getPreparedStatement().prepareStatement(sql);
			ps.setInt(1, patientRegistrationno);

			ps.setInt(2, drid);
			ps.setInt(3, bedid);
			ps.setDate(4, new java.sql.Date(patientDateofregistraton.getTime()));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				insideid = rs.getInt("admision_id");
				insideidDrName = rs.getString("emp_name");
				roomno = rs.getString("room_number");
				bedno = rs.getString("bed_number");

				// rs.updateString("occupy_status", "1");
				// rs.updateRow();
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public void setvalueofbed(int id, String s) {
		System.out.println(id + "  roombed information    " + s);
		try {
			String sql = "update  room_bed_info set occupy_status='1' where bed_id="
					+ id;
			dbcon db = dbcon.getConnection();
			// System.out.println(id+"  roombed information    "+s);
			int a = db.insertOrUpdate(sql);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
/*
	public void setvalueofbed(int id,String s) {

		try {
			String sql = "select * from room_bed_info where bed_id=" + id;
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);
			while (rs.next()) {

				rs.updateString("occupy_status", s);
				rs.updateRow();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
*/
	public int getToken(int emps) {
		int a = 0;
		try {
			String sql = "select * from patient_outside where   doctor_id=? and check_up_date=?";
			PreparedStatement pss = dbcon.getPreparedStatement()
					.prepareStatement(sql);

			pss.setInt(1, emps);
			pss.setDate(2,
					new java.sql.Date(patientDateofregistraton.getTime()));

			ResultSet rs = pss.executeQuery();
			while (rs.next()) {

				a = a + 1;

			}
		} catch (Exception e) {
			System.out.println(e + "error");
		}
		return a;
	}

	public int getnumber(int emps, int tk) {
		int a = 0;
		try {
			String sql = "select * from patient_outside where patient_registrationno=? and doctor_id=? and check_up_date=?";
			PreparedStatement pss = dbcon.getPreparedStatement()
					.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
			pss.setInt(1, patientRegistrationno);
			pss.setInt(2, emps);
			pss.setDate(3,
					new java.sql.Date(patientDateofregistraton.getTime()));

			ResultSet rs = pss.executeQuery();
			while (rs.next()) {
				// System.out.println("Re num="+rs.getInt("outside_id"));
				rs.updateInt("checkup_number", tk);
				rs.updateRow();
				a = rs.getInt("outside_id");

			}
		} catch (Exception e) {
			System.out.println(e + "error");
		}
		return a;
	}

	public boolean addDis(int empid, int diseaseid) {
		// String sql =
		// "select * from employee,diseaseinformation where employee_schedule.emp_id=employee.emp_id and employee.emp_department=diseaseinformation.disease_department   and diseaseinformation.diseaseid=? and employee.emp_id=? and employee_schedule.visiting_day=?";
		String sql = "select * from employee,diseaseinformation,employee_schedule where employee_schedule.emp_id=employee.emp_id and employee.emp_department=diseaseinformation.disease_department   and diseaseinformation.diseaseid=? and employee.emp_id=? and employee_schedule.visiting_day=?";
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			ps.setInt(1, diseaseid);
			ps.setInt(2, empid);
			ps.setString(3, PatientDao.getDayName());
			ResultSet rs = ps.executeQuery();

			Map map;
			if (rs.next()) {
				map = new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("empdepartment", rs.getString("emp_department"));
				map.put("diseasename", rs.getString("disease_name"));
				map.put("diseaseid", rs.getInt("diseaseid"));
				map.put("no", 0);
				map.put("token", 0);
				record.add(map);
				return true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return false;

	}

	public boolean AddPatientDiseaseDoctorServlet(int empid, String empname,
			String diseasename, String department) {

		Map map = new HashMap();

		map.put("empid", empid);
		map.put("empname", empname);
		map.put("diseasename", diseasename);
		map.put("empid", department);
		record.add(map);
		return true;
	}

}
