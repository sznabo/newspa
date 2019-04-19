package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.model.SongCategory;
import com.boyue.karaoke.model.SongCategoryDetail;
import com.boyue.karaoke.service.SongCategoryDetailService;
import com.boyue.karaoke.service.SongCategoryService;
import com.boyue.karaoke.service.SongService;
import com.boyue.karaoke.web.DefaultBaseAction;

/**
 *
 * @author ben
 * @date   2014-6-24 下午1:28:30
 *
 */
@Controller("SongCategoryDetailAction")
@Scope(value = "prototype")
public class SongCategoryDetailAction  extends DefaultBaseAction<Song> {

	@Autowired
	private SongCategoryDetailService songCategoryDetailService;
	@Autowired
	private SongService songService;
	@Autowired
	private SongCategoryService songCategoryService;
	
	private SongCategoryDetail songCategoryDetail;
	private List<Integer> idList;
	private Integer songCategoryId;
	private List<Integer> songIdList;
	private List<Song> songList;
	private Song song;
	private SongCategory songCategory;
	//第一次进入
	private Integer first;
	
	private Integer getCurCategory() {
		return (Integer)this.getSessionAttr("curCategory");
	}
	
	private void setCurCategory(int categoryId) {
		this.setSessionAttr("curCategory", categoryId);
	}
	
	public String findPage() {
		song = song==null?new Song():song;
		//存到session
		if (first != null) {
			setCurCategory(song.getCategoryId());
		} else {
			song.setCategoryId(getCurCategory());
		}
		this.pageBean = songService.findPage(song, pageNo, pageSize);
		songCategory = songCategoryService.findById(getCurCategory());
		return SUCCESS;
	}
	
	public String toAdd() {
		songCategory = songCategoryService.findById(getCurCategory());
		Song querySong = new Song();
		try {
			if (song != null) {
				BeanUtils.copyProperties(song, querySong);
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		querySong.setCategoryId(null);
		List<Song> all = songService.findPage(querySong, 1, 100000).getElements();
		//排除已经存在的
		List<SongCategoryDetail> details = songCategoryDetailService.findByCategory(getCurCategory());
		Map<Integer, SongCategoryDetail> map = new HashMap<Integer, SongCategoryDetail>();
		for (SongCategoryDetail cd : details) {
			map.put(cd.getSong().getId(), cd);
		}
		songList = new ArrayList<Song>();
		for (Song s : all) {
			if (map.get(s.getId()) == null)  {
				songList.add(s);
			}
		}
		return SUCCESS;
	}
	
	public String save() {
		if (songIdList != null && !songIdList.isEmpty()) {
				
			songCategoryDetailService.save(getCurCategory(), songIdList);
			
			
		}
		return SUCCESS;
	}
	
	public String delete() {
		songCategoryDetailService.deleteCategorySong(getCurCategory(), songIdList);
		return SUCCESS;
	}

	public SongCategoryDetail getSongCategoryDetail() {
		return songCategoryDetail;
	}

	public void setSongCategoryDetail(SongCategoryDetail songCategoryDetail) {
		this.songCategoryDetail = songCategoryDetail;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public Integer getSongCategoryId() {
		return songCategoryId;
	}

	public void setSongCategoryId(Integer songCategoryId) {
		this.songCategoryId = songCategoryId;
	}

	public List<Integer> getSongIdList() {
		return songIdList;
	}

	public void setSongIdList(List<Integer> songIdList) {
		this.songIdList = songIdList;
	}

	public List<Song> getSongList() {
		return songList;
	}

	public void setSongList(List<Song> songList) {
		this.songList = songList;
	}

	public Song getSong() {
		return song;
	}

	public void setSong(Song song) {
		this.song = song;
	}

	public SongCategory getSongCategory() {
		return songCategory;
	}

	public void setSongCategory(SongCategory songCategory) {
		this.songCategory = songCategory;
	}

	public Integer getFirst() {
		return first;
	}

	public void setFirst(Integer first) {
		this.first = first;
	}
	
}
