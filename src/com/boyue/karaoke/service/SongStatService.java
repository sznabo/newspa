package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SongStat;

/**
 *
 * @author ben
 * @date   2014-7-3 上午10:31:51
 *
 */
public interface SongStatService {

	/**
	 * @param songStat
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<SongStat> findPage(SongStat songStat, int pageNo, int pageSize);

	void save(int songId, String mac);

}
