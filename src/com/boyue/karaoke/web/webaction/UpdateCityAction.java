package com.boyue.karaoke.web.webaction;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.util.UpdateCity;
@Controller("UpdateCityAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class UpdateCityAction extends BaseAction {
	
	private String capital;
	private String city;
	private String[] cap = null;
	private String[] c = null;
	private String updateCity;
	/**
	 * @Name: toUpdate
	 * @Description: 更新城市
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 无
	 * @throws Exception 有异常抛出
	 */
	public String toUpdate() throws Exception{
		String getUpdateCityPath = this.getProjectPath() + "WEB-INF" + File.separator + "classes" + File.separator + "updatecity.txt";
		String capcity = FileUtils.readFileToString(new File(getUpdateCityPath));
		if(capcity != null && !"".equals(capcity)){
//			String [] capitalcity = capcity.split("-");
//			if(capitalcity.length ==2){
//				this.setRequestAttr("capital", capitalcity[0]);
//				this.setRequestAttr("city", capitalcity[1]);
//			}else if(capitalcity.length ==3){
//				this.setRequestAttr("capital", capitalcity[0]);
//				this.setRequestAttr("city", capitalcity[2]);
//			}
			String capitalStr = capcity.substring(0, capcity.indexOf("-"));
			String cityStr = capcity.substring(capcity.lastIndexOf("-") + 1, capcity.length());
			this.setRequestAttr("capital", capitalStr);
			this.setRequestAttr("city", cityStr);
		}
		updateCity = this.findCity();
		//System.out.println(updateCity);
		this.setRequestAttr("updateCity", updateCity);
		return "update";
	}
	/**
	 * @Name: updateCity
	 * @Description: 更新城市
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-27（创建日期）
	 * @Parameters: 无
	 * @Return: String 无
	 * @throws IOException IO异常
	 */
	public String updateCity() throws Exception{
		cap = capital.split(",");
		c = city.split(",");
		if(!"0".equals(cap[1].trim()) && !"-1".equals(c[1].trim())){
			String str = cap[1].trim() + "-" + c[1].trim();
			String updateCityPath = this.getProjectPath() + "WEB-INF" + File.separator + "classes" + File.separator + "updatecity.txt";
			File f = new File(updateCityPath);
			Writer w = new FileWriter(f);
			w.write(str);
			w.flush();
			w.close();
		}
		
		String cityStr = null;
		
		if(cap[1].trim() != null && !cap[1].trim().equals("0") && !c[1].trim().equals("-1") && !"".equals(cap[1].trim()) && c[1].trim()!= null && !"".equals(c[1].trim())){
			cityStr = UpdateCity.child[Integer.parseInt(cap[1].trim())][Integer.parseInt(c[1].trim())];
		}
		
		if(cityStr != null && !"".equals(cityStr)){
			this.addActionMessage("修改成功!\n您已修改城市为："+ cityStr +"");
		}
		toUpdate();
		return "update";
	}
	/**
	 * @Name: findCity
	 * @Description: 获取城市
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-29（创建日期）
	 * @Parameters: 无
	 * @Return: String 无
	 * @throws Exception 有异常抛出
	 */
	public String findCity() throws Exception {
		// TODO Auto-generated method stub
		String getUpdateCityPath = this.getProjectPath() + "WEB-INF" + File.separator + "classes" + File.separator + "updatecity.txt";
		String capcity = FileUtils.readFileToString(new File(getUpdateCityPath));
		//String cityStr = null;
		if(capcity != null && !"".equals(capcity)){
//			String [] capitalcity = capcity.split("-");
			String capitalStr = capcity.substring(0, capcity.indexOf("-"));
			String cityStr = capcity.substring(capcity.lastIndexOf("-") + 1, capcity.length());
//			if(capitalcity.length == 2){
//				return UpdateCity.child[Integer.parseInt(capitalcity[0].trim())][Integer.parseInt(capitalcity[1].trim())];
//			}
////			if(capitalcity.length == 3 /*&& !("0".equals(capitalcity[0]) && "".equals(capitalcity[1]) && "1".equals(capitalcity[2]))*/){
////				return UpdateCity.child[Integer.parseInt(capitalcity[0].trim())][Integer.parseInt(capitalcity[2].trim())];
//				return UpdateCity.child[Integer.parseInt(capitalcity[0].trim())][Integer.parseInt(capitalcity[capitalcity.length - 1].trim())];
////			}
			return UpdateCity.child[Integer.parseInt(capitalStr)][Integer.parseInt(cityStr)];
		}
		return null;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUpdateCity() {
		return updateCity;
	}
	public void setUpdateCity(String updateCity) {
		this.updateCity = updateCity;
	}
}
