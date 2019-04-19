package com.boyue.karaoke.web.devicestate;

import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author ben
 * @date   2013-1-6 下午07:58:18
 * 
 */
public class OnlineUserList {
	//在线的mac
	private static final Map<String, OnlineUser> ONLINE_USER_MAP = new ConcurrentHashMap<String, OnlineUser>();
	
	public static synchronized void updateUser(String mac, String ip) {
		
		OnlineUser originalUser = ONLINE_USER_MAP.get(mac);
		if (originalUser == null) {
			OnlineUser user = new OnlineUser();
			user.setMac(mac);
			user.setIpaddr(ip);
			user.setConnectTime(new Date());
			ONLINE_USER_MAP.put(user.getMac(), user);
		} else {
			originalUser.setIpaddr(ip);
			originalUser.setConnectTime(new Date());
			//System.out.println("已经存在，更新链接时间:" + mac + " :" + DateUtil.formatToLong(originalUser.getConnectDate()));
		}
	}
	
	public static synchronized void removeOnlineUser(String mac) {
		System.out.println("把用户:" + mac +" 从在线列表中移除");
		ONLINE_USER_MAP.remove(mac);
	}
	
	public static boolean isonline(String mac) {
		return ONLINE_USER_MAP.get(mac) != null;
	}
	
	public static Collection<OnlineUser> getOnlineUserList() {
		//System.out.println(DateUtil.formatToLong(new Date()) + ":获取在线用户列表...");
		
		//System.out.println("-------------------------------------------");
//		Collection<OnlineUser> values = ONLINE_USER_MAP.values();
//		for (OnlineUser u : values) {
//			System.out.println(u.getBoxmac() + ":" + u.getIp());
//		}
		//System.out.println("-------------------------------------------");
		return ONLINE_USER_MAP.values();
	}
	
	public static void main(String[] args) {
	}
}
