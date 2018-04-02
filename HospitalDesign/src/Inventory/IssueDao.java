package Inventory;

import java.sql.ResultSet;
import java.util.*;

import database.dbcon;

public class IssueDao {
	dbcon db=dbcon.getConnection();
	public List show(String s){
		List record=new ArrayList();
		String sql="";
		System.out.println(s);
		if(s!=null & s!="")
			sql="select * from stock where item_name LIKE '"+s+"%'";
		else
			sql=" ";
		Map map;
		try{
			
			ResultSet rs=db.select(sql);
			while(rs.next()){
				
				map=new HashMap();
				map.put("item_id",rs.getInt("item_id"));
				map.put("item_type", rs.getString("item_type"));
				map.put("item_name", rs.getString("item_name"));
				map.put("mfg_company", rs.getString("mfg_company"));
				map.put("total_quantity", rs.getInt("total_quantity"));
		
				record.add(map);
				
				//map.put(arg0, arg1)
				
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return record;
	}
	
	
	

}
