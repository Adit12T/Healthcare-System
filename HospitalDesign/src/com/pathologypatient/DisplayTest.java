package com.pathologypatient;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class DisplayTest {
	
	dbcon db=dbcon.getConnection();
	public List getTestGroup(){
	List recor=new 	ArrayList();
	
	
	String sql="select distinct(test_name) from pathelogy_test_detail";
	try{
		ResultSet rs=db.select(sql);
		while(rs.next()){
			recor.add(rs.getString("test_name"));
		}
		
		
	}catch (Exception e) {
		// TODO: handle exception
	}
	
	
	
		return recor;
	}
	
	
	public List getTestDetial(){
		List record=new 	ArrayList();
		
		
		String sql="select * from pathelogy_test_detail order by test_name";
		try{
			ResultSet rs=db.select(sql);
			Map map;
			while(rs.next()){
				map=new HashMap();
							
				map.put("test_id", rs.getInt("test_id"));
				map.put("test_name", rs.getString("test_name"));
				map.put("test_content", rs.getString("test_content"));
				map.put("start_range", rs.getString("start_range"));
				map.put("end_range", rs.getString("end_range"));
				map.put("end_range", rs.getString("end_range"));
				map.put("end_range", rs.getString("end_range"));
				map.put("test_cost", rs.getInt("test_cost"));
				record.add(map);
				
				//record.add(rs.getString("test_name"));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
			return record;
		}
		
	
	

}
