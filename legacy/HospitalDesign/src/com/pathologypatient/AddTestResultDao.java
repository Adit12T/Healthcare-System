package com.pathologypatient;

import java.sql.PreparedStatement;

import database.dbcon;

public class AddTestResultDao {
	dbcon db=dbcon.getConnection();
	
	public boolean savegroup(String pid,String tname,String remark,String pdi[],String []result){
		int pids=Integer.parseInt(pid);
		String sql="update pathology_patient_test set test_status='clear',test_remark='"+remark+"'  where test_name='"+tname+"' and pathology_patient="+pids;
		try{
			int a=db.insertOrUpdate(sql);
			if(a>0)
			{
			setData(pids, pdi, result);
				return true;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public void setData(int pid,String pdi[],String []result){
		
		String sql="update pathology_patient_test_detail set test_result=? where pathology_test_detail=?";
		try{
			int a;
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			for (int j = 0; j < result.length; j++) {
				a=Integer.parseInt(pdi[j]);
				ps.setString(1, result[j]);	
				ps.setInt(2, a);
				ps.executeUpdate();
			}
			
			
			
		}catch (Exception e) {
		System.out.println(e);
		}
	}
	

}
