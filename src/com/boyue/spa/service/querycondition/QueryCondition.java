package com.boyue.spa.service.querycondition;

import com.boyue.karaoke.common.Constants;



public class QueryCondition {

	private int pageNo = 1;
	
	private int pageSize = Constants.DEFAULT_PAGE_SIZE;

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
