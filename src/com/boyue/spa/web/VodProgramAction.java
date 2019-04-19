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

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.service.AdService;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.karaoke.service.VodVideoService;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
@Controller("VodProgramAction")
@Scope(value = "prototype")
public class VodProgramAction extends BaseAction implements ModelDriven<Vodprogram> {

	@Autowired
	private VodPartService vodPartService;	
	@Autowired
	private VodProgramService vodprogramservice;
	@Autowired
	private VodProgramService vodproProgramService;
	@Autowired
	private AdService adService;
	@Autowired
	private VodVideoService vodVideoService;
	@Autowired
	private VodVideoAction vodVideoAction;
	
	private List<Vodprogram> vodprogramlist;
	private Vodprogram model = new Vodprogram();
	private String voidpath;
	
	private Integer vodpartID;
	private List<String> typeList;
	private List<String> areaList;
	private List<Ad> adList;
	private List<Vodvideo> vList = new ArrayList<Vodvideo>();
	private Vodvideo vodvideo = new Vodvideo();
	private List<String> videoFileList;

	/**文件上传*/
	private File img;
	private String imgFileName;
	private String imgContentType;
	private Integer positionType;
	private List<Integer> idList;
	private Integer programId;
	private Integer vodprogramID;
	
	//
	//文件
	private File xls;
	private String xlsFileName;
	private String xlsContentType;
	private Integer messge;
	
	/**
	 * @Name: updateSave
	 * @Description: 保存更新的节目信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到vodprogramList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String updateSave() throws Exception{
		String imgType = null;
		String imgPath = null;
		String imgName = null;
		String oldImg = null;
		Vodprogram old = vodprogramservice.loadVodProgramByVodprogramID(model.getId());
		if(imgFileName!=null&&!imgFileName.equals("")){
			imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
			imgName = new Date().getTime()+imgType;
			imgPath= Constants.VODPROGRAM_IMG_PATH +imgName;
			FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPath));
			model.setVoidprogramimg(imgPath);
			oldImg = old.getVoidprogramimg();
		}
		
		//保存图片路径至数据库
		//model.setVoidprogramimg(imgPath);
	
		//处理位置
		if (positionType.intValue() == -1) {//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			model.setPosition(null);
		} else if (positionType.intValue() == 0) {
			model.setPosition(0);
		}

		
		//保存VodProgram节目\
		model.setMaxVisitCount(0);
		vodpartID = model.getVodpartid();
		if(model.getId() != null && !model.getId().equals("")){
			if (getLang() == 1) {
				model.setVoidprogramnamee(old.getVoidprogramnamee());
			}else if (getLang() == 2) {
				model.setVoidprogramname(old.getVoidprogramname());
			}
			vodprogramservice.updateVodprogram(model);
			if (oldImg != null) {
				new File(SystemConfig.getProjectBasePath() + oldImg).delete();
			}
			//如果是电影 
			if(model.getTypes().intValue() == 1){
				this.vodVideoAction.passVoidpath1(this.voidpath,model.getId());
				this.vodVideoAction.updateSave();
			}
			//end
		}
		return "prosperity";
	}
	/**
	 * @Name: saveVodProgram
	 * @Description: 保存添加的节目信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到vodprogramList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String saveVodProgram() throws Exception{
		String imgType = null;
		String imgPath = null;
		String imgName = null;
		if(imgFileName!=null&&!imgFileName.equals("")){
			imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
			imgName = new Date().getTime()+imgType;
			imgPath= Constants.VODPROGRAM_IMG_PATH +imgName;		
			FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPath));
		}
		
		//保存图片路径至数据库
		model.setVoidprogramimg(imgPath);
		if (positionType == 0) {//表示默认顺延到最后一个位置
			model.setPosition(null);
		}
		//处理位置
		//保存VodProgram节目\
		model.setMaxVisitCount(0);
		model.setVodpartid(Integer.valueOf(this.getSessionAttr("sessionVodpartId").toString()));
		if (getLang() == 1) {
			model.setVoidprogramnamee(model.getVoidprogramname());
		}else if (getLang() == 2) {
			model.setVoidprogramname(model.getVoidprogramnamee());
		}
		vodprogramservice.saveVodprogram(model);
		//如果是电影，则直接修改
		if(model.getTypes().intValue() == 1){
			this.vodVideoAction.passVoidpath(this.voidpath,model.getId(),model.getVoidprogramname());
			this.vodVideoAction.saveVodvideo();
		}
	
		//end
		vodpartID = model.getVodpartid();
		return "prosperity";
	}
	
	/**
	 * @Name: delVodprogram
	 * @Description: 删除节目信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到vodprogramList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String delVodprogram() throws Exception{
		vodprogramservice.delete(idList);
		return "prosperity";
	}
	
	/**
	 * @Name: viewVodprogram
	 * @Description: 查看Vodprogram对象
	 * @Author:
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到vodprogramList.jsp页面
	 */
	public String viewVodprogram(){

		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getVodpartid()!=null){
			//记住当前的vodpartid
			this.setSessionAttr("sessionVodpartId", model.getVodpartid());
		}
		int vodid = Integer.valueOf(this.getSessionAttr("sessionVodpartId").toString());
		params.add(Restrictions.eq("vodpartid", vodid));
		Vodpart vodpart = this.vodPartService.loadVodPartService(vodid);
		this.setSessionAttr("vodpart", vodpart);
		
		if(model.getVoidprogramname()!=null&&!model.getVoidprogramname().trim().equals("")){
			params.add(Restrictions.like("voidprogramname", model.getVoidprogramname().trim(), MatchMode.ANYWHERE));
		}
		if(model.getVoidprogramdirector()!=null&&!model.getVoidprogramdirector().trim().equals("")){
			params.add(Restrictions.like("voidprogramdirector", model.getVoidprogramdirector().trim(), MatchMode.ANYWHERE));
		}
		if(model.getVoidprogramstarring()!=null&&!model.getVoidprogramstarring().trim().equals("")){
			params.add(Restrictions.like("voidprogramstarring", model.getVoidprogramstarring().trim(), MatchMode.ANYWHERE));
		}
		if(model.getTypes()!=null){
			params.add(Restrictions.eq("types", model.getTypes()));
		}
		
		pageBean = vodprogramservice.loadpage(pageNo, pageSize, Vodprogram.class, params);
//		vList = this.vodVideoService.findByProgramId(model.getVodpartid());
		List<Vodprogram> pList = this.pageBean.getElements();
		for(Vodprogram p : pList){
			vList.add(this.vodVideoService.findByProgramId(p.getId()));
		}
//		vList = this.vodVideoService.findByProgramId();
		this.setSessionAttr("vList", vList);
		//update begin
//		Vodvideo vod = this.vodVideoAction.getvodVideoByvodpath(model.getId());
//		voidpath = vod.getVoidpath();
		//end
		//增加显示点播广告的信息
		List<Vodprogram> vpList = this.pageBean.getElements();
		if(vpList != null && !vpList.isEmpty()){
			for(Vodprogram s : vpList){
				if(s.getAdid() != null){
					Ad a = this.adService.findAdByIntroAdId(s.getAdid());
					s.setAd(a);
				}
			}
		}
		return "vodprogramlist";
	}
	
	/**
	 * @Name: updateVodprogram
	 * @Description: 更新节目信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到editVodprogram.jsp页面
	 */
	public String updateVodprogram() throws Exception{
		initFileList();
		
		String imgType = null;
		String imgPath = null;
		String imgName = null;
		if(imgFileName!=null&&!imgFileName.equals("")){
			imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
			imgName = new Date().getTime()+imgType;
			imgPath= Constants.VODPROGRAM_IMG_PATH +imgName;		
			FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPath));
			model.setVoidprogramimg(imgPath);
		}

		String vodpartID = this.getSessionAttr("sessionVodpartId").toString();
		typeList = this.vodprogramservice.getVodProgramTypes(Integer.valueOf(vodpartID));
		areaList = this.vodprogramservice.getVodProgramAreas(null);
		
		model.setVodpartid(Integer.parseInt(vodpartID));
		vodprogramlist = vodprogramservice.findGramByPart(model.getVodpartid());
		
		Vodpart vodpart = vodPartService.loadVodPartService((Integer)this.getSessionAttr("sessionVodpartId"));
		
		ActionContext.getContext().put("vodpartName", vodpart.getVodpartname());
		model = vodprogramservice.loadVodProgramByVodprogramID(vodprogramID);
		//update begin
		Vodvideo vod = this.vodVideoAction.getvodVideoByvodpath(model.getId());
		if(vod != null){
			voidpath = vod.getVoidpath();
		}
		
		//end
		//增加对点播广告的修改
		this.adList = this.adService.findAdListByIntro(Ad.VOD_AD);
		return "toUpdate";		
	}
	
	/**
	 * @Name: browseAllVodprogramByVodpartID
	 * @Description: 节目列表信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到vodprogramList.jsp页面
	 */
	@SuppressWarnings("unchecked")
	public String browseAllVodprogramByVodpartID(){
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getVodpartid()!=null){
			//记住当前的vodpartid
			this.setSessionAttr("sessionVodpartId", model.getVodpartid());
		}
		
		params.add(Restrictions.eq("vodpartid", this.getSessionAttr("sessionVodpartId")));
		Vodpart vodpart = this.vodPartService.loadVodPartService(Integer.valueOf(this.getSessionAttr("sessionVodpartId").toString()));
		ServletActionContext.getRequest().setAttribute("vodpart", vodpart);
		if(model.getVoidprogramname()!=null&&!model.getVoidprogramname().trim().equals("")){
			params.add(Restrictions.like("voidprogramname", model.getVoidprogramname().trim(), MatchMode.ANYWHERE));
		}
		if(model.getVoidprogramdirector()!=null&&!model.getVoidprogramdirector().trim().equals("")){
			params.add(Restrictions.like("voidprogramdirector", model.getVoidprogramdirector().trim(), MatchMode.ANYWHERE));
		}
		if(model.getVoidprogramstarring()!=null&&!model.getVoidprogramstarring().trim().equals("")){
			params.add(Restrictions.like("voidprogramstarring", model.getVoidprogramstarring().trim(), MatchMode.ANYWHERE));
		}
		
		this.pageBean = vodprogramservice.loadpage(pageNo, pageSize, Vodprogram.class, params);
//		vList = this.vodVideoService.findByProgramId(model.getVodpartid());
//		this.setSessionAttr("vList", vList);
		List<Vodprogram> pList = this.pageBean.getElements();
		for(Vodprogram p : pList){
			vList.add(this.vodVideoService.findByProgramId(p.getId()));
		}
//		vList = this.vodVideoService.findByProgramId();
		this.setSessionAttr("vList", vList);
		//增加显示点播广告的信息
				List<Vodprogram> vpList = this.pageBean.getElements();
				if(vpList != null && !vpList.isEmpty()){
					for(Vodprogram s : vpList){
						if(s.getAdid() != null){
							Ad a = this.adService.findAdByIntroAdId(s.getAdid());
							s.setAd(a);
						}
					}
				}
		
		return "goListVodProgram";
	}
	
	/**
	 * @Name: skip
	 * @Description: 添加节目对象信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳转到addVodvideo.jsp页面
	 */    
	public String skip(){
		initFileList();
		
		HttpServletRequest request = ServletActionContext.getRequest();	
		String vodpartID = this.getSessionAttr("sessionVodpartId").toString();
		typeList = this.vodprogramservice.getVodProgramTypes(Integer.valueOf(vodpartID));
		areaList = this.vodprogramservice.getVodProgramAreas(null);
		model.setVodpartid(Integer.parseInt(vodpartID));
		vodprogramlist = vodprogramservice.findGramByPart(model.getVodpartid());
		Vodpart vodpart = vodPartService.loadVodPartService((Integer)this.getSessionAttr("sessionVodpartId"));
		ActionContext.getContext().put("vodpartName", vodpart.getVodpartname());
		
		//增加点播广告字段
		this.adList = this.adService.findAdListByVodProgram(Ad.VOD_AD);
		return "skip";
	}
	
	private void initFileList() {
		this.videoFileList = new ArrayList<String>();
		String vodDataPath = SystemConfig.getVodDataPath();
		Collection<File> listFiles = FileUtils.listFiles(new File(vodDataPath), null, true);
		for (File f : listFiles) {
			videoFileList.add(f.getPath().replace("\\", "/").replace(vodDataPath, ""));
		}
	}
	
	/**
	 * 影片信息批量导入
	 * @return
	 */
	public String macRead() {
		messge = 1;
		int vodid = Integer.valueOf(this.getSessionAttr("sessionVodpartId").toString());
		if(xlsFileName!=null&&!xlsFileName.equals("")){
			List<Vodprogram> list = new ArrayList<Vodprogram>();
			
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
					Vodprogram p = null;
					Vodvideo  v = null;
					for(int i=1;i<rows;i++){
						//获得行信息
						HSSFRow row = sheet.getRow(i);
						if(row!=null){
							p = new Vodprogram();
//							p.setTypes(1);
							v = new Vodvideo ();
							//行的所有列信息
							int cols = row.getPhysicalNumberOfCells();
							//遍历列信息
							for(int k=0;k<=cols;k++){ //此时K值对应列名
								HSSFCell col = row.getCell((short) k);
								if(k==0){
//								    System.out.println("k==0 "+result(col));
									p.setTypes(Integer.valueOf(result(col)));
								}
								if(k==1){
//									System.out.println("k==0 "+result(col));
									p.setVoidprogramname(result(col));
									p.setVoidprogramnamee(result(col));
								}
								if(k==2){
//									System.out.println("k==1 "+result(col));
									p.setVoidprogramimg(result(col));
								}
								if(k==3){
//									System.out.println("k==2 "+result(col));
									v.setVoidpath(result(col));
									v.setCreatetime(new Date());
									v.setVoidstatus(1);
									v.setIfenable(1);
									v.setVoidname("");
									v.setVoidnamee("");
									v.setCreateadmin("");
									p.setV(v);
								}
								if(k==4){
//									System.out.println("k==3 "+result(col));
									p.setPosition(Integer.valueOf(result(col)));
								}
								if(k==5){
//									System.out.println("k==4 "+result(col));
									p.setFilmtype(result(col));
								}
								if(k==6){
//									System.out.println("k==5 "+result(col));
									p.setYear(result(col));
								}
								if(k==7){
//									System.out.println("k==6 "+result(col));
									p.setArea(result(col));
								}
								if(k==8){
//									System.out.println("k==7 "+result(col));
									p.setVoidprogramdirector(result(col));
								}
								if(k==9){
//									System.out.println("k==8 "+result(col));
									p.setVoidprogramstarring(result(col));
								}
								if(k==10){
//									System.out.println("k==9 "+result(col));
									p.setVoidprogramdescription(result(col));
								}
							}
					
							p.setVodpartid(vodid);
							p.setMaxVisitCount(0);
							list.add(p);
							
						}
						
						
					}
					
					//注意重复导入
					if(list!= null && list.size() > 0){
						Boolean status = vodprogramservice.savevods(list);
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
	
	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public String getImgContentType() {
		return imgContentType;
	}

	public void setImgContentType(String imgContentType) {
		this.imgContentType = imgContentType;
	}

	public VodPartService getVodPartService() {
		return vodPartService;
	}

	public void setVodPartService(VodPartService vodPartService) {
		this.vodPartService = vodPartService;
	}
	public List<Vodprogram> getVodprogramlist() {
		return vodprogramlist;
	}
	public void setVodprogramlist(List<Vodprogram> vodprogramlist) {
		this.vodprogramlist = vodprogramlist;
	}

	public VodProgramService getVodprogramservice() {
		return vodprogramservice;
	}

	public void setVodprogramservice(VodProgramService vodprogramservice) {
		this.vodprogramservice = vodprogramservice;
	}

	public Vodprogram getModel() {
		return model;
	}

	public void setModel(Vodprogram model) {
		this.model = model;
	}
	
	public Integer getVodpartID() {
		return vodpartID;
	}

	public void setVodpartID(Integer vodpartID) {
		this.vodpartID = vodpartID;
	}

	public Integer getPositionType() {
		return positionType;
	}

	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}

	public List<String> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}

	public List<String> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<String> areaList) {
		this.areaList = areaList;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	
	public Integer getProgramId() {
		return programId;
	}

	public void setProgramId(Integer programId) {
		this.programId = programId;
	}
	public Integer getVodprogramID() {
		return vodprogramID;
	}

	public void setVodprogramID(Integer vodprogramID) {
		this.vodprogramID = vodprogramID;
	}
	public List<Ad> getAdList() {
		return adList;
	}
	public void setAdList(List<Ad> adList) {
		this.adList = adList;
	}
	public List<Vodvideo> getvList() {
		return vList;
	}
	public void setvList(List<Vodvideo> vList) {
		this.vList = vList;
	}
	public List<String> getVideoFileList() {
		return videoFileList;
	}
	public void setVideoFileList(List<String> videoFileList) {
		this.videoFileList = videoFileList;
	}
	public String getVoidpath() {
		return voidpath;
	}
	public void setVoidpath(String voidpath) {
		this.voidpath = voidpath;
	}
	public Vodvideo getVodvideo() {
		return vodvideo;
	}
	public void setVodvideo(Vodvideo vodvideo) {
		this.vodvideo = vodvideo;
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
