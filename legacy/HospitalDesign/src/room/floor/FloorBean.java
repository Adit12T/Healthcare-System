package room.floor;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.dbcon;

public class FloorBean {

	dbcon db = dbcon.getConnection();

	public boolean saveFloor(String floorname) {
		boolean flag = false;

		int floorno = Integer.parseInt(floorname);
		boolean f = checkFloor(floorno);
		if (f) {
			String sql = "insert into floor values(" + floorno + ")";
			int a = db.insertOrUpdate(sql);
			System.out.println(a);
			if (a > 0) {
				return true;
			}

		}

		return flag;
	}

	public boolean checkFloor(int floorno) {

		String sql = "select * from floor where floor_number=" + floorno;
		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
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
		try{
		while (rs.next()) {

			record.add(rs.getInt(1));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return record;
	}

}
