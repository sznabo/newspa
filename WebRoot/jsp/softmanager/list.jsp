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
		<title>升级包管理</title>
		<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
		<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script type="text/javascript">
			var a = <%=session.getAttribute("language")%>
	function selectAll(el) {
		$(".check").each(function() {
			this.checked = el.checked;
		});
	}

	function add() {
		window.location.href = "<%=basePath%>soft/toadd.action";
	}

	function edit(id) {
		window.location.href = "<%=basePath%>soft/toupdate.action?soft.id="
				+ id;
	}

	function delBatch() {if(a==1){
		if (confirm("确定删除吗?(如果有关联的升级任务则无法删除)")) {
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if (confirm("Sure to delete?(if you have related upgrade task cannot delete)")) {
			document.getElementById("delForm").submit();
		}
	}
	
	}
	function del(softmanagerid){if(a==1){
		if (confirm("确定删除吗?(如果有关联的升级任务则无法删除)")) {
			window.location.href = "soft/delete.action?idList=" + softmanagerid;
		}
	}
	if(a==2){
		if (confirm("Sure to delete?(if you have associated upgrade task cannot be deleted)")) {
			window.location.href = "soft/delete.action?idList=" + softmanagerid;
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
                      <li  class="currentHover"><a href="soft/list.action">软件包管理</a></li>
						<li><a href="softup/list.action">升级管理</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="admin/list.action">管理员</a></li>
						</s:if>
						<li ><a href="updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
						<li ><a href="functions/list.action">功能开关</a></li>
						<!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
						<li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
		  <s:form action="delete" method="post" name="softForm" id="softForm">
				 <div class="ProgramList_Search">
				 
                         <div class="add_dar" style="margin-right:10px;">
                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
                              <div class="add_darBackground">
										<a href="javascript:add()"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
										<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>删除</a>
                                </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
                    </div>
                    </s:form>
                     <div class="ContentInformation">
							<table class="table1">
								<tr class="TableTitle" align="center">
									<th scope="col">
										<input type="checkbox" class="check" id="delid" name="delid"
											onclick="selectAll(this);" width="2%"/>
									</th>
									<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										名称
									</th>
									<th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										版本
									</th>
									<th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										包名
									</th>
									<th scope="col" width="38%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										描述
									</th>
									<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										操作
									</th>
								</tr>
								<s:form namespace="/soft" action="delete" method="post" id="delForm" name="softForm">
								<s:iterator value="pageBean.elements" id="item">
									<tr align="center">
										<td><input class="check" type="checkbox" name="idList"	value="${item.id}" />
										</td>
										<td>
											<s:property value="name" />
										</td>
										<td>
											<s:property value="version" />
										</td>
										<td>
											<s:property value="packageName" />
										</td>
										<td>
										<div style="width:350px; overflow:hidden; padding-left:20px; text-overflow:ellipsis; white-space:nowrap;">
											<s:property value="remark" />
											</div>
										</td>
										<td>
											<%-- <a href="<%=basePath%>${filePath}"><img alt="" src="res/images/download.png" style="border-width: 0px;"/>【下载】</a> --%>
											<a href="javascript:edit(${item.id});"><img
													src="res/images/Modification.png"  style="border-width: 0px;"/>【修改】</a>
											<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" style="border-width: 0px;"/>【删除】</a>
										</td>
									</tr>
								</s:iterator>
								</s:form>
								<tr>
								<td colspan="6" align="center" class="papg" scope="col">
									<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="soft/list.action" name="actionName"/>
									</jsp:include>
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
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                      <li  class="currentHover"><a href="soft/list.action">Soft</a></li>
						<li><a href="softup/list.action">Upgrade</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="admin/list.action">Administrator</a></li>
						</s:if>
						<li ><a href="updatecity/updateCityAction_toUpdate.action">City</a></li>
						<li ><a href="functions/list.action">Function Switch</a></li>
						<!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
						<li ><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
		  <s:form action="delete" method="post" name="softForm" id="softForm">
				 <div class="ProgramList_Search">
				 
                         <div class="add_dar" style="margin-right:10px;">
                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
                              <div class="add_darBackground">
										<a href="javascript:add()"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
										<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a>
                                </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
                    </div>
                    </s:form>
                     <div class="ContentInformation">
							<table class="table1">
								<tr class="TableTitle" align="center">
									<th scope="col">
										<input type="checkbox" class="check" id="delid" name="delid"
											onclick="selectAll(this);" width="2%"/>
									</th>
									<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
									Name
									</th>
									<th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										Version
									</th>
									<th scope="col" width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										Package Name
									</th>
									<th scope="col" width="38%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										Describe
									</th>
									<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
										Operation
									</th>
								</tr>
								<s:form namespace="/soft" action="delete" method="post" id="delForm" name="softForm">
								<s:iterator value="pageBean.elements" id="item">
									<tr align="center">
										<td><input class="check" type="checkbox" name="idList"	value="${item.id}" />
										</td>
										<td>
											<s:property value="name" />
										</td>
										<td>
											<s:property value="version" />
										</td>
										<td>
											<s:property value="packageName" />
										</td>
										<td>
										<div style="width:350px; overflow:hidden; padding-left:20px; text-overflow:ellipsis; white-space:nowrap;">
											<s:property value="remark" />
											</div>
										</td>
										<td>
											<%-- <a href="<%=basePath%>${filePath}"><img alt="" src="res/images/download.png" style="border-width: 0px;"/>【下载】</a> --%>
											<a href="javascript:edit(${item.id});"><img src="res/images/Modification.png" style="border-width: 0px;"/>【Modify】</a>
											<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" style="border-width: 0px;"/>【Delete】</a>
										</td>
									</tr>
								</s:iterator>
								</s:form>
								<tr>
								<td colspan="6" align="center" class="papg" scope="col">
									<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="soft/list.action" name="actionName"/>
									</jsp:include>
								</td>
								</tr>
							</table>
						
		</div>
		</div>
		</div>
		</div>
		</s:if>
</html>
