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
<title>总服务器信息列表</title>

<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/images.css" rel="stylesheet" />
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
	
	//编辑
	function editClounds(cloundsId){
		location.href = "cloudsManage/toupdate.action?model.id="+cloundsId;
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
                        <li ><a href="<%=basePath%>soft/list.action">软件包管理</a></li>
						<li><a href="<%=basePath%>softup/list.action">升级管理</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="<%=basePath%>admin/list.action">管理员</a></li>
						</s:if>
						<li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
						<li class="currentHover"><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li>
						<li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="10%">总服务名称</th>
					    <th scope="col" width="15%">ip</th>
					    <th scope="col" width="10%">数据库端口</th>
		                <th scope="col" width="10%">数据库名称</th>
		                <th scope="col" width="10%">数据库用户名</th>
		                <th scope="col" width="10%">数据库密码</th>
		                <th scope="col" width="10%">开始标志</th>
		                <th scope="col" width="10%">结束标志</th>
					    <th scope="col" width="8%">操作</th>
					  </tr>
					  
					<s:form action="cloudsManage/list.action" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="messageIdList" value="${item.id }"/></td>
					    <!-- 名称 -->	
					    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="nodeName" /></div></td>
					    <!-- ip -->
					    <td><s:property value="nodeIp" /></td>
					    <!-- 端口 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库名称 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库用户名 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库密码 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 开始标志 -->
					    <td><s:property value="startLine" /></td>
					     <!-- 结束标志 -->
					    <td><s:property value="endLine" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editClounds(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					 	<tr>
					 		<td colspan="10">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="message/pagemessageAction.action" name="actionName"/>
								</jsp:include>
								</div>
					 		</td>
					 	</tr>
					 
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
                        <li ><a href="<%=basePath%>soft/list.action">Package</a></li>
						<li><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
						</s:if>
						<li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">Urban renewal</a></li>
						<li class="currentHover"><a href="<%=basePath%>cloudsManage/list.action">Server information</a></li>
						<li ><a href="<%=basePath%>syslog/list.action">System log</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="10%">Service name</th>
					    <th scope="col" width="15%">Ip</th>
					    <th scope="col" width="10%">Database port</th>
		                <th scope="col" width="10%">Database name</th>
		                <th scope="col" width="10%">Database user name</th>
		                <th scope="col" width="10%">Database password</th>
		                <th scope="col" width="10%">Began to sign</th>
		                <th scope="col" width="10%">End mark</th>
					    <th scope="col" width="8%">Operation</th>
					  </tr>
					  
					<s:form action="cloudsManage/list.action" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="messageIdList" value="${item.id }"/></td>
					    <!-- 名称 -->	
					    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="nodeName" /></div></td>
					    <!-- ip -->
					    <td><s:property value="nodeIp" /></td>
					    <!-- 端口 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库名称 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库用户名 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 数据库密码 -->
					    <td><s:property value="dataPort" /></td>
					     <!-- 开始标志 -->
					    <td><s:property value="startLine" /></td>
					     <!-- 结束标志 -->
					    <td><s:property value="endLine" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editClounds(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					 	<tr>
					 		<td colspan="10">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="message/pagemessageAction.action" name="actionName"/>
								</jsp:include>
								</div>
					 		</td>
					 	</tr>
					 
				</table>
			  </div>
			  
          </div>
          
		 
     </div>
</div>
</s:if>
</body>
</html>

