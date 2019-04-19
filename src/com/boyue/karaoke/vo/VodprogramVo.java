package com.boyue.karaoke.vo;

import java.util.List;

import com.boyue.spa.domain.Vodprogram;

public class VodprogramVo {

	private List<Vodprogram> list;
	
	private int pageCount;

	public List<Vodprogram> getList() {
		return list;
	}

	public void setList(List<Vodprogram> list) {
		this.list = list;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
