/**
 * 
 * @author: ben
 * @date:   2012-8-19
 */
package com.boyue.karaoke.common;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.DefaultConfigurationBuilder;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.boyue.framework.web.BaseAction;
/**
 * 
 * 获取配置文件里面的设置
 */
public final class SystemConfig {
	

	
	protected static final Logger logger = LogManager.getLogger(BaseAction.class);
	private static Configuration CONFIG = null;
	static {
		try {
			DefaultConfigurationBuilder build = new DefaultConfigurationBuilder("configuration.xml");
			CONFIG = build.getConfiguration();
		} catch ( ConfigurationException e) {
			logger.error("读取配置文件错误", e);
		}
	}
	
	private SystemConfig() {
		
	}
	
	/**
	 * 获取web工程的根路径, 如E:/WORK/AD/
	 * @return
	 */
	public static String getProjectBasePath() {
		String path = SystemConfig.class.getProtectionDomain().getCodeSource().getLocation().getPath();
		if (path.startsWith("/")) {// /D:/eclipseprojcet201310/adserver/WebRoot/去掉开头的 / ,windows下
			path = path.substring(1);
		}
		int index = path.indexOf("WEB-INF/classes/");
		return path.substring(0, index);
	}
	/**
	 * 获取web工程的网络路径路径, 如E:http://192.168.2.250:8090/
	 * @return
	 */
	public static String getProjectWebBasePath() {
		String path = ServletActionContext.getRequest().getContextPath();
        String basePath = ServletActionContext.getRequest().getScheme() 
        	+ "://" + ServletActionContext.getRequest().getServerName() + ":" 
        	+ ServletActionContext.getRequest().getServerPort() + path+"/";
        return basePath;
	}
	
	/**
     * 获取工程绝对路径
     * 如: E:\Tomcat\webapps\TEST\ 
     * @return
     */
	public static String getProjectPath() {
        return ServletActionContext.getServletContext().getRealPath("") + "/";
    }
	public static List<String> getList(String key) {
		List list = CONFIG.getList(key);
		return list;
	}
	
	public static String getString(String key) {
		return CONFIG.getString(key);
	}
	
	public static BigDecimal getBigDecimal(String key) {
		return CONFIG.getBigDecimal(key);
	}
	

	/**
	 * @return
	 */
	public static int getLogMax() {
		return CONFIG.getInt("logmax");
	}

	public static String getVodDataPath() {
		return getString("vod_data_path");
	}
	
	public static String getVodWebServer() {
		return getString("vod_web_server");
	}
	
	
	public static void main(String[] args) {
		System.out.println(SystemConfig.getVodDataPath());
	}
}
