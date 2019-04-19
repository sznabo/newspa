package com.boyue.karaoke.service;

import com.boyue.karaoke.model.ProductDetail;

/**
 *
 * @author ben
 * @date   2014-6-25 下午5:06:34
 *
 */
public interface ProductDetailService {

	public void save(ProductDetail detail);

	/**
	 * @param id
	 */
	public void deleteByProduct(int productId);
}
