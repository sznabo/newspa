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
<title>修改分类名称</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script type="text/javascript">
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
	if(isValEmpty("name")){
		alert("请输入名称");
		return false;
	}
	return true;
}
if(a==2){
	if(isValEmpty("name")){
		alert("Please enter a name");
		return false;
	}
	return true;
}
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
                   <!--   <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">自助服务明细</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">左侧内容</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">消费介绍</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li> -->
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li>
                      <li class="currentHover"><a>>>修改分类信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/dishStyle" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	 <s:hidden name="model.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp" align="left">
					<s:textfield name="model.name" size="60" id="name" maxlength="30"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/dishStyle/" name="model.img" id="path"/>
					<span>
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.img}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(不选择图片表示不更换)
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
                   <!--   <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">self-service</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">The self-service subsidiary</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">On the left side of the content</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">Consumption is introduced</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Food management</a></li> -->
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Dish Type</a></li>
                      <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/dishStyle" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	 <s:hidden name="model.id"/>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp" align="left">
					<s:textfield name="model.namee" size="60" id="name" maxlength="30"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/dishStyle/" name="model.img" id="path"/>
					<span style=" margin-left:100px;">
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.img}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(Don't choose pictures will not be changed)
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

