package com.boyue.karaoke.service;

import com.boyue.karaoke.model.LiveApk;
public interface LiveApkService {
	LiveApk findApk();
	boolean updateApk(LiveApk model);
}
