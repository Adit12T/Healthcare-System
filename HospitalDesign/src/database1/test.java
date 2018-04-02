package database1;

import java.util.ArrayList;
import java.util.HashMap;

import database1.DataBean;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DataBean db= new DataBean();
		ArrayList list2= db.getfinalReport(2);
		HashMap h1= (HashMap)list2.get(0);
			
		System.out.println(h1.get("tname"));
		System.out.println(h1.get("srange"));
		/*for (int i = 5; i < list2.size()-1; i++) {
			
			HashMap h1 = (HashMap)list2.get(i);
			
			
			
			
			
			
			System.out.println(h1.get("tname"));
			System.out.println(h1.get("result"));
			System.out.println(h1.get("srange"));
			System.out.println(h1.get("erange"));
			}
		*///System.out.println(list2.get(list2.size()));
			
		
//System.out.println(list.get(list.size()));
	}

}
