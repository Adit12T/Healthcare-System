package database;

public class StringConvert {

	public static String convert(String s){
		
		if(s==null | s==""){
			s="<font color='red'>"+"N/A"+"</font>";
		}
		return s;
	}
	
}
