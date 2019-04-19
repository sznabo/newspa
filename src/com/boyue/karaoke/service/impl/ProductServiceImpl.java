package com.boyue.karaoke.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.ProductDAO;
import com.boyue.karaoke.model.Product;
import com.boyue.karaoke.model.ProductDetail;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.ProductDetailService;
import com.boyue.karaoke.service.ProductService;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:48:56
 *
 */
@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductDetailService productDetailService;
	@Autowired
	private DeviceService deviceService;
	
	
	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#save(com.boyue.karaoke.model.Product)
	 */
	@Override
	public void save(Product product) {
		productDAO.save(product);
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#update(com.boyue.karaoke.model.Product)
	 */
	@Override
	public void update(Product product) {
		productDAO.update(product);
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#findById(java.lang.Integer)
	 */
	@Override
	public Product findById(Integer id) {
		return productDAO.findById(id);
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#deleteByIdList(java.util.List)
	 */
	@Override
	public void deleteByIdList(List<Integer> idList) {
		for (int id : idList) {
			//用户在使用不能删除
			if (deviceService.findByProduct(id).isEmpty()) {
				productDAO.deleteById(id);
				productDetailService.deleteByProduct(id);
			}
		}
	}

	@Override
	public PageBean<Product> findPage(Product product, int pageNo, int pageSize) {
		return productDAO.findPage(product, pageNo, pageSize);
	}

	@Override
	public void save(Product product, List<Integer> moduleIdList) {
		this.save(product);
		for (int moduleId : moduleIdList) {
			ProductDetail detail = new ProductDetail();
			detail.setModuleId(moduleId);
			detail.setProductId(product.getId());
			productDetailService.save(detail);
		}
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#update(com.boyue.karaoke.model.Product, java.util.List)
	 */
	@Override
	public void update(Product product, List<Integer> moduleIdList) {
		Product old = this.findById(product.getId());
		old.setName(product.getName());
		old.setStatus(product.getStatus());
		//先删除老的
		productDetailService.deleteByProduct(product.getId());
		for (int moduleId : moduleIdList) {
			ProductDetail detail = new ProductDetail();
			detail.setModuleId(moduleId);
			detail.setProductId(product.getId());
			productDetailService.save(detail);
		}
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.ProductService#findAll()
	 */
	@Override
	public List<Product> findAll() {
		return productDAO.findAll();
	}

}
