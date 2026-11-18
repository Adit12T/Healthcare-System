package attendance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.conn.MyCon;

public class Attendance {
	public boolean setAttendance(int at_id,int id,String e_name,int year,String month,String date,String at_status){
		Connection con=MyCon.getConnection();
		Date date2=new Date();
		int year1=date2.getYear();
		int month1=date2.getMonth();
		 Date d=new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String datevalue=format.format(d);
		String sql="insert into attendance values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, id);
			ps.setString(3,e_name);
			ps.setInt(4,year);
			ps.setInt(5, month1);
			ps.setString(6, datevalue);
			ps.setString(7, at_status);
			int flag=ps.executeUpdate();
			if(flag>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
