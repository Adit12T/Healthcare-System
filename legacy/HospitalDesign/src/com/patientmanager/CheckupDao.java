package com.patientmanager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.DateConvert;
import database.dbcon;

public class CheckupDao {
	public boolean insert(String pid, String dr, String nr, String re, String cost) {
		System.out.println();
		System.out.println(pid+"  "+dr+"  "+cost+"  "+nr+"  "+re);
		
		String sql="insert into dailycheckup values(?,?,?,?,?,?,?)";
		try{
			int as=Integer.parseInt(pid.trim());
			Date d=new Date();
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, as);
			ps.setString(3, dr);
			ps.setString(4, nr);
			ps.setString(5, re);
			ps.setInt(6, Integer.parseInt(cost));
			ps.setDate(7, new java.sql.Date(d.getTime()));
			int a=ps.executeUpdate();
			if(a>0)
				return true;
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	public List Display(String pid,Date d) {
		List ls=new ArrayList();
		String sql="select * from dailycheckup where checkupdate >=? and pid=?";
	
		try{
			//Date d=new Date();
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(d.getTime()));
			ps.setInt(2, Integer.parseInt(pid.trim()));
			
			ResultSet rs=ps.executeQuery();
			Map map;
		while (rs.next()) {
			map=new HashMap();
			map.put("pid", rs.getInt("pid"));
			map.put("doctorname", rs.getString("doctorname"));
			map.put("nursename", rs.getString("nursename"));
			map.put("remark", rs.getString("remark"));
			map.put("checkupdate", rs.getDate("checkupdate"));
			map.put("cost", rs.getInt("cost"));
			ls.add(map);
		}	
		
		}catch (Exception e) {
			// TODO: handle exception
		}
		return ls;
	}
	
	
	
}
