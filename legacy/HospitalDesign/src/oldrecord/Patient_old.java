package oldrecord;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.dbcon;

public class Patient_old {
	
	dbcon db=dbcon.getConnection();
	public List getOldPatient(String s) {
		List record = new ArrayList();
		/*String sql = "select * from patient_inside  ,patient ,employee ,room_bed_info ,room_info  where"
				+ "patient_inside.bed_id=room_bed_info.bed_id and room_info.room_id=room_bed_info.room_id"
				+ "and   employee.emp_id=patient_inside.doctor_id"
				+ "and patient_inside.patient_id=patient.patient_registrationno";
		*/
		String sql=null;
		if(s!=null &&s!=""){
			
			sql="select * from patient where patient_name like '"+s+"%' or patient_registrationno like '"+s+"%'";// or patient_registrationno like "+s+"%";
		}
		else
		 sql="select * from patient ";
		ResultSet rs=db.select(sql);
		try {
			Map map;
			
			

			while(rs.next()){
				map=new HashMap();
				//map.put("admitid", rs.getInt("admision_id"));
				map.put("patient_registrationno", rs.getInt("patient_registrationno"));
				map.put("patient_name", rs.getString("patient_name"));
				map.put("patient_gender", rs.getString("patient_gender"));
				map.put("patient_age", rs.getString("patient_age"));
				map.put("patient_marital_status", rs.getString("patient_marital_status"));
				map.put("patient_father_husband", rs.getString("patient_father_husband"));
				map.put("patient_address", rs.getString("patient_address"));
				map.put("patient_mobile", rs.getString("patient_mobile"));
				map.put("patient_city", rs.getString("patient_city"));
				map.put("patient_telephone", rs.getString("patient_telephone"));
				
				map.put("patient_religion", rs.getString("patient_religion"));
				map.put("patient_dateofregistraton", rs.getDate("patient_dateofregistraton"));
				record.add(map);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return record;
	}
	
	
	
					
}
