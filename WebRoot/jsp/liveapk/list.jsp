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
<title>无标题文档</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>



<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
	var a = <%=session.getAttribute("language")%>
  function checkEmpty(){if(a==1){
	 var nameV = $("#name").val();
	  if(nameV == null || nameV == ""){
		  alert("名字不能为空");
		  return false;
	  }
	  
	  var val= $("#apk").val();
	  if(val == null || val == ""){
		  return true;
	  }
	  var k = val.substr(val.indexOf("."));
	  if(k != ".apk"){
		  $("#tip").html("未知文件类型");
		  return false;
	  }
	  
	  return true;
	  
  }
  if(a==2){
	 var nameV = $("#name").val();
	  if(nameV == null || nameV == ""){
		  alert("Name cannot be empty");
		  return false;
	  }
	  
	  var val= $("#apk").val();
	  if(val == null || val == ""){
		  return true;
	  }
	  var k = val.substr(val.indexOf("."));
	  if(k != ".apk"){
		  $("#tip").html("Unknown file type");
		  return false;
	  }
	  
	  return true;
	  
  }
  }

function showLiveList() {
	 if ($("#positionType1").attr("checked")) {
		$("#LiveListTr").show();
	 } else {
		$("#LiveListTr").hide();
	 }
}

</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                 		
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">直播分类管理&lt;&lt;</a></li>
                 
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">模拟直播管理</a></li>
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">数字直播管理</a></li>
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveapk/list.action">第三方直播管理</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="update" namespace="/liveapk" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">APP名称：</th>
				
				<td class="inp">
					<input name="model.name" id="name" value="${model.name }"/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">apk文件包：</th>
				<td class="inp">
					<s:file name="apk" id="apk" size="70px" ></s:file>
					(选择直播APK文件，不选择则不更改)
					<br/>
					<span id="tip" style="color:red"></span>
				</td>
				
			</tr>
			<tr>
				<th scope="row" align="right">当前APP信息：</th>
				<td>
					<span> 名 &nbsp;&nbsp;称：[${model.name }]</span>
					<br /><span>软件包：[${model.packName }]</span>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
				
				<a href="<%=basePath%>liveCategory/list.action"><input type="button" name="back" value="返回" class="STYLE1" /></a>
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
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                 		
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">Live classification&lt;&lt;</a></li>
                 
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">Analog broadcast </a></li>
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">Digital broadcast</a></li>
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveapk/list.action">The third party broadcast</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="liveapk/update.action" namespace="/liveapk" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">APP name:</th>
				
				<td class="inp">
					<input name="model.name" id="name" value="${model.name }"/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Apk package:</th>
				<td class="inp">
					<s:file name="apk" id="apk" size="70px" ></s:file>
					(Choose to live the APK, chose not to do not change)
					<br/>
					<span id="tip" style="color:red"></span>
				</td>
				
			</tr>
			<tr>
				<th scope="row" align="right">Current APP information:</th>
				<td>
					<span> Name：[${model.name }]</span>
					<br /><span>software package：[${model.packName }]</span>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="submit" onclick="return checkEmpty()" class="STYLE1" />
				
				<a href="<%=basePath%>liveCategory/list.action"><input type="button" name="back" value="return" class="STYLE1" /></a>
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

