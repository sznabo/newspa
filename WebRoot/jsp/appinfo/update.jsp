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
<title>修改</title>
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
	if(isValEmpty("appName")){
		alert("请输入名称");
		return false;
	}
	/*
	if(isValEmpty("packageName")){
		alert("请输入APK包名");
		return false;
	}
	*/
	if(isValEmpty("position")){
		alert("请输入排序号");
		return false;
	}
	return true;
}
if(a==1){
	if(isValEmpty("appName")){
		alert("Please enter a name");
		return false;
	}
	/*
	if(isValEmpty("packageName")){
		alert("请输入APK包名");
		return false;
	}
	*/
	if(isValEmpty("position")){
		alert("Please input sequence number");
		return false;
	}
	return true;
}
}

function back(){
	location.href = "appInfo/list.action";
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
                    <li><a style="white-space: nowrap;" href="<%=basePath%>appCategory/list.action">应用管理</a></li>
                      <li class="currentHover"><a>>>修改APP</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/appInfo" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	 <s:hidden name="appInfo.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.appName" id="appName" maxlength="30"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">APK包名：</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.packageName" id="packageName" maxlength="100"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">排序号：</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.position" id="position" maxlength="2" size="10"  onkeyup="value=value.replace(/[^\d]/g,'')" />
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">分类：</th>
				<td class="inp" align="left">
					<s:select list="#{1:'视频',2:'购物',3:'游戏',4:'新闻'}" name="appInfo.kind" headerKey="" headerValue="请选择..."></s:select>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">APK安装文件：</th>
				<td class="inp" align="left">
					<b:fileUpload uploadSavePath="upload/app_apk/" name="appInfo.path" id="apkFile"/>(不选择表示不更换)
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">APK图标：</th>
				<td class="inp" align="left">
					<b:fileUpload uploadSavePath="upload/app_icon/" name="appInfo.icon" id="icon"/>(不选择表示不更换)
					<br />注：图片分辨率407px*259px
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">原图标预览：</th>
				<td class="inp" align="left">
					<img src="<%=basePath%>${appInfo.icon}" width="200px" height="200px" alt="" />
				</td>
			</tr>
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>appInfo/list.action?appInfo.category=1">Touching game</a></li>
                      <li ><a style="white-space: nowrap;"  href="<%=basePath%>appInfo/list.action?appInfo.category=2">Network applications</a></li>
                      <li class="currentHover"><a>>>Modify the APP</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/appInfo" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	 <s:hidden name="appInfo.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.appNamee" id="appName" maxlength="30"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">APK package name:</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.packageName" id="packageName" maxlength="100"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Order no. :</th>
				<td class="inp" align="left">
					<s:textfield name="appInfo.position" id="position" maxlength="2" size="10"  onkeyup="value=value.replace(/[^\d]/g,'')" />
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">Classification:</th>
				<td class="inp" align="left">
					<s:select list="#{1:'video',2:'shopping',3:'game',4:'news'}" name="appInfo.kind" headerKey="" headerValue="Please select a..."></s:select>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">APK installation files:</th>
				<td class="inp" align="left">
					<b:fileUpload uploadSavePath="upload/app_apk/" name="appInfo.path" id="apkFile"/>(Choose not to say don't change)
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">APK icon:</th>
				<td class="inp" align="left">
					<b:fileUpload uploadSavePath="upload/app_icon/" name="appInfo.icon" id="icon"/>(Choose not to say don't change)
					<br />Note: the image resolution407px*259px
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Original icon preview:</th>
				<td class="inp" align="left">
					<img src="<%=basePath%>${appInfo.icon}" width="200px" height="200px" alt="" />
				</td>
			</tr>
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

