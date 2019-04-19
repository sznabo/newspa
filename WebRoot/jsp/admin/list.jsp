<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>节目列表</title>

<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<style type="text/css">
</style>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function delBatch() {if(a==1){
	if (window.confirm("确定要删除吗?")) {
		document.getElementById("delForm").submit();
	}
}if(a==2){
	if (window.confirm("Sure you want to delete?")) {
		document.getElementById("delForm").submit();
	}
}
}
function del(adminid){
if(a==1){
	if (window.confirm("确定要删除吗?")) {
		window.location.href = "admin/delete.action?idList=" + adminid;
	}
}if(a==2){
	if (window.confirm("Sure you want to delete?")) {
		window.location.href = "admin/delete.action?idList=" + adminid;
	}
}
}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                 	 
                      <li><a href="<%=basePath%>soft/list.action">软件包管理</a></li>
                      <li><a href="<%=basePath%>softup/list.action">升级管理</a></li>
                      <s:if test="#session._adminUser.superAdmin==1">
					   <li  class="currentHover"><a href="<%=basePath%>admin/list.action">管理员</a></li>
					   </s:if>
					   <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
					   <li><a href="<%=basePath%>functions/list.action">功能开关</a></li> 
					   <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
					   <li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="list" method="post" namespace="/admin">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                              
	                         </div>
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>admin/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch())"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" nowrap="nowrap" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" nowrap="nowrap"  width="34%">姓名</th>
					    <th scope="col" nowrap="nowrap" width="34%">登陆名</th>
					    <th scope="col" nowrap="nowrap"  width="15%">创建时间</th>
					    <th scope="col" width="15%" nowrap="nowrap">操作</th>
					  </tr>
					  
					  <s:form action="delete" method="post" namespace="/admin" id="delForm">
						  <s:iterator value="all" id="item" status="st">
						  <tr>
						    <td scope="col" nowrap="nowrap" class="check"><input type="checkbox" class="cls" name="idList" value="${item.id }"/></td>
						  	<td scope="col" nowrap="nowrap"> ${item.userName}</td>
						  	<td scope="col" nowrap="nowrap"> ${item.loginName}</td>
						  	<td scope="col" nowrap="nowrap"><s:date name="#item.createTime" format="yyyy-MM-dd HH:mm:ss"/> </td>
						  	<td scope="col" nowrap="nowrap">
						  		<a href="<%=basePath%>admin/toupdate.action?admin.id=${item.id}">
						  			<img src="res/images/Modification.png" border="none;"/>【修改】</a> 
						  		<a href="javascript:void(del(${item.id}));">
						  			<img alt="" src="res/images/Delete.png" border="none;"/>【删除】</a>
						  	</td>
						  </tr>
						  </s:iterator>
					</s:form>
						
				 	</table>
			  </div>
          </div>
     </div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                 	 
                      <li><a href="<%=basePath%>soft/list.action">Soft</a></li>
                      <li><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
                      <s:if test="#session._adminUser.superAdmin==1">
					   <li  class="currentHover"><a href="<%=basePath%>admin/list.action">Administrator</a></li>
					   </s:if>
					   <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">City</a></li>
					   <li><a href="<%=basePath%>functions/list.action">Function switch</a></li> 
					   <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
					   <li ><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="list" method="post" namespace="/admin">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                              
	                         </div>
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>admin/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch())"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" nowrap="nowrap" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" nowrap="nowrap"  width="34%">Name</th>
					    <th scope="col" nowrap="nowrap" width="34%">Login name</th>
					    <th scope="col" nowrap="nowrap"  width="15%">Creation time</th>
					    <th scope="col" width="15%" nowrap="nowrap">Operation</th>
					  </tr>
					  
					  <s:form action="delete" method="post" namespace="/admin" id="delForm">
						  <s:iterator value="all" id="item" status="st">
						  <tr>
						    <td scope="col" nowrap="nowrap" class="check"><input type="checkbox" class="cls" name="idList" value="${item.id }"/></td>
						  	<td scope="col" nowrap="nowrap"> ${item.userName}</td>
						  	<td scope="col" nowrap="nowrap"> ${item.loginName}</td>
						  	<td scope="col" nowrap="nowrap"><s:date name="#item.createTime" format="yyyy-MM-dd HH:mm:ss"/> </td>
						  	<td scope="col" nowrap="nowrap">
						  		<a href="<%=basePath%>admin/toupdate.action?admin.id=${item.id}">
						  			<img src="res/images/Modification.png" border="none;"/>【Modify】</a> 
						  		<a href="javascript:void(del(${item.id}));">
						  			<img alt="" src="res/images/Delete.png" border="none;"/>【Delete】</a>
						  	</td>
						  </tr>
						  </s:iterator>
					</s:form>
						
				 	</table>
			  </div>
          </div>
     </div>
</div>
</s:if>
</body>
</html>

