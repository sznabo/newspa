package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Soft;
import com.boyue.karaoke.service.SoftService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("SoftAction")
@Scope(value = "prototype")
public class SoftAction extends DefaultBaseAction<Soft> {

	@Autowired
	private SoftService softService;

	private File addFile;

	// myFileContentType属性用来封装上传文件的类型
	private String addFileContentType;

	// myFileFileName属性用来封装上传文件的文件名
	private String addFileFileName;

	private Integer id;

	// 页面传过来的id 列表
	private List<Integer> idList;

	private Soft soft;
	

	private InputStream apkFile;

	private String apkFileName;

	/**
	 * 进入增加页面
	 * 
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}

	/**
	 * 增加
	 * 
	 * @return
	 * @throws IOException
	 */
	public String save() throws IOException {

		String path = this.getUploadPath();
		if (addFile != null) {
			if (!new File(path).exists()) {
				new File(path).mkdirs();
			}
			String suffix=addFileFileName.substring(addFileFileName.lastIndexOf("."),addFileFileName.length());
			long ran=(long) (Math.random()*999999999+1);
			FileUtils.copyFile(addFile, new File(path +ran+ suffix));
			soft.setFilePath("upload/soft/"+ran+suffix);
			softService.save(soft);
			this.addActionMessage("上传成功");
		} else {
			this.addActionError("请选择要上传的文件");
		}
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 * @throws IOException
	 */
	public String update() throws IOException {
		String path = this.getUploadPath();
		String oldFilePath = null;
		if (!new File(path).exists()) {
			new File(path).mkdirs();
		}
		if (addFile != null) {
			String suffix=addFileFileName.substring(addFileFileName.lastIndexOf("."),addFileFileName.length());
			long ran=(long) (Math.random()*999999999+1);
			FileUtils.copyFile(addFile, new File(path + ran+suffix));
			soft.setFilePath("upload/soft/"+ran+suffix);
		}
		Soft softUpdate = this.softService.findById(soft.getId());	
		oldFilePath = softUpdate.getFilePath();
		softUpdate.setFilePath(soft.getFilePath());
		softUpdate.setVersion(soft.getVersion());
		softUpdate.setName(soft.getName());
		softUpdate.setRemark(soft.getRemark());
		softService.update(softUpdate);
		if (new File(ServletActionContext.getServletContext().getRealPath("/") + oldFilePath).exists()) {
			new File(ServletActionContext.getServletContext().getRealPath("/") + oldFilePath).delete();
		}
		this.addActionMessage("修改成功");
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	public String toUpdate() {
		this.soft = softService.findById(soft.getId());
		return SUCCESS;
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			softService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public String findPage() {
		this.pageBean = softService.findPage(soft, pageNo, pageSize);
		return SUCCESS;
	}
	/*
	 * 下载
	 */
	public String download() throws Exception {
		Soft s = softService.findById(id);
		this.apkFileName = java.net.URLEncoder.encode(FilenameUtils.getName(s
				.getFilePath()), "UTF-8");
		this.apkFile = new FileInputStream(this.getProjectPath()
				+ s.getFilePath());
		return SUCCESS;
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

	public Soft getSoft() {
		return soft;
	}

	public void setSoft(Soft soft) {
		this.soft = soft;
	}

	public File getAddFile() {
		return addFile;
	}

	public void setAddFile(File addFile) {
		this.addFile = addFile;
	}

	public String getAddFileContentType() {
		return addFileContentType;
	}

	public void setAddFileContentType(String addFileContentType) {
		this.addFileContentType = addFileContentType;
	}

	public String getAddFileFileName() {
		return addFileFileName;
	}

	public void setAddFileFileName(String addFileFileName) {
		this.addFileFileName = addFileFileName;
	}

	private String getUploadPath() {
		return ServletActionContext.getServletContext().getRealPath("/")
				+ "upload" + "/"+"soft/";
	}

	private String genFileName(String fileName) {
		return fileName;
		// return System.currentTimeMillis() + "." +
		// FilenameUtils.getExtension(fileName);
	}
}
