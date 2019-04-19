package com.boyue.karaoke.web.devicestate;

import java.util.Collection;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.boyue.karaoke.service.CloudsManageService;
import com.boyue.karaoke.service.DeviceService;

/**
 * 
 * @author ben
 * @date 2013-1-7 上午10:02:22
 * 
 */
public class CloundsManageTets {
	// 检测的时间间隔
	public static final long SCAN_INTERVAL = 4*60 * 1000;

	public static final long TIMEOUT = 15 * 60 * 1005;
	private Timer timer;
	private CloudsManageService cloudsManageService;

	public CloundsManageTets(CloudsManageService cl) {
		timer = new Timer();
		this.cloudsManageService = cl;
	}

	public void start() {
		// 扫描离线的mac
		timer.schedule(new TimerTask() {

			@Override
			public void run() {
				cloudsManageService.changeOnline();
			}
		}, 3000, SCAN_INTERVAL);
	}

	public synchronized void cancel() {
		timer.cancel();
	}

}
