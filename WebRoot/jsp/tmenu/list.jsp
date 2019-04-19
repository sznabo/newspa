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
	//添加
	function toUpdate(tmenuId) {
		location.href = "<%=basePath%>terminalmenu/toUpdate.action?terminalMenu.id="+tmenuId;
	}
	
	function updateStatu(tmenuId) {
		location.href = "<%=basePath%>terminalmenu/updateStatu.action?terminalMenu.id="+tmenuId;
	}
	
	function subMenu(tmenuId) {
		location.href = "<%=basePath%>temlsubmenu/list.action?model.menuId="+tmenuId;
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
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li  class="currentHover"><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                       <li ><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                        <li><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">主菜单</th>
					    <th scope="col" width="35%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图标</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 名称 -->
					    <td nowrap="nowrap"><a  style="color: blue;font-weight: 700;" href="javascript:subMenu(${item.id })">${item.name }</a></td>
					    <!-- logo -->	
					    <td nowrap="nowrap">
					    	<img width="50" height="50" src="${item.logoUrl }" alt="" />
					    </td>
					    <!-- 状态 -->
					    <td nowrap="nowrap">
					    	<s:if test="#item.statu == 0"><span style="color:red;">已关闭</span></s:if>
					    	<s:if test="#item.statu == 1"><span style="color:green;">已激活</span></s:if>
					    </td>
					    <!-- 类型 -->
					    <%-- <td nowrap="nowrap" align="center"><s:property value="categoryName" /></td>
					     --%><!-- 运行状态 -->
					    				   
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:updateStatu(${item.id})"><img alt="" src="res/images/Modification.png"/>
					    		<s:if test="#item.statu == 0">【激活】</s:if>
					    		<s:if test="#item.statu == 1">【关闭】</s:if>
					    	</a>
					    	<a href="javascript:toUpdate(${item.id});"><img alt="" src="res/images/Modification.png"/>【编辑】</a>
					    </td>
					   
					  </tr>
					  </s:iterator>
					   <span style="margin-left:20px">注：点击主菜单可编辑该菜单下的二级菜单</span>
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="terminalmenu/list.action" name="actionName"/>
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
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">Terminal Type</a></li>
                       <li  class="currentHover"><a href="<%=basePath%>terminalmenu/list.action">Terminal layout</a></li>
                       <li ><a href="<%=basePath%>backimg/list.action">Other Settings</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">The main menu</th>
					    <th scope="col" width="35%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Icon</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">State</th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Operation</th>
					  </tr>
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 名称 -->
					    <td nowrap="nowrap"><a  style="color: blue;font-weight: 700;" href="javascript:subMenu(${item.id })">${item.namee }</a></td>
					    <!-- logo -->	
					    <td nowrap="nowrap">
					    	<img width="50" height="50" src="${item.logoUrl }" alt="" />
					    </td>
					    <!-- 状态 -->
					    <td nowrap="nowrap">
					    	<s:if test="#item.statu == 0"><span style="color:red;">closed</span></s:if>
					    	<s:if test="#item.statu == 1"><span style="color:green;">Has been activated</span></s:if>
					    </td>
					    <!-- 类型 -->
					    <%-- <td nowrap="nowrap" align="center"><s:property value="categoryName" /></td>
					     --%><!-- 运行状态 -->
					    				   
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:updateStatu(${item.id})"><img alt="" src="res/images/Modification.png"/>
					    		<s:if test="#item.statu == 0">【activation】</s:if>
					    		<s:if test="#item.statu == 1">【Shut down】</s:if>
					    	</a>
					    	<a href="javascript:toUpdate(${item.id});"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    </td>
					   
					  </tr>
					  </s:iterator>
					   <span style="margin-left:20px">Note: click the main menu to edit the secondary menu under the menu</span>
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="terminalmenu/list.action" name="actionName"/>
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

