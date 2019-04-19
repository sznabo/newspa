package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Song;

/**
 *
 * @author ben
 * @date 2014-6-23 上午10:34:26
 *
 */
public interface SongDAO extends DAO<Song> {

	List<Song> findAll();

	void addPlayTimes(int songId);

	List<Song> findByName(String songName);

	List<Song> findByHql(String hql);

}
