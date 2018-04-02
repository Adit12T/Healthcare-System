package room.floor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class RoomBedInfoBean {

	public List showById(int id) {

		String sql = "select * from room_bed_info rbi,room_info ri,room_type rt where rt.room_type_id=ri.room_type_id  and rbi.room_id=ri.room_id  and rbi.bed_id="
				+ id;
		List record = new ArrayList();

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
				map.put("bednumber", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
				map.put("bedstatus", rs.getString("bed_status"));
				map.put("bedoccupy", rs.getString("occupy_status"));
				record.add(map);

				/*
				 * bed_number room_floor bed_capicity room_type_name
				 * room_type_cost room_number
				 */

			}
		} catch (Exception e) {
			 System.out.println("  --"+e);
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
				 map.put("bed_status", rs.getString("bed_status"));
				// map.put("roomtypecost", rs.getInt("room_type_cost"));
				map.put("roomnumber", rs.getString("room_number"));
				map.put("bednumber", rs.getString("bed_number"));
				map.put("bedid", rs.getString("bed_id"));
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

	public List showBedInformaion() {
		List record = new ArrayList();

		String sql = "select * from room_bed_info rbi, room_info ri,room_type rt where rbi.room_id=ri.room_id and ri.room_type_id =rt.room_type_id ";
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
				map.put("bednumber", rs.getString("bed_number"));
				record.add(map);
				/*
				 * bed_number room_floor bed_capicity room_type_name
				 * room_type_cost room_number
				 */

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}

	public boolean insertbedinfo(int id, int bedcapacity) {
		boolean flag = false;
		int ch = 65;
		char chc;
		String s;
		System.out.println(id + "           " + bedcapacity);
		String sql = "insert into room_bed_info (room_id,bed_number,bed_status,occupy_status)values(?,?,?,?)";
		Connection con = dbcon.getPreparedStatement();
		con = dbcon.getPreparedStatement();
		try {
			PreparedStatement ps = con.prepareStatement(sql);

			for (int i = 0; i < bedcapacity; i++) {
				System.out.println(i);
				chc = (char) ch++;
				s = chc + "";

				ps.setInt(1, id);
				ps.setString(2, s);
				ps.setString(3, "activate");
				ps.setString(4, "0");
				ps.executeUpdate();
				flag = true;

			}
		} catch (Exception e) {
			System.out.println(e);
			flag = false;
		}

		return flag;
	}

}
