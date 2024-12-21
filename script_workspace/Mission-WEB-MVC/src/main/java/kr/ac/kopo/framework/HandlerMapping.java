package kr.ac.kopo.framework;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import kr.ac.kopo.controller.Controller;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	
	/*
	public HandlerMapping() {
		this("bean.properties"); // web.xml에서 init문을 안 썻을 때 없어도 됨
	}
	*/

	public HandlerMapping(String propName) {
		if (propName == null) propName = "bean.properties";
		mappings = new HashMap<>();
		Properties prop = new Properties();
		String propLoc = this.getClass().getResource(propName).getPath();
//		//System.out.println(propLoc);
		
		try (
			InputStream is = new FileInputStream(propLoc);
			) {
			prop.load(is); // Properties 객체에 파일 load
			Set<Object> keys = prop.keySet(); // key들만 받아옴
			for(Object key : keys) {
				//System.out.println(key.toString() + " : " + prop.getProperty(key.toString())); 
				String className = prop.getProperty(key.toString());
				
				Class<?> clz = Class.forName(className); // 문자열로 클래스 로드?
				Constructor<?> constructor = clz.getConstructor(); // 생성자 생성?
				Controller instance = (Controller)constructor.newInstance(); // 인스턴스 객체 생성
				
				mappings.put(key.toString(), instance); // 원래는 mappings.put(key.toString(), new BoardListController());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public Controller getController(String uri) {
		
		return mappings.get(uri);
	}
	
	
	

	
	
}
