package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.SongDAO;
import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.service.SongCategoryDetailService;
import com.boyue.karaoke.service.SongService;

/**
 *
 * @author ben
 * @date   2014-6-23 上午10:37:01
 *
 */
@Service
public class SongServiceImpl implements SongService {
	@Autowired
	private SongCategoryDetailService songCategoryDetailService;
	@Autowired
	private SongDAO songDAO;
	
	@Override
	public void save(Song song) {
		song.setPlayTimes(0);
		songDAO.save(song);
	}

	@Override
	public void update(Song song) {
		songDAO.update(song);
	}

	@Override
	public Song findById(Integer id) {
		return songDAO.findById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		List<Song> songList = songDAO.findByIdList(idList);
		songDAO.deleteByIdList(idList);
		//在分类中把相关的记录也删掉
		songCategoryDetailService.deleteBySong(idList);
		//删除文件
		String basepath = SystemConfig.getProjectBasePath();
		for (Song song : songList) {
			new File(basepath + song.getMusicFile()).delete();
			if (StringUtils.isNotBlank(song.getLogo())) {
				new File(basepath + song.getLogo()).delete();
			}
			if (StringUtils.isNotBlank(song.getLyricFile())) {
				new File(basepath + song.getLyricFile()).delete();
			}
		}
	}

	@Override
	public PageBean<Song> findPage(Song song, int pageNo, int pageSize) {
		if (song == null) {
			song = new Song();
		}
//		Song s = new Song();
//		BeanUtils.copyProperties(song, s);
//		if (StringUtils.isNotBlank(song.getSongName())) {
//			s.setSongName("%" + song.getSongName() + "%");
//		}
		return songDAO.findPage(song, pageNo, pageSize);
	}

	@Override
	public List<Song> findAll() {
		return songDAO.findAll();
	}
	
	
	@Override
	public List<Song> findByName(String songName) {
		
		return songDAO.findByName(songName);
	}

	@Override
	public void addSongPlayTimes(int songId) {
		songDAO.addPlayTimes(songId);
	}

	/**
	 * 批量添加歌曲
	 */
	@Override
	public boolean saveSongs(List<Song> songs) {
		boolean status = false;
		try{
		if(songs != null && songs.size() > 0){
			for(Song s :songs){
				if(findExist(s)){
					songDAO.save(s);
				}
			}
		}
		status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	
	private boolean findExist(Song s){
		boolean status = true;
		String hql = "from Song s where s.songName ='"+s.getSongName()+"' and s.singer='"+s.getSinger()+"'";
		List<Song> lists = songDAO.findByHql(hql);
		if(lists != null && lists.size() > 0){
			status = false;
		}
		return status;
	}

	public PageBean<Song> findPageByorder(Song song, int pageNo, int pageSize, String nameSort)
	  {
	     if (song == null) {
      song = new Song();
	     }
	    if (nameSort == null) {
	       return this.songDAO.findPageByOrder(song,pageNo,pageSize,new Order[0]);
	     }
	     return this.songDAO.findPageByOrder(song,pageNo,pageSize,new Order[] { Order.desc(nameSort) });
	   }
}
