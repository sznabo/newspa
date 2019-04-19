package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.ProductDetailDAO;
import com.boyue.karaoke.model.ProductDetail;

/**
 *
 * @author ben
 * @date   2014-6-25 下午5:08:06
 *
 */
@Repository
public class ProductDetailDAOImpl extends BaseDAOImpl<ProductDetail> implements ProductDetailDAO {

	@Override
	public void deleteByProduct(int productId) {
		this.executeSql("DELETE FROM product_detail WHERE product_id=" + productId);
	}

}
