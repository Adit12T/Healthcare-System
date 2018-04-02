package com.patientmanager;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class PatientDischargeDao {
	dbcon db=dbcon.getConnection();
	public List show() {
		List record = new ArrayList();
		/*String sql = "select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where"
				+ "patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id"
				+ "and   employee.emp_id=patient_inside.doctor_id"
				+ "and patient_inside.patient_id=patient.patient_registrationno";
		*/
		String sql="select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id and   employee.emp_id=patient_inside.doctor_id and patient_inside.patient_id=patient.patient_registrationno and room_bed_info.occupy_status='1'";
		ResultSet rs=db.select(sql);
		try {
			Map map;
			while(rs.next()){
				map=new HashMap();
				map.put("admitid", rs.getInt("admision_id"));
				map.put("patientro", rs.getInt("patient_registrationno"));
				map.put("patientname", rs.getString("patient_name"));
				map.put("roomno", rs.getString("room_number"));
				map.put("bedname", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("diseasename", rs.getString("disease_name"));
				map.put("admitdate", rs.getDate("admision_date"));
				record.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return record;
	}
	public List show(String s) {
		List record = new ArrayList();
		/*String sql = "select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where"
				+ "patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id"
				+ "and   employee.emp_id=patient_inside.doctor_id"
				+ "and patient_inside.patient_id=patient.patient_registrationno";
		*/
		String sql=null;
		if(s!=null &&s!=""){
			
			sql="select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id and   employee.emp_id=patient_inside.doctor_id and patient_inside.patient_id=patient.patient_registrationno and room_bed_info.occupy_status='1' and patient.patient_name like '"+s+"%'";
		}
		else
		 sql="select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id and   employee.emp_id=patient_inside.doctor_id and patient_inside.patient_id=patient.patient_registrationno and room_bed_info.occupy_status='1'";
		ResultSet rs=db.select(sql);
		try {
			Map map;
			while(rs.next()){
				map=new HashMap();
				map.put("admitid", rs.getInt("admision_id"));
				map.put("patientro", rs.getInt("patient_registrationno"));
				map.put("patientname", rs.getString("patient_name"));
				map.put("roomno", rs.getString("room_number"));
				map.put("bedname", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("diseasename", rs.getString("disease_name"));
				map.put("admitdate", rs.getDate("admision_date"));
				
				record.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return record;
	}
}
