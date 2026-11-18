package Inventory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NewissueitemDao {
public	String Name;
public	String Total;
public int billno;
	public List record;
	public NewissueitemDao() {
		record=new ArrayList();
	}
	
	
	
		public void save(String name,String quantity,String total){
				Map map=new HashMap();
		map.put("name", name);
		map.put("quantity", Integer.parseInt(quantity));
		map.put("total", Integer.parseInt(total));
		record.add(map);
	}
	
	public void delete(String i){
		int index=Integer.parseInt(i);
		record.remove(index);
	}
	
	
	

}
