/**
 * 
 * @author: ben
 * @date:   2012-8-25
 */
package com.boyue.framework.common;

import java.io.Serializable;
import java.util.List;

public class PageBean<T> implements Serializable {
	//默认每页记录数
	public final static int DEFAULT_PAGE_SIZE = 10;
    
    // 每页显示记录数
    private int pageSize = DEFAULT_PAGE_SIZE;
    
    //总记录数
    private int totalRows;
    
    //当前第几页，从1开始计数。如果element数量为0，则设为0
    private int currentPage = 1;
    
    //总页数
    private int totalPage;
    
    //绑定的内容列表
    private List<T> elements;
    
    //开始记录
    private int startIndex;
    
    //结束记录
    private int endIndex;
    
    private Object appendix;

    public PageBean(int curPage, int totalCount, List<T> elements) {
    	this(curPage, totalCount, DEFAULT_PAGE_SIZE, elements);
    }
    
    /**
     * @param curPage 第几页
     * @param totalRows 总行数
     * @param pageSize 每页多少行
     * @param elements 当前页的内容
     */
    public PageBean(int curPage, int totalRows, int pageSize ,List<T> elements) {
    	this.pageSize = pageSize;
    	this.currentPage = curPage;
    	this.totalRows = totalRows;
    	this.elements = elements;
    	init();
    }
    
    
    private void init() {
    	//计算总页数
		if (this.totalRows%pageSize == 0) {
			this.totalPage = totalRows/pageSize;
		} else{
			this.totalPage = totalRows/pageSize + 1;
		}
		//计算开始记录
		this.startIndex = (currentPage -1) * pageSize  +1;
		//计算结束记录
		this.endIndex = currentPage * pageSize;
    	
    }
    
	public List<T> getElements() {
		return elements;
	}

	public void setElements(List<T> elements) {
		this.elements = elements;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public Object getAppendix() {
		return appendix;
	}

	public void setAppendix(Object appendix) {
		this.appendix = appendix;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	

}
