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

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>	
	//添加
	function addDeviceLink(){
		window.location.href = "<%=basePath%>device/adddeviceAction.action";	
	}

	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "device/deldeviceAction.action?idslist="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "device/deldeviceAction.action?idslist="+id;
		}
	}
}
	//删除
	function delDeviceLink(){if(a==1){
		if(window.confirm("确定要删除吗？")){
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if(window.confirm("Sure you want to delete？")){
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function editDevice(deviceId){
		location.href = "device/toupdatedeviceAction.action?device.id="+deviceId;
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
                      <li class="currentHover"><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                        <li ><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="pagedeciveAction" namespace="/device">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	  <font style="color:#818689;margin-left:20px;" >MAC地址:</font>
					   			  <s:textfield name="device.mac"></s:textfield>
					   			  &nbsp;
					   			  运行状态：
					   			 <s:select name="device.runStatus" list="#{1:'在线', 2:'离线'}" headerKey="" headerValue="全部"></s:select>
					   			  
	                              <input class="Sear" type="submit" value="搜&nbsp;索" style="margin-left:10px;"/>
	                              
					    	<s:if test="addmessge == 1"><span style="color:red;">终端设备数量已达上限，不可再添加！</span></s:if>
					    
					   
	                              
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>device/adddeviceAction.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delDeviceLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                             
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">位置号</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">MAC地址</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <!-- <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">类型</th> -->
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">运行状态</th>
					    <!-- <th scope="col" width="11%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th> -->
					    <!-- <th scope="col" width="11%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">连接时间</th> -->
					    <!-- <th scope="col" width="33%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">位置</th> -->
					    <th scope="col" width="13%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">IP地址</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idslist" id="idslist" value="${item.id}"/></td>
					    <!-- 房间号 -->
					    <td nowrap="nowrap"><s:property value="userName" /></td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap"><s:property value="mac" /></td>
					    <!-- 状态 -->
					    <td nowrap="nowrap"><s:property value="deviceStatus[#item.status]" /></td>
					    <!-- 类型 -->
					    <%-- <td nowrap="nowrap" align="center"><s:property value="categoryName" /></td>
					     --%><!-- 运行状态 -->
					    <td nowrap="nowrap" align="center">
					    	<s:if test="#item.runStatus == 1">在线</s:if>
					    	<s:if test="#item.runStatus == 2">离线</s:if>
					    </td>				   
					   	<!-- 时间 -->
					    <%-- <td nowrap="nowrap"><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					    <td nowrap="nowrap"><s:date name="connectTime" format="yyyy-MM-dd HH:mm:ss"/></td>
					    <td nowrap="nowrap">${item.position}</td>
					     --%><td nowrap="nowrap">${item.ipaddr}</td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editDevice(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="device/pagedeciveAction.action" name="actionName"/>
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
                      <li class="currentHover"><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">Terminal Type</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">Terminal Layout</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">Other Settings</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="pagedeciveAction" namespace="/device">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	  <font style="color:#818689;margin-left:20px;" >MAC address:</font>
					   			  <s:textfield name="device.mac"></s:textfield>
					   			  &nbsp;
					   			Running condition:
					   			 <s:select name="device.runStatus" list="#{1:'online', 2:'offline'}" headerKey="" headerValue="all"></s:select>
					   			  
	                              <input class="Sear" type="submit" value="Search" style="margin-left:10px;"/>
	                              
					    	<s:if test="addmessge == 1"><span style="color:red;">Terminal number has reached upper limit, do not add！</span></s:if>
					    
					   
	                              
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>device/adddeviceAction.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delDeviceLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                             
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Position no.</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">MAC address</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">State</th>
					    <!-- <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">类型</th> -->
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Running state</th>
					    <!-- <th scope="col" width="11%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th> -->
					    <!-- <th scope="col" width="11%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">连接时间</th> -->
					    <!-- <th scope="col" width="33%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">位置</th> -->
					    <th scope="col" width="13%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">IP address</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Operation</th>
					  </tr>
					  
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idslist" id="idslist" value="${item.id}"/></td>
					    <!-- 房间号 -->
					    <td nowrap="nowrap"><s:property value="userName" /></td>
					    <!-- 设备号 -->	
					    <td nowrap="nowrap"><s:property value="mac" /></td>
					    <!-- 状态 -->
					    <td nowrap="nowrap"><s:property value="deviceStatus[#item.status]" /></td>
					    <!-- 类型 -->
					    <%-- <td nowrap="nowrap" align="center"><s:property value="categoryName" /></td>
					     --%><!-- 运行状态 -->
					    <td nowrap="nowrap" align="center">
					    	<s:if test="#item.runStatus == 1">online</s:if>
					    	<s:if test="#item.runStatus == 2">offline</s:if>
					    </td>				   
					   	<!-- 时间 -->
					    <%-- <td nowrap="nowrap"><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					    <td nowrap="nowrap"><s:date name="connectTime" format="yyyy-MM-dd HH:mm:ss"/></td>
					    <td nowrap="nowrap">${item.position}</td>
					     --%><td nowrap="nowrap">${item.ipaddr}</td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editDevice(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="device/pagedeciveAction.action" name="actionName"/>
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

