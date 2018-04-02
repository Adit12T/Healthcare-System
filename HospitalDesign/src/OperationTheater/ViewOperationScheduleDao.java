package OperationTheater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conn.MyCon;


public class ViewOperationScheduleDao {
	public List<OperationRegistrationBean> selectSchedule(String getDate_from,String getDate_to ){
		
		List<OperationRegistrationBean> oList=new ArrayList<OperationRegistrationBean>();
		String sql="select * from operation_patient,patient where (operation_date >=? and operation_date <=?) and patient.patient_registrationno=operation_patient.patient_id";
		Connection con=MyCon.getConnection();
		try {
			OperationRegistrationBean operationRegistrationBean;
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,getDate_from);
			ps.setString(2,getDate_to);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
			
				operationRegistrationBean=new OperationRegistrationBean(rs.getInt(1), rs.getInt(7), rs.getInt(8), rs.getInt(6), rs.getString(4), rs.getString(5), rs.getString("operation_date"), rs.getString(3), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),rs.getString("patient_name"));
				oList.add(operationRegistrationBean);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oList; 
	}

}
