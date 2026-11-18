package com.pathologypatient;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class PatientresultZDao extends patientDetailBean {
	dbcon db = dbcon.getConnection();
	public String testname;
	public String remark;

	public List getgroup(String as) {
		List record = new ArrayList();
		try {

			Map map;
			int a = Integer.parseInt(as);
			setMethod(a);

			String sql = "select * from pathology_patient p,pathology_patient_test pt where p.pathology_patient_id=pt.pathology_patient and p.pathology_patient_id="
					+ a;
			ResultSet rs = db.select(sql);

			while (rs.next()) {
				map = new HashMap();
				map.put("pathology_patient_test",
						rs.getInt("pathology_patient_test"));
				map.put("pathology_patient", rs.getInt("pathology_patient"));
				map.put("test_name", rs.getString("test_name"));
				map.put("test_amount", rs.getInt("test_amount"));
				map.put("test_status", rs.getString("test_status"));
				map.put("test_remark", rs.getString("test_remark"));
				record.add(map);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}

	public String setRemark(String name, int id) {
		String s = "";
		Map map;
		String sql = "select * from pathology_patient_test  where pathology_patient="
				+ id + " and test_name='" + name + "'";
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {

				s = rs.getString("test_remark");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

	public List getgroupDetail(String ids, String name) {
		testname = name;
		List record = new ArrayList();
		try {
			int a = Integer.parseInt(ids);
			remark=setRemark(name, a);
			Map map;
			
			setMethod(a);

			String sql = "select * from pathology_patient_test_detail where  test_name='"
					+ name + "' and pathology_patient_id=" + a;
			ResultSet rs = db.select(sql);

			while (rs.next()) {
				map = new HashMap();
				map.put("pathology_test_detail",
						rs.getInt("pathology_test_detail"));
				map.put("pathology_patient_id",
						rs.getInt("pathology_patient_id"));
				map.put("test_id", rs.getInt("test_id"));
				map.put("test_name", rs.getString("test_name"));
				map.put("test_content", rs.getString("test_content"));
				map.put("test_startrange", rs.getString("test_startrange"));
				map.put("test_endrange", rs.getString("test_endrange"));
				map.put("test_result", rs.getString("test_result"));
				record.add(map);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return record;
	}

}
