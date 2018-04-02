package com.patientmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.conn.MyCon;
import com.disease.Disease_Beans;

import database.dbcon;

public class PatientDao {
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

	public static Map AddPatientDiseaseDoctorServlet(int empid, String empname,
			String diseasename, String department) {

		Map map = new HashMap();

		map.put("empid", empid);
		map.put("empname", empname);
		map.put("diseasename", diseasename);
		map.put("empid", department);

		return map;
	}

	

	public List getDisease(String diseasename) {
		String sql = "select * from employee,employee_schedule,diseaseinformation where employee_schedule.emp_id=employee.emp_id and employee.emp_department=diseaseinformation.disease_department   and diseaseinformation.disease_name=? and employee_schedule.visiting_day=?";
		ArrayList record = new ArrayList();
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			ps.setString(1, diseasename);
			ps.setString(2, getDayName());
			ResultSet rs = ps.executeQuery();

			Map map;
			while (rs.next()) {
				map = new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("empdepartment", rs.getString("emp_department"));
				map.put("diseasename", rs.getString("disease_name"));
				map.put("diseaseid", rs.getInt("diseaseid"));
				record.add(map);

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return record;
	}

	public static String getDayName() {
		String dayname = "";
		Date d = new Date();
		dayname = getname(d.getDay());
		return dayname;
	}

	public static void main(String[] args) {
		PatientDao p = new PatientDao();
		System.out.println(p.getDayName());
	}

	public static String getname(int c) {
		String s = "";

		switch (c) {

		case 0: {
			s = "Sunday";
			break;
		}
		case 1: {
			s = "Monday";
			break;
		}
		case 2: {
			s = "Tuesday";
			break;
		}
		case 3: {
			s = "Wednesday";
			break;
		}
		case 4: {
			s = "Thursday";
			break;
		}
		case 5: {
			s = "Friday";
			break;
		}
		case 6: {
			s = "Saturday";
			break;
		}
		}
		return s;
	}
	
	public List showDepartment(){
		String sql="select * from department";
		ArrayList record = new ArrayList();
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();

			//Map map;
			while (rs.next()) {
				//map = new HashMap();
				//map.put("departmentid", rs.getInt(1));
				//map.put("departmentname", rs.getString("department_name"));
				record.add(rs.getString("department_name"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return record;
		
	}
	public List showDoctor(String emp_department){
		String sql="select * from employee where emp_department='"+emp_department+"'";
		ArrayList record = new ArrayList();
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();

			Map map;
			while (rs.next()) {
				map = new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("empdepartment", rs.getString("emp_department"));
				record.add(map);

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return record;
		
	}
	
	public List showRoomType() {
		dbcon db=dbcon.getConnection();
		List record = new ArrayList();
		String sql = "select * from room_type";
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				map.put("room_type_id", rs.getString("room_type_id"));
				map.put("room_type_name", rs.getString("room_type_name"));
				map.put("room_type_cost", rs.getString("room_type_cost"));
				record.add(map);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}
	
	


}