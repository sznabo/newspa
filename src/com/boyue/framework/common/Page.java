package com.boyue.framework.common;

import java.util.List;

public class Page<T> {

	private int pageNo = 1;
	
	private int pageSize =  SystemConfig.DEFAULT_PAGE_SIZE;
	
	private int totalPage;
	
	private int totalRows;
	
	private boolean hasPrePage;
	
	private boolean hasNextPage;
	
	private List<T> data;
	
	public Page(int pageNo, int pageSize, List<T> data, int total) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.data = data;
		this.totalRows = total;
		compute();
	}
	
	public Page(int pageNo, List<T> data, int total) {
		this(pageNo, SystemConfig.DEFAULT_PAGE_SIZE, data, total);
	}
	
	

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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public boolean isHasPrePage() {
		return hasPrePage;
	}

	public void setHasPrePage(boolean hasPrePage) {
		this.hasPrePage = hasPrePage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	private void compute() {
		//设置总页数
		if (this.getTotalRows() != 0) {
			if (this.getTotalRows()%this.getPageSize() == 0) {
				this.setTotalPage(getTotalRows()/this.getPageSize());
			} else {
				this.setTotalPage(getTotalRows()/this.getPageSize() + 1);
			}
		}
		//设置是否有上一页, 不是第一页就有上一页
		if (this.getPageNo() < 2) {
			this.setHasPrePage(false);
		} else {
			this.setHasPrePage(true);
		}
		//设置是否有下一页
		if (this.getPageNo() < this.getTotalPage()) {
			this.setHasNextPage(true);
		} else {
			this.setHasNextPage(false);
		}
		
	}
	
	

}
