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
<title>叫醒服务列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
//将信息返回给终端 
function back(id){
	location.href = "wakeup/wakeUpAction_changeBack.action?model.id="+id;
}
//表示对整个呼叫信息已处理完成 
function manage(id){
	location.href = "wakeup/wakeUpAction_manger.action?model.id="+id;
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
                      <li><a href="<%=basePath%>calling/callingAction_home.action">呼叫信息</a></li>
                 </ul>
                 <ul>
                      <li class="currentHover"><a href="<%=basePath%>wakeup/wakeUpAction_home.action">叫醒服务信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="wakeUpAction_home.action" namespace="/wakeup">
	           <div class="ProgramList_Search">
                      <div class="Search">
                           &nbsp;<input class="Sear" type="submit" value="查&nbsp;询" style="margin-left:10px;"/>
                      </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">设备名称</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">设备号</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">IP地址</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">叫醒时间</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">位置</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">是否返回</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">是否处理</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">处理</th>
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 设备名称 -->
					    <td nowrap="nowrap">${item.device.userName}</td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap">${item.device.mac}</td>
					    <!-- IP地址 -->
					    <td nowrap="nowrap">${item.device.ipaddr}</td>
					   	<!-- 创建时间 -->
					    <td nowrap="nowrap"><s:date name="createtime" format="yyyy-MM-dd HH:mm:ss" /></td>
					    <!-- 叫醒时间 -->
					    <td nowrap="nowrap">${item.wakeupTime}</td>
					    <!-- 位置 -->
					    <td nowrap="nowrap">${item.device.position}</td>
					    <!-- 是否返回 -->
					    <td nowrap="nowrap">
					      <s:if test="#item.backIf==0"> <font color="red">否</font></s:if>
                          <s:if test="#item.backIf==1"> <font color="green">是</font></s:if>
					    </td>
					    <!-- 是否处理 -->
					    <td nowrap="nowrap">
					      <s:if test="#item.manageIf==0"> <font color="red">否</font></s:if>
                          <s:if test="#item.manageIf==1"> <font color="green">是</font></s:if>
					    </td>
					    <td nowrap="nowrap">
					       <s:if test="#item.backIf==0"> <a href="javascript:back(${id});">【返回终端】</a></s:if>
	                       <s:if test="#item.backIf==1"><s:if test="#item.manageIf==0"> <a href="javascript:manage(${id});">【处理】</a></s:if></s:if>
					    </td>
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="9">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="wakeup/wakeUpAction_home.action" name="actionName"/>
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
                      <li><a href="<%=basePath%>calling/callingAction_home.action">Call information</a></li>
                 </ul>
                 <ul>
                      <li class="currentHover"><a href="<%=basePath%>wakeup/wakeUpAction_home.action">Wake up service information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="wakeUpAction_home.action" namespace="/wakeup">
	           <div class="ProgramList_Search">
                      <div class="Search">
                           &nbsp;<input class="Sear" type="submit" value="The query" style="margin-left:10px;"/>
                      </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device name</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device number</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">The IP address</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Creation time</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Wake up of time</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">location</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Whether to return</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Whether the processing</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">To deal with</th>
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 设备名称 -->
					    <td nowrap="nowrap">${item.device.userName}</td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap">${item.device.mac}</td>
					    <!-- IP地址 -->
					    <td nowrap="nowrap">${item.device.ipaddr}</td>
					   	<!-- 创建时间 -->
					    <td nowrap="nowrap"><s:date name="createtime" format="yyyy-MM-dd HH:mm:ss" /></td>
					    <!-- 叫醒时间 -->
					    <td nowrap="nowrap">${item.wakeupTime}</td>
					    <!-- 位置 -->
					    <td nowrap="nowrap">${item.device.position}</td>
					    <!-- 是否返回 -->
					    <td nowrap="nowrap">
					      <s:if test="#item.backIf==0"> <font color="red">on</font></s:if>
                          <s:if test="#item.backIf==1"> <font color="green">yes</font></s:if>
					    </td>
					    <!-- 是否处理 -->
					    <td nowrap="nowrap">
					      <s:if test="#item.manageIf==0"> <font color="red">on</font></s:if>
                          <s:if test="#item.manageIf==1"> <font color="green">yes</font></s:if>
					    </td>
					    <td nowrap="nowrap">
					       <s:if test="#item.backIf==0"> <a href="javascript:back(${id});">【Return to the terminal】</a></s:if>
	                       <s:if test="#item.backIf==1"><s:if test="#item.manageIf==0"> <a href="javascript:manage(${id});">【To deal with】</a></s:if></s:if>
					    </td>
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="9">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="wakeup/wakeUpAction_home.action" name="actionName"/>
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

