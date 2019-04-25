package com.boyue.karaoke.web.mobileaction;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.common.Page;
import com.boyue.framework.common.PageBean;
import com.boyue.framework.web.Response;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.common.DateResult;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.BigCatDAO;
import com.boyue.karaoke.dao.PlayDAO;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.AdDetail;
import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.AppInfo;
import com.boyue.karaoke.model.Command;
import com.boyue.karaoke.model.Customercase;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.Discount;
import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.model.Functions;
import com.boyue.karaoke.model.GuestBook;
import com.boyue.karaoke.model.HotelRegister;
import com.boyue.karaoke.model.LiveApk;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.model.LiveManagement;
import com.boyue.karaoke.model.MainAd;
import com.boyue.karaoke.model.Message;
import com.boyue.karaoke.model.Play;
import com.boyue.karaoke.model.ServerMsg;
import com.boyue.karaoke.model.ServerMsgDetail;
import com.boyue.karaoke.model.ShopIntroduce;
import com.boyue.karaoke.model.SingelLive;
import com.boyue.karaoke.model.Soft;
import com.boyue.karaoke.model.SoftUpdateTask;
import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.model.SongCategory;
import com.boyue.karaoke.model.SongCategoryDetail;
import com.boyue.karaoke.model.Technician;
import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.model.TemlCfg;
import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.model.WakeupCall;
import com.boyue.karaoke.service.AdDetailService;
import com.boyue.karaoke.service.AdService;
import com.boyue.karaoke.service.AppCategoryService;
import com.boyue.karaoke.service.AppInfoService;
import com.boyue.karaoke.service.BigCatService;
import com.boyue.karaoke.service.CustomercaseService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.DiscountService;
import com.boyue.karaoke.service.DishService;
import com.boyue.karaoke.service.DishStyleService;
import com.boyue.karaoke.service.FunctionsService;
import com.boyue.karaoke.service.HotelService;
import com.boyue.karaoke.service.ICallingService;
import com.boyue.karaoke.service.IGuestBookService;
import com.boyue.karaoke.service.ILiveManagementService;
import com.boyue.karaoke.service.IServerMsgDetailService;
import com.boyue.karaoke.service.IServerMsgService;
import com.boyue.karaoke.service.IShopIntroduceService;
import com.boyue.karaoke.service.LiveApkService;
import com.boyue.karaoke.service.LiveCategoryService;
import com.boyue.karaoke.service.MainAdService;
import com.boyue.karaoke.service.MessageService;
import com.boyue.karaoke.service.PlayService;
import com.boyue.karaoke.service.SingelLiveService;
import com.boyue.karaoke.service.SoftUpdateTaskService;
import com.boyue.karaoke.service.SongCategoryDetailService;
import com.boyue.karaoke.service.SongCategoryService;
import com.boyue.karaoke.service.SongService;
import com.boyue.karaoke.service.SongStatService;
import com.boyue.karaoke.service.TechnicianService;
import com.boyue.karaoke.service.TechnicianTypeService;
import com.boyue.karaoke.service.TemlCfgService;
import com.boyue.karaoke.service.TerminalMenuService;
import com.boyue.karaoke.service.TerminalSubMenuService;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.karaoke.service.VodVideoService;
import com.boyue.karaoke.service.WakeupCallService;
import com.boyue.karaoke.util.DateTool;
import com.boyue.karaoke.util.Datefomter;
import com.boyue.karaoke.util.HardInfoUtil;
import com.boyue.karaoke.util.LicenceInfo;
import com.boyue.karaoke.vo.DateMessageVo;
import com.boyue.karaoke.vo.LiveVo;
import com.boyue.karaoke.vo.VodprogramVo;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.boyue.karaoke.web.devicestate.OnlineUserList;
import com.boyue.karaoke.web.webaction.UpdateCityAction;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;


@Controller("DeviceRemoteAction")
@Scope(value = "prototype")
public class DeviceRemoteAction extends DefaultBaseAction {
	
	private static final Logger LOG = LogManager.getLogger(DeviceRemoteAction.class);
	
	@Autowired
	private BigCatService bigCatService;
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private SoftUpdateTaskService softUpdateTaskService;
	@Autowired
	private SongService songService;
	@Autowired
	private SongCategoryService songCategoryService;
	@Autowired
	private SongCategoryDetailService songCategoryDetailService;
	@Autowired
	private AppInfoService appInfoService;
	@Autowired
	private AdService adService;
	@Autowired
	private AdDetailService adDetailService;
	@Autowired
	private SongStatService songStatService;
	@Autowired
	private VodProgramService programService;
	@Autowired
	private VodPartService vodPartService;
	@Autowired
	private VodVideoService vodVideoService;
	@Autowired
	private IShopIntroduceService shopIntroduceService;
	@Autowired
	private ILiveManagementService liveManagementService;
	@Autowired
	private SingelLiveService singelLiveService;
	@Autowired
	private IGuestBookService guestBookService;
	@Autowired
	private IServerMsgDetailService serverMsgDetailService;
	@Autowired
	private IServerMsgService serverMsgService;
	@Autowired
	private ICallingService callingService;
	@Autowired
	private UpdateCityAction updateCityAction;
	@Autowired
	private WakeupCallService wakeupCallService;
	@Autowired
	private TechnicianTypeService technicianTypeService;
	@Autowired
	private TechnicianService technicianService;
	@Autowired
	private DishService dishService;
	@Autowired
	private DishStyleService dishStyleService;
	
	@Autowired
	private AppCategoryService appCategoryService;
	
	@Autowired
	private LiveCategoryService liveCategoryService;
	
	@Autowired
	private FunctionsService functionsService;
	
	@Autowired
	private TerminalMenuService terminalMenuService;
	
	@Autowired
	private TerminalSubMenuService terminalSubMenuService;
	
	@Autowired
	private TemlCfgService temlCfgService;
	
	@Autowired
	private LiveApkService liveApkService;
	
	@Autowired
	private MainAdService mainAdService;
	
	@Autowired
	private DiscountService discountService;
	
	@Autowired
	private CustomercaseService customercaseService;
	
	@Autowired
	private HotelService hotelService; 
	
	@Autowired
	private PlayService playService;
	
	private String mac;
	private Device device;
	private Command command;
	private GuestBook guestBook = new GuestBook();
	private String songName;
	
	//软件版本
	private String softVersion;
	private Integer songId;
	private String wakeUpTime;
	private Integer typeId;  //技师类型id
	private Integer styleId;//菜品分类id
	private String vodName;
	private Integer vodPartId;
	
	private Integer categoryId; 
	private Integer sortType;
	String basePath = this.getProjectWebPath();
	
	
	
	
	private String username;
	private ServerMsg serverMsg;
	private Integer vodPid;
	private Integer ParentId;
	

	
	

	/**
	 * 获取设备信息
	 * @return
	 */
	public String getDeviceInfo() {
		if(checkShouquan()){
//		LOG.info("getDeviceInfo---------------:" + mac);
		device = deviceService.findByMac(mac);
		if (device == null) {
			ajaxResponse.setMsgCode(Response.FAIL);
		} else {
			device.setCurDate(new Date());
		}
		HotelRegister hr=hotelService.findById(1);  //获取当前酒店信息
		device.setHotelname(hr.getHotelname());
		device.setHotelid(hr.getHotelid());
		device.setChannel("nabo");
		this.ajaxResponse.setMsgBody(device);
		}
		
		return JSON_RESULT;
	}
	
	/**
	 * 获取播放引擎
	 */
	public String getPlayType() {
		List<Play> p = playService.findAll();
		String num = null;
		for (Play play : p) {
			if(play.getStatu_play() == 1) {
				num = String.valueOf(play.getId());
			}
		}
		this.ajaxResponse.setMsgBody(num);
		return JSON_RESULT;
	}
	
	/**
	 * 心跳
	 * @return
	 */
	public String heartbeat() {
//		LOG.info("心跳------------- " + mac);
		deviceHearbeat(mac);
		return JSON_RESULT;
	}

	/**
	 * 上线
	 * @return
	 */
	public String online() {
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		//上线前删除上一用户留言信息
		device = deviceService.findByMac(mac);
		List<ServerMsgDetail> smdList = new ArrayList<ServerMsgDetail>();
		if (device != null) {
			smdList = serverMsgDetailService.findServerMsgDetailByUserid(device.getId());
		}
		serverMsgDetailService.delServerMsgDetailList(smdList);
		serverMsgService.delServerMsgByNoneDetail();
		
		LOG.info("online........:" + mac);
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		device = deviceService.findByMac(mac);
		if (device == null) {
			return JSON_RESULT;
		}
		deviceHearbeat(mac);
		this.ajaxResponse.setMsgBody(device);
		
		device.setConnectTime(new Date());
		device.setIpaddr(ip);
		device.setRunStatus(Device.ONLINE);
		deviceService.update(device);
		
		return JSON_RESULT;
	}
	
	private void deviceHearbeat(String mac) {
//		LOG.info("deviceHearbeat........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return;
		}
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		boolean online = OnlineUserList.isonline(mac);
		OnlineUserList.updateUser(mac, ip);
		//如果之前不在线，第一次开始心跳连接，则更新设备的状态
		if (!online) {
			Device d = deviceService.findByMac(mac);
			d.setRunStatus(Device.ONLINE);
			deviceService.update(d);
		}
	}
	
	/**
	 * 检测软件更新
	 * 如果有更新，把链接传过去，如果没有就是空
	 * @return
	 */
	public String checkSoftUpdate() {
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
//		LOG.info("checkSoftUpdate........:" + mac);
		Device d = deviceService.findByMac(mac);
		SoftUpdateTask task = this.softUpdateTaskService.findByDevice(d.getId(), softVersion);
//		System.out.print("softVersion号版本号版本号版本号版本号版本号版本号版本号= " + softVersion + "MACMACMACMACMACMACMAMC = " + mac);
		if (task != null && task.getStatus() == 1 && Double.valueOf(task.getTargetVersion()) > Double.valueOf(softVersion)) {
			Soft soft = task.getSoft();
			soft.setFilePath(this.getProjectWebPath() + soft.getFilePath());
			task.setSoftUpdateDevices(null);
			this.ajaxResponse.setMsgBody(task);
		}
		return JSON_RESULT;
	}
	
	/**
	 * 获取字幕消息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getDeviceMessage() {
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
//		LOG.info("getDeviceMessage........:" + mac);
		Device d = deviceService.findByMac(mac);
		List<Message> list = messageService.findDeviceMessage(d.getId());
		List<Message> msgs = new ArrayList<Message>();
		Date date = new Date();
		//过滤时间
//		for (Message m : list) {
//			if (m.getType() == 2 
//				&& (date.getTime() >= m.getStartTime().getTime()) 
//				&& (date.getTime() <= m.getEndTime().getTime())
//				&& (m.getStatus() == Message.ENABLE)) {
////				Ad ad = this.adService.findToTime(m);
//				msgs.add(m);
//			}
//			if(m.getType() == 1 && m.getStatus() == Message.ENABLE){
//				msgs.add(m);
//			}
//		}
		for(Message m : list){
			
			if(m.getType() == 2 && m.getStatus() == Message.ENABLE ){
				
				Calendar cal_now=Calendar.getInstance();//使用日历类
				StringBuffer sbBuffer = new StringBuffer();
				sbBuffer.append(cal_now.get(Calendar.YEAR)).append(":").append(cal_now.get(Calendar.MONTH)+1).append(":").append(cal_now.get(Calendar.DAY_OF_MONTH));
				SimpleDateFormat df = new SimpleDateFormat("yyyy:MM:dd");
				try {
					Date dates = df.parse(sbBuffer.toString());
					if((dates.getTime() >= m.getStartDate().getTime())&& (dates.getTime() <= m.getEndDate().getTime())){

					    int hour=cal_now.get(Calendar.HOUR_OF_DAY);//得到小时
					    int minute=cal_now.get(Calendar.MINUTE);//得到分钟
					    int second=cal_now.get(Calendar.SECOND);//得到秒
					    StringBuffer buf = new StringBuffer();
					    String curTime = buf.append(hour).append(":").append(minute).append(":").append(second).toString();
					    //把开始字符串时间和结束字符串时间转化成时间格式
						String startTime = m.getStartTime();
						String endTime =  m.getEndTime();
						DateFormat d_startTime = new SimpleDateFormat("HH:mm:ss");
						DateFormat d_endTime = new SimpleDateFormat("HH:mm:ss");
						DateFormat d_curTime = new SimpleDateFormat("HH:mm:ss");
						Date date_startTime=null;
						Date date_endTime=null;
						Date date_curTime=null;
						try {
							date_startTime = d_startTime.parse(startTime + ":00");  //开始时间
							date_endTime = d_endTime.parse(endTime + ":00");  //结束时间
							date_curTime = d_curTime.parse(curTime); //当前时间
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						if(date_startTime.getTime() <= date_curTime.getTime() 
								&& date_curTime.getTime() <= date_endTime.getTime()){
							msgs.add(m);
						}
					}
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			}
			if(m.getType() == 1 && m.getStatus() == Message.ENABLE){
				msgs.add(m);
			}
		}
		this.ajaxResponse.setMsgBody(msgs);
		return JSON_RESULT;
	}
	
	/**
	 * 获取所有歌曲
	 * @return
	 */
	public String getAllSongs() {
//		LOG.info("getAllSongs........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<Song> all = songService.findAll();
		processSongUrl(all);
		this.ajaxResponse.setMsgBody(all);
		return JSON_RESULT;
	}
	
	/**
	 * 获取歌曲类型列表(含歌曲)
	 * @return
	 */
	public String getCategorySongs() {
//		LOG.info("getCategorySongs........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<SongCategory> allCategories = this.songCategoryService.findAll();
		String basePath = getProjectWebPath();
		for (SongCategory c : allCategories) {
			c.setIcon(basePath + c.getIcon());
			
			List<SongCategoryDetail> details = songCategoryDetailService.findByCategory(c.getId());
			List<Song> scSongs = new ArrayList<Song>();
			for (SongCategoryDetail d : details) {
				scSongs.add(d.getSong());
			}
			processSongUrl(scSongs);
			c.setSongs(scSongs);
		}
		this.ajaxResponse.setMsgBody(allCategories);
		return JSON_RESULT;
	}
	/**
	 * 必填  categoryId 
		选填
 		pageNo 默认1
 		pageSize defalut 10
 		sortType 1 热度 2 最新
	 * 
	 * 
	 * @return
	 */
	//TODO  歌曲 根据分类来查找歌曲信息
	public String getSongsBycategory(){
		if ((!checkMac()) || (!checkShouquan().booleanValue())) {
			       return "global_ajax_response";
			     }
			     Song song = new Song();
			     List<Song> scSongs = new ArrayList<Song>();
			     List<SongCategoryDetail> findByCategory = songCategoryDetailService.findByCategory(categoryId);
			     
			     PageBean<Song> SongBean = null;
			     for (SongCategoryDetail songCategoryDetail : findByCategory) {
					 song = songCategoryDetail.getSong();
					 scSongs.add(song);
				}
			     if (this.sortType.intValue() == 1) {
			    	 SongBean = new PageBean<Song>(pageNo,scSongs.size(),pageSize,scSongs);
			     } else if (this.sortType.intValue() == 2) {
			    	 SongBean = new PageBean<Song>(pageNo,scSongs.size(),pageSize,scSongs);
			     }
			     processSongUrl(SongBean.getElements());
			    this.ajaxResponse.setMsgBody(SongBean);
			    return "global_ajax_response";
	}
	
	/**
	 * 获取应用新型
	 * @return
	 */
	public String getAppInfos() {
//		LOG.info("getAppInfos........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
//		String basePath = this.getProjectWebPath();
		List<AppInfo> list = appInfoService.findAll();
		for (AppInfo a : list) {
			a.setPath(basePath + a.getPath());
			a.setIcon(basePath + a.getIcon());
		}
		this.ajaxResponse.setMsgBody(list);
		return JSON_RESULT;
	}
	/**
	 * 获取应用及其子类
	 * @return
	 */
	public String getAppCategory(){
//		LOG.info("getAppCategory........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<AppCategory> categories = appCategoryService.findall();
		this.ajaxResponse.setMsgBody(categories);
		return JSON_RESULT;
	}
	
	/**
	 * 获取所有的广告
	 * @return
	 */
	public String getAllAd() {
//		LOG.info("getAllAd........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		String basePath = this.getProjectWebPath();
		List<Ad> allAd = adService.findAll();
		//把相对路径变成绝对路径
		for (Ad ad : allAd) {
			if (ad.getCategory() == Ad.AD) {
				List<AdDetail> details = adDetailService.findByAd(ad.getId());
				for (AdDetail d : details) {
					d.setPath(basePath + d.getPath());
				}
				ad.setDetails(details);
			}
		}
		this.ajaxResponse.setMsgBody(allAd);
		return JSON_RESULT;
	}
	
	/**
	 * 播放歌曲
	 * @return
	 */
	public String playSong() {
//		LOG.info("playSong........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		songStatService.save(songId, mac);
		return JSON_RESULT;
	}
	
	//获取所有点播分类
	public String getAllVideos() {
//		LOG.info("getAllVideos........:" + mac);
		if(!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		String projectWebPath = this.getProjectWebPath();
		List<Vodpart> parts = vodPartService.findAll();
		for (Vodpart p : parts) {
			p.setImg(projectWebPath+p.getImg());	
	
		}
		this.ajaxResponse.setMsgBody(parts);
//		LOG.info("getAllVideosend-----------------" + mac);
		return JSON_RESULT;
	}
	
	public String getVideosbyType() {
		if (vodPartId != null) {
			VodprogramVo vo = new VodprogramVo();
			String projectWebPath = this.getProjectWebPath();
			String vodWebServer = SystemConfig.getVodWebServer();  //点播地址
			List<Criterion> params = new ArrayList<Criterion>();
			params.add(Restrictions.eq("vodpartid", vodPartId));
//			System.out.println("第"+pageNo+"页    "+pageSize+"   分类id："+vodPartId);
			PageBean<Vodprogram> data = programService.loadpage(pageNo, pageSize, Vodprogram.class, params);
			List<Vodprogram> list = data.getElements();
			vo.setPageCount(data.getTotalPage());
			if (list != null && list.size() > 0) {
				for (Vodprogram g : list) {
					g.setVoidprogramimg(projectWebPath + g.getVoidprogramimg());
					List<Vodvideo> videos = this.vodVideoService.findVodvideoByGram(g.getId());
					g.setVideos(videos);
					
					for (Vodvideo v : videos) {
						v.setVoidpath(vodWebServer + v.getVoidpath());
					}
					
					if (g.getAdid() == null) {
						continue;
					}
					Ad ad = adService.findById(g.getAdid());
					if (ad == null) {
						continue;
					}
					List<AdDetail> adDetails = adDetailService.findByAd(ad.getId());
					ad.setDetails(adDetails);
					for(AdDetail adDetail: adDetails){
						adDetail.setPath(projectWebPath + adDetail.getPath());
					}
					g.setAd(ad);

				}
			}
			vo.setList(list);
			this.ajaxResponse.setMsgBody(vo);  //返回数据
		}
		return JSON_RESULT;
	}
	
	public String getvideoByname(){
//		LOG.info("getvideoByname........:" + mac);
		if(!checkMac() || !checkShouquan() && vodName == null && vodName.trim().isEmpty()) {
			return JSON_RESULT;
		}
		List<Vodprogram> progList = programService.findByName(vodName);
		if(progList != null){
			for (Vodprogram g : progList) {
				g.setVoidprogramimg(getProjectWebPath() + g.getVoidprogramimg());
				List<Vodvideo> videos = this.vodVideoService.findVodvideoByGram(g.getId());
				g.setVideos(videos);
				
				for (Vodvideo v : videos) {
					v.setVoidpath(SystemConfig.getVodWebServer() + v.getVoidpath());
				}
				//TODO 增加max_visit_count 
				if (g.getAdid() == null) {
					continue;
				}
				Ad ad = adService.findById(g.getAdid());
				if (ad == null) {
					continue;
				}
				List<AdDetail> adDetails = adDetailService.findByAd(ad.getId());
				ad.setDetails(adDetails);
				for(AdDetail adDetail: adDetails){
					adDetail.setPath(getProjectWebPath() + adDetail.getPath());
				}
				g.setAd(ad);
//				for (Vodvideo v : videos) {
//					v.setVoidpath(vodWebServer + v.getVoidpath());
//				}
			}
		}
		this.ajaxResponse.setMsgBody(progList);
		return JSON_RESULT;
	}
	/**
	 * 处理歌曲的路径
	 * @param songs
	 */
	private void processSongUrl(List<Song> songs) {
		//变成网络路径
		String basePath = getProjectWebPath();
		for (Song s : songs) {
			if(s.getMusicFile().startsWith("http")){
				
			}else {
				s.setMusicFile(basePath + s.getMusicFile());
			}
			if (StringUtils.isNotBlank(s.getLogo())) {
				s.setLogo(basePath + s.getLogo());
			}
			if (StringUtils.isNotBlank(s.getLyricFile())) {
				s.setLyricFile(basePath + s.getLyricFile());
			}
		}
	}
	
	
	private boolean checkMac() {
		if (StringUtils.isBlank(mac)) {
			this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
			this.ajaxResponse.setMsgBody("MAC有误！");
			return false;
		}
		Device d = deviceService.findByMac(mac);
		return d!= null && d.getStatus() == Device.ENABLE;
	}
	/**
	 * @Name: getAllShopIntroduce
	 * @Description: 把本店介绍中图片的相对路径变成绝对路径，并通过JSON格式返回
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 */
	public String getAllShopIntroduce(){
		if(!checkMac() || !checkShouquan()) { 
			return JSON_RESULT;
		}
		
		String basePath = this.getProjectWebPath();
		List<ShopIntroduce> silist = shopIntroduceService.findAllShopIntroduce();
		List<ShopIntroduce> siLv1List = new ArrayList<ShopIntroduce>();
		//把相对路径变成绝对路径
		for (ShopIntroduce si : silist) {
			if(si.getLv() == 1){
				siLv1List.add(si);
			}
			
			si.setLogo(basePath + si.getLogo());
			//si.setImg(basePath + si.getImg());
			if(si.getAdid() == null) {
				continue;
			}
			Ad ad = adService.findById(si.getAdid());
			if (ad == null) {
				continue;
			}
			List<AdDetail> adDetails = adDetailService.findByAd(ad.getId());
			for(AdDetail adDetail:adDetails){
				adDetail.setPath(basePath + adDetail.getPath());
			}
			ad.setDetails(adDetails);
			si.setAd(ad);
		}
		for(ShopIntroduce siLv : siLv1List){
			List<ShopIntroduce> lv2List = new ArrayList<ShopIntroduce>();
			for (ShopIntroduce si : silist) {
				if(siLv.getId().equals(si.getParentID())){
					lv2List.add(si);
				}
			}
			siLv.setSiList(lv2List);
		}
		this.ajaxResponse.setMsgBody(siLv1List);
//		LOG.info("getAllShopIntroduce   end------------- " + mac);
		return JSON_RESULT;
	}
	/**
	 * @Name: getAllLiveManagement
	 * @Description: 获取直播管理的所有信息，并通过JSON格式返回
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 */
	public String getAllLiveManagement(){
		if(!checkMac() || !checkShouquan()) { 
			return JSON_RESULT;
		}
		LOG.info("getAllLiveManagement------------- " + mac);
		LiveVo vo = new LiveVo();
		List<LiveManagement> list = liveManagementService.findAllLiveManagement();
		List<SingelLive> singelLives = singelLiveService.findClientLives();
		vo.setLives(list);
		vo.setSingelLives(singelLives);
		this.ajaxResponse.setMsgBody(vo);
		return JSON_RESULT;
	}
	/**
	 * 获取直播类型状态，信息
	 * @return
	 */
	public String getLiveCategory(){
		Map<String, Object> data = new HashMap<String, Object>();
		if(!checkMac() || !checkShouquan()) { 
			return JSON_RESULT;
		}
//		LOG.info("getLiveCategory------------- " + mac);
		LiveCategory liveCategory = new LiveCategory();
		liveCategory.setStatusConfig(1);
		List<LiveCategory> lists = liveCategoryService.findPage(liveCategory, pageNo, 1).getElements();
		if(lists != null && lists.size() > 0){
			LiveCategory l = lists.get(0);
			if(l.getId().intValue() == 1 ){  //模拟直播
				data.put("type", 1);
				data.put("lives", liveManagementService.findAllLiveManagement());
			}else if (l.getId().intValue() == 2) {  //数字直播
				data.put("type", 2);
				data.put("lives", singelLiveService.findClientLives());
			}else{
				LiveApk liveApk = liveApkService.findApk();
				if (liveApk == null) {
					this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
					this.ajaxResponse.setMsgBody("后台未设置第三方APK");
					return JSON_RESULT;
				}
				liveApk.setPath(getBasePath() + liveApk.getPath());
				data.put("type", 3);
				data.put("lives", liveApk);
				
			}
		}
		this.ajaxResponse.setMsgBody(data);
		return JSON_RESULT;
	}
	/**
	 * @Name: saveGuestBook
	 * @Description:保存留言管理的所有信息，并通过JSON格式返回
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-14（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 */
	public String saveGuestBook(){
		guestBookService.saveGuestBook(guestBook);
		return JSON_RESULT;
	}
	/**
	 * @Name: getServerMsgList
	 * @Description:通过mac最终获取留言信息集合
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 */
	public String getServerMsgList(){
//		LOG.info("getServerMsgList------------- " + mac);
		if(checkShouquan()){
		device = deviceService.findByMac(mac);
		List<ServerMsg> smList = new ArrayList<ServerMsg>();
		if (device != null) {
			List<ServerMsgDetail> smdList = serverMsgDetailService.findServerMsgDetailByUserid(device.getId());
			smList = serverMsgService.findServerMsgList(smdList);
		}
		this.ajaxResponse.setMsgBody(smList);
		}
		return JSON_RESULT;
	}
	/**
	 * @Name: getCalling
	 * @Description: 呼叫信息
	 * @Author:（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 */
	public String getCalling(){
//		LOG.info("getCalling------------- " + mac);
		if(checkShouquan()){
		device = deviceService.findByMac(mac);
//		System.out.print("device = " + device + "\nmac = " + mac);
		if(device != null){
			Device callingDevive = deviceService.findById(device.getId());
			callingService.saveCalling(callingDevive);
		}
		}
		return JSON_RESULT;
	}
	
	public String getWakeUp(){
		if(checkShouquan() && mac!= null && !mac.trim().isEmpty() && wakeUpTime != null && !wakeUpTime.trim().isEmpty()){
			device = deviceService.findByMac(mac);
			if(device != null){
				WakeupCall w = new WakeupCall();
				w.setUserid(device.getId());
				w.setWakeupTime(wakeUpTime);
				wakeupCallService.saveWakeUp(w);
			}
		}
		
		return JSON_RESULT;
	}
	/**
	 * @Name: updateCity
	 * @Description: 获取城市
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-29（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回json格式的全局json结果视图
	 * @throws Exception 有异常抛出
	 */
	public String updateCity() throws Exception{
		String cityStr = updateCityAction.findCity();
		this.ajaxResponse.setMsgBody(cityStr);
		return JSON_RESULT;
	}
	
	/**
	 * 获取日期
	 * @return
	 */
	public String getDate(){
//		DateMessageVo vo = new DateMessageVo();
		Date dates = new Date();
//		vo.setYearAndDate(Datefomter.formatDate(dates)) ;
//		vo.setWeekMessage(Datefomter.getWeekMessage(dates));
//		vo.setMinAndHour(Datefomter.getNowTime(dates));
		this.ajaxResponse.setMsgBody(dates.getTime());
		return JSON_RESULT;
	}
	
	/**
	 * 获取技师类型
	 * @return
	 */
	public String getTechnicianType(){
//		LOG.info("getTechnicianType------------- " + mac);
		if(checkShouquan() && checkMac()){
			List<TechnicianType> types = technicianTypeService.findTypes();
			if(types != null && types.size() > 0){
				for(TechnicianType t:types){
					t.setImg(getProjectWebPath()+t.getImg());
				}
			}
			this.ajaxResponse.setMsgBody(types);
		}
		return JSON_RESULT;
	}
	
	/**
	 * 根据类型id获取技师
	 * @return
	 */
	public String getTechnicianById(){
		if(checkShouquan() && typeId != null && checkMac()){
			List<Technician> lists = technicianService.findByType(typeId);
			if(lists != null && lists.size() > 0){
				for(Technician t :lists){
					t.setImg(getProjectWebPath()+t.getImg());
				}
			}
			this.ajaxResponse.setMsgBody(lists);
		}
		return JSON_RESULT;
	}
	
	/**
	 * 获取所有菜系分类
	 * @return
	 */
	public String getDishStyle(){
//		LOG.info("getDishStyle------------- " + mac);
		if(checkShouquan()&& checkMac()){
			List<DishStyle> styles = dishStyleService.findTypes();
			if(styles != null && styles.size() > 0){
				for(DishStyle style:styles){
					style.setImg(getProjectWebPath()+style.getImg());
				}
			}
			this.ajaxResponse.setMsgBody(styles);
		}
		return JSON_RESULT;
	}
	/**
	 * 根据名称搜索歌曲
	 * @return
	 */
	public String findSongByName(){
//		LOG.info("findSongByName------------- " + mac);
		if(checkShouquan()&& checkMac()){
		   List<Song> songs = songService.findByName(songName);
		   processSongUrl(songs);
		   this.ajaxResponse.setMsgBody(songs);
		}
		
		return JSON_RESULT;
	}
	
	
	/**
	 * 根据类型id获取菜品信息
	 * @return
	 */
	public String getDishStringByStyleId(){
//		LOG.info("getDishStringByStyleId------------- " + mac);
		if(checkShouquan() && styleId != null && checkMac()){
			List<Dish> lists = dishService.findTypes(styleId);
			if(lists != null && lists.size() > 0){
				for(Dish d :lists){
					d.setImg(getProjectWebPath()+d.getImg());
				}
			}
			this.ajaxResponse.setMsgBody(lists);
		}
		return JSON_RESULT;
	}
	
	public String getFinctions(){
//		LOG.info("getFinctions------------- " + mac);
		if (!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<Functions> list = functionsService.findAll();
		this.ajaxResponse.setMsgBody(list);
		return JSON_RESULT;
	}
	
	
	//获取菜单信息接口
	
	public String getTemlMenu(){
		if (!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<TerminalMenu> list = terminalMenuService.findAll();
		
		for (TerminalMenu terminalMenu : list) {
			terminalMenu.setSubMenus(terminalSubMenuService.findByMenuId(terminalMenu.getId()));
			terminalMenu.setLogoUrl(getBasePath() + terminalMenu.getLogoUrl());
		}
		
		this.ajaxResponse.setMsgBody(list);
		return JSON_RESULT;
	}
	
	//获取终端背景图片信息
	
	public String getBackImg(){
		if (!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		
		List<TemlCfg> list = temlCfgService.findAll();
		for (TemlCfg temlCfg : list) {
			temlCfg.setValue(getBasePath() + temlCfg.getValue());
		}
		this.ajaxResponse.setMsgBody(list);
		return JSON_RESULT;
	}
	
	//获取音量信息
	
	public String getVolume() {
		TemlCfg v = temlCfgService.findByKey("volume");
		String volume = v.getValue();
		this.ajaxResponse.setMsgBody(volume);
		return JSON_RESULT;
	}
	
	// 获取第三方直播信息
	public String getLiveApk(){
		if (!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
	
		LiveApk liveApk = liveApkService.findApk();
		if (liveApk == null) {
			this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
			this.ajaxResponse.setMsgBody("后台未设置第三方APK");
			return JSON_RESULT;
		}
		liveApk.setPath(getBasePath() + liveApk.getPath());
		this.ajaxResponse.setMsgBody(liveApk);
		return JSON_RESULT;
	}
	public String getMainAd(){
		if (!checkMac() || !checkShouquan()) {
			return JSON_RESULT;
		}
		List<MainAd> ads = mainAdService.findAll();
		if (ads != null && ads .size() > 0) {
			for(MainAd ad:ads){
				ad.setFilePath(getProjectWebPath()+ad.getFilePath());
				if (ad.getType().intValue() == 1 && ad.getMusicPath() != null && ad.getMusicPath().trim() != null) {
					ad.setMusicPath(getProjectWebPath()+ad.getMusicPath());
				}
			}
		}
		this.ajaxResponse.setMsgBody(ads);
		return JSON_RESULT;
		
	}
	
	
	/**
	 * 验证授权
	 */
	
	public Boolean checkShouquan(){
		Boolean a = true;
		LicenceInfo info = (LicenceInfo) ServletActionContext.getServletContext().getAttribute(Constants.SYS_PERMISSION);
		//具备授权   授权时间还在有效期范围内
		if(info == null){
			this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
			this.ajaxResponse.setMsgBody("该设备没有授权！");
			a = false;
		}
		
		try {
			String hardInfo	 = HardInfoUtil.getInfo();
			if (!hardInfo.toLowerCase().equals(info.getHardInfo().toLowerCase())) {
				this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
				this.ajaxResponse.setMsgBody("该设备没有授权！");
				a = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		 if (!info.isNotLimitUserTime() && (new Date().getTime() > info.getDateTo().getTime())) {
			this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
			this.ajaxResponse.setMsgBody("该设备已过期！");
			a = false;
		}
		 
		 int f = bigCatService.findByStatu();
		 if(f==0) {
			 this.ajaxResponse.setServerCode(ajaxResponse.FAIL);
				this.ajaxResponse.setMsgBody("请联系纳博管理员陈文杰，他关的你服务器！^_^");
				a = false;
		 }
		return a;
		
	}
	
	
	

	
	
	
	/**  
	* @Title: insertMacByAuto_Username  
	* @Description: 增加MAC码  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月1日 上午11:25:13
	* @throws  
	*/  
	public String insertMacByAuto_Username() {
		
		if (!checkMac()) {
			Integer count = this.deviceService.findByMaxCount();
			this.device = new Device();
			this.device.setCategoryId(Integer.valueOf(75));
			this.device.setStatus(Integer.valueOf(1));
			if (count.intValue() < 10) {
				this.device.setUserName("00" + String.valueOf(count));
			} else if ((100 > count.intValue()) && (count.intValue() >= 10)) {
				this.device.setUserName("0" + String.valueOf(count));
			} else if (100 <= count.intValue()) {
				this.device.setUserName(String.valueOf(count));
			}
			this.device.setMac(this.mac);
			this.deviceService.save(this.device);
		}
		return JSON_RESULT;
	}
	   
	
	
	
	 
	/**  
	* @Title: updateUsernameByMac  
	* @Description: 根据Mac 修改位置号  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月2日 上午11:25:39
	* @throws  
	*/  
	public String updateUsernameByMac() {
	   
	  if (checkMac())
	   {
	     this.device = this.deviceService.findByMac(this.mac);
	     	this.device.setMac(this.mac);
	        this.device.setUserName(this.username);
	        this.deviceService.update(this.device);
	   }
	  	return JSON_RESULT;
	 }
	
	/**  
	* @Title: updatevodcheckcountById  
	* @Description: 电影热度  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月2日 下午10:32:25
	* @throws  
	*/  
	public String updatevodcheckcountById()
	    {
	      Vodprogram vodprogram = this.programService.findById(this.vodPid);
	      vodprogram.setPlaytime(Integer.valueOf(vodprogram.getPlaytime().intValue() + 1));
	      this.programService.updateVodprogram(vodprogram);
	      return JSON_RESULT;
	    }
	 
	/**  
	* @Title: updateSongcheckcountById  
	* @Description: 音乐热度 
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月2日 下午10:24:52
	* @throws  
	*/  
	public String updateSongcheckcountById()
	    {
	      Song song = this.songService.findById(this.songId);
	      song.setPlayTimes(Integer.valueOf(song.getPlayTimes().intValue() + 1));
	      this.songService.update(song);
	      return JSON_RESULT;
	    }
	
		@Autowired
	   private IServerMsgService iServerMsgService;
	
	/**  
	* @Title: insertServerMsg  
	* @Description: 用户反馈  
	* @param     参数  
	* @return void    返回类型  
	* @date：2018年9月3日 上午10:07:49
	* @throws  
	*/  
	public void insertServerMsg()
	   {
	     if (checkMac())
	     {
	       Device device = this.deviceService.findByMac(this.mac);
	       Integer count = this.iServerMsgService.findMsgCount();
	       device.setId(count);
	       List<Integer> idListsave = new LinkedList();
	       idListsave.add(device.getId());
	       this.iServerMsgService.saveServerMsg(this.serverMsg, idListsave);
	     }
	   }

	
	 
	/**  
	* @Title: getVideosbyTypeBysortType  
	* @Description: 电影热度 查询  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 上午10:51:23
	* @throws  
	*/  	
	public String getVideosbyTypeBysortType()
	    {
	      if (this.vodPartId != null)
	      {
	       Object adDetails;
	        if ((this.sortType.intValue() == 1) && (this.sortType != null))
	        {
	          VodprogramVo vo = new VodprogramVo();
	          String projectWebPath = getProjectWebPath();
	          String vodWebServer = SystemConfig.getVodWebServer();
	          List<Criterion> params = new ArrayList<Criterion>();
	          params.add(Restrictions.eq("vodpartid", this.vodPartId));
	          
	          PageBean<Vodprogram> data = this.programService.loadpage(this.pageNo, this.pageSize, Vodprogram.class, params);
	          List<Vodprogram> list = data.getElements();
	          vo.setPageCount(data.getTotalPage());
	          if ((list != null) && (list.size() > 0)) {
	            for (Vodprogram g : list)
	            {
	              g.setVoidprogramimg(projectWebPath + g.getVoidprogramimg());
	              List<Vodvideo> videos = this.vodVideoService.findVodvideoByGram(g.getId().intValue());
	              g.setVideos(videos);
	              for (Vodvideo v : videos) {
	                v.setVoidpath(vodWebServer + v.getVoidpath());
	              }
	              if (g.getAdid() != null)
	              {
	                Ad ad = this.adService.findById(g.getAdid());
	                if (ad != null)
	                {
	                  adDetails = this.adDetailService.findByAd(ad.getId().intValue());
	                  ad.setDetails((List)adDetails);
	                 for (AdDetail adDetail : ad.getDetails()) {
	                    adDetail.setPath(projectWebPath + adDetail.getPath());
	                  }
	                  g.setAd(ad);
	                }
	              }
	            }
	          }
	          vo.setList(list);
	          this.ajaxResponse.setMsgBody(vo);
	        }
	        else if ((this.sortType.intValue() == 2) && (this.sortType != null))
	        {
	          VodprogramVo vo = new VodprogramVo();
	          String projectWebPath = getProjectWebPath();
	          String vodWebServer = SystemConfig.getVodWebServer();
	          List<Criterion> params = new ArrayList();
	          params.add(Restrictions.eq("vodpartid", this.vodPartId));
	          
	          PageBean<Vodprogram> data = this.programService.loadpageBysortType(this.pageNo, this.pageSize, Vodprogram.class, params, this.sortType.intValue());
	          List<Vodprogram> list = data.getElements();
	          vo.setPageCount(data.getTotalPage());
	          if ((list != null) && (list.size() > 0)) {
	            for (Vodprogram g : list)
	            {
	              g.setVoidprogramimg(projectWebPath + g.getVoidprogramimg());
	              List<Vodvideo> videos = this.vodVideoService.findVodvideoByGram(g.getId().intValue());
	              g.setVideos(videos);
	              for (adDetails = videos.iterator(); ((Iterator)adDetails).hasNext();)
	              {
	                Vodvideo v = (Vodvideo)((Iterator)adDetails).next();
	                v.setVoidpath(vodWebServer + v.getVoidpath());
	              }
	              if (g.getAdid() != null)
	              {
	                Ad ad2 = this.adService.findById(g.getAdid());
	                if (ad2 != null)
	                {
	                  Object adDetailss = this.adDetailService.findByAd(ad2.getId().intValue());
	                  ad2.setDetails((List)adDetailss);
	                  for (AdDetail adDetail : ad2.getDetails()) {
	                    adDetail.setPath(projectWebPath + adDetail.getPath());
	                  }
	                  g.setAd(ad2);
	                }
	             }
	          }
	         }
	        vo.setList(list);
	         this.ajaxResponse.setMsgBody(vo);
	       }
	     }
	      
	     return JSON_RESULT;
	    }
	
	
	
	
	/**  
	* @Title: findIntroParentIsNull  
	* @Description: 自助服务的首页面  （找到intro表中父级id为空的数据集）
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 上午11:29:51
	* @throws  
	*/  
	public String findIntroParentIsNull()
	   {
	     ShopIntroduce shopIntroduce = new ShopIntroduce();
	     shopIntroduce.setLv(Integer.valueOf(1));
	     PageBean<ShopIntroduce> shopIntroduces = this.shopIntroduceService.findShopIntroduceByParentIsNull(shopIntroduce, Integer.valueOf(this.pageNo), Integer.valueOf(this.pageSize));
	     processIntroUrl(shopIntroduces.getElements());
	     this.ajaxResponse.setMsgBody(shopIntroduces);
	     return JSON_RESULT;
	   }
	
	
	
	
	/**  
	* @Title: findsecondIntroByParentId  
	* @Description: 根据ParentId 找到自助服务子页面  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:17:03
	* @throws  
	*/  
	public String findsecondIntroByParentId()
	   {
	     List<ShopIntroduce> introduces = this.shopIntroduceService.findShopIntroduceByParentID(this.ParentId, Integer.valueOf(2), null);
	     processIntroUrl(introduces);
	     this.ajaxResponse.setMsgBody(introduces);
	     return JSON_RESULT;
	   }

	
	
	 
	/**  
	* @Title: findAllTechnicianType  
	* @Description: 技师类型  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:22:23
	* @throws  
	*/  
	public String findAllTechnicianType()
	    {
	      PageBean<TechnicianType> pageBean = this.technicianTypeService.findPage(null, Integer.valueOf(this.pageNo), Integer.valueOf(this.pageSize));
	      for (TechnicianType t : pageBean.getElements()) {
	        t.setImg(getProjectWebPath() + t.getImg());
	      }
	      this.ajaxResponse.setMsgBody(pageBean);
	      return JSON_RESULT;
	    }
	
	
	
	/**  
	* @Title: findAllDishstyle  
	* @Description: 餐饮类型  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:23:53
	* @throws  
	*/  
	public String findAllDishstyle()
	   {
	     PageBean<DishStyle> pageBean = this.dishStyleService.findPage(null, Integer.valueOf(this.pageNo), Integer.valueOf(this.pageSize));
	     for (DishStyle d : pageBean.getElements()) {
	       d.setImg(getProjectWebPath() + d.getImg());
	     }
	     this.ajaxResponse.setMsgBody(pageBean);
	     return JSON_RESULT;
	   }
	
	
	 
	/**  
	* @Title: findAlltechnician  
	* @Description: 根据技师类型查找 类型下的技师  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:32:40
	* @throws  
	*/  
	public String findAlltechnician()
	    {
	      Technician technician = new Technician();
	      technician.setTypeId(this.typeId);
	      PageBean<Technician> pageBean = this.technicianService.findPage(technician, this.pageNo, this.pageSize);
	      for (Technician t : pageBean.getElements()) {
	        t.setImg(getProjectWebPath() + t.getImg());
	      }
	      this.ajaxResponse.setMsgBody(pageBean);
	      return JSON_RESULT;
	    }
	
	
	/**  
	* @Title: findDishByDishstyle  
	* @Description: 餐饮类型 餐饮下的数据  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:33:59
	* @throws  
	*/  
	public String findDishByDishstyle()
	   {
	     Dish dish = new Dish();
	     dish.setStyleId(this.styleId);
	     PageBean<Dish> pageBean = this.dishService.findPage(dish, Integer.valueOf(this.pageNo), Integer.valueOf(this.pageSize));
	     for (Dish d : pageBean.getElements()) {
	       d.setImg(getProjectWebPath() + d.getImg());
	     }
	     this.ajaxResponse.setMsgBody(pageBean);
	     return JSON_RESULT;
	   }
	
	 
	/**  
	* @Title: findLogo  
	* @Description: 查找终端  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:42:32
	* @throws  
	*/  
	public String findLogo()
	    {
	      TemlCfg cfg = this.temlCfgService.findByKey("back_logo");
	      String path = getProjectWebPath();
	      cfg.setValue(path + cfg.getValue());
	      this.ajaxResponse.setMsgBody(cfg);
	      return JSON_RESULT;
	    }
	
	
	
	/**  
	* @Title: findTime  
	* @Description: 拿到当前日期  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午2:45:48
	* @throws  
	*/  
	public String findTime()
	   {
	     Date date = new Date();
	     DateResult dateResult = new DateResult();
	     dateResult.setSpecific_date(Datefomter.format(date, "yyyy-MM-dd"));
	     dateResult.setTime(Datefomter.getHour(date) + ":" + Datefomter.getMinute(date));
	     dateResult.setWeek(DateTool.datatoWeek(Datefomter.format(date, "yyyy-MM-dd")));
	     this.ajaxResponse.setMsgBody(dateResult.getSpecific_date() + " " + dateResult.getTime() + " " + dateResult.getWeek());
	     return JSON_RESULT;
	   }
	
	
	
	 
	/**  
	* @Title: getAllDiscount  
	* @Description: 客户案例  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午3:08:53
	* @throws  
	*/  
	public String getAllDiscount()
	    {
	      PageBean<Discount> beans = this.discountService.getAllDiscount(this.pageNo, this.pageSize);
	      this.ajaxResponse.setMsgBody(beans);
	      return JSON_RESULT;
	    }
	
	
	
	/**  
	* @Title: getAllCustomercase  
	* @Description: 优惠活动  
	* @param @return    参数  
	* @return String    返回类型  
	* @date：2018年9月3日 下午4:00:38
	* @throws  
	*/  
	public String getAllCustomercase()
	 {
	     PageBean<Customercase> beans = this.customercaseService.getAllCustomercase(this.pageNo, this.pageSize);
	     //变成网络路径
		 String basePath = getProjectWebPath();
	     this.ajaxResponse.setMsgBody(beans);
	     return JSON_RESULT;
	  }
	
	
	/**  
	* @Title: processIntroUrl  
	* @Description: 设置店铺logo  
	* @param @param introduces    参数  
	* @return void    返回类型  
	* @date：2018年9月3日 上午11:37:30
	* @throws  
	*/  
	private void processIntroUrl(List<ShopIntroduce> introduces)
	  {
	     String basePath = getProjectWebPath();
	     for (ShopIntroduce s : introduces) {
	    	 //判断logo是否不为空且长度不为0且不由空白符(whitespace)构成
	       if (StringUtils.isNotBlank(s.getLogo())) {
	         s.setLogo(basePath + s.getLogo());
	       }
	     }
	   }
	
	/**
	 * 获取客户酒店名称
	 * @return
	 */
	public String getKehu() {
		HotelRegister h = hotelService.findById(1);
		this.ajaxResponse.setMsgBody(h);
	     return JSON_RESULT; 
	}
	
	/**
	 * 获取客户mac
	 * @return
	 */
	public String getKehuMac() {
		List<Device> f = deviceService.findAll();
		this.ajaxResponse.setMsgBody(f);
	     return JSON_RESULT; 
	}
	
	/**
	 * 更新状态0
	 * @return
	 */
	public void updateState_x0() {
		bigCatService.updateStatus0();
	}
	/**
	 * 更新状态1
	 * @return
	 */
	public void updateState_x1() {
		bigCatService.updateStatus1();
		
	}
	
	public Integer getParentId() {
		return ParentId;
	}

	public void setParentId(Integer parentId) {
		ParentId = parentId;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getVodPid() {
		return vodPid;
	}

	public void setVodPid(Integer vodPid) {
		this.vodPid = vodPid;
	}
	public ServerMsg getServerMsg() {
		return serverMsg;
	}

	public void setServerMsg(ServerMsg serverMsg) {
		this.serverMsg = serverMsg;
	}

	
	

	public Integer getSortType() {
		return sortType;
	}

	public void setSortType(Integer sortType) {
		this.sortType = sortType;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public Command getCommand() {
		return command;
	}

	public void setCommand(Command command) {
		this.command = command;
	}

	public String getSoftVersion() {
		return softVersion;
	}

	public void setSoftVersion(String softVersion) {
		this.softVersion = softVersion;
	}

	public Integer getSongId() {
		return songId;
	}

	public void setSongId(Integer songId) {
		this.songId = songId;
	}
	public GuestBook getGuestBook() {
		return guestBook;
	}

	public void setGuestBook(GuestBook guestBook) {
		this.guestBook = guestBook;
	}

	public String getWakeUpTime() {
		return wakeUpTime;
	}

	public void setWakeUpTime(String wakeUpTime) {
		this.wakeUpTime = wakeUpTime;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getStyleId() {
		return styleId;
	}

	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}

	public String getVodName() {
		return vodName;
	}

	public void setVodName(String vodName) {
		this.vodName = vodName;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}
	
	public Integer getVodPartId() {
		return vodPartId;
	}

	public void setVodPartId(Integer vodPartId) {
		this.vodPartId = vodPartId;
	}

	private String getBasePath(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+
				request.getServerName()+":"+request.getServerPort()+path+"/";
		return basePath;
	}
	
	
	
}
