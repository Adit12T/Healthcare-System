package sechdule;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class SechduleDao {

	public List getAllDoctorForsechdule() {
		List ls = new ArrayList();
		String sql = "select * from employee e,employee_specialization esp where  e.emp_id=esp.emp_id";
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try {
			Map map;
			while (rs.next()) {
				map=new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("empspecialization", rs.getString("specialization"));
				map.put("empdepartment", rs.getString("emp_department"));
			//	map.put("empsechdule",getSechduleByID(rs.getInt("emp_id")) );
				ls.add(map);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ls;
	}
	public List getDoctor() {
		List ls = new ArrayList();
		String sql = "select * from employee e where e.emp_type='doctor' and e.emp_id !=all (select emp_id from employee_schedule)";
		//distinct (emp_name)
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		try {
			String s1="",s2="";
			Map map;int i=0;
			while (rs.next()) {
				if(s1.equalsIgnoreCase((String)rs.getString("emp_name"))){
					
				}
				else{
					System.out.println(++i);
					s1=rs.getString("emp_name");
				map=new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
			//	map.put("empspecialization", rs.getString("specialization"));
			//	map.put("empdepartment", rs.getString("emp_department"));
			//	map.put("empsechdule",getSechduleByID(rs.getInt("emp_id")) );
				ls.add(map);}
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ls;
	}
	
	public List getSechduleByID(int i) {
		List ls = new ArrayList();
		System.out.println("i value= "+i);
		String sql = "select * from employee e,employee_schedule es where  e.emp_id=es.emp_id and e.emp_id="+i;
		
		dbcon db = dbcon.getConnection();
		ResultSet rs = db.select(sql);
		
		try {
			Map map;
			while (rs.next()) {
				
				map=new HashMap();
				map.put("empid", rs.getInt("emp_id"));
				map.put("empname", rs.getString("emp_name"));
				map.put("empday", rs.getString("visiting_day"));
				map.put("empstarthr", rs.getString("start_hr"));
				map.put("emstartminute", rs.getString("start_minute"));
				map.put("emstartshift", rs.getString("start_shift"));
				map.put("empendhr", rs.getString("end_hr"));
				map.put("empendminute", rs.getString("end_minute"));
				map.put("empendshift", rs.getString("end_shift"));
				
				map.put("emppayedstart", rs.getString("startconsult_time"));
				map.put("emppayedend", rs.getString("endconsult_time"));
				map.put("emppayedcost", rs.getString("consult_cost"));
				
				System.out.println(ls);
				
				ls.add(map);
				System.out.println("---------"+i);
			}
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return ls;
	}
	public boolean deleteRecord(String id){
		
		String sql="delete from employee_schedule where emp_id='"+id+"'";
		dbcon db=dbcon.getConnection();
		int a=db.insertOrUpdate(sql);
		if(a>0){
			return true;
		}
		return false;
	}
	

}
