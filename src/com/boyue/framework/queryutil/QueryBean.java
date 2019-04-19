package com.boyue.framework.queryutil;

import com.boyue.framework.common.PageBean;

/**
 *
 * @author ben
 * @date   2013-3-31 下午03:55:11
 *
 */
public class QueryBean {
	//默认第一页
	private int pageNo = 1;
	//显示多少条
	private int pageSize = PageBean.DEFAULT_PAGE_SIZE;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
}
