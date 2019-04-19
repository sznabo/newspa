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
<title>系统日志</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
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
					   <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
					   <li><a href="<%=basePath%>functions/list.action">功能开关</a></li> 
					   <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
					   <li class="currentHover"><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/syslog">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;&nbsp;操作人：<s:textfield name="syslog.operator" />
					   			 &nbsp;操作：<s:textfield name="syslog.operate" />
					   			 &nbsp;IP：<s:textfield name="syslog.ip" />
					   			&nbsp;时间： <input  name="syslog.time" value="<s:date name="syslog.time" format="yyyy-MM-dd" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                              <input class="Sear" type="submit" value="搜索" style="margin-left:10px;"/>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" nowrap="nowrap">操作人</th>
					    <th scope="col" nowrap="nowrap">操作时间</th>
					    <th scope="col" nowrap="nowrap">IP</th>
					    <th scope="col" nowrap="nowrap">执行的操作</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					     <td nowrap="nowrap">${item.operator}</td>
					     <td nowrap="nowrap"><s:date name="#item.time" format="yyyy-MM-dd HH:mm:ss" /> </td>
					     <td nowrap="nowrap">${item.ip}</td>
					     <td nowrap="nowrap">${item.operate}</td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="syslog/list.action" name="actionName"/>
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
                       <li><a href="<%=basePath%>soft/list.action">Soft</a></li>
                      <li><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
                      <s:if test="#session._adminUser.superAdmin==1">
					   <li ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
					   </s:if>
					   <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">City</a></li>
					   <li><a href="<%=basePath%>functions/list.action">Function Switch</a></li> 
					   <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
					   <li class="currentHover"><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/syslog">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;&nbsp;operator：<s:textfield name="syslog.operator" />
					   			 &nbsp;operation：<s:textfield name="syslog.operate" />
					   			 &nbsp;IP：<s:textfield name="syslog.ip" />
					   			&nbsp;time： <input  name="syslog.time" value="<s:date name="syslog.time" format="yyyy-MM-dd" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                              <input class="Sear" type="submit" value="search" style="margin-left:10px;"/>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" nowrap="nowrap">operator
</th>
					    <th scope="col" nowrap="nowrap">Operating time</th>
					    <th scope="col" nowrap="nowrap">IP</th>
					    <th scope="col" nowrap="nowrap">Perform the operation</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					     <td nowrap="nowrap">${item.operator}</td>
					     <td nowrap="nowrap"><s:date name="#item.time" format="yyyy-MM-dd HH:mm:ss" /> </td>
					     <td nowrap="nowrap">${item.ip}</td>
					     <td nowrap="nowrap">${item.operate}</td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="syslog/list.action" name="actionName"/>
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

