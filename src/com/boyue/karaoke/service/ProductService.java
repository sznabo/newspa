package com.boyue.karaoke.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Product;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:48:37
 *
 */
@Service
public interface ProductService {

	/**
	 * @param product
	 */
	void save(Product product);

	/**
	 * @param Product
	 */
	void update(Product product);

	/**
	 * @param id
	 * @return
	 */
	Product findById(Integer id);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param Product
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<Product> findPage(Product product, int pageNo, int pageSize);

	/**
	 * @param product
	 * @param moduleIdList
	 */
	void save(Product product, List<Integer> moduleIdList);

	/**
	 * @param product
	 * @param moduleIdList
	 */
	void update(Product product, List<Integer> moduleIdList);

	/**
	 * @return
	 */
	List<Product> findAll();
}
