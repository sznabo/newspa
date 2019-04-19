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
<title>直播类型列表</title>
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
		location.href = "liveCategory/toUpdate.action?model.id=" + id ;
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
                 	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">直播分类管理</a></li>
                 	<li><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/toSelect.action">直播类型选择</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	         
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="24%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图片</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th>
					  </tr>
					  
					 <s:form namespace="/liveCategory" action="liveCategory/list.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					   
						
					    <!-- 直播分类名称-->
				        <td width="29%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:if test="#item.id == 1">
				        <a style="color: blue;" href="<%=basePath%>live/liveManagementAction_home.action"><s:property value="name"/></a>
				        </s:if> 
				        <s:if test="#item.id == 2">
				        <a style="color: blue;" href="<%=basePath%>singelLive/list.action"><s:property value="name"/></a>
				        </s:if>
				        <s:if test="#item.id == 3">
				        <a style="color: blue;" href="<%=basePath%>liveapk/list.action"><s:property value="name"/></a>
				        </s:if>
				        </div></td>
				        <!-- logo图片 -->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><img src="${item.path}" width="200" height="100"/></div></td>
						<!-- 状态-->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				            <s:if test="#item.statusConfig == 0">禁用</s:if>
					    	<s:if test="#item.statusConfig == 1">启用</s:if>
				        </div></td>
						<!-- 操作 -->				
						
							<td class="Operating" nowrap="nowrap" width="15%">
				
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    
						    </td> 
						
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="liveCategory/list.action" name="actionName"/>
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
                 	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action" >Live Type</a></li>
                 	<li><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/toSelect.action">Live Type Selection</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	         
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="24%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Image</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">State</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </tr>
					  
					 <s:form namespace="/liveCategory" action="liveCategory/list.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					   
						
					    <!-- 直播分类名称-->
				        <td width="29%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:if test="#item.id == 1">
				        <a style="color: blue;" href="<%=basePath%>live/liveManagementAction_home.action"><s:property value="name"/></a>
				        </s:if> 
				        <s:if test="#item.id == 2">
				        <a style="color: blue;" href="<%=basePath%>singelLive/list.action"><s:property value="name"/></a>
				        </s:if>
				        <s:if test="#item.id == 3">
				        <a style="color: blue;" href="<%=basePath%>liveapk/list.action"><s:property value="name"/></a>
				        </s:if>
				        </div></td>
				        <!-- logo图片 -->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><img src="${item.path}" width="200" height="100"/></div></td>
						<!-- 状态-->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				            <s:if test="#item.statusConfig == 0">disable</s:if>
					    	<s:if test="#item.statusConfig == 1">enable</s:if>
				        </div></td>
						<!-- 操作 -->				
						
							<td class="Operating" nowrap="nowrap" width="15%">
				
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    
						    </td> 
						
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="liveCategory/list.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div></s:if>
</body>
</html>


