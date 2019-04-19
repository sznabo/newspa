package com.boyue.karaoke.service;

import java.io.File;
import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.ShopIntroduce;

public interface IShopIntroduceService {

	PageBean<ShopIntroduce> findShopIntroduceList(ShopIntroduce model,
			int pageNo, int pageSize);

	void saveShopIntroduce(ShopIntroduce model,File logo_img,String imgFileName)throws Exception;

	ShopIntroduce findShopIntroduceByID(Integer id);

	void updateShopIntroduce(ShopIntroduce model, File img, File logo_img,String imgFileName) throws Exception;

	void delByIDs(List<Integer> idList);

	List<ShopIntroduce> findAllShopIntroduce();

	List<ShopIntroduce> findAllShopIntroduceByLv(ShopIntroduce si);

	List<ShopIntroduce> findShopIntroduce(Integer lv, Integer integer);

	List<ShopIntroduce> findShopIntroduceByParentID(Integer parentID, Integer lv, Integer integer);
	
	public  PageBean<ShopIntroduce> findShopIntroduceByParentIsNull(ShopIntroduce paramShopIntroduce, Integer paramInteger1, Integer paramInteger2);

}
