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
<title>留言列表</title>

<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/images.css" rel="stylesheet" />
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
	//添加
	function addServerMsgLink(){
		window.location.href = "servermsg/serverMsgAction_add.action";	
	}

	function del(id) {
	if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "servermsg/serverMsgAction_delByIDs.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "servermsg/serverMsgAction_delByIDs.action?idList="+id;
		}
	}
	}

	//删除
	function delServerMsgLink(){if(a==1){	
		if(window.confirm("确定要删除吗？")){
			document.getElementById("delForm").submit();
		}
	}
	if(a==1){	
		if(window.confirm("Sure you want to delete？")){
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function editServerMsg(servermsgId){
		location.href = "servermsg/serverMsgAction_update.action?model.id="+servermsgId;
	}	
	function changeRight(url) {
	 window.parent.document.getElementById("iframepage").src=url;
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
                      <li class="currentHover"><a href="<%=basePath%>servermsg/serverMsgAction_home.action">留言信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="serverMsgAction_home" method="post" namespace="/servermsg">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	&nbsp;&nbsp;标题<input type="text" name="model.title" style="margin-left:15px;"/>
	                              <input class="Sear" type="submit" value="搜&nbsp;索" style="margin-left:10px;"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(addServerMsgLink());"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delServerMsgLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="15%">标题</th>
					    <th scope="col" width="30%">内容</th>
					    <th scope="col" width="15%">创建时间</th>
					    <th scope="col" width="15%">操作</th>
					  </tr>
					  
					<s:form action="serverMsgAction_delByIDs" namespace="/servermsg" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList" value="${item.id }"/></td>
					    <!-- 标题 -->	
					    <td><div style="width:100px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="title"/></div></td>
					    <!-- 内容 -->
					    <td  align="center"><div style="width:530px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="content"/></div></td>
					   	<!-- 创建时间 -->
					    <td><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editServerMsg(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					  
					  
						 <!-- 分页 -->
					 	<tr>
					 		<td colspan="5">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="servermsg/serverMsgAction_home.action" name="actionName"/>
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
                      <li class="currentHover"><a href="<%=basePath%>servermsg/serverMsgAction_home.action">Message</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="servermsg/serverMsgAction_home.action" method="post" namespace="/servermsg">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	&nbsp;&nbsp;Title<input type="text" name="model.title" style="margin-left:15px;"/>
	                              <input class="Sear" type="submit" value="Search" style="margin-left:10px;"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(addServerMsgLink());"><img alt="" src="res/images/Gnome-List-Add-32.png"/> Add</a>
	                              	 <a href="javascript:void(delServerMsgLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="15%">Title</th>
					    <th scope="col" width="30%">Content</th>
					    <th scope="col" width="15%">Creation time</th>
					    <th scope="col" width="15%">Operation</th>
					  </tr>
					  
					<s:form action="servermsg/serverMsgAction_delByIDs.action" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList" value="${item.id }"/></td>
					    <!-- 标题 -->	
					    <td><div style="width:100px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="title"/></div></td>
					    <!-- 内容 -->
					    <td  align="center"><div style="width:530px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="contente"/></div></td>
					   	<!-- 创建时间 -->
					    <td><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editServerMsg(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					  
					  
						 <!-- 分页 -->
					 	<tr>
					 		<td colspan="5">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="servermsg/serverMsgAction_home.action" name="actionName"/>
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

