package com.boyue.karaoke.web.webaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Module;
import com.boyue.karaoke.model.Product;
import com.boyue.karaoke.service.ModuleService;
import com.boyue.karaoke.service.ProductService;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.opensymphony.xwork2.ActionContext;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:52:26
 *
 */
@Controller("ProductAction")
@Scope(value = "prototype")
public class ProductAction extends DefaultBaseAction<Product> {

	@Autowired
	private ProductService productService;
	@Autowired
	private ModuleService moduleService;
	
	private Product product;
	private Integer id;
	private List<Integer> idList;
	private List<Module> allModules;
	private List<Integer> moduleIdList;
	
	public String findPage() {
		this.pageBean = productService.findPage(product, pageNo, pageSize);
		return SUCCESS;
	}
	
	public String save() {
		productService.save(product, moduleIdList);
		return SUCCESS;
	}
	
	public String toAdd() {
		this.allModules = moduleService.findAll();
		return SUCCESS;
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		this.allModules = moduleService.findAll();
		this.product = productService.findById(id);
		Map<Integer, Module> productModuleMap = new HashMap<Integer, Module>();
		for (Module m : product.getModules()) {
			productModuleMap.put(m.getId(), m);
		}
		ActionContext.getContext().put("productModuleMap", productModuleMap);
		return SUCCESS;
	}
	
	public String update() {
		productService.update(product, moduleIdList);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			productService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public List<Module> getAllModules() {
		return allModules;
	}

	public void setAllModules(List<Module> allModules) {
		this.allModules = allModules;
	}

	public List<Integer> getModuleIdList() {
		return moduleIdList;
	}

	public void setModuleIdList(List<Integer> moduleIdList) {
		this.moduleIdList = moduleIdList;
	}

}
