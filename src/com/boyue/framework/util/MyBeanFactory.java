package com.boyue.framework.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * @author: luoweibin
 * @date:2011-12-19
 * description: 
 *
 */
public class MyBeanFactory {
	//由于j2ee1.4 的xml_api.jar的包与spring冲突
	static {
		System.setProperty("javax.xml.parsers.DocumentBuilderFactory", "com.sun.org.apache.xerces.internal.jaxp.DocumentBuilderFactoryImpl"); 
		System.setProperty("javax.xml.parsers.SAXParserFactory", "com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl");  
	}
	private static final ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	private MyBeanFactory() {
	}
	
	 public  static final <T> T getBean(Class<T> cls) {
		return context.getBean(cls);
	}
	
	public static void main(String[] args) throws Throwable {
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
