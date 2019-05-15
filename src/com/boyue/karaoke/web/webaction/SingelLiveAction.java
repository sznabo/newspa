package com.boyue.karaoke.web.webaction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.util.MD5;
import com.boyue.karaoke.model.Service1;
import com.boyue.karaoke.model.SingelLive;
import com.boyue.karaoke.service.SingelLiveService;
import com.boyue.karaoke.service.querycondition.LiveQueryCondition;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("SingelLiveAction")
@Scope(value = "prototype")
public class SingelLiveAction extends DefaultBaseAction<SingelLive> {
	SingelLive model = new SingelLive();
	List<SingelLive> liveMageList;
	List<Service1> serverList;
	List<Service1> servicerListChecked;
	
	private List<SingelLive> allLiveList;
	
	@Autowired
	SingelLiveService singelLiveService;
    String strategylist;
    private Integer positionType;
    private String liveName; 
    private Integer befireLiveId;
	public String getStrategylist() {
		return strategylist;
	}

	public void setStrategylist(String strategylist) {
		this.strategylist = strategylist;
	}

	//分页展示
	public String listManagement(){
		LiveQueryCondition condition = new LiveQueryCondition();
		condition.setPageNo(pageNo);
		condition.setPageSize(pageSize);
		condition.setLiveName(StringUtils.trim(liveName));
		this.pageBean = singelLiveService.findLivePage(condition);
//		return "goListLiveMange";
		return "success";
	}
	
	public String skip(){
		String type = ServletActionContext.getRequest().getParameter("type").toString();
		return type;
	}
	/**显示服务器列表*/
	public String showServicers(){
//		serverList = new ArrayList<Service1>();
//		serverList = servicerMngService.loadServicerByServisType(Constants.ServerType.SOURCE_SERVER);
		return "goaddLive";
	}
	//跳转到添加页面
	public String toAddLive() {
//		serverList = new ArrayList<Service1>();
//		serverList = servicerMngService.loadServicerByServisType(Constants.ServerType.SOURCE_SERVER);
		allLiveList = singelLiveService.findLiveListOrderByPosition();
		return "success";
	}
	
	
	//保存添加
	public String saveLive(){
		
		if (positionType == null || positionType == 0) {
			model.setPosition(null);
		}
		String url = "";
		model.setIfable("0"); //0-未发布,1-发布,默认不发布
		model.setFilmname(model.getLivemanagementname());
		if (getLang() == 1) {
			model.setLivemanagementnamee(model.getLivemanagementname());
		}else if (getLang() == 2) {
			model.setLivemanagementname(model.getLivemanagementnamee());
		}
		singelLiveService.saveSingelLiveService(model);
		return "success";
	}
	
	/**批处理删除频道,已发布,未发布
	 * @throws Exception */
	public String delLive() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] ids = request.getParameterValues("liveid");
		
		List<SingelLive> list = new ArrayList<SingelLive>();
		list = singelLiveService.query(createHQL(ids));
		
		//已发布
		List<SingelLive> livedList = new ArrayList<SingelLive>();
		//未发布
		List<SingelLive> unliveList = new ArrayList<SingelLive>();
		for(SingelLive liv:list){
//			if(liv.getIfable().equals("1")&&(liv.getFilmid()!=null&&!liv.getFilmid().equals(""))){
			if(liv.getIfable().equals("1")){
				livedList.add(liv);
			}else{
				unliveList.add(liv);
			}
		}
		
		//处理已发布livedList
//		if(!livedList.isEmpty()&&livedList.size()>0){
//				try {
//					for(Livemanagement liv:livedList){
//						//删除P2P信息
//						Map map = new HashMap<Integer, String>();
//						map = stopReleaseLive(liv);
//						if(!map.isEmpty()){
//							//并修改数据库信息
//							singelLiveService.delsingelLiveService(liv.getId());
//						}else{
//							this.addActionError("["+liv.getFilmname()+"] "+"因网络原因无法撤销，请稍后再试！");
//						}
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}else{
//				//文件不存在
//			}			
		
		//处理未发布的unliveList
		StringBuffer strbuff = new StringBuffer();
		if(!unliveList.isEmpty()&&unliveList.size()>0){
			strbuff.append("delete from SingelLive where id in ("); 
			strbuff.append("").append(unliveList.get(0).getId()).append("");
			if(unliveList.size()>1){
				for(int i=1;i<unliveList.size();i++){
					strbuff.append(",").append(unliveList.get(i).getId()).append("");
				}
			}
			strbuff.append(")");
		}
		String hql = strbuff.toString();
		singelLiveService.delLiveMore(hql);
//		return listManagement();
		return "success";
	}
	
	//通过ID加载直播频道信息(S)
	public String loadLiveByID(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String type = request.getParameter("type").toString();
		String liveid = request.getParameter("liveid");
		
		//被加载信息
		model = singelLiveService.loadSingelLiveService(Integer.valueOf(liveid));
		
		//加载所有的直播信息列表,用来选顺序
		allLiveList = new ArrayList<SingelLive>();
		List<SingelLive> liveList = singelLiveService.findLiveListOrderByPosition();
		for (SingelLive item : liveList) {
			//if (item.getId().intValue() != Integer.valueOf(liveid)) {
				allLiveList.add(item);
			//}
		}
		
		//以分配的服务器ID
//		String serviceId = model.getLivemanagementserver();
//		String[] ids = serviceId.split(", ");
//		StringBuffer stringBuffer = new StringBuffer();
//		stringBuffer.append("from Service as s where s.serviceid in (");
//		stringBuffer.append(StringUtils.join(ids, ",")).append(")");
//		
//		servicerListChecked = new ArrayList<Service>();
//		if (stringBuffer.length()>0) {
//			servicerListChecked = servicerMngService.loadServiceByHql(stringBuffer.toString());
//		}
		
		//存在但未分配的资源服务器信息
		StringBuffer stringbuff = new StringBuffer();
		stringbuff.append("from Service1 as s where s.servicetype='2'");
		
//		serverList = new ArrayList<Service1>();
//		serverList = servicerMngService.loadServiceByHql(stringbuff.toString());
//		Map<Integer, Service> myServerMap = new HashMap<Integer, Service>();
//		for (Service s : servicerListChecked) {
//			myServerMap.put(s.getId(), s);
//		}
//		ActionContext.getContext().put("myServerMap", myServerMap);
		return type;
	}

	//更新直播频道信息   @throws Exception 
	
	public String updateLive() throws Exception{
		SingelLive live = new SingelLive();
		live = singelLiveService.loadSingelLiveService(model.getId());
		model.setFilmname(model.getLivemanagementname());
		model.setIfable(live.getIfable());
		
		if (positionType.intValue() == -1) {//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			model.setPosition(null);
		} else if (positionType.intValue() == 0) {
			model.setPosition(0);
		}
		if (getLang() == 1) {
			model.setLivemanagementnamee(live.getLivemanagementnamee());
		}else if (getLang() == 2) {
			model.setLivemanagementname(live.getLivemanagementname());
		}
		singelLiveService.saveOrUpdateSingelLiveService(model);
				
		return "success";
	}
	
	public Map remoteRequest(SingelLive liv) throws Exception{
		Map map = new HashMap<Integer, String>();
	//	System.out.println(map.size());
	//	System.out.println(map.isEmpty());
		//数据库服务器
//		List<Service1> serlist = new ArrayList<Service1>();
//		serlist = servicerMngService.loadServicerByServisType(Constants.ServerType.P2P_SERVER);
		//视频类型
		String filetype = liv.getLivemanagementtype();
		//协议实现(**********详细逻辑待续****************************)
		String ptlimpl = null;
		String ptl =null;
		if(filetype.equals("wmv")&&liv.getLivemanagementagreement().equals("0")){ //微软：wmv-http-ms_wms
			ptl = "http";
			ptlimpl = "ms_wms";
		}else if(filetype.equals("ts")&&liv.getLivemanagementagreement().equals("2")){ //标HTTP:ts-http-std
			ptl = "http";
			ptlimpl = "std";
		}else if(filetype.equals("ts")&&liv.getLivemanagementagreement().equals("4")){ //标UDP：ts-udp-std
			ptl = "udp";
			ptlimpl = "std";
		}
		else if(filetype.equals("itv")&&liv.getLivemanagementagreement().equals("3")){ //原力：itv-原力http-原力原力ITV直播
			ptl = "原力http";
			ptlimpl = "原力ITV直播";
		}else{
			
			ptl = "http";
			ptlimpl = "std";			
		}
		
		
		String str2 = null;
		try {
			//直播链接
			String livpath = java.net.URLEncoder.encode(liv.getLivemanagementaddress(), "utf-8");
			//直播名称
			String livname = java.net.URLEncoder.encode(liv.getFilmname(), "utf-8");
			//资源服务器ID
			String serviceId = liv.getLivemanagementserver();
			String[] ids = serviceId.split(", ");
			StringBuffer strbuff = new StringBuffer();
			strbuff.append("ftdsid=").append(ids[0]);
			if(ids.length>1){
				for(int k=1;k<ids.length;k++){
					strbuff.append("&ftdsid=").append(ids[k]);
				}
			}
			String ftdsid = strbuff.toString();
			//时间
			long time = System.currentTimeMillis()/1000;
			//加密
			String key = MD5.MD5Encode("admin@boytech"+time);		
			
			String str = "http://"+":"+"/" +
						 "admin?cmd=o_if_addfilm&vod=0&filetype="+filetype+"&" +
						 "ptl="+ptl+"&ptlimpl="+ptlimpl+"&url="+livpath+"&" +
						 "name="+livname+"&"+ftdsid+"&submit=%E6%8F%90%E4%BA%A4&" +
						 "time="+time+"&key="+key+"&ai_cdn=0";		
			
		//	System.out.println(str);
			try {
				URL url = new URL(str);
				try {
					HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
					httpConn.setConnectTimeout(1000*10);
					httpConn.setReadTimeout(1000*10);
					InputStream inp = httpConn.getInputStream(); //异常
					InputStreamReader in = new InputStreamReader(inp);
					
					BufferedReader buff = new BufferedReader(in);
					while((buff.readLine())!=null){
						str2 += buff.readLine();
				//		System.out.println(buff.readLine());
					}
					
					buff.close();
					in.close();
					httpConn.disconnect();	
					
					String[] str3 = str2.split(" ");
					for(int m=1;m<str3.length;m++){
						String[] str4 = str3[m].split("=");
						for(int k=1;k<str4.length;k++){
							String[] str5 = str4[k].split("\"");
					//		System.out.println(str5[1]);
							map.put(m, str5[1]);
						}
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace(); 
			//		System.out.println("==============处理异常=================");
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 撤销发布，可批量撤销
	 * @throws Exception 
	 * */
	public String revokeReleaseLive() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String type = request.getParameter("type").toString();
		String[] ids = request.getParameterValues("liveid");

		List<SingelLive> list = new ArrayList<SingelLive>();
		list = singelLiveService.query(createHQL(ids));
		
		//已经发布的Livemanagement
//		List<Livemanagement> livlist = new ArrayList<Livemanagement>();
//		for(Livemanagement liv:list){
//			if(liv.getIfable().equals("1")&&(liv.getFilmid()!=null&&!liv.getFilmid().equals(""))){
//				livlist.add(liv);
//			}
//		}
		
		//撤销发布：删除xml节点-删除P2P-修改数据库
		if(!list.isEmpty()&&list.size()>0){
			//文件保存路径
			//重新输出xml
			for(SingelLive liv:list){
				//删除P2P信息
//				Map map = new HashMap<Integer, String>();
//				map = stopReleaseLive(liv);
				//并修改数据库信息
//				if(!map.isEmpty()){
					liv.setFilmid(null);
					liv.setIfable("0");
					singelLiveService.updateLive(liv);
//				}else{
//					this.addActionError("["+liv.getFilmname()+"] "+"因网络原因无法撤销，请稍后再试！");
//				}
			}
		}else{
			//撤销livlist为空
		}
//		return listManagement();
		return "success";
	}	
	
	//删除P2P上已发布的视频信息@throws Exception  
	
	public Map stopReleaseLive(SingelLive live){
		Map map = new HashMap<Integer, String>();
		
		//若发布到多个资源服务器上，则多删除
		String serviceId = live.getLivemanagementserver();
		String[] ids = serviceId.split(", ");
		StringBuffer strbuff = new StringBuffer();
		strbuff.append("ftdsid=").append(ids[0]);
		if(ids.length>1){
			for(int k=1;k<ids.length;k++){
				strbuff.append("&ftdsid=").append(ids[k]);
			}
		}
		String ftdsid = strbuff.toString();		
		//P2P上视频id
		String id = live.getFilmid();
		//time时间差(单位秒)
		long time = System.currentTimeMillis()/1000;
		//key
		String key = MD5.MD5Encode("admin@boytech"+time);
		
		List<Service1> serlist = new ArrayList<Service1>();
//		serlist = servicerMngService.loadServicerByServisType(Constants.ServerType.P2P_SERVER);		
		
		String str = "http://"+serlist.get(0).getServiceip()+":"+serlist.get(0).getServiceport()+"/" +
				"admin?cmd=o_if_delfilm&" +
				"id="+id+"&" +
				"ftdsid="+ftdsid+"&" +
				"time="+time+"&" +
				"key="+key+"";
		
		
		try {
			URL url = new URL(str);
			
			try {
				HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
				httpConn.setConnectTimeout(1000*10); //请求超时
				httpConn.setReadTimeout(1000*10);
				InputStreamReader in = new InputStreamReader(httpConn.getInputStream());
				String str2 = null;
				BufferedReader buff = new BufferedReader(in);
				while((buff.readLine())!=null){
					str2 += buff.readLine();
				}
				
				buff.close();
				in.close();
				httpConn.disconnect();

				if(str!=null){
					String[] str3 = str2.split(" ");
					for(int m=1;m<str3.length;m++){
						String[] str4 = str3[m].split("=");
						for(int k=1;k<str4.length;k++){
							String[] str5 = str4[k].split("\"");
					//		System.out.println(str5[1]);
							map.put(m, str5[1]);
						}
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map; 
	}
	
	/**
	 *  发布直播	
	 * @throws Exception 
	 * */
	public String releaseLive()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] ids = request.getParameterValues("liveid");

		List<SingelLive> list = new ArrayList<SingelLive>();
		list = singelLiveService.query(createHQL(ids));
		
		//目标livlist
		List<SingelLive> livlist = new ArrayList<SingelLive>();
//		Map map = null;
//		for(Livemanagement liv:list){
//			if(liv.getIfable().equals("0")){
//				map = new HashMap<Integer, String>();
//				map = remoteRequest(liv);
//				//获得发布的ID
//				if(!map.isEmpty()){
//					liv.setFilmid(map.get(3).toString());
//					livlist.add(liv);
//				} 
//				else {
//					this.addActionError(liv.getFilmname()+"视频--"+"因网络原因没发布成功，请稍后重试！");
//				}
//			}
//		}
		
		//获得服务器路径
		String path = ServletActionContext.getRequest().getRealPath("/").replace("\\", "/");
		
		//livlist数据是否存在
		if(!list.isEmpty()&&list.size()>0){
				for(SingelLive live:list){
					live.setIfable("1");
					singelLiveService.updateLive(live);
				}
		}else{
			//没有要发布的频道
		}
//		return listManagement();
		return "success";
	}
	
	
	//根据ID数组生成hql语句
	public String createHQL(String[] ids){
		String hql =null; 
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("from SingelLive as liv where liv.id in ( ");
		stringBuffer.append("").append(ids[0]).append("");
		if(ids.length>1){
			for(int i=1;i<ids.length;i++){
				stringBuffer.append(",").append(ids[i]).append("");
			}
		}
		stringBuffer.append(")");
		hql = stringBuffer.toString();
	//	System.out.println(hql);
		return hql;
	}
	
	
	public List<Service1> getServerList() {
		return serverList;
	}

	public void setServerList(List<Service1> serverList) {
		this.serverList = serverList;
	}

	public List<SingelLive> getLiveMageList() {
		return liveMageList;
	}

	public void setLiveMageList(List<SingelLive> liveMageList) {
		this.liveMageList = liveMageList;
	}

	public SingelLiveService getSingelLiveService() {
		return singelLiveService;
	}

	public void setSingelLiveService(SingelLiveService singelLiveService) {
		this.singelLiveService = singelLiveService;
	}

	public SingelLive getModel() {
		return model;
	}

	public void setModel(SingelLive model) {
		this.model = model;
	}
	
	public List<Service1> getServicerListChecked() {
		return servicerListChecked;
	}

	public void setServicerListChecked(List<Service1> servicerListChecked) {
		this.servicerListChecked = servicerListChecked;
	}

	public String getLiveName() {
		return liveName;
	}

	public void setLiveName(String liveName) {
		this.liveName = liveName;
	}

	public List<SingelLive> getAllLiveList() {
		return allLiveList;
	}

	public void setAllLiveList(List<SingelLive> allLiveList) {
		this.allLiveList = allLiveList;
	}

	public Integer getBefireLiveId() {
		return befireLiveId;
	}

	public void setBefireLiveId(Integer befireLiveId) {
		this.befireLiveId = befireLiveId;
	}

	public Integer getPositionType() {
		return positionType;
	}

	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}	
	
	
	
	
}
