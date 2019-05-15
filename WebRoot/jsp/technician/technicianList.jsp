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
<title>技师浏览列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
	var a = <%=session.getAttribute("language")%>
	function del(id) {if(a==1){
		//var lv = document.getElementById("lv").value;
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "shopintroduce/shopIntroduceAction_delByIDs.action?idList=" + id ;
		}
	}
	if(a==2){
		//var lv = document.getElementById("lv").value;
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "shopintroduce/shopIntroduceAction_delByIDs.action?idList=" + id ;
		}
	}
}
	//删除
	function delBatch(){if(a==1){
		if(window.confirm("确定要删除吗?")){
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if(window.confirm("Sure you want to delete?")){
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	}
	//编辑
	function edit(id){
		location.href = "technician/toupdate.action?model.id=" + id ;
	}	
	//预览介绍
	function viewIntroduce(id){
		location.href = "shopintroduce/shopIntroduceAction_viewIntroduce.action?model.id="+id;
	}
	
	function findIntroduceName(){
		document.getElementById("searchForm").submit();
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
                 	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">技师浏览</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">类型管理</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">级别管理</a></li>
                      
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post"  action="list" namespace="/technician" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	名称：
	                              <s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
	                                                                                   技师分类：
					   			  <s:select name="model.typeId" list="types" headerKey="" headerValue="全部" listKey="id" listValue="name"></s:select>
					   			    技师级别：
					   			  <s:select name="model.levelId" list="levels" headerKey="" headerValue="全部" listKey="id" listValue="name"></s:select>
	                                                                                  当值：
					   			  <s:select name="model.onDuty" list="#{0:'否',1:'是'}" headerKey="" headerValue="全部"></s:select>
	                                                                                  状态：
					   			  <s:select name="model.status" list="#{0:'空闲',1:'忙碌'}" headerKey="" headerValue="全部"></s:select>
	                              <input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                                <a href="<%=basePath%>technician/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 	<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a>

	                              	 </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">编号</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">籍贯</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">类型</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">服务范围</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">级别</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">性别</th>
                        <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">是否当值</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">状态</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th>
					  </tr>
					  
					 <s:form namespace="/technician" action="delete" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
						
					    <!-- 技师名称-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="name"/>
				        </div></td>
				         <!-- 技师编号-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="number"/>
				        </div></td>
				         <!-- 籍贯-->
				        <td width="10%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="nativePlace"/>
				        </div></td>
				         <!-- 类型-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="type.name"/>
				        </div></td>
				        <!-- 服务范围-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="scopeService"/>
				        </div></td>
				         <!-- 级别-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="level.name"/>
				        </div></td>
				         <!-- 技师性别-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.sex == 0">男</s:if>
					        <s:if test="#item.sex == 1">女</s:if>
				        </div></td>
				         <!-- 是否当值-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.onDuty == 0">否</s:if>
					        <s:if test="#item.onDuty == 1">是</s:if>
				        </div></td>
				        <!-- 状态-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.status == 0">空闲</s:if>
					        <s:if test="#item.status == 1">忙碌</s:if>
				        </div></td>
				     
						<!-- 操作 -->				
							<td class="Operating" nowrap="nowrap" width="8%">
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    </td> 
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="technician/list.action" name="actionName"/>
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
                 	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">Technician to browse</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">Type management</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">Level management</a></li>
                      
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post"  action="technician/list.action" namespace="/technician" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              Name:
	                              <s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
	                              Technicians classification：
					   			  <s:select name="model.typeId" list="types" headerKey="" headerValue="all" listKey="id" listValue="name"></s:select>
					   			    Technician levels:
					   			  <s:select name="model.levelId" list="levels" headerKey="" headerValue="all" listKey="id" listValue="name"></s:select>
	                                                                                 The duty:
					   			  <s:select name="model.onDuty" list="#{0:'on',1:'yes'}" headerKey="" headerValue="all"></s:select>
	                                                                                 Status:
					   			  <s:select name="model.status" list="#{0:'free',1:'busy'}" headerKey="" headerValue="all"></s:select>
	                              <input type="submit" value="search" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                                <a href="<%=basePath%>technician/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 	<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a>

	                              	 </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Serial number</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Native place</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Type</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Level</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Gender</th>
                        <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Whether the duty</th>
					    <th scope="col" width="6%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">State</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </tr>
					  
					 <s:form namespace="/technician" action="technician/delete.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
						
					    <!-- 技师名称-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="namee"/>
				        </div></td>
				         <!-- 技师编号-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="number"/>
				        </div></td>
				         <!-- 籍贯-->
				        <td width="10%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="nativePlacee"/>
				        </div></td>
				         <!-- 类型-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="type.name"/>
				        </div></td>
				         <!-- 级别-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="level.name"/>
				        </div></td>
				         <!-- 技师性别-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.sex == 0">man</s:if>
					        <s:if test="#item.sex == 1">woman</s:if>
				        </div></td>
				         <!-- 是否当值-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.onDuty == 0">on</s:if>
					        <s:if test="#item.onDuty == 1">yes</s:if>
				        </div></td>
				        <!-- 状态-->
				        <td width="6%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#item.status == 0">free</s:if>
					        <s:if test="#item.status == 1">busy</s:if>
				        </div></td>
				     
						<!-- 操作 -->				
							<td class="Operating" nowrap="nowrap" width="8%">
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    </td> 
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="technician/list.action" name="actionName"/>
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


