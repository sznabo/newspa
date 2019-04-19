package com.boyue.karaoke.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.ProductDetailDAO;
import com.boyue.karaoke.model.ProductDetail;
import com.boyue.karaoke.service.ProductDetailService;

/**
 *
 * @author ben
 * @date   2014-6-25 下午5:06:50
 *
 */
@Service
public class ProductDetailServiceImpl implements ProductDetailService {

	@Autowired
	private ProductDetailDAO productDetailDAO;
	@Override
	public void save(ProductDetail detail) {
		productDetailDAO.save(detail);
	}
	
	@Override
	public void deleteByProduct(int productId) {
		productDetailDAO.deleteByProduct(productId);
	}

}
