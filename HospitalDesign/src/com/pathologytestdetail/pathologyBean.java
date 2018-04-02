package com.pathologytestdetail;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class pathologyBean {
	int test_id;
	String test_name;
	String test_content;
	String start_range;
	String end_range;
	String test_cost;

	public int getTest_id() {
		return test_id;
	}

	public String getTest_name() {
		return test_name;
	}

	public String getTest_content() {
		return test_content;
	}

	public String getStart_range() {
		return start_range;
	}

	public String getEnd_range() {
		return end_range;
	}

	public String getTest_cost() {
		return test_cost;
	}

	dbcon db = dbcon.getConnection();

	public void getmethod(int a) {
		String sql = "select * from pathelogy_test_detail where test_id=" + a
				+ "";
		try {
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				test_id = rs.getInt("test_id");
				test_name = rs.getString("test_name");
				test_content = rs.getString("test_content");
				start_range = rs.getString("start_range");
				end_range = rs.getString("end_range");
				test_cost = rs.getString("test_cost");
				

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public List show() {
		List record = new ArrayList();

		String sql = "select * from pathelogy_test_detail";
		Map map;
		try {
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				map = new HashMap();
				map.put("test_id", rs.getInt("test_id"));
				map.put("test_name", rs.getString("test_name"));
				map.put("test_content", rs.getString("test_content"));
				map.put("start_range", rs.getString("start_range"));
				map.put("end_range", rs.getString("end_range"));
				map.put("test_cost", rs.getString("test_cost"));
				record.add(map);
			}

		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
		return record;
	}

}
