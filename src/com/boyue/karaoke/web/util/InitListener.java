package com.boyue.karaoke.web.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.boyue.karaoke.service.CloudsManageService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.web.devicestate.CloundsManageTets;
import com.boyue.karaoke.web.devicestate.OnlineUserMonitor;



/**
 *
 * @author ben
 * @date   2013-8-31 下午03:32:25
 * 初始化一下系统资源
 */
public class InitListener implements ServletContextListener  {

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		DeviceService ds = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext()).getBean(DeviceService.class);
		CloudsManageService cl = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext()).getBean(CloudsManageService.class);
		//把所有设备装备初始化为离线
		ds.initAllDeviceOffline();
		//启动缓存
		//CacheManager.getInstance().startup();
		new OnlineUserMonitor(ds).start();
		//new CloundsManageTets(cl).start();
	}

}
