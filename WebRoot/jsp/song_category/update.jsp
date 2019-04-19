<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<style type="text/css">
</style>

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<SCRIPT language="JavaScript" type="text/javascript">
var a = <%=session.getAttribute("language")%>
$(function() {
if(a==1){
	
}else if(a==2){
  $("input[type=file]").filestyle({
          image: "<%=basePath%>/res/images/file.png",
          imageheight : 22,
          imagewidth : 82,
          width : 150
      });
}
    
});
function checkForm(){if(a==1){
	if($("#name").val().trim() == ""){
		alert("请输入专辑名称");
		return false;
	}
	return true;
}
if(a==2){
	if($("#name").val().trim() == ""){
		alert("Please enter the album name");
		return false;
	}
	return true;
}
}	

function back(){
	location.href = "songCategory/list.action";
}

</SCRIPT>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a href="<%=basePath%>song/list.action">歌曲管理</a></li>
                      <li><a href="<%=basePath%>songCategory/list.action">专辑管理</a></li>
                      <li class="currentHover"><a>>>修改分组</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/songCategory" enctype="multipart/form-data"  method="post" onsubmit="return checkForm();">
	 <s:hidden name="songCategory.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">分组名称：</th>
				<td class="inp">
					<s:textfield name="songCategory.name" maxlength="30" id="name"/>  <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">专辑LOGO：</th>
				<td class="inp">
					<input name="pic" id="pic"  type="file" />(不选择表是不修改)
					<br />注：图片分辨率488px * 360px
				</td>
			</tr>
			<tr>
				<th scope="row" valign="top" align="right">原图标预览：</th>
				<td class="inp">
					<img src="<%=basePath%>${songCategory.icon}" alt="" width="200" height="200"/>
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
                      <li><a href="<%=basePath%>song/list.action">Song</a></li>
                      <li><a href="<%=basePath%>songCategory/list.action">Album</a></li>
                      <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/songCategory" enctype="multipart/form-data"  method="post" onsubmit="return checkForm();">
	 <s:hidden name="songCategory.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Group name：</th>
				<td class="inp">
					<s:textfield name="songCategory.namee" maxlength="30" id="name"/>  <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Album LOGO：</th>
				<td class="inp">
					<input name="pic" id="pic"  type="file" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Don't choose table is modified)
					<br />Note: the image resolution488px * 360px
				</td>
			</tr>
			<tr>
				<th scope="row" valign="top" align="right">The original icon preview:</th>
				<td class="inp">
					<img src="<%=basePath%>${songCategory.icon}" alt="" width="200" height="200"/>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="Return" onclick="back();"/>
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

