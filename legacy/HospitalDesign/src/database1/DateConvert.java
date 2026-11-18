package database1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert {

	public static Date convertDate(String datevlue) {
		Date ob = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			ob = format.parse(datevlue);
		} catch (Exception e) {
		}
		return ob;
	}

	public static String convertDateToString(Date datevalue) {
		String value = "";
		try {
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			value = format.format(datevalue);
		} catch (Exception e) {
		}

		return value;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
