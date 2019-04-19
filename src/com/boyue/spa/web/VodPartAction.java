package com.boyue.spa.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.framework.web.Response;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.service.querycondition.VodpartQueryCondition;


@Controller("VodPartAction")
@Scope(value = "prototype")
public class VodPartAction extends BaseAction {
	private Vodpart model = new Vodpart();
	@Autowired
	private VodPartService vodPartService;
	private VodProgramService vodprogramSerivce;
	private List<Vodpart> vodPartList;
	private List<Integer> idList;
	private Integer id;
	private String vodpartName;
	private String vodpartNamee;
	
	/**
	 * @Name: listVodPart
	 * @Description: 显示点播管理首页信息
	 * @Author: 罗伟斌（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodPartList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String listVodPart() throws Exception {
		VodpartQueryCondition condition = new VodpartQueryCondition();
		condition.setPageNo(pageNo);
		condition.setPageSize(6);
		condition.setVodpartName(vodpartName);
		condition.setVodpartNamee(vodpartNamee);
		this.pageBean = vodPartService.findVodpartPage(condition);
		return "goListVodPart";
	}
	
	/**
	 * @Name: saveVodPart
	 * @Description: 保存新增点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 保存后跳到vodPartList.jsp页面
	 */
	public String saveVodPart() {
		if (getLang() == 1) {
			model.setVodpartnamee(model.getVodpartname());
		}else if (getLang() == 2) {
			model.setVodpartname(model.getVodpartnamee());
		}
	    vodPartService.saveVodPartService(model);
		
		return "listVodPart";
	}
	
	/**
	 * @Name: delVodPartByIDs
	 * @Description: 批处理删除和删除单个点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 删除后重定向到vodPartList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String delVodPartByIDs() throws Exception {
		//如果已经在使用，则无法删除
		this.vodPartService.delete(idList);
		return "listVodPart";
	}
	
	/**
	 * @Name: toUpdatePage
	 * @Description: 点播栏目信息更新
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editVodPart.jsp页面
	 */
	public String toUpdatePage(){
		model = vodPartService.findVodPartByID(id);
		return "goEditVodPart";
	}
	/**
	 * @Name: updateVodPart
	 * @Description:保存更新后的点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodPartList.jsp页面
	 */
	public String updateVodPart() {
		Vodpart vodpart = new Vodpart();
		vodpart = vodPartService.loadVodPartService(model.getId());
		String subxml = vodpart.getXmlpath();
		model.setXmlpath(subxml);
		
		if (getLang() == 1) {
			model.setVodpartnamee(vodpart.getVodpartnamee());
		}
		if (getLang() == 2) {
			model.setVodpartname(vodpart.getVodpartname());
		}
		
		if(model.getPartintr() ==null||model.getPartintr().equals("")){
			model.setPartintr(vodpart.getPartintr());
		}
		if(model.getImg() != null && !model.getImg().trim().isEmpty() ){
			new File(vodpart.getImg()).delete();
		}else {
			model.setImg(vodpart.getImg());
		}
		//保存信息
		vodPartService.saveOrUpdateVodPartService(model);
		return "listVodPart";
	}
	/**
	 * @Name: skip
	 * @Description:添加点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addPartList.jsp页面
	 */
	public String skip() {
		return "goaddVodPart";
	}
	public String isName(){
		ajaxResponse = new Response<Boolean>();
		
		Vodpart v = new Vodpart();
		if(model.getId() != null){
			Vodpart vodpart = vodPartService.findVodPartByID(model.getId());
			if(vodpart.getVodpartname().equals(model.getVodpartname())){
				ajaxResponse.setMsgBody(true);
				return JSON_RESULT;
			}
		}
		v.setVodpartname(model.getVodpartname());
		List<Vodpart> list = vodPartService.findIsName(v);
		System.out.println("			" + list);
		if (list == null || list.isEmpty()) {
			ajaxResponse.setMsgBody(true);
		} else {
			ajaxResponse.setMsgBody(false);
		}
		return JSON_RESULT;
	}
	public Vodpart getModel() {
		return model;
	}

	public void setModel(Vodpart model) {
		this.model = model;
	}

	public List<Vodpart> getVodPartList() {
		return vodPartList;
	}

	public void setVodPartList(List<Vodpart> vodPartList) {
		this.vodPartList = vodPartList;
	}

	public VodProgramService getVodprogramSerivce() {
		return vodprogramSerivce;
	}

	public void setVodprogramSerivce(VodProgramService vodprogramSerivce) {
		this.vodprogramSerivce = vodprogramSerivce;
	}
	
	public String getVodpartName() {
		return vodpartName;
	}

	public void setVodpartName(String vodpartName) {
		this.vodpartName = vodpartName;
	}
	
	

	public String getVodpartNamee() {
		return vodpartNamee;
	}

	public void setVodpartNamee(String vodpartNamee) {
		this.vodpartNamee = vodpartNamee;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
