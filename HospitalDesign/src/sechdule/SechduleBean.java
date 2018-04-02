package sechdule;

import java.sql.PreparedStatement;

import database.dbcon;

public class SechduleBean {
	int emp_id;
	String visiting_day;
	int start_hr;
	int start_minute;
	int end_hr;
	int end_minute;
	int paid_cost;

	public boolean saveSechdule(String paidcharge,String pst,String pet, int empid, String visiting_day[],
			String start_hr[], String start_minute[],String start_shift[], String end_hr[],
			String end_minute[],String end_shift[]) {

		String sql = "insert into employee_schedule (emp_id,visiting_day,start_hr,start_minute,end_hr,end_minute,start_shift,end_shift,consult_cost,startconsult_time,endconsult_time)values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);

			for (int i = 0; i < visiting_day.length; i++) {
				ps.setInt(1, empid);
				ps.setString(2, visiting_day[i]);
				ps.setInt(3, Integer.parseInt(start_hr[i]));
				ps.setInt(4, Integer.parseInt(start_minute[i]));
				ps.setInt(5, Integer.parseInt(end_hr[i]));
				ps.setInt(6, Integer.parseInt(end_minute[i]));
				ps.setString(7, start_shift[i]);
				ps.setString(8, end_shift[i]);
				ps.setString(9, paidcharge);
				ps.setString(10, pst);
				ps.setString(11, pet);
				
				int a = ps.executeUpdate();
				/*
	  varchar(10)  latin1_swedish_ci  YES             (NULL)                   select,insert,update,references             
    varchar(10)  latin1_swedish_ci  YES             (NULL)                   select,insert,update,references             
 			 * 
				 * if(a<0) return false;
				 */
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return true;

	}

}
