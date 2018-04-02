package Ambulance;
import database.dbcon;

public class AmbulanceBean {
	private int pid;
	private int aid;
	private String atype;
	private String add;
	private String ptype;
	private String date;
	private String time;
	private int cno1;
	//private int tamount;
	
	//private int aid;
	//private String amt;
	private String drivername;
	private int cost;
	private int cno;
	
	public AmbulanceBean()
	{
	
	}
	
	public boolean saveData(int aid, String atype, int pid, String pname,
			 String date, String time, String add,String cno1
			) {
	
		dbcon db = dbcon.getConnection();
		String sql = "insert into ambulance_info values(" +aid+ ",'"
				+ atype + "'," + pid + ",'" + pname + "','" + date
				+ "','" + time+ "','" + add + "','" + cno1 + "')";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;
	}

	
	
	public boolean saveDatainfo( int aid, String atype, String drivername,int cno) 
	{
	
		dbcon db = dbcon.getConnection();
		String sql = "insert into ambulance_updation values(" + aid + ",'"
				+ atype + "','" + drivername + "',"+cno+")";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;
	}

}
