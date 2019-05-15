package com.boyue.karaoke.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.web.devicestate.OnlineUserMonitor;


public class InitListener implements ServletContextListener {
	private static final Logger LOG = Logger.getLogger(InitListener.class);
	
	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		
		
//		System.out.println("web路径：" +SystemConfig.getProjectBasePath());
//		//初始化要控制的url
//		LOG.info("载入要进行权限控制的url...");
//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(contextEvent.getServletContext());
//		ResourceService resourceService = (ResourceService) context.getBean("resourceService");
//		List<Resource> resources = resourceService.findResource();
//		Map<String, Resource> allUrl = new HashMap<String, Resource>();
//		for (Resource resource : resources) {
//			allUrl.put(resource.getUri().toLowerCase(), resource);
//		}
//		LOG.info("共加载被控制url " + allUrl.size() + "个");
//		contextEvent.getServletContext().setAttribute(Constants.ALL_CONTROL_URL, allUrl);
//		contextEvent.getServletContext().setAttribute(Constants.ONLINE_USER_TOTAL, new AtomicInteger(0));
		initSysPermission(contextEvent);
//		
//		//直播
//		LiveManagementService liveManagementService = (LiveManagementService) context.getBean("liveManagementService");
//		List<Livemanagement> liveList = liveManagementService.browseLiveManagementService();
//		Map<Integer, Integer> liveMaxMap = new ConcurrentHashMap<Integer, Integer>();
//		for (Livemanagement l : liveList) {
//			liveMaxMap.put(l.getId(), l.getMaxVisit());
//		}
//		contextEvent.getServletContext().setAttribute(Constants.LIVE_MAX_VISIT_MAP, liveMaxMap);
//		
//		//点播
//		VodProgramService programService = (VodProgramService) context.getBean("vodProgramServiceImpl");
//		List<Vodprogram> allProgram = programService.findAll();
//		Map<Integer, Integer> vodMaxMap = new ConcurrentHashMap<Integer, Integer>();
//		for (Vodprogram vp : allProgram) {
//			vodMaxMap.put(vp.getId(), vp.getMaxVisitCount());
//		}
//		contextEvent.getServletContext().setAttribute(Constants.VOD_MAX_VISIT_MAP, vodMaxMap);
//		
	//	startOnlineUserSanner();
//		QuartzContext.getInstance().setContext(contextEvent.getServletContext());
//		
//		//启动检测自己在云端状态的线程
//		TimerTestService timerTestService = (TimerTestService) context.getBean("timerTestService");
//		timerTestService.start();
	}
	
	private void initSysPermission(ServletContextEvent contextEvent) {
		String file = contextEvent.getServletContext().getRealPath("/") + "nabo.sn";
		try {
			LicenceInfo info = DecodeUtil.getInfoFromKey(file);
			contextEvent.getServletContext().setAttribute(Constants.SYS_PERMISSION, info);
			contextEvent.getServletContext().setAttribute(Constants.SYS_PERSON_NUM, info.getNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void startOnlineUserSanner() {
		new OnlineUserMonitor(null).start();
	}
	
}
