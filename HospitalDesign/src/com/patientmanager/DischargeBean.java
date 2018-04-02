package com.patientmanager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import database.DateConvert;
import database.dbcon;
import database1.DateConvertdata;

public class DischargeBean {
	dbcon db = dbcon.getConnection();

	public dbcon getDb() {
		return db;
	}

	public String getPatientname() {
		return patientname;
	}

	public int getPatientregno() {
		return patientregno;
	}

	public Date getAdmitdate() {
		return admitdate;
	}

	public Date getDischargedate() {
		return dischargedate;
	}

	public String getPatientage() {
		return patientage;
	}

	public String getGender() {
		return gender;
	}

	public int getTotalamount() {
		return totalamount;
	}

	public int getCustomerpaid() {
		return customerpaid;
	}

	public String getDoctorname() {
		return doctorname;
	}

	public String getDepartment() {
		return department;
	}

	public int getRoomtypecost() {
		return roomtypecost;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public String getRoomnumber() {
		return roomnumber;
	}

	public long getStaydays() {
		return staydays;
	}

	public int getBedid() {
		return bedid;
	}

	public String getBednumber() {
		return bednumber;
	}

	public int getBedcost() {
		return bedcost;
	}

	public String getDiseasename() {
		return diseasename;
	}

	public int getDailycheckcost() {
		return dailycheckcost;
	}

	public int getOtcost() {
		return otcost;
	}

	public int getOtcostpaid() {
		return otcostpaid;
	}

	public int getPathalogycost() {
		return pathalogycost;
	}

	public int getPaidpathalogycost() {
		return paidpathalogycost;
	}

	public int getBloodbankcost() {
		return bloodbankcost;
	}

	public void setDb(dbcon db) {
		this.db = db;
	}

	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}

	public void setPatientregno(int patientregno) {
		this.patientregno = patientregno;
	}

	public void setAdmitdate(Date admitdate) {
		this.admitdate = admitdate;
	}

	public void setDischargedate(Date dischargedate) {
		this.dischargedate = dischargedate;
	}

	public void setPatientage(String patientage) {
		this.patientage = patientage;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}

	public void setCustomerpaid(int customerpaid) {
		this.customerpaid = customerpaid;
	}

	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public void setRoomtypecost(int roomtypecost) {
		this.roomtypecost = roomtypecost;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}

	public void setStaydays(long staydays) {
		this.staydays = staydays;
	}

	public void setBedid(int bedid) {
		this.bedid = bedid;
	}

	public void setBednumber(String bednumber) {
		this.bednumber = bednumber;
	}

	public void setBedcost(int bedcost) {
		this.bedcost = bedcost;
	}

	public void setDiseasename(String diseasename) {
		this.diseasename = diseasename;
	}

	public void setDailycheckcost(int dailycheckcost) {
		this.dailycheckcost = dailycheckcost;
	}

	public void setOtcost(int otcost) {
		this.otcost = otcost;
	}

	public void setOtcostpaid(int otcostpaid) {
		this.otcostpaid = otcostpaid;
	}

	public void setPathalogycost(int pathalogycost) {
		this.pathalogycost = pathalogycost;
	}

	public void setPaidpathalogycost(int paidpathalogycost) {
		this.paidpathalogycost = paidpathalogycost;
	}

	public void setBloodbankcost(int bloodbankcost) {
		this.bloodbankcost = bloodbankcost;
	}

	public String patientname;
	public int patientregno;
	public Date admitdate;
	public Date dischargedate;
	public String patientage;
	public String gender;
	public int totalamount;
	public int customerpaid;
	public String doctorname;
	public String department;
	public int roomtypecost;
	public String roomtype;
	public String roomnumber;
public int admisionid;
	int bedid;
	public String bednumber;
	public int bedcost;
	public String diseasename;

	public long staydays;
	public int dailycheckcost;
	public int otcost;
	public int otcostpaid;

	public int pathalogycost;
	public int paidpathalogycost;
	public int bloodbankcost;

	public void setData(int id) {

		String sql = "select * from patient_inside ,patient ,employee ,room_bed_info ,room_info  where patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id and   employee.emp_id=patient_inside.doctor_id and patient_inside.patient_id=patient.patient_registrationno and room_bed_info.occupy_status='1' and admision_id="
				+ id;
		ResultSet rs = db.select(sql);
		try {

			while (rs.next()) {

				admisionid=	rs.getInt("admision_id");
				patientage = rs.getString("patient_age");
				gender = rs.getString("patient_gender");
				patientregno = rs.getInt("patient_registrationno");
				patientname = rs.getString("patient_name");
				roomnumber = rs.getString("room_number");
				bednumber = rs.getString("bed_number");
				bedid = rs.getInt("bed_id");
				rs.getInt("emp_id");
				doctorname = rs.getString("emp_name");
				diseasename = rs.getString("disease_name");
				admitdate = rs.getDate("admision_date");
				dischargedate = new Date();
			}
			getBedCost();
			getDaily();
			getOt();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void getBedCost() {
		String sql = "select * from room_type rt,room_info ri,room_bed_info rb where rt.room_type_id=ri.room_type_id and ri.room_id=rb.room_id and rb.bed_id="
				+ bedid;
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				roomtype = rs.getString("room_type_name");
				roomtypecost = rs.getInt("room_type_cost");
				System.out.println("------------=" + roomtypecost);
				// otcost=otcost+rs.getInt("operation_cost");
				// otcostpaid=otcostpaid+rs.getInt("paid_operation_cost");

			}
			staydays = (dischargedate.getTime() - admitdate.getTime())
					/ (24 * 60 * 60 * 1000);
			System.out.println("----------------=" + staydays);
			bedcost = (int) (staydays * roomtypecost);
			totalamount = totalamount + bedcost;
			// customerpaid=customerpaid+otcostpaid;

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void getDaily() {
		String sql = "select * from dailycheckup where checkupdate >=? and checkupdate <=? and pid=?";

		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(admitdate.getTime()));
			ps.setDate(2, new java.sql.Date(dischargedate.getTime()));
			ps.setInt(3, patientregno);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				dailycheckcost = dailycheckcost + rs.getInt("cost");

			}
			totalamount = totalamount + dailycheckcost;
			// customerpaid=customerpaid+otcostpaid;
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void getOt() {

		String sql = "select * from operation_patient where operation_date >='"
				+ DateConvertdata.convertDate(DateConvert.convertDateToString(admitdate))
				+ "' and operation_date <='"
				+ DateConvertdata.convertDate( DateConvert.convertDateToString(dischargedate))
				+ "' and patient_id=" + patientregno;
		System.out.println(sql);
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				System.out.println(rs.getString("operation_name"));
				System.out.println(rs.getInt("operation_cost") + "//// "+ rs.getInt("paid_operation_cost"));
				otcost = otcost + rs.getInt("operation_cost");
				otcostpaid = otcostpaid + rs.getInt("paid_operation_cost");

			}
			totalamount = totalamount + otcost;
			customerpaid = customerpaid + otcostpaid;
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void getpathalogy() {
		String sql = "select * from operation_patient where operation_date >='"
				+ DateConvert.convertDateToString(admitdate)
				+ "' and operation_date <='"
				+ DateConvert.convertDateToString(dischargedate)
				+ "' and patient_id=" + patientregno;
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				paidpathalogycost = paidpathalogycost+ rs.getInt("pathology_cost");
				otcostpaid = otcostpaid + rs.getInt("paid_cost");

			}

			
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	

	public boolean saveDischarge() {
		String sql="insert into discharge values(?,?,?,?,?,?,?)";
		try{
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, admisionid);
			ps.setInt(3, patientregno);
			ps.setDate(4, new java.sql.Date(admitdate.getTime()));
				ps.setDate(5, new java.sql.Date(dischargedate.getTime()));
				ps.setInt(6, totalamount);
				ps.setInt(7, customerpaid);
				int a=ps.executeUpdate();
			
				if(a>0)
					hetCounterZero();
					return true;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public void hetCounterZero(){
		String sql="update room_bed_info set occupy_status='0' where bed_id="+bedid;
		db.insertOrUpdate(sql);
	}
	
	
	public static void main(String[] args) {
		// Date d=(.getTime()-.getTime())*24*60*60;
		System.out.println();
	}
}
