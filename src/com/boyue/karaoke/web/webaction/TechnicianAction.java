package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Technician;
import com.boyue.karaoke.model.TechnicianLevel;
import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.service.TechnicianLevelService;
import com.boyue.karaoke.service.TechnicianService;
import com.boyue.karaoke.service.TechnicianTypeService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("TechnicianAction")
@Scope(value = "prototype")
public class TechnicianAction extends DefaultBaseAction<Technician>{
	@Autowired
	private TechnicianService technicianService;
	@Autowired
	private TechnicianLevelService technicianLevelService;
	@Autowired
	private TechnicianTypeService technicianTypeService;
	
	private Technician model;
	
	private List<Integer> idList;
	
	private List<TechnicianLevel> levels;
	
	private List<TechnicianType> types;
	
	/**
	 * 分页查找
	 * @return
	 */
	
	public String home(){
		this.types = technicianTypeService.findTypes();
		this.levels = technicianLevelService.findLevel();
		if(model == null){
			model = new Technician();
		}
		this.pageBean = technicianService.findPage(model, pageNo, pageSize);
		if(this.pageBean.getElements() != null && this.pageBean.getElements().size() > 0){
			for(Technician t:this.pageBean.getElements()){
				t.setType(technicianTypeService.findById(t.getTypeId()));
				t.setLevel(technicianLevelService.findById(t.getLevelId()));
			}
		}
		return "success";
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String toadd(){
		this.types = technicianTypeService.findTypes();
		this.levels = technicianLevelService.findLevel();
		return "success";
	}
	
	public String add(){
		if (getLang() == 1) {
			model.setNamee(model.getName());
			model.setNativePlacee(model.getNativePlace());
		}else if (getLang() == 2) {
			model.setName(model.getNamee());
			model.setNativePlace(model.getNativePlacee());
		}
		technicianService.savemodel(model);
		return "success";
	}
	
	public String toUpdate() {
		if(model.getId() != null){
			model = technicianService.findById(model.getId());
		}
		this.types = technicianTypeService.findTypes();
		this.levels = technicianLevelService.findLevel();
		return "success";
	}
	
	public String update() {
		Technician old = technicianService.findById(model.getId());
		if (StringUtils.isNotBlank(model.getImg())) {
			new File(old.getImg()).delete();
		}else {
			model.setImg(old.getImg());
		}
		if (getLang() == 1) {
			model.setNamee(old.getNamee());
			model.setNativePlacee(old.getNativePlacee());
		}else if (getLang() ==2) {
			model.setName(old.getName());
			model.setNativePlace(old.getNativePlace());
		}
		technicianService.updatemodel(model);
		return "success";
	}

	public String deleteIds() {
		if(idList != null && idList.size() > 0){
			technicianService.deleteIds(idList);
		}
		return "success";
	}
	public Technician getModel() {
		return model;
	}

	public void setModel(Technician model) {
		this.model = model;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public List<TechnicianLevel> getLevels() {
		return levels;
	}

	public void setLevels(List<TechnicianLevel> levels) {
		this.levels = levels;
	}

	public List<TechnicianType> getTypes() {
		return types;
	}

	public void setTypes(List<TechnicianType> types) {
		this.types = types;
	}
	
	
	
	
	
	
	

}
