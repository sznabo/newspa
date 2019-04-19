package com.boyue.karaoke.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SongCategoryDAO;
import com.boyue.karaoke.model.SongCategory;

/**
 *
 * @author ben
 * @date   2014-6-24 上午10:08:04
 *
 */
@Repository
public class SongCategoryDAOImpl  extends BaseDAOImpl<SongCategory> implements SongCategoryDAO  {

	@Override
	public void deleteById(Serializable id) {
		super.deleteById(id);
		this.executeSql("delete from song_category_detail where category_id=" + id);
	}

	@Override
	public void deleteByIdList(List idList) {
		super.deleteByIdList(idList);
		this.executeSql("delete from song_category_detail where category_id in (" + StringUtils.join(idList, ",") + ")");
	}

	
}
