package room.floor;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class RoomNumberBean {
	dbcon db = dbcon.getConnection();
	String msgs="<font color ='red'>Some Error..........</font>";
	public boolean save(String floorname, String roomtypeid, String roomnumber,
			String bedcapacity, String status) {
		boolean flag = false;
		int bedcapacitys = Integer.parseInt(bedcapacity);
		if (check(roomnumber)) {
			String sql = "insert into room_info (room_type_id,room_floor,room_number,bed_capacity,room_status)values("
					+ roomtypeid
					+ ",'"
					+ floorname
					+ "','"
					+ roomnumber
					+ "',"
					+ bedcapacitys + ",'" + status + "')";
			int a = db.insertOrUpdate(sql);
			System.out.println("value of a=" + a);
			if (a > 0) {
				int id = getRoomId(roomnumber);
				System.out.println(id);
				RoomBedInfoBean rbb = new RoomBedInfoBean();
				rbb.insertbedinfo(id, bedcapacitys);
				 msgs="<font color ='red'>Successfully Created..........</font>";
				return true;
			}

		}

		return flag;

	}

	public int getRoomId(String roomnumber) {
		int id = 0;
		String sql = "select * from room_info where room_number='" + roomnumber
				+ "'";
		ResultSet rs = db.select(sql);
		try {
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return id;
	}

	public boolean check(String roomnumber) {

		String sql = "select * from room_info where room_number='" + roomnumber
				+ "'";
		try {
			ResultSet rs = db.select(sql);
			while (rs.next()) {
				 msgs="<font color ='red'>Already Exist..........</font>";
				return false;

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return true;
	}

	public List showFloor() {
		List record = new ArrayList();
		String sql = "select * from floor";
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {

				record.add(rs.getInt(1));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}

	public List showRoomType() {
		List record = new ArrayList();
		String sql = "select * from room_type";
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map = new HashMap();
				map.put("room_type_id", rs.getInt("room_type_id"));
				map.put("room_type_name", rs.getString("room_type_name"));
				map.put("room_type_cost", rs.getString("room_type_cost"));
				record.add(map);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}

	public List showbedInfo() {
		List record = new ArrayList();
		String sql = "SELECT * FROM room_bed_info,room_info,room_type  WHERE room_bed_info.room_id=room_info.room_id AND room_info.room_type_id=room_type.room_type_id";

		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {

				map = new HashMap();
				map.put("bedid", rs.getInt("bed_id"));
				map.put("roomnumber", rs.getString("room_number"));
				map.put("room_type", rs.getString("room_type_name"));
				//map.put("bedcapacity", rs.getString("bed_capacity"));
				map.put("bednumber", rs.getString("bed_number"));
				record.add(map);

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return record;

	}
	public String deleteRoom(String ids) {
int id=Integer.parseInt(ids);
		if (checkRoom(id)) {
			String sql = "delete from room_info where room_id=" + id ;
			
			int a = db.insertOrUpdate(sql);
			sql="delete from room_bed_info where room_id=" + id ;
			db.insertOrUpdate(sql);
			if (a > 0) {
				msg = "<font color='grean' size='16px'>Successfully Deleted..........</font>";
				return msg;
			}

		}
		return msg;

	}

	String msg = "";

	public boolean checkRoom(int id) {

		String sql = "SELECT * FROM room_info ri,room_bed_info rbi where ri.room_id=rbi.room_id and rbi.occupy_status='1' and ri.room_id="
				+ id;
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				msg = "<font color='red' size='16px'>Room Occupied .....................</font>";
				return false;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

}
