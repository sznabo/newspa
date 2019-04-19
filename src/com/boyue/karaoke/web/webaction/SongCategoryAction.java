package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.SongCategory;
import com.boyue.karaoke.service.SongCategoryService;
import com.boyue.karaoke.web.DefaultBaseAction;

/**
 *
 * @author ben
 * @date   2014-6-24 上午10:06:05
 *
 */
@Controller("SongCategoryAction")
@Scope(value = "prototype")
public class SongCategoryAction extends DefaultBaseAction<SongCategory>  {

	@Autowired
	private SongCategoryService SongCategoryService;
	
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private SongCategory songCategory;
	private File pic;
	private String picFileName;
	private String picContentType;
	
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 * @throws IOException 
	 */
	public String save() throws IOException {
		if (pic != null) {
			String filename = Constants.LYRICFILE_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(picFileName).toLowerCase();
			FileUtils.copyFile(pic, new File(this.getProjectPath() + filename));
			songCategory.setIcon(filename);
		}
		if (getLang() == 1) {
			songCategory.setNamee(songCategory.getName());
		}else if (getLang() ==2) {
			songCategory.setName(songCategory.getNamee());
		}
		SongCategoryService.save(songCategory);
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 * @throws IOException 
	 */
	public String update() throws IOException {
		SongCategory old = SongCategoryService.findById(songCategory.getId());
		if (getLang() == 1) {
			old.setName(songCategory.getName());
		}else if (getLang() == 2) {
			old.setNamee(songCategory.getNamee());
		}
		String oldIcon = null;
		if (pic != null) {
			String filename = Constants.LYRICFILE_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(picFileName).toLowerCase();
			FileUtils.copyFile(pic, new File(this.getProjectPath() + filename));
			oldIcon = old.getIcon();
			old.setIcon(filename);
		}
		
		SongCategoryService.update(old);
		if (oldIcon != null) {
			new File(this.getProjectPath() + oldIcon).delete();
		}
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		songCategory = SongCategoryService.findById(id);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			SongCategoryService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = SongCategoryService.findPage(songCategory, pageNo, pageSize);
		return SUCCESS;
	}

	public SongCategory getSongCategory() {
		return songCategory;
	}

	public void setSongCategory(SongCategory songCategory) {
		this.songCategory = songCategory;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
}
