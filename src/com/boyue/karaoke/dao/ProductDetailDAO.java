package com.boyue.karaoke.dao;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.ProductDetail;

/**
 *
 * @author ben
 * @date   2014-6-25 下午5:07:41
 *
 */
public interface ProductDetailDAO extends DAO<ProductDetail>{

	/**
	 * @param productId
	 */
	void deleteByProduct(int productId);

}
