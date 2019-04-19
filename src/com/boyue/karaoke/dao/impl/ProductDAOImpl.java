package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.ProductDAO;
import com.boyue.karaoke.model.Product;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:47:37
 *
 */
@Repository
public class ProductDAOImpl extends BaseDAOImpl<Product> implements ProductDAO {

	@Override
	public void deleteByIdList(List idList) {
		super.deleteByIdList(idList);
		this.executeSql("delete from product_detail where product_id in (" + StringUtils.join(idList, ",") +")");
	}

}
