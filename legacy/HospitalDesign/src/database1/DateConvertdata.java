package database1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvertdata {
	public static String convertDate(String datevlue) {
		String s="";
		Date ob = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			
			ob = format.parse(datevlue);
			s=convertDateToString(ob);
			
		} catch (Exception e) {
		}
		return s;
	}

	public static String convertDateToString(Date datevalue) {
		String value = "";
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			value = format.format(datevalue);
		} catch (Exception e) {
		}

		return value;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		


	}

}
