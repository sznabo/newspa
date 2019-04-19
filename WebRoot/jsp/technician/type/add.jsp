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
	if(isValEmpty("name")){
		alert("请输入名称");
		return false;
	}
	//验证图片不为空 
  	if ($("#path").val().trim() == '') {
		alert("请选择图片");
		return false;
	}
	return true;
}
if(a==2){
	if(isValEmpty("name")){
		alert("Please enter a name");
		return false;
	}
	//验证图片不为空 
  	if ($("#path").val().trim() == '') {
		alert("Please select a picture");
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
                     <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">技师浏览</a></li>
                     <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">类型管理</a></li>
                      <li class="currentHover"><a>>>添加类型名称</a></li>
                     <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">级别管理</a></li>
                     
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="add" namespace="/technicianType" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp" align="left">
					<s:textfield name="model.name" id="name" maxlength="30"/>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technicianType/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					注：图片分辨率407px * 259px
				</td>
			</tr>

		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="保存" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="返回" onclick="window.history.go(-1);"/>
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
                     <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">Technician to browse</a></li>
                     <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">Type management</a></li>
                      <li class="currentHover"><a>>>Add a type name</a></li>
                     <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">Level management</a></li>
                     
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="add" namespace="/technicianType" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">name：</th>
				<td class="inp" align="left">
					<s:textfield name="model.namee" id="name" maxlength="30"/>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technicianType/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					Note: the image resolution407px * 259px
				</td>
			</tr>

		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="save" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="return" onclick="window.history.go(-1);"/>
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

