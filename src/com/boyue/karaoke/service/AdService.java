package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.Message;
import com.boyue.spa.domain.Vodprogram;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:52:58
 *
 */
public interface AdService {

	Ad findById(Integer id);

	void update(Ad old);

	PageBean<Ad> findPage(Ad ad, int pageNo, int pageSize);

	List<Ad> findAll();

	void saveAd(Ad ad);

	void updateAd(Ad ad);

	void delByIDs(List<Integer> idList,Integer showFlag);

	Ad findIsAd(int parseInt);

	List<String> findAdLeftContent(int introContent);

	List<Ad> findAdListByIntro(int introContent);

	Ad findAdByIntroAdId(Integer adid);

	List<Ad> findAdListByVodProgram(int vodAd);

	Ad findToTime(Message m);
}
