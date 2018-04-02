package database;

import java.awt.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import database.dbcon;
import database1.DateConvertdata;

public class DataBean {

	public String m;

	public DataBean() {

	}

	public boolean updatePathologyTestDetail(String tid, String tname,
			String tcontent, String srange, String erange, int tcost) {
		// System.out.println();
		dbcon db = dbcon.getConnection();
		String sql = "UPDATE `pathelogy_test_detail` SET test_name='" + tname
				+ "',test_content='" + tcontent + "',start_range='" + srange
				+ "',end_range='" + erange + "',test_cost='" + tcost
				+ "' WHERE `test_id`='" + tid + "'";
		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}

	public boolean savePathologyTestDetail(String tname, String tcontent,
			String srange, String erange, int tcost) {
		boolean f = check(tname, tcontent);
		if (f == false) {
			m = "Already";
			return false;
		}
		dbcon db = dbcon.getConnection();
		String sql = "insert into pathelogy_test_detail() values(0,'" + tname
				+ "','" + tcontent + "','" + srange + "','" + erange + "','"
				+ tcost + "')";
		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			m = "success";
			return true;
		}
		m = "error";
		return false;
	}

	public boolean check(String tname, String tcontent) {
		String sql = "select * from pathelogy_test_detail where test_content='"
				+ tcontent + "' and test_name='" + tname + "' ";
		try {
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				return false;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return true;
	}

	public void deletePathologyTestDetail(String tid) {
		dbcon db = dbcon.getConnection();
		String sql = "delete from pathelogy_test_detail  where test_id='" + tid
				+ "'";
		int flag = db.insertOrUpdate(sql);
	}

	public java.util.List getTest() {
		java.util.List record = new ArrayList();

		String sql = "select distinct test_name from pathelogy_test_detail";
		dbcon db = dbcon.getConnection();
		try {

			ResultSet rs1 = db.select(sql);

			while (rs1.next()) {
				record.add(rs1.getString("test_name"));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return record;

	}

	public float getTestIdByTestName(String tname) {
		dbcon db = dbcon.getConnection();

		float tid = 0;
		try {
			String sql = "select * from pathelogy_test_detail where test_name='"
					+ tname + "'";
			ResultSet rs = db.select(sql);
			while (rs.next()) {

				tid = rs.getFloat(1);
				System.out.println(tid);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tid;

	}

	public boolean savePathologyTestReport(int pid, String[] tid, String tdate,
			String result, String refby) {
		dbcon db = dbcon.getConnection();

		int flag = 0;

		for (int i = 0; i < tid.length; i++) {

			String sql = "insert into pathology_test_report values(0,'" + pid
					+ "','" + tid[i] + "','"
					+ DateConvertdata.convertDate(tdate) + "','" + result
					+ "','" + refby + "')";

			flag = db.insertOrUpdate(sql);

		}
		if (flag > 0) {
			return true;
		}

		return false;
	}

	public void deletePathologyTestReport(int rid) {
		dbcon db = dbcon.getConnection();
		String sql = "delete from pathology_test_report  where report_id='"
				+ rid + "'";
		int flag = db.insertOrUpdate(sql);
	}

	public boolean updatePathologyTestReport(int rid, int pid, float tid,
			String date, String result, String refby) {
		// System.out.println();
		dbcon db = dbcon.getConnection();
		String sql = "UPDATE `pathology_test_report` SET  `patient_id`='" + pid
				+ "', test_id = '" + tid + "',test_date = '" + date
				+ "',result = '" + result + "',refered_by = '" + refby
				+ "' WHERE `report_id`='" + rid + "'";
		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}

	public boolean saveTestResult(String[] rid, String result[]) {
		// System.out.println();
		try {
			for (int i = 0; i < rid.length; i++) {
				int rd = Integer.parseInt(rid[i]);
				dbcon db = dbcon.getConnection();
				String sql = "UPDATE `pathology_test_report` SET  result = '"
						+ result[i] + "' WHERE `report_id`='" + rd + "'";
				int flag = db.insertOrUpdate(sql);

			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public static ArrayList getPatientDetail(int pid) {
		dbcon db = dbcon.getConnection();
		ArrayList list = new ArrayList<>();

		try {
			String sql = "select * from patient where patient_registrationno='"
					+ pid + "' ";
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				list.add(rs.getString("patient_name"));
				list.add(rs.getString("patient_age"));
				list.add(rs.getString("patient_gender"));

			}
		} catch (Exception e) {

		}
		return list;

	}

	public static ArrayList getTestReportByPID(int pid) {
		dbcon db = dbcon.getConnection();
		ArrayList list = new ArrayList<>();
		float cost = 0;
		try {
			String sql = "select * from pathology_test_report where patient_id='"
					+ pid + "' ORDER BY test_id";
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				Map map = new HashMap();
				map.put("rid", rs.getString("report_id"));
				map.put("tid", rs.getFloat("test_id"));
				map.put("result", rs.getString("result"));
				map.put("refby", rs.getString("refered_by"));
				map.put("date", rs.getString("test_date"));

				list.add(map);
			}

		} catch (Exception e) {

		}
		return list;

	}

	public static ArrayList getTestDetailByTID(float tid) {
		dbcon db = dbcon.getConnection();
		ArrayList list = new ArrayList<>();

		try {
			// System.out.println(tid);
			String sql1 = "select * from pathelogy_test_detail where test_id='"
					+ tid + "' ";
			ResultSet rs1 = db.select(sql1);

			while (rs1.next()) {
				Map map = new HashMap();

				map.put("tid", rs1.getString("test_id"));
				map.put("tname", rs1.getString("test_name"));
				map.put("tcontent", rs1.getString("test_content"));
				map.put("srange", rs1.getString("start_range"));
				map.put("erange", rs1.getString("end_range"));
				map.put("tcost", rs1.getString("test_cost"));
				list.add(map);
			}

		} catch (Exception e) {

		}
		return list;

	}

	public static ArrayList getfinalReport(int pid) {
		ArrayList list = new ArrayList();
		DataBean db = new DataBean();
		ArrayList list1 = db.getPatientDetail(pid);
		list.add((String) list1.get(0));
		list.add((String) list1.get(1));
		list.add((String) list1.get(2));
		ArrayList list2 = db.getTestReportByPID(pid);
		HashMap m = (HashMap) list2.get(0);
		list.add((String) m.get("refby"));
		list.add((String) m.get("date"));
		int cost = 0;

		for (int i = 0; i < list2.size(); i++) {
			DataBean db1 = new DataBean();
			HashMap h = (HashMap) list2.get(i);

			float tid = (float) h.get("tid");

			System.out.println(tid);
			ArrayList ls = db1.getTestDetailByTID(tid);

			for (int j = 0; j < ls.size(); j++) {
				HashMap h1 = (HashMap) ls.get(j);
				HashMap map = new HashMap();
				map.put("rid", (String) h.get("rid"));
				map.put("tid", (String) h1.get("tid"));
				map.put("tname", (String) h1.get("tname"));
				map.put("tcontent", (String) h1.get("tcontent"));
				map.put("result", (String) h.get("result"));
				map.put("srange", (String) h1.get("srange"));
				map.put("erange", (String) h1.get("erange"));
				map.put("tcost", (String) h1.get("tcost"));
				map.put("tdate", (String) h.get("date"));
				map.put("refby", (String) h.get("refby"));

				list.add(map);
			}

		}

		list.add(cost);
		return list;

	}
}
