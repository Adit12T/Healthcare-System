package Inventory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class NewIssueServletSaveDataDao {

	public boolean saveData(NewissueitemDao p, String name, String total) {
		String sql = "insert into issuediteminfo values(?,?,?,?)";
		try {
			PreparedStatement pp = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			pp.setInt(1, 0);
			pp.setString(2, name);
			pp.setDate(3, new java.sql.Date(new Date().getTime()));
			pp.setInt(4, Integer.parseInt(total.trim()));
			int a = pp.executeUpdate();
			if (a > 0) {
				boolean ss = get(p);
				if (ss) {
					return true;
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;

	}

	public int getbill(String name, String total) {
		int a = 0;
		String sql = "select * from issuediteminfo where person_name= ? and issue_date= ? and total_amount=?";
		try {
			PreparedStatement pp = dbcon.getPreparedStatement()
					.prepareStatement(sql);

			pp.setString(1, name);
			pp.setDate(2, new java.sql.Date(new Date().getTime()));
			pp.setInt(3, Integer.parseInt(total.trim()));
			ResultSet rs = pp.executeQuery();
			while (rs.next()) {
				a = rs.getInt("billno");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return a;
	}

	public boolean get(NewissueitemDao p) {
		List record = p.record;
		try {
			Map map;
			ResultSet rs;
			String sql = "select * from stock where item_name=?";
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
			int tmp;
			for (int i = 0; i < record.size(); i++) {
				map = (Map) record.get(i);
				tmp = (Integer) map.get("quantity");
				ps.setString(1, (String) map.get("name"));
				rs = ps.executeQuery();
				if (rs.next()) {
					int q = rs.getInt("total_quantity");
					rs.updateInt("total_quantity", (q - tmp));
					rs.updateRow();
				}

			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
