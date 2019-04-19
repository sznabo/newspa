package com.boyue.spa.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Admin;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.spa.domain.VodQueryDTO;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodvideo;
import com.boyue.spa.service.VodManagementService;
import com.boyue.spa.service.querycondition.VodpartQueryCondition;
import com.opensymphony.xwork2.ModelDriven;

@Controller("VodManagementAction")
@Scope(value = "prototype")
public class VodManagementAction extends BaseAction implements
		ModelDriven<Vodvideo> {

	private Vodvideo model = new Vodvideo();
	private com.boyue.spa.domain.VodQueryDTO vodquery = new VodQueryDTO();
	@Autowired
	private VodPartService vodPartService;
	private VodManagementService vodmngService;
	private VodProgramService vodprogramSerivce;
	private List<Vodpart> vodPartList;
	private List<Vodvideo> vodprogramList;
	private String liveName;
	
	/**
	 * @Name: listVodPart
	 * @Description: 显示点播信息列表
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-14（创建日期）
	 * @Parameters: 无
	 * @Return: String 查询后跳到vodManagemeList.jsp页面
	 */
	/** 显示栏目信息 */
	public String listVodPart() throws Exception {
//		String type = ServletActionContext.getRequest().getParameter("type").toString();
		VodpartQueryCondition condition = new VodpartQueryCondition();
		condition.setPageNo(pageNo);
		condition.setPageSize(pageSize);
//		condition.setVodpartName(StringUtils.trim(liveName));
//		this.pageBean = vodPartService.findVodpartPage(condition );
//		
//		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
//		List<Vodprogram> allProgram = vodprogramSerivce.findAll();
		
		this.pageBean = vodPartService.findVodpartPage(vodPartList,condition);
		this.setRequestAttr("pageBean", pageBean);
		
		return "goListVodPart";
	}

	/** 根据channelID,加载栏目下所有视频 */
	public String loadAllVodByVodPartID() {
		String type = ServletActionContext.getRequest().getParameter("type")
				.toString();
		String id = ServletActionContext.getRequest().getParameter("vodpartID")
				.toString();

		vodprogramList = new ArrayList<Vodvideo>();
		vodprogramList = vodmngService.browseVodByVodPartID(Integer
				.parseInt(id));

		Vodpart vodpart = new Vodpart();
		vodpart = vodPartService.loadVodPartService(Integer.parseInt(id));

		ServletActionContext.getRequest().getSession()
				.setAttribute("channel", vodpart.getVodpartname());
		model.setVodprogramid(vodpart.getId());
		return type;
	}

	/** 跳转 */
	public String skip() {
		String type = ServletActionContext.getRequest().getParameter("type")
				.toString();
		String id = ServletActionContext.getRequest().getParameter("vodpartid")
				.toString();
		model.setVodprogramid(Integer.parseInt(id));
		return type;
	}

	/** 保存添加的视频信息 */
	public String saveVodProgram() {

		model.setVoidstatus(0);
		model.setIfenable(0);
		model.setCreatetime(new Timestamp(System.currentTimeMillis()));
		model.setCreateadmin(((Admin) ServletActionContext.getRequest()
				.getSession().getAttribute(Constants.MANAGE_USERINFO_SESSION_KEY)).getUserName());
		vodmngService.saveVoidprogram(model);

		vodprogramList = new ArrayList<Vodvideo>();
		vodprogramList = vodmngService.browseVodByVodPartID(model
				.getVodprogramid());
		return "voidprogram";
	}


	public List<Vodvideo> getVodprogramList() {
		return vodprogramList;
	}

	public void setVodprogramList(List<Vodvideo> vodprogramList) {
		this.vodprogramList = vodprogramList;
	}

	public VodManagementService getVodmngService() {
		return vodmngService;
	}

	public void setVodmngService(VodManagementService vodmngService) {
		this.vodmngService = vodmngService;
	}



	public List<Vodpart> getVodPartList() {
		return vodPartList;
	}

	public void setVodPartList(List<Vodpart> vodPartList) {
		this.vodPartList = vodPartList;
	}

	public Vodvideo getModel() {
		return model;
	}

	public void setModel(Vodvideo model) {
		this.model = model;
	}

	public VodQueryDTO getVodquery() {
		return vodquery;
	}

	public void setVodquery(VodQueryDTO vodquery) {
		this.vodquery = vodquery;
	}

	public String getLiveName() {
		return liveName;
	}

	public void setLiveName(String liveName) {
		this.liveName = liveName;
	}

	public VodProgramService getVodprogramSerivce() {
		return vodprogramSerivce;
	}

	public void setVodprogramSerivce(VodProgramService vodprogramSerivce) {
		this.vodprogramSerivce = vodprogramSerivce;
	}

}
