package com.boyue.karaoke.web.webaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.SongStat;
import com.boyue.karaoke.service.SongStatService;

/**
 *
 * @author ben
 * @date   2014-7-3 上午10:34:07
 *
 */

@Controller("SongStatAction")
@Scope(value = "prototype")
public class SongStatAction extends BaseAction<SongStat> {
	
	@Autowired
	private SongStatService songStatService;
	
	private SongStat songStat;
	
	
	public String findPage() {
		this.pageBean = songStatService.findPage(songStat, pageNo, pageSize);
		return SUCCESS;
	}
	
	public SongStat getSongStat() {
		return songStat;
	}
	
	public void setSongStat(SongStat songStat) {
		this.songStat = songStat;
	}
	
}
