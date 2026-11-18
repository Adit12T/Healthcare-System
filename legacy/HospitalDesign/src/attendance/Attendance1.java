package attendance;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.conn.MyCon;


public class Attendance1 {
	
	public static Connection con=MyCon.getConnection();
	
	////////////////
	public static ArrayList getEmploye()
	{
		ArrayList list=new ArrayList();
		 ResultSet rs = null;
		 int status = 0;
		String query="select EmpId,EmpName from employee where status = '"+status+"'";
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()){
				ArrayList li=new ArrayList();
				li.add(rs.getInt("emp_id"));
				li.add(rs.getString("emp_name"));
				list.add(li);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public static ArrayList getEmployeById(int id)
	{
		ArrayList list=new ArrayList();
		 ResultSet rs = null;
		 int status = 0;
		String query="select EmpId,EmpName from employee where status = '"+status+"' AND emp_id="+id;
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()){
				ArrayList li=new ArrayList();
				li.add(rs.getInt("emp_id"));
				li.add(rs.getString("emp_name"));
				list.add(li);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public int setAttandance(int empid,String status){
		int i=0;
		String columnname="emp_"+empid;
		try {
			Statement stmt = con.createStatement();
			
			 String query1 ="update emp_attendance set "+columnname+"='"+status+"' where a_date=CURDATE()";
			
			 i=stmt.executeUpdate(query1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public int createAttandanceRow(int month,int year){
		int i=0;
		try {
			Statement stmt = con.createStatement();
			
			 String query1 ="insert into emp_attendance (a_date,a_status,a_month,a_year) values (CURDATE(),1,'"+month+"',"+year+")";
			 
			 i=stmt.executeUpdate(query1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//////////////////////////////////111111111111111111111111111111111111111111
	public int createAttandanceRowPerDay(){
	
		 Date dNow = new Date();
		 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		 String date = ft.format(dNow);
		// System.out.print("curent date="+date);
		int i=0;
		try {
			Statement stmt = con.createStatement();
			
			 String query1 ="SELECT  a_date FROM emp_attendance WHERE a_date='"+date+"'";
			 
			 ResultSet rs=stmt.executeQuery(query1);
			 while(rs.next()){
				 i++;
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}/////////////////////111111111111111111111111111
	
public static int updatePresent(int empId )
	
	{ 
		int i = 0;
		
		

	
		try {
			Statement stmt = con.createStatement();
			
			 String query1 ="update employee set status = '1' where emp_id = '"+empId+"'"; 
			i= stmt.executeUpdate(query1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
public static int alterTable(int empId )

{ 
	int i = 0;
	String col="emp_"+empId;

	try {
		Statement stmt = con.createStatement();
		
		String sql="ALTER TABLE emp_attendance ADD "+col+" varchar(20)";
		i= stmt.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return i;
}

public static ArrayList getAttendanceEmployeeList()
{
	ArrayList list=new ArrayList();
	 ResultSet rs = null;
	 int status = 0;
	 ArrayList empids=new ArrayList();
	 ArrayList attendancestaus=new ArrayList();
	
	try {
		
		///
		String sqlquery="select * from emp_attendance where a_date=CURDATE()";
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery(sqlquery);
		////
		
		Statement stmt = con.createStatement();
		String sql = "select * from emp_attendance";
        rs = stmt.executeQuery(sql);
      
        ResultSetMetaData metaData = rs.getMetaData();
    String name=null,subname=null;
        int rowCount = metaData.getColumnCount();
        
       while(rs1.next()){
			for (int j = 6; j < rowCount+1; j++) {
	        	attendancestaus.add(rs1.getString(j));
	        }
			
		}
        for (int i = 6; i < rowCount+1; i++) {
        	name=metaData.getColumnName(i);
        	//
            
            subname=name.substring(4, name.length());
            empids.add(subname);
            System.out.println(metaData.getColumnTypeName(i ));
        }
			list.add(0, empids);
			list.add(1,attendancestaus);
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return list;
}
public static String getAttendanceEmployeeListBySearch(int id,String date)
{
	
	 ResultSet rs = null;
	 int status = 0;
	 String col="emp_"+id;
	 String astatus=null;
	
	try {
		String sqlquery=null;
		
		///
		if(date==null||date=="")
		sqlquery="select "+col+" from emp_attendance where a_date=CURDATE()";
		else
			sqlquery="select "+col+" from emp_attendance where a_date='"+date+"'";
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery(sqlquery);
		////
		
	
   
        
       while(rs1.next()){
			
	        	astatus=rs1.getString(1);
	       
			
		}
      
			
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return astatus;
}

public static int updatePresentStatus(){ 
	int i=0,k = 0;
	int empId[]=new int[1500];
	try {
		String query1 =null;
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		String sql="select emp_id from employee";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			empId[i]=rs.getInt("EmpId");
			i++;
		}
		for(int j=0;j<i;j++){
		  query1 ="update employee set status = '0' where emp_id = "+empId[j]; 
		  k= stmt1.executeUpdate(query1);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return k;
}

/////////////////////////////////
	public static ResultSet getEmpDepart( String s1)
	{
		 ResultSet rs = null;
		String query="select DName from designationdetail where EmpId= '"+s1+"'";
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public static ResultSet getAtten(int id)
	{
		ResultSet rs = null;
		String sql = "select present from empattendance where emp_id = '"+id+"'";
		try {
			Statement stmt = con.createStatement();
			rs =  stmt.executeQuery(sql);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public static int updatePresent(int i1, int i2,String s1 ,String s2)
	
	{ 
		int i = 0;
		int j = 1;
		String query="update empattendance set present = '"+i2+"',pmonth = '"+s1+"', pyear = '"+s2+"' where emp_id= '"+i1+"';";

		
		try {
			Statement stmt = con.createStatement();
			 i = stmt.executeUpdate(query);
			 String query1 ="update personal_profile set attendanceStatus = '"+j+"' where EmpId = '"+s1+"'"; 
			 stmt.executeUpdate(query1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
   
	public static int SetAbsent(int i1 , String s2 , String s3,String s4,String s5)
	{
		 int i=0;
		String sql = "insert into empabsent (EmpId,absent,halfday,amonth,ayear) values('"+i1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')";
		try {
			Statement stmt = con.createStatement();
			i= stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
