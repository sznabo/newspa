<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广告管理系统</title>
<link href="res/css/Home.css" rel="stylesheet" />
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="HomeBody">
     <div class="Container">
     	<div class="HomeContent">
                <img src="<%=basePath%>res/images/syshome.png" alt="" />
        </div>
     	
        <div class="HomeRight">
        	    
            <div class="Terminal">
                 <div class="Terminal1">
                      <div class="Online"><span>在线终端<a href="device/pagedeciveAction.action?device.runStatus=1">&nbsp;${onlineDeviceCount}&nbsp;</a>个</span><img src="res/images/Terminal_a.png"/></div>
                      <div class="Offline"><span>离线终端<a href="device/pagedeciveAction.action?device.runStatus=2">&nbsp;${offlineDeviceCount}&nbsp;</a>个</span><img src="res/images/Terminal_b.png"/></div>
                 </div>
                 
                 <!-- 
                 <div class="Terminal1">
                      <div class="Online"><span>未审核节目 <a>2</a> 个</span> <img src="res/images/Unaudited_a.png"/></div>
                      <div class="Offline"><span>未审核发布 <a>4</a> 个</span> <img src="res/images/Unaudited_b.png"/></div>
                 </div>
                  -->
           </div>
        </div>
    	
    </div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="HomeBody">
     <div class="Container">
     	<div class="HomeContent">
                <img src="<%=basePath%>res/images/syshome.png" alt="" />
        </div>
     	
        <div class="HomeRight">
        	    
            <div class="Terminal">
                 <div class="Terminal1">
                      <div class="Online"><span>Online terminal<a href="device/pagedeciveAction.action?device.runStatus=1">&nbsp;${onlineDeviceCount}&nbsp;</a>个</span><img src="res/images/Terminal_a.png"/></div>
                      <div class="Offline"><span>Offline terminal<a href="device/pagedeciveAction.action?device.runStatus=2">&nbsp;${offlineDeviceCount}&nbsp;</a>个</span><img src="res/images/Terminal_b.png"/></div>
                 </div>
                 
                 <!-- 
                 <div class="Terminal1">
                      <div class="Online"><span>未审核节目 <a>2</a> 个</span> <img src="res/images/Unaudited_a.png"/></div>
                      <div class="Offline"><span>未审核发布 <a>4</a> 个</span> <img src="res/images/Unaudited_b.png"/></div>
                 </div>
                  -->
           </div>
        </div>
    	
    </div>
</div>
</s:if>
</body>
</html>


