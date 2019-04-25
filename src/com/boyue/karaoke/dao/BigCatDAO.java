package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.BigCat;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.model.Play;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:50:41
 *
 */
public interface BigCatDAO extends DAO<BigCat> {

	public int updateStatus0();
	public int updateStatus1();
	public int findByStatu();


}
