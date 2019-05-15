package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.security.MD5;
import com.boyue.framework.util.DateUtil;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Admin;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.service.AdminService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.util.DecodeUtil;
import com.boyue.karaoke.util.HardInfoUtil;
import com.boyue.karaoke.util.LicenceInfo;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller("AdminAction")
@Scope(value = "prototype")
public class AdminAction extends DefaultBaseAction<Admin> {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private DeviceService deviceService;
	
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private Admin admin;
	
	private String oldpwd;
	private String newpwd;
	private List<Admin> all;
	private Integer language = 1;    //1中文  2英语
	public String toLogin() {
		return INPUT;
	}
	
	public String login() {
		this.setSessionAttr("language", language);
//		Date end = DateUtil.parse("2012-09-18 00:00:00");
//		if (new Date().getTime() > end.getTime()) {
//			this.addActionError("授权已过期");
//			return INPUT;
//		}
//		if (this.getSessionAdmin() != null) {
//			return SUCCESS;
//		}
		
		try {
			LicenceInfo info = (LicenceInfo) ServletActionContext.getServletContext().getAttribute(Constants.SYS_PERMISSION);
			if (info == null) {
				this.addActionError("该设备没有授权");
//				ActionContext.getContext().put(Constants.SYS_PERMISSION_ERROR, "该设备没有授权");
				return INPUT;
			}
			
			String hardInfo = HardInfoUtil.getInfo();
		//	System.out.println("电脑本地"+hardInfo+"      授权文件："+info.getHardInfo());
			//检测时间是不是过期了
			if (!info.isNotLimitUserTime() && (new Date().getTime() > info.getDateTo().getTime())) {
//				ActionContext.getContext().put(Constants.SYS_PERMISSION_ERROR, "系统授权已经过期:" + info.getDateTo());
				this.addActionError("系统授权已经过期:" + info.getDateTo());
				return INPUT;
			}
			
			if (!hardInfo.toLowerCase().equals(info.getHardInfo().toLowerCase())) {
				this.addActionError("该设备没有授权");
//				ActionContext.getContext().put(Constants.SYS_PERMISSION_ERROR, "该设备没有授权");
				return INPUT;
			}
			List<Device> devices  = deviceService.findAll();
			if(devices!= null && devices.size()>0){
				Integer num = (Integer)ServletActionContext.getServletContext().getAttribute(Constants.SYS_PERSON_NUM);
				if(devices.size() > num){
					this.addActionError("终端数量已达上限！");
					return INPUT;
				}
			}
			//检测硬件
		} catch (Exception e) {
			e.printStackTrace();
			this.addActionError("系统授权失败");
//			ActionContext.getContext().put(Constants.SYS_PERMISSION_ERROR, "系统授权失败");
			return INPUT;
		}
		
		if (admin != null && admin.getLoginName() != null && admin.getPassword() != null) {
			Admin ad = adminService.findByLoginName(admin.getLoginName());
			if (ad != null && MD5.valid(admin.getPassword(), ad.getPassword())) {
				this.setSessionAdmin(ad);
				return SUCCESS;
			}
//			if(ad !=null && admin.getPassword().equals(ad.getPassword())){
//				this.setSessionAdmin(ad);
//				return SUCCESS;
//			}
		}
		this.addActionError("请输入正确的用户名和密码");
		return INPUT;
	}
	
	public String logout() {
		ServletActionContext.getRequest().getSession().invalidate();
		return INPUT;
	}
	
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
	 */
	public String save() {
		List<Admin> all = adminService.findAll();
		for (Admin a : all) {
			if (a.getLoginName().toLowerCase().equals(admin.getLoginName())) {
				this.addActionError("登陆名已经存在");
			}
		}
		if (!this.hasActionErrors()) {
			admin.setSuperAdmin(Admin.NOT_SUPER_ADMIN);
			adminService.save(admin);
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String updatePwd() {
		Admin admin = adminService.findById(this.getSessionAdmin().getId());
		if (!MD5.valid(oldpwd, admin.getPassword())) {
			this.addActionError("旧密码错误");
		} else {
			admin.setPassword(newpwd);
			adminService.update(admin);
			
			this.setSessionAdmin(admin);
			this.addActionMessage("修改成功");
		}
		return SUCCESS;
	}
	
	public String toUpdatePwd() {
		admin = adminService.findById(this.getSessionAdmin().getId());
		return SUCCESS;
	}
	
	public String update() {
		Admin old = adminService.findById(admin.getId());
		old.setUserName(admin.getUserName());
		old.setPassword(admin.getPassword());
		adminService.update(old);
		return SUCCESS;
	}
	
	public String list() {
		List<Admin> admins = adminService.findAll();
		int adminId = this.getSessionAdmin().getId();
		all = new ArrayList<Admin>();
		for (Admin admin : admins) {
			if (admin.getId() != adminId) {
				all.add(admin);
			}
		}
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		admin = adminService.findById(admin.getId());
		return INPUT;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			adminService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = adminService.findPage(admin, pageNo, pageSize);
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

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public List<Admin> getAll() {
		return all;
	}

	public void setAll(List<Admin> all) {
		this.all = all;
	}

	public Integer getLanguage() {
		return language;
	}

	public void setLanguage(Integer language) {
		this.language = language;
	}

	
	
}
