package com.expenditure;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.conn.MyCon;

public class Expendituredao {

	public static Boolean saveExpenditure(Expenditure_Beans e) {

		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into expenditure values(0,'"
							+ e.getEItem() + "','" + e.getEDate() + "','"
							+ e.getECost() + "','" + e.getERemark() + "')");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return null;
	}

	public static Boolean updateExpenditure(Expenditure_Beans e) {

		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("update `expenditure` set `e_item`='"
							+ e.getEItem() + "',`e_date`='" + e.getEDate()
							+ "',`e_cost`='" + e.getECost() + "',`e_remark`='"
							+ e.getERemark() + "' where `e_id`='" + e.getEId()
							+ "'");
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

		return null;
	}

	public static void deleteExpenditure(int eid) {
		Connection con = MyCon.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("delete from `expenditure` where `e_id`='"
							+ eid + "'");
			ps.executeUpdate();

		} catch (SQLException e1) {

			e1.printStackTrace();
		}

	}
	
	public static ArrayList<Expenditure_Beans> getExpenditure(){
		Connection con = MyCon.getConnection();
		ArrayList<Expenditure_Beans> list =new ArrayList<>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from `expenditure`");
		ResultSet rs =	ps.executeQuery();
		while (rs.next()) {
			Expenditure_Beans e = new Expenditure_Beans(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			list.add(e);
		}
		
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		return list;
		
	}
	
}
