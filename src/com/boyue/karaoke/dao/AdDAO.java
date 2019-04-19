package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Ad;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:50:41
 *
 */
public interface AdDAO extends DAO<Ad> {

	/**
	 * @return
	 */
	List<Ad> findAll();

	List<Integer> findAdContextTypeList();

	List<Integer> findAdCategoryList();

	PageBean<Ad> findPage(Ad ad, int pageNo, int pageSize, Order asc);

	Ad findIsAd(int id);

	List<String> findAdLeftContent(int introContentid);

	List<Ad> findAdListByIntro(int introContentid);

	List<Ad> findAdListByVodProgram(int adid);


}
