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
	
	function updateStatu(tmenuId) {
		location.href = "<%=basePath%>temlsubmenu/updateStatu.action?model.id="+tmenuId;
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
                      
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li  class="currentHover"><a href="<%=basePath%>temlsubmenu/list.action?model.menuId=${menu.id }">>>${menu.name }（二级菜单）</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">二级菜单</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 名称 -->
					    <td nowrap="nowrap">${item.name }</td>
			
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
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="temlsubmenu/list.action" name="actionName"/>
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
                      
                       <li ><a href="<%=basePath%>terminalmenu/list.action">Terminal layout management</a></li>
                        <li  class="currentHover"><a href="<%=basePath%>temlsubmenu/list.action?model.menuId=${menu.id }">>>${menu.name }（The secondary menu）</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">   
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">The secondary menu</th>
					    <th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">state</th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">operation</th>
					  </tr>
					 <s:form namespace="/device" action="deldeviceAction" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <!-- 名称 -->
					    <td nowrap="nowrap">${item.namee }</td>
			
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
					    		<s:if test="#item.statu == 0">【The activation】</s:if>
					    		<s:if test="#item.statu == 1">【Shut down】</s:if>
					    	</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">&nbsp;
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="temlsubmenu/list.action" name="actionName"/>
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

