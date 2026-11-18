package com.pathologypatient;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.DateConvert;
import database.dbcon;

public class ViewAllClearReportDao {
	
dbcon db=dbcon.getConnection();

	
	
	public List showAll(String s){
		List record=new ArrayList();
		List tm=new ArrayList();
		String sql;
		if(s!=null & s!="")
			sql="select distinct(p.pathology_patient_id) from pathology_patient p,pathology_patient_test pt where p.pathology_patient_id=pt.pathology_patient and pt.test_status='clear' and p.patient_name like '"+s+"%'";
		else
			sql="select distinct(p.pathology_patient_id) from pathology_patient p,pathology_patient_test pt where p.pathology_patient_id=pt.pathology_patient and pt.test_status='clear'";
		try{
			Map map;
			ResultSet rs=db.select(sql);
			
			while(rs.next()){
				tm.add(rs.getInt("pathology_patient_id"));
			}
			patientDetailBean pb=new patientDetailBean();
			for (int i = 0; i < tm.size(); i++) {
				pb.setMethod((Integer)tm.get(i));
				map=new HashMap();
				map.put("billid", pb.getPathology_patient_id());
				map.put("name", pb.getPatient_name());
				map.put("address", pb.getPatient_address());
				map.put("total",pb.getTotal());
				map.put("paid", pb.getPaid());
				map.put("status", pb.getP_status());
				map.put("date",DateConvert.convertDateToString( pb.getTest_date()));
				record.add(map);
				
			}
					
			
		}catch (Exception e) {
			System.out.println(e);
		}
			
		return record;
	}
	

}
