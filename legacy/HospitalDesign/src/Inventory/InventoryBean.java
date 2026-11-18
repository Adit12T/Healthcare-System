package Inventory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.DateConvert;
import database.dbcon;

public class InventoryBean {
	int s1 = 0;
	private String s2;
	private String s3;
	private String s4;
	private int totalquantity;
	private int id = 0;

	public boolean saveSuppliedItem(int aid, String sname, String type,
			String iname, String company, String date, int rquantity,
			int squantity, int pquantity, String expirydate, int tamount,
			int paidamount, int pending) {
		dbcon db = dbcon.getConnection();

		String s = "select *  from stock where item_name='" + iname
				+ "' and item_type='" + type + "' and mfg_company='" + company
				+ "'";
		ResultSet rs = db.select(s);
		try {
			if (rs.next()) {
				do {
					totalquantity = rs.getInt("total_quantity");
					s1 = rs.getInt("item_id");
					s2 = rs.getString("item_name");
					s3 = rs.getString("item_type");
					s4 = rs.getString("mfg_company");
					} while (rs.next());

				int bd = totalquantity + squantity;

				String sql = "update  stock set total_quantity=" + bd
						+ "  where item_name='" + iname + "'and item_type='"
						+ type + "' and mfg_company='" + company + "'";

				db.insertOrUpdate(sql);
			} else {

				String sql = "insert into stock values(" + id + ",'" + type
						+ "','" + iname + "','" + company + "'," + squantity
						+ ")";

				db.insertOrUpdate(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String sql1 = "insert into itemsupplied  values(" + aid + ",'" + sname
				+ "','" + type + "','" + iname + "','" + company + "','" + date
				+ "'," + rquantity + "," + squantity + "," + pquantity + ",'"
				+ expirydate + "'," + tamount + "," + paidamount + ","
				+ pending + ")";

		int flag = db.insertOrUpdate(sql1);

		if (flag > 0) {
			return true;
		}
		return false;

	}

	public boolean saveSupplierInfo(int aid, String sname, String add,
			String city, String state, String country, String cno, String email) {
		dbcon db = dbcon.getConnection();

		String sql1 = "insert into supplierinfo  values(" + aid + ",'" + sname
				+ "','" + add + "','" + city + "','" + state + "','" + country
				+ "','" + cno + "','" + email + "')";

		int flag = db.insertOrUpdate(sql1);
		if (flag > 0) {
			return true;
		}
		return false;
	}

	/*public boolean saveissuedata(int voucherno, String issueto,
			String personname, String issueitemtype, String issueitemname,
			String company, String issuedate, int reqquantity,
			int issuequantity, int pendingquantity, int totalamount,
			int pamount, int penamount) {
		dbcon db = dbcon.getConnection();
		int check = 0;
		int flag = 0;
		String s = "select *  from stock where item_name='" + issueitemname
				+ "' and item_type='" + issueitemtype + "' ";
		ResultSet rs = db.select(s);
		System.out.println(s);
		try {
			while (rs.next()) {
				totalquantity = rs.getInt("total_quantity");
				s1 = rs.getInt("item_id");
				s2 = rs.getString("item_name");
				s3 = rs.getString("item_type");
				s4 = rs.getString("mfg_company");
				System.out.println(s2);
				System.out.println(s3);
				System.out.println(s4);

				if (s2.equals(issueitemname) && s3.equals(issueitemtype)) {
					int bd = totalquantity - issuequantity;
					System.out.println(totalquantity);
					System.out.println(issuequantity);
					System.out.println(bd);
					if (bd > 0) {
						String sql = "update  stock set total_quantity=" + bd
								+ " where item_name='" + issueitemname
								+ "'and item_type='" + issueitemtype
								+ "' ";
						System.out.println(sql);
						check = db.insertOrUpdate(sql);
					} else {

						return false;
					}
				}
			}
		} catch (Exception e) {
			
		}
		String sql1 = "insert into issuediteminfo values(" + voucherno + ",'"
				+ issueto + "','" + personname + "','" + issueitemtype + "','"
				+ issueitemname + "','" + company + "','" + issuedate + "',"
				+ reqquantity + "," + issuequantity + " ," + pendingquantity
				+ "," + totalamount + "," + pamount + "," + penamount + ")";
		
			flag = db.insertOrUpdate(sql1);
		System.out.println(sql1);
		
		if (flag > 0) {
			return true;
		}
		return false;

	}
*/public boolean saveissuedata(int voucherno, 
		String personname, String issueitemtype, String issueitemname,
		String company, String issuedate, 
		int issuequantity,  int totalamount) {
	dbcon db = dbcon.getConnection();
	int check = 0;
	int flag = 0;
	int bd=0;
	String s = "select *  from stock where item_name='" + issueitemname
			+ "' ";
	ResultSet rs = db.select(s);
	System.out.println(s);
	try {
		while (rs.next()) {
			totalquantity = rs.getInt("total_quantity");
			s1 = rs.getInt("item_id");
			s2 = rs.getString("item_name");
			s3 = rs.getString("item_type");
			s4 = rs.getString("mfg_company");
			

			if (s2.equals(issueitemname) && s3.equals(issueitemtype)
					&& s4.equals(company)) {
				
				 bd = totalquantity - issuequantity;
				
				System.out.println(totalquantity);
				System.out.println(issuequantity);
				//System.out.println(bd);
				//if (bd > 0) {
					String sql = "update  stock set total_quantity=" + bd
							+ " where item_name='" + issueitemname
							+ "'and item_type='" + issueitemtype
							+ "' and mfg_company='" + company + "'";
					System.out.println(sql);
					check = db.insertOrUpdate(sql);
				} 
			}
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	String sql1 = "insert into issuediteminfo values(" + voucherno + ",'" + personname + "','" + issueitemtype + "','"
			+ issueitemname + "','" + company + "','" + issuedate + "'," + issuequantity + " ," + totalamount + ")";
	if (check != 0) {
		flag = db.insertOrUpdate(sql1);
		System.out.println(sql1);
	}
	if (flag > 0) {
		return true;
	}
	return false;

}
	public boolean saveexpireItem(int aid, String sname, String type,
			String iname, String company, String date, int rquantity,
			int squantity, int pquantity, String expirydate, int tamount,
			int paidamount, int pending) {
		dbcon db = dbcon.getConnection();

		
		String sql1 = "insert into expireitem  values(" + aid + ",'" + sname
				+ "','" + type + "','" + iname + "','" + company + "','" + date
				+ "'," + rquantity + "," + squantity + "," + pquantity + ",'"
				+ expirydate + "'," + tamount + "," + paidamount + ","
				+ pending + ")";

		int flag = db.insertOrUpdate(sql1);

		if (flag > 0) {
			return true;
		}
		return false;

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List getExItem() {
		int difference = 0;
		Date sdate;
		List record = new ArrayList();
		try {
			//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
//			Calendar cal = Calendar.getInstance();

			//date = (Date) dateFormat.parse(dateFormat.format(cal.getTime()));

			String sql = "select * from itemsupplied where  item_expiry_date <=?";
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(date.getTime()));
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getInt(1));
				Map map = new HashMap();
				sdate = rs.getDate("item_expiry_date");
				map.put("exdate", sdate);
				map.put("name", rs.getString("supplied_item_name"));
				map.put("quantity", rs.getInt("supplied_quantity"));
				map.put("id", rs.getInt("supplyer_id"));
				map.put("company", rs.getString("mfg_company"));
				map.put("type", rs.getString("supplied_item_type"));
				map.put("sname", rs.getString("supplyer_name"));
				map.put("date", rs.getString("supplied_date"));
				map.put("rq", rs.getInt("requsting_quantity"));
				
				map.put("pq", rs.getInt("pending_quantity"));
				map.put("ta", rs.getInt("total_amount"));
				map.put("pa", rs.getInt("paid_amount"));
				map.put("pena", rs.getInt("pending_amount"));
				
				//difference = (int) ((sdate.getTime() - date.getTime()) / (1000 * 60 * 60 * 24));
/*
				map.put("exdate", sdate);
				map.put("name", rs.getString("supplied_item_name"));
				map.put("quantity", rs.getInt("supplied_quantity"));
				map.put("id", rs.getInt("supplyer_id"));
				map.put("company", rs.getString("mfg_company"));
				map.put("type", rs.getString("supplied_item_type"));
				map.put("sname", rs.getString("supplyer_name"));
				map.put("date", rs.getString("supplied_date"));
				map.put("rq", rs.getInt("requesting_quantity"));
				
				map.put("pq", rs.getInt("pending_quantity"));
				map.put("ta", rs.getInt("total_amount"));
				map.put("pa", rs.getInt("paid_amount"));
				map.put("pena", rs.getInt("pending_amount"));
*/
//				if (difference <= 5)
					record.add(map);

			}
		} catch (Exception e) {
			
			
		}
		return record;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List searchSuppliedByItem(String type,String name) {
		
		Date sdate;
		List record = new ArrayList();
		try {
			

		
			String sql = "select * from itemsupplied where supplied_item_type='"+type+"' or supplied_item_name='"+name+"' ";
			if(type.equalsIgnoreCase("") & name.equalsIgnoreCase("")){
				sql = "select * from itemsupplied";
			}
			
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);

			while (rs.next()) {
				System.out.println(rs.getInt(1));
				Map map = new HashMap();
				sdate = rs.getDate("item_expiry_date");
				

				map.put("exdate", sdate);
				map.put("name", rs.getString("supplied_item_name"));
				map.put("quantity", rs.getInt("supplied_quantity"));
				map.put("id", rs.getInt("supplyer_id"));
				map.put("company", rs.getString("mfg_company"));
				map.put("type", rs.getString("supplied_item_type"));
				map.put("sname", rs.getString("supplyer_name"));
				map.put("date", rs.getString("supplied_date"));
				map.put("rq", rs.getInt("requsting_quantity"));
				
				map.put("pq", rs.getInt("pending_quantity"));
				map.put("ta", rs.getInt("total_amount"));
				map.put("pa", rs.getInt("paid_amount"));
				map.put("pena", rs.getInt("pending_amount"));

				
					record.add(map);

			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return record;
	}
public List searchExpiredStock() {
		
		Date sdate;
		List record = new ArrayList();
		try {
			

			String sql = "select * from expireitem ";
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);

			while (rs.next()) {
				//System.out.println(rs.getInt(1));
				Map map = new HashMap();
				sdate = rs.getDate("item_expiry_date");
				

				map.put("exdate", sdate);
				map.put("name", rs.getString("supplied_item_name"));
				map.put("quantity", rs.getInt("supplied_quantity"));
				map.put("id", rs.getInt("supplyer_id"));
				map.put("company", rs.getString("mfg_company"));
				map.put("type", rs.getString("supplied_item_type"));
				map.put("sname", rs.getString("supplyer_name"));
				map.put("date", rs.getString("supplied_date"));
				map.put("rq", rs.getInt("requsting_quantity"));
				
				map.put("pq", rs.getInt("pending_quantity"));
				map.put("ta", rs.getInt("total_amount"));
				map.put("pa", rs.getInt("paid_amount"));
				map.put("pena", rs.getInt("pending_amount"));

				
					record.add(map);

			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return record;
	}
public List searchSuppliedByCompany(String cp) {
		
		Date sdate;
		List record = new ArrayList();
		try {
			
System.out.println(cp);
			String sql = "select * from itemsupplied where mfg_company='"+cp+"' ";
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);

			while (rs.next()) {
				System.out.println(rs.getInt(1));
				Map map = new HashMap();
				sdate = rs.getDate("item_expiry_date");
				

				map.put("exdate", sdate);
				map.put("name", rs.getString("supplied_item_name"));
				map.put("quantity", rs.getInt("supplied_quantity"));
				map.put("id", rs.getInt("supplyer_id"));
				map.put("company", rs.getString("mfg_company"));
				map.put("type", rs.getString("supplied_item_type"));
				map.put("sname", rs.getString("supplyer_name"));
				map.put("date", rs.getString("supplied_date"));
				map.put("rq", rs.getInt("requsting_quantity"));
				
				map.put("pq", rs.getInt("pending_quantity"));
				map.put("ta", rs.getInt("total_amount"));
				map.put("pa", rs.getInt("paid_amount"));
				map.put("pena", rs.getInt("pending_amount"));

				
					record.add(map);

			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return record;
	}
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	public List getStock() {
		int difference = 0;
		Date sdate, pdate;
		List record = new ArrayList();
		try {
			

			String sql = "select item_id,item_type,item_name,mfg_company,sum(total_quantity) from stock group by item_type ,item_name order by item_name";
			dbcon db = dbcon.getConnection();
			ResultSet rs = db.select(sql);

				
				while (rs.next()) {

					Map map = new HashMap();
					map.put("s1", rs.getInt("item_id"));
					map.put("s2", rs.getString("item_type"));
					map.put("s3", rs.getString("item_name"));
					map.put("s4", rs.getString("mfg_company"));
					map.put("s5", rs.getInt("sum(total_quantity)"));

					

				
					record.add(map);

			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return record;
	}
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	public List getDrugIssueReport(String name,String type,String company) {
		int difference = 0;
		Date sdate, pdate;
		List record = new ArrayList();
		try {
			dbcon db = dbcon.getConnection();
			
			String sql = "select * from issuediteminfo where mfg_company='"
					+ company + "' and issued_item_name='" + name
					+ "' and issue_item_type='" + type + "'";
			ResultSet rs = db.select(sql);
			System.out.println(sql);

			while (rs.next()) {

				Map m=new HashMap();
				m.put("s1", rs.getInt(1));
				m.put("s2", rs.getString("issue_to"));
				m.put("s3", rs.getString("person_name"));
				m.put("s4", rs.getString("issue_item_type"));
				m.put("s5", rs.getString("issued_item_name"));
				m.put("s6", rs.getString("mfg_company"));
				m.put("s7", rs.getString("issue_date"));
				m.put("s8", rs.getInt("issue_quantity"));
				m.put("s9", rs.getInt("paid_amount"));
				m.put("s10", rs.getInt("pending_amount"));
				
					record.add(m);
					System.out.println(record);

			}
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return record;
	}
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	public List getPatient(int vno,String name) {
		int difference = 0;
		Date sdate, pdate;
		List record = new ArrayList();
		try {
			dbcon db = dbcon.getConnection();
			// System.out.println("ar");
			String sql="select * from issuediteminfo where voucher_no="+vno+" and person_name='"+name+"'";
			ResultSet rs = db.select(sql);
			System.out.println(sql);

			while (rs.next()) {

				Map m=new HashMap();
				m.put("s1", rs.getInt(1));
				m.put("s2", rs.getString("issue_to"));
				m.put("s3", rs.getString("person_name"));
				m.put("s4", rs.getString("issue_item_type"));
				m.put("s5", rs.getString("issued_item_name"));
				m.put("s6", rs.getString("mfg_company"));
				m.put("s7", rs.getString("issue_date"));
				m.put("s8", rs.getInt("issue_quantity"));
				m.put("s9", rs.getInt("paid_amount"));
				m.put("s10", rs.getInt("pending_amount"));
				
					record.add(m);
					System.out.println(record);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return record;
	}
	public List getSupply(String fdate,String ldate) {
		int a = 0;
		String sdate,edate;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		List record = new ArrayList();
		
		try {
			sdate =dateFormat.format ((Date) dateFormat.parse(fdate));
		
			edate =dateFormat.format ((Date) dateFormat.parse(ldate));
			System.out.println(sdate + " " + edate);
		
		String sql = "  select supplyer_id,supplyer_name,supplied_item_type,supplied_item_name,pending_amount,total_amount,pending_quantity,requsting_quantity,mfg_company,supplied_date,paid_amount,sum(supplied_quantity)  from itemsupplied as q  where  ((supplied_date>='"
				+ sdate
				+ "' and supplied_date <= '"
				+ edate
				+ "') )group by supplied_item_type ,supplied_item_name order by supplied_item_name ";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		
		while (rs.next()) {
			//System.out.println(rs.getInt(1));
			Map map = new HashMap();
			//difference = (int) ((sdate.getTime() - date.getTime()) / (1000 * 60 * 60 * 24));

			map.put("exdate", sdate);
			map.put("name", rs.getString("supplied_item_name"));
			map.put("quantity", rs.getInt("sum(supplied_quantity)"));
			map.put("id", rs.getInt("supplyer_id"));
			map.put("company", rs.getString("mfg_company"));
			map.put("type", rs.getString("supplied_item_type"));
			map.put("sname", rs.getString("supplyer_name"));
			map.put("date", rs.getString("supplied_date"));
			map.put("rq", rs.getInt("requsting_quantity"));
			
			map.put("pq", rs.getInt("pending_quantity"));
			map.put("ta", rs.getInt("total_amount"));
			map.put("pa", rs.getInt("paid_amount"));
			map.put("pena", rs.getInt("pending_amount"));

			
				record.add(map);

		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return record;
	}



}
