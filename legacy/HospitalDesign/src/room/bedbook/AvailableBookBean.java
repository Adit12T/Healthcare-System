package room.bedbook;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class AvailableBookBean {
	dbcon db = dbcon.getConnection();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public List showRoomTye() {
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
	public List showRoomInfo(String roomtype) {
		List record = new ArrayList();

		String sql = "select * from  room_info ri,room_type rt where  ri.room_type_id =rt.room_type_id and rt.room_type_name='"+roomtype+"' ";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				// map.put("", rs.getString(""));
				map.put("roomfloor", rs.getString("room_floor"));
				map.put("bedcapacity", rs.getInt("bed_capacity"));
				map.put("roomtypename", rs.getString("room_type_name"));
				map.put("roomtypecost", rs.getInt("room_type_cost"));
				map.put("roomnumber", rs.getString("room_number"));
			/*	map.put("bednumber", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("bedstatus", rs.getString("bed_status"));
				map.put("bedoccupy", rs.getString("bed_occupy"));
				*/record.add(map);

				/*
				 * bed_number room_floor bed_capicity room_type_name
				 * room_type_cost room_number
				 */

			}
		} catch (Exception e) {
			// System.out.println("  --"+e);
		}
		// System.out.println(record);
		return record;

	}
	
	public List showRoomInfo() {
		List record = new ArrayList();

		String sql = "select * from  room_info ri,room_type rt where  ri.room_type_id =rt.room_type_id ";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				// map.put("", rs.getString(""));
				map.put("roomfloor", rs.getString("room_floor"));
				map.put("bedcapacity", rs.getInt("bed_capacity"));
				map.put("roomtypename", rs.getString("room_type_name"));
				map.put("roomtypecost", rs.getInt("room_type_cost"));
				map.put("roomnumber", rs.getString("room_number"));
			/*	map.put("bednumber", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("bedstatus", rs.getString("bed_status"));
				map.put("bedoccupy", rs.getString("bed_occupy"));
				*/record.add(map);

				/*
				 * bed_number room_floor bed_capicity room_type_name
				 * room_type_cost room_number
				 */

			}
		} catch (Exception e) {
			// System.out.println("  --"+e);
		}
		// System.out.println(record);
		return record;

	}
	public List showBedInfoByRoomID(String roomnumber) {
		List record = new ArrayList();

		String sql = "select * from room_bed_info rbi, room_info ri where rbi.room_id=ri.room_id and ri.room_number='"
				+ roomnumber + "'";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				// map.put("", rs.getString(""));
				map.put("roomfloor", rs.getString("room_floor"));
				map.put("bedcapacity", rs.getInt("bed_capacity"));
				// map.put("roomtypename", rs.getString("room_type_name"));
				// map.put("roomtypecost", rs.getInt("room_type_cost"));
				map.put("roomnumber", rs.getString("room_number"));
				map.put("bednumber", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("bedstatus", rs.getString("bed_status"));
				map.put("occupystatus", rs.getString("occupy_status"));
				record.add(map);
				/*
				 * bed_number room_floor bed_capicity room_type_name
				 * room_type_cost room_number
				 */

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		// System.out.println("--------"+record);
		return record;

	}

}
