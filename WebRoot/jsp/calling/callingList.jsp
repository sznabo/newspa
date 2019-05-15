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
<title>呼叫服务列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
	
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li class="currentHover"><a href="<%=basePath%>calling/callingAction_home.action">呼叫信息</a></li>
                 </ul>
                <!--  <ul>
                      <li><a href="<%=basePath%>wakeup/wakeUpAction_home.action">叫醒服务信息</a></li>
                 </ul> -->
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="callingAction_home" namespace="/calling">
	           <div class="ProgramList_Search">
                      <div class="Search">
                           &nbsp;<input class="Sear" type="submit" value="查&nbsp;询" style="margin-left:10px;"/>
                      </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">设备名称</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">设备号</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">呼叫次数</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th>
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">位置</th>
					    
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 设备名称 -->
					    <td nowrap="nowrap">${item.device.userName}</td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap">${item.device.mac}</td>
					    <!-- 呼叫次数 -->
					    <td nowrap="nowrap">${item.counts}</td>
					   	<!-- 时间 -->
					    <td nowrap="nowrap"><s:date name="time" format="yyyy-MM-dd HH:mm:ss" /></td>
					    <!-- 位置 -->
					    <td nowrap="nowrap">${item.device.position}</td>
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="calling/callingAction_home.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div></s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li class="currentHover"><a href="<%=basePath%>calling/callingAction_home.action">Call information</a></li>
                 </ul>
                <!--  <ul>
                      <li><a href="<%=basePath%>wakeup/wakeUpAction_home.action">叫醒服务信息</a></li>
                 </ul> -->
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="callingAction_home.action" namespace="/calling">
	           <div class="ProgramList_Search">
                      <div class="Search">
                           &nbsp;<input class="Sear" type="submit" value="Search" style="margin-left:10px;"/>
                      </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device name</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device number</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Call the number</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Creation time</th>
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">location</th>
					    
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 设备名称 -->
					    <td nowrap="nowrap">${item.device.userName}</td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap">${item.device.mac}</td>
					    <!-- 呼叫次数 -->
					    <td nowrap="nowrap">${item.counts}</td>
					   	<!-- 时间 -->
					    <td nowrap="nowrap"><s:date name="time" format="yyyy-MM-dd HH:mm:ss" /></td>
					    <!-- 位置 -->
					    <td nowrap="nowrap">${item.device.position}</td>
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="calling/callingAction_home.action" name="actionName"/>
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
<s:else>
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li class="currentHover"><a href="<%=basePath%>calling/callingAction_home.action">Call information</a></li>
                 </ul>
                <!--  <ul>
                      <li><a href="<%=basePath%>wakeup/wakeUpAction_home.action">叫醒服务信息</a></li>
                 </ul> -->
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="callingAction_home.action" namespace="/calling">
	           <div class="ProgramList_Search">
                      <div class="Search">
                           &nbsp;<input class="Sear" type="submit" value="Search" style="margin-left:10px;"/>
                      </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device name</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Device number</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Call the number</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Creation time</th>
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">location</th>
					    
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 设备名称 -->
					    <td nowrap="nowrap">${item.device.userName}</td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap">${item.device.mac}</td>
					    <!-- 呼叫次数 -->
					    <td nowrap="nowrap">${item.counts}</td>
					   	<!-- 时间 -->
					    <td nowrap="nowrap"><s:date name="time" format="yyyy-MM-dd HH:mm:ss" /></td>
					    <!-- 位置 -->
					    <td nowrap="nowrap">${item.device.position}</td>
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="calling/callingAction_home.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>

</s:else>
</body>
</html>

