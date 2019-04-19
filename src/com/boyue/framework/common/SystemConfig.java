package com.boyue.framework.common;

import org.apache.struts2.ServletActionContext;


public class SystemConfig {

	//默认每页多少条
	public static final int DEFAULT_PAGE_SIZE = 10;
	//播放服务器的类型,对应service表的type
	public static final String PLAY_SERVICE_TYPE = "7"; 
	
	public static final String SOFT_UPDATE_PATH = "upload";
	
	//直播xml文件
	public static final String LIVE_XML_PATH = "date/live.xml";

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
     * 获取工程绝对路径
     * 如: E:\Tomcat\webapps\TEST\ 
     * @return
     */
	public static String getProjectPath() {
        return ServletActionContext.getServletContext().getRealPath("") + "/";
    }
}
