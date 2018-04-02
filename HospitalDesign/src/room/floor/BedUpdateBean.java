package room.floor;

import database.dbcon;

public class BedUpdateBean {
	dbcon db=dbcon.getConnection();
	String msg="<font color ='red' >Try again............</font>";
	public boolean  updateStatus(int id,String status){
		String sql="update room_bed_info set bed_status='"+status+"' where bed_id="+id;
		int a=db.insertOrUpdate(sql);
		if(a>0){
			 msg="<font color ='green' >Successfully updated............</font>";
			return true;}
		return false; 
	}
		
	
}
