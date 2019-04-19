package com.boyue.karaoke.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.SongStatDAO;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.model.SongStat;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.SongService;
import com.boyue.karaoke.service.SongStatService;

/**
 *
 * @author ben
 * @date   2014-7-3 上午10:33:12
 *
 */
@Service
public class SongStatServiceImpl implements SongStatService {

	@Autowired
	private SongStatDAO songStatDAO;
	@Autowired
	private SongService songService;
	@Autowired
	private DeviceService deviceService;
	
	@Override
	public PageBean<SongStat> findPage(SongStat songStat, int pageNo,
			int pageSize) {
		return songStatDAO.findPage(songStat, pageNo, pageSize);
	}

	@Override
	public void save(int songId, String mac) {
		Song song = songService.findById(songId);
		Device device = deviceService.findByMac(mac);
		if (song != null && device != null) {
			SongStat songStat = new SongStat();
			songStat.setMac(mac);
			songStat.setSongName(song.getSongName());
			songStat.setUserName( device.getUserName());
			songStat.setTime(new Date());
			songStatDAO.save(songStat);
			songService.addSongPlayTimes(songId);
		}
		
	}

}
