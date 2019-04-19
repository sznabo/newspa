package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Product;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:47:15
 *
 */
public interface ProductDAO extends DAO<Product> {

	List<Product> findAll();
}
