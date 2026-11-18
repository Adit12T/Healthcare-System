package room.floor;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import database.dbcon;

public class RoomTypeBean {
	dbcon db = dbcon.getConnection();
public String ms="<font color='red'>Try Again..........</font>";
	public boolean save(String roomtypename, String roomtypecost) {
		boolean flag = false;
		int roomtypecost_ = Integer.parseInt(roomtypecost);
		if (checkFloor(roomtypename)) {
			String sql = "insert into room_type (room_type_name,room_type_cost)values('"
					+ roomtypename + "'," + roomtypecost + ")";
			int a = db.insertOrUpdate(sql);
			System.out.println(a);
			if (a > 0) {
				ms="<font color='green'>Success..........</font>";
				return true;
			}

		}

		return false;

	}

	public boolean checkFloor(String roomtypename) {

		String sql = "select * from room_type where room_type_name='"
				+ roomtypename + "'";
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				ms="<font color='red'>Already Exist............</font>";
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return true;
	}

	public List showRoomType() {
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

public	int roomtyprid;
public	String roomtypename;
public	int roomtypcost;

	public void get(String id) {
		String sql = "select * from room_type where room_type_id='" + id + "'";

		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				roomtyprid = rs.getInt("room_type_id");
				roomtypename = rs.getString("room_type_name");
				roomtypcost = rs.getInt("room_type_cost");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	public boolean update(String roomtypename, String roomtypecost) {
	System.out.println(roomtypecost);
	System.out.println(roomtypename);
		boolean flag = false;
		int roomtypecost_ = Integer.parseInt(roomtypecost);
	
			String sql = "update  room_type set room_type_cost="
					+ roomtypecost_ + " where room_type_name='"+roomtypename+"'";
			int a = db.insertOrUpdate(sql);
			System.out.println(a);
			if (a > 0) {
				ms="<font color='green'>Update SuccessFully........</font>";
				return true;
			}

	
			ms="<font color='red'>Try again........</font>";
		return false;

	}
}
