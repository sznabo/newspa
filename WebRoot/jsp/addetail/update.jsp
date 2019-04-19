<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.boyue.karaoke.model.DeviceCategory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="b" uri="/boyueTags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> 修改</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function checkForm(){if(a==1){
	if($("#name").val().trim() == ""){
		alert("请输入名称");
		return false;
	}
	if (isValEmpty("inter")) {
		alert("请输入时间间隔");
		return false;
	}
	if (isValEmpty("position")) {
		alert("请输入排序号");
		return false;
	}
	return true;
}if(a==2){
	if($("#name").val().trim() == ""){
		alert("Please enter a name");
		return false;
	}
	if (isValEmpty("inter")) {
		alert("Please enter the time interval");
		return false;
	}
	if (isValEmpty("position")) {
		alert("Please input sequence number");
		return false;
	}
	return true;
}
}

function back(){
	location.href = "addetail/list.action";
}

</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <s:if test="#session.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">点播广告</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">自助服务</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">左侧内容</a></li>
                 	</s:if>
                      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">【${sessionScope.curAd.name}】明细列表</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">修改【${sessionScope.curAd.name}】内容</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/addetail" method="post" enctype="multipart/form-data"  onsubmit="return checkForm()">
	 <s:hidden name="adDetail.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<s:textfield name="adDetail.name" id="name" maxlength="30"/> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">时间间隔：</th>
				<td class="inp">
					<s:textfield size="4" name="adDetail.inter" id="inter" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">排序号：</th>
				<td class="inp">
					<s:textfield size="4" name="adDetail.position" id="position" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"><s:if test="#session.curAd.contentType==1">图片：</s:if><s:else>视频：</s:else></th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/adfile/" name="adDetail.path" id="path"/>
					(不选择表示不作修改) <br /> 
					<s:if test="adid == 1">
					<!-- 首页-本店介绍封面 -->
				        	注：图片分辨率330px * 527px 
				     </s:if>
				     <s:elseif test="adid == 2">
				     <!-- 首页-电影点播 -->
				                  注：图片分辨率600px * 258px
				     </s:elseif>
				     <s:elseif test="adid == 3">
				     <!-- 直播右侧广告 -->
				                  注：图片分辨率340px * 609px 
				     </s:elseif>
				     <s:elseif test="adid == 9">
				      <!-- 开机广告 -->
				                   注：图片分辨率1600px * 900px
				     </s:elseif>
				     <s:elseif test="adid == 10">
				     <!-- 音乐欣赏 -->
				                 注：图片分辨率<!-- 204px * 195px  -->
				                 296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 11">
				     <!-- 电视直播 -->
				                   注：图片分辨率<!-- 892px * 609px  -->
				                   600px * 258px
				     </s:elseif>
				     <s:elseif test="adid == 12">
				     <!-- 网络应用 -->
				                 注：图片分辨率<!-- 407px * 259px   -->
				                 296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 13">
				     <!-- 触摸游戏 -->
				                  注：图片分辨率<!-- 407px * 259px  --> 
				                  296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 59">
				     <!-- ben图片轮播 -->
				                <!-- 407px * 259px -->  
				                注：图片分辨率543px * 476px
				     </s:elseif>
				      <s:else>
				      <s:if test="#session.curAd.contentType==1">
				        	<!-- 407px * 259px  -->
				        	注：图片分辨率543px * 476px 
				        	</s:if>
				      </s:else>
				</td>
			</tr>
			
			<s:if test="#session.curAd.contentType==1">
			<tr>
				<th  scope="row" align="right" valign="top">原图片预览：</th>
				<td  class="inp">
					<img src="${adDetail.path}" width="200" height="100" alt="" />
				</td>
			</tr>
			</s:if>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="保存" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="返回" onclick="back();"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div></s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <s:if test="#session.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">message management</a></li>
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">Advertising management</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">film management</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">On demand of advertising</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">self-service
</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">Left content</a></li>
                 	</s:if>
                      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">【${sessionScope.curAd.name}】明细列表</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">修改【${sessionScope.curAd.name}】内容</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/addetail" method="post" enctype="multipart/form-data"  onsubmit="return checkForm()">
	 <s:hidden name="adDetail.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<s:textfield name="adDetail.name" id="name" maxlength="30"/> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Time interval:</th>
				<td class="inp">
					<s:textfield size="4" name="adDetail.inter" id="inter" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Order no. :</th>
				<td class="inp">
					<s:textfield size="4" name="adDetail.position" id="position" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"><s:if test="#session.curAd.contentType==1">Image:</s:if><s:else>Video:</s:else></th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/adfile/" name="adDetail.path" id="path"/>
					(Don't modify chose not to say) <br /> 
					<s:if test="adid == 1">
					<!-- 首页-本店介绍封面 -->
				        	Note: the image resolution330px * 527px 
				     </s:if>
				     <s:elseif test="adid == 2">
				     <!-- 首页-电影点播 -->
				                  Note: the image resolution600px * 258px
				     </s:elseif>
				     <s:elseif test="adid == 3">
				     <!-- 直播右侧广告 -->
				                  Note: the image resolution340px * 609px 
				     </s:elseif>
				     <s:elseif test="adid == 9">
				      <!-- 开机广告 -->
				                 Note: the image resolution1600px * 900px
				     </s:elseif>
				     <s:elseif test="adid == 10">
				     <!-- 音乐欣赏 -->
				                 Note: the image resolution<!-- 204px * 195px  -->
				                 296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 11">
				     <!-- 电视直播 -->
				                 Note: the image resolution<!-- 892px * 609px  -->
				                   600px * 258px
				     </s:elseif>
				     <s:elseif test="adid == 12">
				     <!-- 网络应用 -->
				                Note: the image resolution<!-- 407px * 259px   -->
				                 296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 13">
				     <!-- 触摸游戏 -->
				                Note: the image resolution<!-- 407px * 259px  --> 
				                  296px * 259px
				     </s:elseif>
				     <s:elseif test="adid == 59">
				     <!-- ben图片轮播 -->
				                <!-- 407px * 259px -->  
				             Note: the image resolution543px * 476px
				     </s:elseif>
				      <s:else>
				      <s:if test="#session.curAd.contentType==1">
				        	<!-- 407px * 259px  -->
				        	Note: the image resolution543px * 476px 
				        	</s:if>
				      </s:else>
				</td>
			</tr>
			
			<s:if test="#session.curAd.contentType==1">
			<tr>
				<th  scope="row" align="right" valign="top">The original image preview:</th>
				<td  class="inp">
					<img src="${adDetail.path}" width="200" height="100" alt="" />
				</td>
			</tr>
			</s:if>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="save" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="return" onclick="back();"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div></s:if>
</body>
</html>

