<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>

		<title>升级任务管理</title>

		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
  		<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
  		
  		
  		<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
		
		<script type="text/javascript">
			var a = <%=session.getAttribute("language")%>
	function selectAll(el) {
		$(".check").each(function() {
			this.checked = el.checked;
		});
	}

	function add() {
		window.location.href = "<%=basePath%>softup/toadd.action";
	}

	function edit(id) {
		window.location.href = "<%=basePath%>softup/toupdate.action?softUpdateTask.id="
				+ id;
	}

	function delBatch() {if(a==1){
		if (confirm("确定删除吗?")) {
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if (confirm("Sure to delete??")) {
			document.getElementById("delForm").submit();
		}
	}
	}
	function changeRight(url) {
	 window.parent.document.getElementById("iframepage").src=url;
	}
	
</script>
	</head>

<body>
<s:if test="#session.language==1">
<div class="AlonModule">
 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>soft/list.action">软件包管理</a></li>
                         <li class="currentHover"><a href="<%=basePath%>softup/list.action">升级管理</a></li>
                         <s:if test="#session._adminUser.superAdmin==1">
						 <li ><a href="<%=basePath%>admin/list.action">管理员</a></li>
						 </s:if>
						 <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
						 <li><a href="<%=basePath%>functions/list.action">功能开关</a></li> 
						 <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
                         <li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
   <s:form action="delete" namespace="/softup"  method="post" name="softForm" id="softForm">
      
   	 <div class="ProgramList_Search">
                         <div class="add_dar" style="margin-right:10px;">
                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
                              <div class="add_darBackground">
                             	 
  								  <a href="javascript:add()" >添加</a>
   								 <a href="javascript:delBatch()">删除</a>
                                </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
      </div>
      </s:form>
      <div class="ContentInformation">
    <table class="table1">
	<tr class="TableTitle">
    <th scope="col"><input type="checkbox" class="check" id="delid" name="delid" onclick="selectAll(this);" width="2%"/></th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">软件名</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">目标版本</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">开始时间</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">结束时间</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
   </tr>
   <s:form namespace="/softup" action="delete" method="post" id="delForm">
  <s:iterator value="pageBean.elements" id="item">
  <tr>
    <td><input	class="check" type="checkbox" name="idList" value="${item.id}"  /></td>
    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="name"/></div></td>
    
    <td>
    <s:if test="%{status==1}">正常</s:if>
    <s:if test="%{status==2}">停止</s:if>
    </td>
    <td><s:property value="soft.name"/></td>
    <td><s:property value="targetVersion"/></td>
    <td nowrap="nowrap"><s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td nowrap="nowrap"><s:date name="#item.startTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td nowrap="nowrap"><s:date name="#item.endTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td class="Operating"><a href="javascript:edit(${item.id});"><img src="res/images/Modification.png"/>【修改】</a> 
    <a href="<%=basePath%>softup/delete.action?idList=${item.id}"><img alt="" src="res/images/Delete.png" />【删除】</a></td>
  </tr>
  </s:iterator>
   </s:form>
  <tr>
    <td colspan="9">
    	<!-- 分页 -->
				<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="softup/list.action" name="actionName"/>
				</jsp:include>
    </td>
  </tr>
</table>
</div>
</div>
</div></div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>soft/list.action">Soft</a></li>
                         <li class="currentHover"><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
                         <s:if test="#session._adminUser.superAdmin==1">
						 <li ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
						 </s:if>
						 <li ><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">City</a></li>
						 <li><a href="<%=basePath%>functions/list.action">Function switch</a></li> 
						 <!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
                         <li ><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
   <s:form action="delete" namespace="/softup"  method="post" name="softForm" id="softForm">
      
   	 <div class="ProgramList_Search">
                         <div class="add_dar" style="margin-right:10px;">
                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
                              <div class="add_darBackground">
                             	 
  								  <a href="javascript:add()" >Add</a>
   								 <a href="javascript:delBatch()">Delete</a>
                                </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
      </div>
      </s:form>
      <div class="ContentInformation">
    <table class="table1">
	<tr class="TableTitle">
    <th scope="col"><input type="checkbox" class="check" id="delid" name="delid" onclick="selectAll(this);" width="2%"/></th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">State</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Software name</th>
    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Target version</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Creation time</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Start time</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">End of time</th>
    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Operation</th>
   </tr>
   <s:form namespace="/softup" action="delete" method="post" id="delForm">
  <s:iterator value="pageBean.elements" id="item">
  <tr>
    <td><input	class="check" type="checkbox" name="idList" value="${item.id}"  /></td>
    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="name"/></div></td>
    
    <td>
    <s:if test="%{status==1}">normal</s:if>
    <s:if test="%{status==2}">stop</s:if>
    </td>
    <td><s:property value="soft.name"/></td>
    <td><s:property value="targetVersion"/></td>
    <td nowrap="nowrap"><s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td nowrap="nowrap"><s:date name="#item.startTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td nowrap="nowrap"><s:date name="#item.endTime" format="yyyy-MM-dd hh:mm:ss"/></td>
    <td class="Operating"><a href="javascript:edit(${item.id});"><img src="res/images/Modification.png"/>【Modify】</a> 
    <a href="<%=basePath%>softup/delete.action?idList=${item.id}"><img alt="" src="res/images/Delete.png" />【Delete】</a></td>
  </tr>
  </s:iterator>
   </s:form>
  <tr>
    <td colspan="9">
    	<!-- 分页 -->
				<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="softup/list.action" name="actionName"/>
				</jsp:include>
    </td>
  </tr>
</table>
</div>
</div>
</div></div>
</s:if>
</body>
</html>
