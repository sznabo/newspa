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
<link href="res/css/images.css" rel="stylesheet" />
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
	//添加
	function addMessageLink(){
		window.location.href = "message/addmessageAction.action";	
	}

	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "message/deleteMsgAction.action?message.id="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "message/deleteMsgAction.action?message.id="+id;
		}
	}
}
	//删除
	function delMessageLink(){if(a==1){
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
	function editMessage(messageId){
		location.href = "message/toupdatemessageAction.action?message.id="+messageId;
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
                      <li class="currentHover"><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                      <li ><a href="<%=basePath%>ad/list.action?showFlag=1&firstFlag=true">广告管理</a></li>
                      <li><a href="<%=basePath%>mainAd/list.action">主屏广告</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="pagemessageAction" method="post" namespace="/message">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	&nbsp;&nbsp;标题：
	                         	  <input type="text" name="message.title"/>
	                              <input class="Sear" type="submit" value="搜&nbsp;索" style="margin-left:10px;"/>
	                         </div>
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(addMessageLink());"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delMessageLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="10%">标题</th>
					    <th scope="col" width="5%">状态</th>
					    <th scope="col" width="6%">播放模式</th>
					   <!--  <th scope="col" width="8%">开始日期</th>
					    <th scope="col" width="8%">结束日期</th>
					    <th scope="col" width="8%">开始时间</th>
					    <th scope="col" width="8%">结束时间</th> -->
					    <th scope="col" width="30%">内容</th>
					    <th scope="col" width="15%">操作</th>
					  </tr>
					  
					<s:form action="message/delmessageAction.action" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="messageIdList" value="${item.id }"/></td>
					    <!-- 标题 -->	
					    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="title" /></div></td>
					    <!-- 状态 -->
					    <td><s:property value="messageStatus[#item.status]" /></td>
					    <!-- 播放模式 -->
					    <td><s:property value="messagePlayType[#item.type]" /></td>
					   	<!-- 开始日期 
					    <td><s:date name="startDate" format="yyyy-MM-dd"/></td>-->
					    <!-- 结束日期 
						<td><s:date name="endDate" format="yyyy-MM-dd"/></td>-->
						<!-- 开始时间 
					    <td><s:property value="startTime"/>--><%-- <s:date name="startTime" format="yyyy-MM-dd HH:mm:ss"/> --%></td>
					    <!-- 结束时间 
						<td><s:property value="endTime"/>--><%-- <s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/> --%></td>
						<!-- 内容 -->
					    <td  align="center"><div style="width:530px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="content"/></div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editMessage(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					 	<tr>
					 		<td colspan="10">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="message/pagemessageAction.action" name="actionName"/>
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
                      <li class="currentHover"><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                      <li ><a href="<%=basePath%>ad/list.action?showFlag=1&firstFlag=true">Ad</a></li>
                      <li><a href="<%=basePath%>mainAd/list.action">Home Ad</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form action="pagemessageAction" method="post" namespace="/message">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         	&nbsp;&nbsp;Title:
	                         	  <input type="text" name="message.title"/>
	                              <input class="Sear" type="submit" value="search" style="margin-left:10px;"/>
	                         </div>
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(addMessageLink());"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delMessageLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table class="table1">
					   <tr class=TableTitle>
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="10%">Title</th>
					    <th scope="col" width="5%">State</th>
					    <th scope="col" width="6%">Play mode</th>
					   <!--  <th scope="col" width="8%">开始日期</th>
					    <th scope="col" width="8%">结束日期</th>
					    <th scope="col" width="8%">开始时间</th>
					    <th scope="col" width="8%">结束时间</th> -->
					    <th scope="col" width="30%">Content</th>
					    <th scope="col" width="15%">Operation</th>
					  </tr>
					  
					<s:form action="message/delmessageAction.action" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="messageIdList" value="${item.id }"/></td>
					    <!-- 标题 -->	
					    <td><div style="width:80px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="title" /></div></td>
					    <!-- 状态 -->
					    <td><s:property value="messageStatus[#item.status]" /></td>
					    <!-- 播放模式 -->
					    <td><s:property value="messagePlayType[#item.type]" /></td>
					   	<!-- 开始日期 
					    <td><s:date name="startDate" format="yyyy-MM-dd"/></td>-->
					    <!-- 结束日期 
						<td><s:date name="endDate" format="yyyy-MM-dd"/></td>-->
						<!-- 开始时间 
					    <td><s:property value="startTime"/>--><%-- <s:date name="startTime" format="yyyy-MM-dd HH:mm:ss"/> --%></td>
					    <!-- 结束时间 
						<td><s:property value="endTime"/>--><%-- <s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/> --%></td>
						<!-- 内容 -->
					    <td  align="center"><div style="width:530px; overflow:hidden; padding-left:25px; text-overflow:ellipsis; white-space:nowrap;"><s:property value="contente"/></div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:editMessage(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					 	<tr>
					 		<td colspan="10">
					 			<div>
					 			<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="message/pagemessageAction.action" name="actionName"/>
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

