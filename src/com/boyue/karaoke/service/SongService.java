package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Song;

/**
 *
 * @author ben
 * @date   2014-6-23 上午9:58:27
 *
 */
public interface SongService {

	/**
	 * @param song
	 */
	void save(Song song);

	/**
	 * @param song
	 */
	void update(Song song);

	/**
	 * @param id
	 * @return
	 */
	Song findById(Integer id);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param song
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<Song> findPage(Song song, int pageNo, int pageSize);

	/**
	 * @return
	 */
	List<Song> findAll();

	
	List<Song> findByName(String songName);
	/**
	 * 增加播放次数
	 * @param songId
	 */
	void addSongPlayTimes(int songId);
	
	boolean saveSongs(List<Song> songs);
	
	public abstract PageBean<Song> findPageByorder(Song paramSong, int paramInt1, int paramInt2, String paramString);

}
