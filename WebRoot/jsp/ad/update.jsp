<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.boyue.karaoke.model.DeviceCategory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
	
	
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<style type="text/css">
</style>

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script language="JavaScript" type="text/javascript">

function back(){
	location.href = "deviceCategory/list.action";
}

</script>
</head>
<body><s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">设备管理</a></li>
                      <li><a href="<%=basePath%>ad/list.action">广告管理</a></li>
                      <li class="currentHover"><a>>>修改广告</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
	 <s:form action="update" namespace="/ad" method="post" >
	 <s:hidden name="ad.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row">模块名称：</th>
				<td class="inp">
					${ad.name}
				</td>
			</tr>
			
			<tr>
				<th scope="row">内容类型：</th>
				<td class="inp">
					<s:select name="ad.contentType" list="#{1:'图片', 2:'视频', 3:'FLASH'}"></s:select>
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
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">Equipment management</a></li>
                      <li><a href="<%=basePath%>ad/list.action">Advertising management</a></li>
                      <li class="currentHover"><a>>>Modify the ads</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
	 <s:form action="update" namespace="/ad" method="post" >
	 <s:hidden name="ad.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row">Name of the module:</th>
				<td class="inp">
					${ad.name}
				</td>
			</tr>
			
			<tr>
				<th scope="row">content types:</th>
				<td class="inp">
					<s:select name="ad.contentType" list="#{1:'picture', 2:'video', 3:'FLASH'}"></s:select>
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
</s:if>
</body>
</html>

