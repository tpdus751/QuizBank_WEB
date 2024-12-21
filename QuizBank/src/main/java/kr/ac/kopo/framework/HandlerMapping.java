package kr.ac.kopo.framework;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.HomeController;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		this("bean.properties"); // web.xml에서 init문을 안 썻을 때 없어도 됨
	}

	public HandlerMapping(String propName) {
		if(propName == null) propName = "bean.properties";
		mappings = new HashMap<>();
		Properties prop = new Properties();
		String propLoc = this.getClass().getResource(propName).getPath();
		System.out.println("? : " + propLoc);
		
		try(
			InputStream is = new FileInputStream(propLoc);
		) {
			prop.load(is);
			 System.out.println("로딩된 bean.properties 내용:");
			 prop.forEach((key, value) -> System.out.println(key + " -> " + value));
			Set<Object> keys = prop.keySet();
			for(Object key : keys) {
				System.out.println(key.toString() + " : " + prop.getProperty(key.toString()));
				String className = prop.getProperty(key.toString()); // kr.ac.kopo.controller.BoardListController
				
				Class<?> clz = Class.forName(className);
				System.out.println("clz : " + clz);
				Constructor<?> constructor = clz.getConstructor();
				System.out.println("cons : " + constructor);
				Controller instance = (Controller)constructor.newInstance();
				System.out.println("ins : " + instance);
				mappings.put(key.toString(), instance);
			}
			 mappings.put("/home.do", new HomeController()); // 매핑 추가
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri) {
		Controller controller = mappings.get(uri);
	    if (controller == null) {
	        System.err.println("매핑되지 않은 URI: " + uri);
	    } else {
	    	System.out.println("매핑댐");
	    }
	    return controller;
	}


}





