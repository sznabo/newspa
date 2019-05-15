package com.boyue.spa.web;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.karaoke.service.VodVideoService;
import com.boyue.spa.domain.VodQueryDTO;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;
import com.opensymphony.xwork2.ModelDriven;

@Controller("VodVideoAction")
@Scope(value = "prototype")
public class VodVideoAction extends BaseAction implements ModelDriven<Vodvideo>{
	
	private Vodvideo model = new Vodvideo();
	private VodQueryDTO query = new VodQueryDTO(); 
	@Autowired
	private VodVideoService vodvideoservice;
	@Autowired
	VodProgramService vodprogramseivice;
	@Autowired
	VodPartService vodPartService;
	List<Vodvideo> vodvideoList;
	List<Service> servicerList;
	List<Service> servicerListChecked;
	private Integer positionType;
	private String[] videoID;
	private String voidname;
	private Integer vodprogramid;
	private List<String> videoFileList;
	
	//文件
	private File xls;
	private String xlsFileName;
	private String xlsContentType;
	private Integer messge;
	/**
	 * @Name: browseVodvideoByVodprogramID
	 * @Description: 浏览节目的详细续集List页面
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodvideoList.jsp页面
	 */
	public String browseVodvideoByVodprogramID(){
		if(model.getVodprogramid() != null){
			this.setSessionAttr("curProgramId", model.getVodprogramid());
			Vodprogram vodprogram = vodprogramseivice.loadVodProgramByVodprogramID(model.getVodprogramid());
			int vodid = Integer.valueOf(this.getSessionAttr("sessionVodpartId").toString());
			Vodpart vodpart = vodPartService.findVodPartByID(vodid);
			this.setSessionAttr("vodprogram", vodprogram);
			this.setSessionAttr("vodpart", vodpart);
		} 
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getVodprogramid()!=null){
		//	System.out.println(model.getVodprogramid());
			params.add(Restrictions.eq("vodprogramid",  this.getSessionAttr("curProgramId")));
		}
		if(model.getVoidname()!=null&&!model.getVoidname().trim().equals("")){
			params.add(Restrictions.like("voidname", model.getVoidname().trim(), MatchMode.ANYWHERE));
		}
		if(model.getVoidstatus()!=null&&model.getVoidstatus()!=-1){
			params.add(Restrictions.eq("voidstatus", model.getVoidstatus()));
		}
		if(model.getIfenable()!=null&&model.getIfenable()!=-1){
			params.add(Restrictions.eq("ifenable", model.getIfenable()));
		}
		if(model.getCreateadmin()!=null&&!model.getCreateadmin().trim().equals("")){
			params.add(Restrictions.eq("createadmin", model.getCreateadmin().trim()));
		}
		if(query.getUpstarttime()!=null){
			params.add(Restrictions.ge("createtime", query.getUpstarttime()));
		}
		if(query.getUpendtime()!=null){
			params.add(Restrictions.le("createtime", query.getUpendtime()));
		}
		if(query.getRelstarttime()!=null){
			params.add(Restrictions.ge("releasetime", query.getRelstarttime()));
		}
		if(query.getRelendtime()!=null){
			params.add(Restrictions.le("releasetime", query.getRelendtime()));
		}
		if(this.getSessionAttr("curProgramId") != null){
			params.add(Restrictions.eq("vodprogramid", this.getSessionAttr("curProgramId")));
		}
		
		this.pageBean = vodvideoservice.loadPage(pageNo, pageSize, Vodvideo.class, params);
		return "vodvideolist";
//		return "list";
	}
	/**
	 * @Name: skip
	 * @Description: 增加节目续集
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addvodprogram.jsp页面
	 */
	public String skip(){
		
		initFileList();
//		String vodgramID = this.getRequestParameter("vodprogramid");
		String vodgramID = this.getSessionAttr("curProgramId").toString();
		model.setVodprogramid(Integer.valueOf(vodgramID));
		
		if(vodgramID!=null){
			//记住当前的vodpartid
			this.setSessionAttr("sessionprogram", vodgramID);
			Vodprogram program = vodprogramseivice.loadVodProgramByVodprogramID(Integer.valueOf(vodgramID));
			this.setSessionAttr("program", program);
		} else {
			vodgramID = this.getSessionAttr("sessionprogram").toString();
			model.setVodprogramid(Integer.valueOf(vodgramID));
		}
		vodvideoList = vodvideoservice.findVodvideoByGram(model.getVodprogramid());
		vodprogramid = model.getVodprogramid();
		return "add";
	}
	/**
	 * @Name: saveVodvideo
	 * @Description: 保存Vodvideo对象剧集信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodvideoList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String saveVodvideo() throws Exception{
		model.setVoidstatus(0);
		model.setIfenable(1); //上传即启用(则filmid必须经过请求)
		model.setVoidstatus(model.ENABLE);
		model.setCreatetime(new Date());
		model.setCreateadmin("");
		model.setPosition(null);
		if (getLang() == 1) {
			model.setVoidnamee(model.getVoidname());
		}else if (getLang() == 2) {
			model.setVoidname(model.getVoidnamee());
		}
		vodvideoservice.saveVodvideo(model);
	 	model.setVoidname(null);
	 	model.setVoidgrade(null);
	 	model.setVoidpath(null);
	 	model.setVoidstatus(null);
	 	vodprogramid = model.getVodprogramid();
		return "list";
	}
	/**
	 * @Name: updateSave
	 * @Description: 保存更新Vodvideo对象剧集信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodvideoList.jsp页面
	 */
	public String updateSave(){
		model.setVoidstatus(0);
		model.setIfenable(1); //上传即启用(则filmid必须经过请求)
		model.setVoidstatus(model.ENABLE);
		model.setCreatetime(new Date());
		model.setCreateadmin("");
		model.setPosition(null);
		Vodvideo vod = this.vodvideoservice.findById(model.getId());
//		model.setId(vod.getId());
		if (getLang() == 1) {
			model.setVoidnamee(vod.getVoidnamee());
		}else if (getLang() == 2) {
			model.setVoidname(vod.getVoidname());
		}
		if(model.getId() != null && !model.getId().equals("")){
			vodvideoservice.updateVodvideo(model);
		}
	 	model.setVoidname(null);
	 	model.setVoidgrade(null);
	 	model.setVoidpath(null);
	 	model.setVoidstatus(null);
	 	vodprogramid = model.getVodprogramid();
		return "list";
	}
	/**
	 * @Name: viewVodvideo
	 * @Description: 更新Vodvideo对象剧集信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-19（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editVodvideo.jsp页面
	 */
	public String viewVodvideo(){ 
		initFileList();
		//String vodgramID = this.getRequestParameter("vodprogramid");curProgramId
		String vodgramID = this.getSessionAttr("curProgramId").toString();
		model.setVodprogramid(Integer.valueOf(vodgramID));
		
		if(vodgramID!=null && !vodgramID.equals("")){
			//记住当前的vodpartid
			this.setSessionAttr("sessionprogram", vodgramID);
			Vodprogram program = vodprogramseivice.loadVodProgramByVodprogramID(Integer.valueOf(vodgramID));
			this.setSessionAttr("program", program);
		} else {
			vodgramID = this.getSessionAttr("sessionprogram").toString();
		}
		vodvideoList = vodvideoservice.findVodvideoByGram(model.getVodprogramid());
		
		HttpServletRequest request = ServletActionContext.getRequest();
		model = vodvideoservice.loadVodvideoByID(model.getId());
		vodprogramid = model.getVodprogramid();
		return "modifyVido";
	}
	
	/**更新Vodvideo对象
	 * @throws Exception */
	public String updateVodvideo() throws Exception{
		Vodvideo vv = vodvideoservice.findById(model.getId());
		model.setCreatetime(new Date());
		//处理位置
		if (positionType.intValue() == -1) {//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			model.setPosition(null);
		} else if (positionType.intValue() == 0) {
			model.setPosition(0);
		}
		
		vv.setVoidname(model.getVoidname());
		vv.setVoidpath(model.getVoidpath());
		vv.setPosition(model.getPosition());
		vodvideoservice.updateVodvideo(vv);
		//未发布，启用→未发布，停用
		//正常跳转
		model.setCreateadmin(null);
		model.setCreatetime(null);
		model.setFilmid(null);
		model.setIfenable(null);
		model.setPosition(null);
		model.setReleasetime(null);
		model.setReleasetype(null);
		model.setVoidformat(null);
		model.setVoidgrade(null);
		model.setVoidname(null);
		model.setVoidstatus(null);
		
		if(model.getId() != null && !model.getId().equals("")){
			vodvideoservice.updateVodvideo(model);
		}
		return browseVodvideoByVodprogramID();
	}
	/**
	 * @Name: delVodvideo
	 * @Description: 删除单个和批量删除Vodvideo对象剧集信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodvideoList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String delVodvideo() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer vodprogramid = model.getVodprogramid();
		String[] ids = videoID;
		String[] vdoId = ids[0].split(",");
		Vodvideo vod = null;
		List<Vodvideo> list = null;
		for(int i=0;i<vdoId.length;i++){
			vodvideoservice.delVodvideoByID(Integer.parseInt(vdoId[i]));
		}
		
		return browseVodvideoByVodprogramID();
	}
	
	/**
	 * 影片信息批量导入
	 * @return
	 */
	public String macRead() {
		messge = 1;
		int programId = Integer.valueOf(this.getSessionAttr("curProgramId").toString());
		if(xlsFileName!=null&&!xlsFileName.equals("")){
			List<Vodvideo> list = new ArrayList<Vodvideo>();
			try {
				FileInputStream fin = new FileInputStream(xls);
				try {
					HSSFWorkbook workbook = new HSSFWorkbook(fin);
					//获得表一
					//HSSFSheet sheet = workbook.getSheet("sheet1"); //注意表的名字
					HSSFSheet sheet = workbook.getSheetAt(0);
					//获得表一所有行
					int rows = sheet.getPhysicalNumberOfRows();
					//遍历行信息
					Vodvideo  v = null;
					for(int i=1;i<rows;i++){
						//获得行信息
						HSSFRow row = sheet.getRow(i);
						if(row!=null){
							v = new Vodvideo ();
							//行的所有列信息
							int cols = row.getPhysicalNumberOfCells();
							//遍历列信息
							for(int k=0;k<=cols;k++){ //此时K值对应列名
								HSSFCell col = row.getCell((short) k);
								if(k==0){
//								    System.out.println("k==0 "+result(col));
									v.setVoidname(result(col));
									v.setVoidnamee(result(col));
								}
								if(k==1){
//									System.out.println("k==0 "+result(col));
									v.setVoidpath(result(col));
								}
								if(k==2){
//									System.out.println("k==1 "+result(col));
									v.setPosition(Integer.valueOf(result(col)));
								}
                                v.setVodprogramid(programId);
								v.setCreatetime(new Date());
								v.setVoidstatus(1);
								v.setIfenable(1);
								v.setCreateadmin("");
								
								
							}
							
							list.add(v);
							
						}
						
						
					}
					
					//注意重复导入
					if(list!= null && list.size() > 0){
						Boolean status = vodvideoservice.savevods(list);
						if(status == false){
							messge = 2;
						}
						
					}
				} catch (IOException e) {
					messge = 2;//导入异常
					e.printStackTrace();
				}
			} catch (FileNotFoundException e) {
				messge = 2;
				e.printStackTrace();
			}			
		}
		return "relist";
		
	}
	
	
	//获得xls结果
	public String result(HSSFCell cell){
		String result = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			result =Integer.toString((int)(cell.getNumericCellValue()));;
			break;
		case HSSFCell.CELL_TYPE_STRING:
			result = cell.getStringCellValue();
			break;
		}		
		return result;
	}
	
	
	public List<Service> getServicerList() {
		return servicerList;
	}

	public void setServicerList(List<Service> servicerList) {
		this.servicerList = servicerList;
	}

	public VodProgramService getVodprogramseivice() {
		return vodprogramseivice;
	}

	public void setVodprogramseivice(VodProgramService vodprogramseivice) {
		this.vodprogramseivice = vodprogramseivice;
	}

	public List<Vodvideo> getVodvideoList() {
		return vodvideoList;
	}
	
	public void setVodvideoList(List<Vodvideo> vodvideoList) {
		this.vodvideoList = vodvideoList;
	}

	public VodVideoService getVodvideoservice() {
		return vodvideoservice;
	}

	public void setVodvideoservice(VodVideoService vodvideoservice) {
		this.vodvideoservice = vodvideoservice;
	}

	public Vodvideo getModel() {
		return model;
	}

	public void setModel(Vodvideo model) {
		this.model = model;
	}

	public List<Service> getServicerListChecked() {
		return servicerListChecked;
	}

	public void setServicerListChecked(List<Service> servicerListChecked) {
		this.servicerListChecked = servicerListChecked;
	}

	public VodPartService getVodPartService() {
		return vodPartService;
	}

	public void setVodPartService(VodPartService vodPartService) {
		this.vodPartService = vodPartService;
	}

	public VodQueryDTO getQuery() {
		return query;
	}

	public void setQuery(VodQueryDTO query) {
		this.query = query;
	}

	public Integer getPositionType() {
		return positionType;
	}

	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}
	public String getVoidname() {
		return voidname;
	}

	public void setVoidname(String voidname) {
		this.voidname = voidname;
	}
	public String[] getVideoID() {
		return videoID;
	}

	public void setVideoID(String[] videoID) {
		this.videoID = videoID;
	}
	public Integer getVodprogramid() {
		return vodprogramid;
	}
	public void setVodprogramid(Integer vodprogramid) {
		this.vodprogramid = vodprogramid;
	}
	
	private void initFileList() {
		this.videoFileList = new ArrayList<String>();
		String vodDataPath = SystemConfig.getVodDataPath();
		Collection<File> listFiles = FileUtils.listFiles(new File(vodDataPath), null, true);
		for (File f : listFiles) {
			videoFileList.add(f.getPath().replace("\\", "/").replace(vodDataPath, ""));
		}
	}
	
	public List<String> getVideoFileList() {
		return videoFileList;
	}
	public void setVideoFileList(List<String> videoFileList) {
		this.videoFileList = videoFileList;
	}
	
	public void passVoidpath(String voidpath, Integer id,String name) {
		model.setVoidname(name);
		model.setVoidnamee(name);
		model.setVoidpath(voidpath);
		model.setVodprogramid(id);
		model.setVoidname("");
	}
	public void passVoidpath1(String voidpath, Integer id) {
		model = getvodVideoByvodpath(id);
		model.setVoidpath(voidpath);
		model.setVodprogramid(id);
		model.setVoidname("");
	}
	public Vodvideo getvodVideoByvodpath(Integer id) {
		// TODO Auto-generated method stub
		return this.vodvideoservice.findByProgramId(id);
	}
	public File getXls() {
		return xls;
	}
	public void setXls(File xls) {
		this.xls = xls;
	}
	public String getXlsFileName() {
		return xlsFileName;
	}
	public void setXlsFileName(String xlsFileName) {
		this.xlsFileName = xlsFileName;
	}
	public String getXlsContentType() {
		return xlsContentType;
	}
	public void setXlsContentType(String xlsContentType) {
		this.xlsContentType = xlsContentType;
	}
	public Integer getMessge() {
		return messge;
	}
	public void setMessge(Integer messge) {
		this.messge = messge;
	}
	
	
	
	
}
