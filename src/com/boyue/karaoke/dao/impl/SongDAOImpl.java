package com.boyue.karaoke.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SongDAO;
import com.boyue.karaoke.model.Song;

/**
 *
 * @author ben
 * @date   2014-6-23 上午10:35:06
 *
 */
@Repository
public class SongDAOImpl extends BaseDAOImpl<Song> implements SongDAO {

	@Override
	public PageBean<Song> findPage(Song t, int pageNo, int pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if (t.getYear() != null) {
			params.add(Restrictions.eq("year", t.getYear()));
		}
		if (t.getRecommend() != null) {
			params.add(Restrictions.eq("recommend", t.getRecommend()));
		}
		if (StringUtils.isNotBlank(t.getSinger())) {
			params.add(Restrictions.like("singer", t.getSinger().trim(), MatchMode.ANYWHERE));
		}
		if (StringUtils.isNotBlank(t.getSingerType())) {
			params.add(Restrictions.eq("singerType", t.getSingerType()));
		}
		if (StringUtils.isNotBlank(t.getSongName())) {
			params.add(Restrictions.like("songName", t.getSongName().trim(), MatchMode.ANYWHERE));
		}
		if (t.getType() != null) {
			params.add(Restrictions.eq("type", t.getType()));
		}
		if (t.getCategoryId() != null) {
			params.add(Restrictions.sqlRestriction(" id in (SELECT song_id FROM song_category_detail WHERE category_id=" + t.getCategoryId() + ") "));
		}
		
		return this.findPage(pageNo, pageSize, Song.class, params , new Order[]{Order.desc("playTimes"),Order.desc("id")});
	}

	@Override
	public void addPlayTimes(int songId) {
		this.executeSql("update song set play_times= play_times+1 where id=" + songId);
	}

	@Override
	public List<Song> findByName(String songName) {
		List<Song> songs = new ArrayList<Song>();
		if(songName != null){
			String hql = " from Song where songName like '%"+songName+"%'";
			songs = this.findByHql(hql);
		}
		return songs;
	}
	
	
	
	
}
