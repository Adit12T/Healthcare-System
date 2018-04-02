package Inventory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import database.DateConvert;
import database.dbcon;
import database1.DateConvertdata;

public class DateWiseBean {

	dbcon db = dbcon.getConnection();

	String sdate, edate;

	public List showDetail(String fdate, String ldate) {
		sdate = fdate;
		edate = ldate;

		List record = new ArrayList();
		String sql = "select * from stock";

		ResultSet rs = db.select(sql);
		try {
			while (rs.next()) {
				System.out.println(rs.getInt(1));

				int id = rs.getInt("item_id");
				String name = rs.getString("item_name");
				int SuppliedQuantity =  getSuppliedQuantity(name);
				int IssueQuantity =  getIssueQuantity(name);
				int total = rs.getInt("total_quantity");

				StockDetailBean sd = new StockDetailBean();
				sd.setItemid(id);
				sd.setItemname(name);
				sd.setSuppiled(SuppliedQuantity);
				sd.setIssue(IssueQuantity);
				sd.setTotal(total);
			record.add(sd);
				System.out.println(record);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return record;
	}

	public int getSuppliedQuantity(String  name) {
		int a = 0;
		String sql = "select sum(supplied_quantity) as q  from itemsupplied s where  ((s.supplied_date>=? and s.supplied_date <=?) and  s.supplied_item_name=?) ";

		
		try {
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			Date d1=DateConvert.convertDate(DateConvertdata.convertDate(sdate));
			Date d2=DateConvert.convertDate(DateConvertdata.convertDate(edate));
					ps.setDate(1, new java.sql.Date(d1.getTime()));
					ps.setDate(2, new java.sql.Date(d2.getTime()));
					ps.setString(3, name);
					ResultSet rss = ps.executeQuery();
			if (rss.next()) {
				a = rss.getInt("q");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	public int getIssueQuantity(String name) {
		int a = 0;

		String sql = "select sum(issue_quantity) as q  from issuediteminfo s where  ((s.issue_date>=? and s.issue_date <=?) and  s.issued_item_name=?) ";
		try {

			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
	Date d1=DateConvert.convertDate(DateConvertdata.convertDate(sdate));
	Date d2=DateConvert.convertDate(DateConvertdata.convertDate(edate));
			ps.setDate(1, new java.sql.Date(d1.getTime()));
			ps.setDate(2, new java.sql.Date(d2.getTime()));
			ps.setString(3, name);
			ResultSet rss1 = ps.executeQuery();

			
			if (rss1.next()) {
				a = rss1.getInt("q");
				System.out.println(a);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
