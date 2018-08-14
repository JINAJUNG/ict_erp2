package com.ict.erp;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ParamTest {

	public static void makeData(Map<String,String> data) {
		data.put("이름", "길동이");
		data.put("나이", "33");
		data.put("주소", "서울시 동작구");		
	}
	
	public static void printData(Map<String,String> data) {
		Iterator<String> it =data.keySet().iterator();
		
		while(it.hasNext()) {
			String key = it.next();
			System.out.print(key+" : ");
			System.out.println(data.get(key));
		}
	
	}
	public static void main(String[] args) {
		Map<String,String> map = new HashMap<String,String>();
		makeData(map);
		printData(map);
	}
}
