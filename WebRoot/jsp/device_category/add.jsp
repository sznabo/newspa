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
<title>添加</title>
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
		alert("请输入分类名称");
		return false;
	}
	return true;
}
}
if(a==2){
	if($("#name").val().trim() == ""){
		alert("Please enter the category name");
		return false;
	}
	return true;
}
function back(){
	location.href = "deviceCategory/list.action";
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
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">设备管理</a></li>
                      <li><a href="<%=basePath%>deviceCategory/list.action">设备分类管理</a></li>
                      <li class="currentHover"><a>>>添加设备分类</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="save" namespace="/deviceCategory" method="post" onsubmit="return checkForm()">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row">分类名称：</th>
				<td class="inp">
					<input name="deviceCategory.name" id="name" maxlength="20" /><font style="color: red; margin-left: 10">*</font>
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
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li><a href="<%=basePath%>deviceCategory/list.action">Terminal Type</a></li>
                      <li class="currentHover"><a>>>Add</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="save" namespace="/deviceCategory" method="post" onsubmit="return checkForm()">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row">Category name:</th>
				<td class="inp">
					<input name="deviceCategory.name" id="name" maxlength="20" /><font style="color: red; margin-left: 10">*</font>
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
</div>
</s:if>
</body>
</html>

