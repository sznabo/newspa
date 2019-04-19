package com.boyue.karaoke.web.devicestate;

import java.util.Collection;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.boyue.karaoke.service.DeviceService;

/**
 * 
 * @author ben
 * @date 2013-1-7 上午10:02:22
 * 
 */
public class OnlineUserMonitor {
	// 检测的时间间隔
	public static final long SCAN_INTERVAL = 20 * 1000;
	// 设备超时                                                                                               
	// public static final long TIMEOUT = 300 * 1000;
	public static final long TIMEOUT = 15 * 60 * 1005;
	private Timer timer;
	private DeviceService deviceService;

	public OnlineUserMonitor(DeviceService ds) {
		timer = new Timer();
		this.deviceService = ds;
	}

	public void start() {
		// 扫描离线的mac
		timer.schedule(new TimerTask() {

			@Override
			public void run() {
				Collection<OnlineUser> onlineUserList = OnlineUserList
						.getOnlineUserList();
				for (OnlineUser user : onlineUserList) {
					// 如果最近一次心跳时间，超过设定的超时时间，表示超时
					if ((new Date().getTime() - user.getConnectTime().getTime()) > TIMEOUT) {
						OnlineUserList.removeOnlineUser(user.getMac());
						// 更新设备的状态
						deviceService.offline(user.getMac());
					}
				}
			}
		}, 3000, SCAN_INTERVAL);
	}

	public synchronized void cancel() {
		timer.cancel();
	}

}
