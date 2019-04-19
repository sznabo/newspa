package com.boyue.karaoke.web.interceptor;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

public class LogConfig {

	private static final Map<String, String> map = new ConcurrentHashMap<String, String>();
	
	static {
		try {
			Properties properties =  new Properties();
			InputStream in = LogConfig.class.getResourceAsStream("/log_config.properties");
			properties.load(in);
			Set<Entry<Object, Object>> entrySet = properties.entrySet();
			for (Entry<Object, Object> entry : entrySet) {
					map.put(entry.getKey().toString(), entry.getValue().toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static boolean isBeLog(String actionMethod) {
		return map.get(actionMethod) != null;
	}
	
	
	public static String getLogValue(String actionMethod) {
		return map.get(actionMethod);
	}

	public static void main(String[] args) {
		System.out.println(LogConfig.isBeLog("com.boyue.struts.action.AdminAction.login"));
		String dd;
		try {
			System.out.println(LogConfig.getLogValue("com.boyue.struts.action.AdminAction.updateAdmin"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
