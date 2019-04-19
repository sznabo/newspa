package com.boyue.karaoke.service;

import java.util.Date;
import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.GuestBook;

public interface IGuestBookService {
	PageBean findLiveManagementList(GuestBook model, int pageNo, int pageSize,Date startTime,Date endTime);

	GuestBook findGuestBookByID(Integer id);

	void deleteGuestBookByID(List<Integer> idList);

	void saveGuestBook(GuestBook guestBook);
}
