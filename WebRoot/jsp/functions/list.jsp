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
<title>列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
	//编辑
	function edit(id){
		location.href = "functions/toUpdate.action?model.id="+id;
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
						<li ><a href="<%=basePath%>admin/list.action">管理员</a></li>
						</s:if>
						<li><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
						<li class="currentHover"><a href="<%=basePath%>functions/list.action">功能开关</a></li> 
						<li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					  
					 <s:form namespace="/functions" action="list" method="post">
					  <s:iterator value="lists" id="item">
					  <tr>
					    <!-- 名称-->
					    <td nowrap="nowrap"><s:property value="name"/></td>
					    <!-- 状态-->
					    <td nowrap="nowrap">
					    <s:if test="#item.status==1">开通</s:if>
					    <s:else>关闭</s:else>
					    </td>
					    <!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
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
						<li ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
						</s:if>
						<li><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">City</a></li>
						<li class="currentHover"><a href="<%=basePath%>functions/list.action">Function switch</a></li> 
						<li ><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">name</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">state</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">operation</th>
					  </tr>
					  
					 <s:form namespace="/functions" action="list" method="post">
					  <s:iterator value="lists" id="item">
					  <tr>
					    <!-- 名称-->
					    <td nowrap="nowrap"><s:property value="name"/></td>
					    <!-- 状态-->
					    <td nowrap="nowrap">
					    <s:if test="#item.status==1">open</s:if>
					    <s:else>关闭</s:else>
					    </td>
					    <!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
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

