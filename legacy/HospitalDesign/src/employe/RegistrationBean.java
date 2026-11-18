package employe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import com.conn.MyCon;

import database.dbcon;

public class RegistrationBean {

	private int id;
	private String name;
	private String dob;
	private String joindate;
	private String teleno;
	private String mobno;
	private String mstatus;
	private String gender;
	private String address;
	private String city;
	private String state;
	private String country;
	private String bloodg;
	private String emptype;
	private String email;
	private String image;
	private int salary;
	private String dname;

	private String qtype;
	private String coursen;
	private String stream;
	private String university;
	private String clgname;
	private String passyear;
	private String percentage;

	private String specialization;
	private String licenseno;

	private String lastemp;
	private String post;
	private String esalary;
	private String experience;
	private int expid = 0;
	private int profid = 0;
	private int speid = 0;
	
	
	private int aid = 0;
	private String bankname;
	private String bankaccno;
	private String pfno;
	private String panno;
private int status1;
	public RegistrationBean() {

	}

	public boolean saveData(int id, String name, String dob, String joindate,
			String teleno, String mobno, String mstatus, String gender,
			String address, String city, String state, String country,
			String bloodg, String emptype, String email, String image,
			int salary,String dname,int status,String c_date,String s_date) {
		// System.out.println(fname);
		dbcon db = dbcon.getConnection();
		String sql = "insert into employee values(" + id + ",'" + name + "','"
				+ dob + "','" + joindate + "','" + teleno + "','" + mobno
				+ "','" + mstatus + "','" + gender + "','" + address + "','"
				+ city + "','" + state + "','" + country + "','" + bloodg
				+ "','" + emptype + "','" + email + "','" + image + "',"
				+ salary + ",'"+dname+"',"+status+",'"+c_date+"','"+s_date+"')";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;
	}

	public int getempid(int id, String name, String dob, String joindate,
			String teleno, String mobno, String mstatus, String gender,
			String address, String city, String state, String country,
			String bloodg, String emptype, String email, String image,
			int salary) {
		int ids=0;
		// System.out.println(fname);
		dbcon db = dbcon.getConnection();
		String sql = "select * from employee where emp_name='" + name + "' and emp_email='" + email + "'";

		ResultSet rs = db.select(sql);
		try{
		if(rs.next())
				ids = rs.getInt(1);
		} catch (Exception e) {
				// TODO: handle exception
			}
System.out.println("method==========="+ids);
		return ids;
	}

	
	
	public boolean saveData1(int expid, int id, String lastemp, String post,
			String esalary, String experince) {

		dbcon db = dbcon.getConnection();
		String sql = "insert into employee_experience values(" + expid + ","
				+ id + ",'" + lastemp + "','" + post + "','" + esalary + "','"
				+ experince + "')";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}

	public boolean saveData2(int profid, int id, String qtype[],
			String coursen[], String stream[], String university[],
			String clgname[], String passyear[], String percentage[]) {

		int flag = 0;
		dbcon db = dbcon.getConnection();

		for (int i = 0; i < qtype.length; i++) {
			if (qtype[i] != null && qtype[i] !="") {
				String sql = "insert into employee_profetional_information values("
						+ profid
						+ ","
						+ id
						+ ",'"
						+ qtype[i]
						+ "','"
						+ coursen[i]
						+ "','"
						+ stream[i]
						+ "','"
						+ university[i]
						+ "','"
						+ clgname[i]
						+ "','"
						+ passyear[i] + "','" + percentage[i] + "')";

				flag = db.insertOrUpdate(sql);
			}
		}
		if (flag > 0) {
			return true;
		}
		return false;

	}

	public boolean saveData3(int speid, int id, String specialization,
			String licenseno) {

		dbcon db = dbcon.getConnection();
	
		String sql = "insert into employee_specialization values(" + speid
				+ "," + id + ",'" + specialization + "','" + licenseno + "')";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}
	/*public boolean updateData( int id, 
			String teleno, String mobno, String mstatus,
			String address, String city, String state, String country,
			  String email, String image,int salary)
	{
		dbcon db = dbcon.getConnection();
	HttpSession s=Request.getSession();
		String sql = "update  employee set emp_address,emp_mobile,emp_telephone,emp_marrialstatus,emp_email,emp_city,emp_state,emp_country,emp_salary,emp_image where emp_id="++""; 
		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}*/
	public boolean saveData4( int aid,int id,String bankname,String bankaccno,String pfno,String panno) {

		dbcon db = dbcon.getConnection();

		String sql = "insert into employee_account values(" + aid + "," + id + ",'"
				+ bankname + "','" + bankaccno + "','" + pfno + "','" + panno
				+ "')";

		int flag = db.insertOrUpdate(sql);
		if (flag > 0) {
			return true;
		}
		return false;

	}

	public List showDept(){
		List list=new ArrayList();
		String sql="select * from department";
		Connection con=MyCon.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("department_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	
}
