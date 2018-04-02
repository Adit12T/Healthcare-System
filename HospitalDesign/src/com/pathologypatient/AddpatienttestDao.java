package com.pathologypatient;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.pathologytestdetail.pathologyBean;

import database.dbcon;

public class AddpatienttestDao {
	public int patientid;
	public String name;
	public String address;
	public int total;
	public int paid;
	public String[] testid;
	public List pathology_patient_test;

	public void save(String[] ids, String name, String address) {
		this.name = name;
		this.address = address;
		testid = ids;
		
	}

	public void setpaid(String p){
		paid=Integer.parseInt(p.trim());
		saveinpathology_patient();
		savePathology_patient_test();
		savePathology_patient_test_detail();
	}
	
	
	public List getGroupData() {
		pathology_patient_test =new ArrayList();
	
		Set group=new HashSet();
	Map map;
		String sql = "select * from pathelogy_test_detail where test_id=?";
		int temp=0;ResultSet rs;
		try {
			
			PreparedStatement p = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			for (int j = 0; j < testid.length; j++) {
				
				p.setString(1, testid[j]);
				rs=p.executeQuery();
				
				if(rs.next()){
				//String s=	rs.getString("test_name");
        			group.add(rs.getString("test_name"));
        			//temp=temp+rs.getInt("test_cost");
    
				}

			}
			Iterator  t1=group.iterator();
			String ss;int tmp=0;
			while(t1.hasNext() )
			{ ss=(String )t1.next();
				map=new HashMap();
				map.put("name", ss);
				tmp=tmp+getGroupDataamount(ss);
				map.put("amount",getGroupDataamount(ss));
				pathology_patient_test.add(map);				
			}
			total=tmp;
	
	
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return pathology_patient_test;
	}
		
		public int  getGroupDataamount(String ss) {
			
		
			
		
			String sql = "select * from pathelogy_test_detail where test_id=? and test_name=?";
			int temp=0;
			try {
				
				PreparedStatement p = dbcon.getPreparedStatement()
						.prepareStatement(sql);
				for (int j = 0; j < testid.length; j++) {
					p.setString(1, testid[j]);
					p.setString(2, ss);
					ResultSet rs=p.executeQuery();
					
					if(rs.next()){
					rs.getString("test_name");
	        		temp=temp+rs.getInt("test_cost");
	    
					}

				}
				//total=total+temp;
						
			} catch (Exception e) {
				// TODO: handle exception
			}
			return temp;
		}

	public void saveinpathology_patient() {
		String sql = "insert into pathology_patient values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setString(2, name);
			ps.setString(3, address);
			ps.setInt(4, total);
			ps.setInt(5, paid);
			ps.setString(6, "uncheck");
			ps.setDate(7, new java.sql.Date((new Date().getTime())));
			int a = ps.executeUpdate();

			if (a > 0) {
				patientid = getId();

			}

			/*
			 * pathology_patient_id int(11) (NULL) NO PRI (NULL) auto_increment
			 * select,insert,update,references patient_name varchar(100)
			 * latin1_swedish_ci YES (NULL) select,insert,update,references
			 * patient_address varchar(500) latin1_swedish_ci YES (NULL)
			 * select,insert,update,references total int(11) (NULL) YES (NULL)
			 * select,insert,update,references paid int(11) (NULL) YES (NULL)
			 * select,insert,update,references p_status varchar(20)
			 * latin1_swedish_ci YES (NULL) select,insert,update,references
			 * test_date
			 */
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public int getId() {
		int a = 0;

		String sql = "select * from pathology_patient where patient_name=? and patient_address=? and test_date=? and total=? and paid=? and p_status=?";
		try {
			PreparedStatement pss = dbcon.getPreparedStatement()
					.prepareStatement(sql);
			pss.setString(1, name);
			pss.setString(2, address);
			pss.setDate(3, new java.sql.Date((new Date().getTime())));
			pss.setInt(4, total);
			pss.setInt(5, paid);
			pss.setString(6, "uncheck");
			ResultSet rs = pss.executeQuery();
			while (rs.next()) {
				a = rs.getInt(1);
				System.out.println("id ="+a);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return a;
	}
	public void savePathology_patient_test(){
		String sql="insert into pathology_patient_test values(?,?,?,?,?,?)";
		try{
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			Map map;
			for (int i = 0; i <pathology_patient_test .size(); i++) {
				map=(Map)pathology_patient_test.get(i);
				int tm=(Integer)map.get("amount");
				ps.setInt(1, 0);
				ps.setInt(2, patientid);
				ps.setString(3,(String)map.get("name") );
				ps.setString(4, tm+"" );
				ps.setString(5, "pending");
				ps.setString(6, "remak");
				ps.executeUpdate();
			}
		
			}catch (Exception e) {
			System.out.println();
		}
	}
	public void savePathology_patient_test_detail(){
		String sql="insert into pathology_patient_test_detail values(?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement ps=dbcon.getPreparedStatement().prepareStatement(sql);
			
			pathologyBean pb=new pathologyBean();
			for (int i = 0; i <testid .length; i++) {
			pb.getmethod(Integer.parseInt(testid[i]));
				ps.setInt(1, 0);
				ps.setInt(2, patientid);
				ps.setInt(3, pb.getTest_id());
				ps.setString(4,pb.getTest_name() );
				ps.setString(5, pb.getTest_content());
				ps.setString(6, pb.getStart_range());
				ps.setString(7, pb.getEnd_range());
				ps.setString(8, "");
				
				ps.executeUpdate();
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	
	
}
