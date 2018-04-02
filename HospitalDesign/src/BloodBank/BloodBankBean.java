package BloodBank;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import database.DateConvert;
import database.dbcon;
import database1.DateConvertdata;

public class BloodBankBean {
	int s1=0;
	public BloodBankBean() {

	}

	public boolean savedonerData(int did, String dname, String ddob,
			String dgender, String dage, String dbloodgroup, String dweight,
			String dmobile, String daddress, String dcity, String dstate,
			String dcountry, String demail, String dremark, String ddate,
			String dlastddate, int dquantity, String dusername,
			String dpassword, String dcnfmpwd) {

		// dbcon db = dbcon.getConnection();
		dbcon db = dbcon.getConnection();
		try {
             s1 = getbloodbyname(dbloodgroup);
			int bd = s1 + dquantity;
			System.out.println(bd);
			String sql = "update  bloodbank_manager set bloodquantity=" + bd
					+ " where bloodtypename='" + dbloodgroup + "'";
			System.out.println(sql);
			db.insertOrUpdate(sql);

			String sql1 = "insert into bloodbankdonor  values(" + did + ",'"
					+ dname + "','" +ddob  + "','" + dgender + "','" + dage
					+ "','" + dbloodgroup + "'," + dweight + ",'" + dmobile
					+ "','" + daddress + "','" + dcity + "','" + dstate + "','"
					+ dcountry + "','" + demail + "','" + dremark + "','"
					+ DateConvertdata.convertDate(ddate) + "','" + DateConvertdata.convertDate(dlastddate) + "'," + bd + ",'" + dusername
					+ "','" + dpassword + "','" + dcnfmpwd + "')";

			int flag = db.insertOrUpdate(sql1);
			// int flag = db.insertOrUpdate(sql);
			if (flag > 0) {
				return true;
			}
			return false;

		} catch(Exception e) {
			// TODO: handle exception
		}
		return false;

	}

	public boolean saveacceptorData(int aid, String aname, String adob,
			String agender, String aage, String abloodgroup, String amobile,
			String aaddress, String acity, String astate, String acountry,
			String aemail, String adate, int aquantity) {

		dbcon db = dbcon.getConnection();

		String s = "select bloodtypename, bloodquantity  from bloodbank_manager where bloodtypename='"
				+ abloodgroup + "'";
		ResultSet rs = db.select(s);
		try {
			while (rs.next()) {
				abloodgroup = rs.getString("bloodtypename");
				s1 = rs.getInt("bloodquantity");
				System.out.println(s1);

			}
			int bd = s1 - aquantity;
			if (bd > 0) {
				String sql = "update  bloodbank_manager set bloodquantity="
						+ bd + " where bloodtypename='" + abloodgroup + "'";
				System.out.println(sql);
				db.insertOrUpdate(sql);
			} else {
				return false;
			}
			String sql1 = "insert into bloodbankacceptor  values(" + aid + ",'"
					+ aname + "','" + adob + "','" + agender + "','" + aage
					+ "','" + abloodgroup + "','" + amobile + "','" + aaddress
					+ "','" + acity + "','" + astate + "','" + acountry + "','"
					+ aemail + "','" + adate + "'," + aquantity + ")";

			int flag = db.insertOrUpdate(sql1);
			// int flag = db.insertOrUpdate(sql);
			if (flag > 0) {
				return true;
			}
			return false;

		} catch (Exception e) {
			System.out.println(e);
		}

		return false;

	}

	public static int getbloodquantitybytype(String name) {
		return 0;

	}
	
	public static int getbloodbyname(String name) {
		dbcon db = dbcon.getConnection();
		
		int q=0;
		String s = "select bloodquantity  from bloodbank_manager where bloodtypename='"
				+ name + "'";
		ResultSet rs = db.select(s);
		try {
			while (rs.next()) {
				
				q = rs.getInt("bloodquantity");
				System.out.println(q);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
 return q;
	}
	
	public static ArrayList getblood(){
		dbcon db = dbcon.getConnection();
		String sql = "select *from bloodbank_manager";
		ResultSet rs = db.select(sql);
		ArrayList ls = new ArrayList();
		
		try {
			while (rs.next()) {
				Map m = new HashMap();
				m.put("id", rs.getInt(1));
				m.put("type", rs.getString(2));
				m.put("quantity", rs.getString(3));
				ls.add(m);
				
				
			}} catch (Exception e) {
				// TODO: handle exception
			}
		return ls;

	}
}
