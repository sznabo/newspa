<%@page import="com.boyue.karaoke.model.GuestBook"%>
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
<title>列表</title>

<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
		var a = <%=session.getAttribute("language")%>
	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "guestbook/guestBookAction_delByIDs.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "guestbook/guestBookAction_delByIDs.action?idList="+id;
		}
	}
}
	//删除
	function delBatch(){if(a==1){
		if(window.confirm("Sure you want to delete?")){
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function loadViewLink(id){
		location.href = "guestbook/guestBookAction_view.action?model.id="+id;
	}	
	
	function findGuestBook(){
		//var startTime = document.getElementById("startTime").value;
		//var endTime = document.getElementById("endTime").value;
		//location.href = "admin/vodPartAction_findVodpartName.action";searchForm
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
                      <li class="currentHover"><a style="white-space: nowrap;">留言管理</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="guestBookAction_home" namespace="/guestbook" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                                                                           用户姓名:
				  				<input type="text" name="model.user_name" id="user_name" maxlength="255" style="margin-left:10px" />&nbsp;&nbsp;
				  				 联系电话:
				  				<input type="text" name="model.tel" id="tel" maxlength="30" style="margin-left:10px" />&nbsp;&nbsp;  				
				  				 留言内容:
				  				<input type="text" name="model.msg" id="msg" maxlength="255" style="margin-left:10px"/>&nbsp;&nbsp;
				  				起始时间:
				  				  <input  name="startTime" id="startTime" value="<s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />" style="margin-left:10px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>&nbsp;&nbsp;
				  				 结束时间:
				  				  <input  name="endTime" id="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss" />" style="margin-left:10px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
  									<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findGuestBook()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="13%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">用户姓名</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">联系电话</th>
					    <th scope="col" width="45%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">留言内容</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">创建时间</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th>
					  </tr>
					  
					 <s:form namespace="/guestbook" action="guestBookAction_delByIDs.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="liveManagementId" name="idList" value="${id}"/></td>
					    
					    <!-- 用户姓名-->
				        <td width="13%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        <s:property value="user_name"/>
				        </div></td>
				        <!-- 联系电话 -->
				        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><s:property value="tel"/></div></td>
				        <!-- 留言内容-->
				        <td width="48%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center" class="texthidden_150" id="content" align="center" style="width:670px; overflow:hidden; padding-left:15px; text-overflow:ellipsis; white-space:nowrap;">
				        <s:property value="msg" />
				        </div></td>
				        <!-- 创建时间 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"> <s:date name="create_time" format="yyyy-MM-dd HH:mm:ss" /> </div></td>
						<!-- 操作 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    <a href="javascript:loadViewLink(${item.id});"><img alt="" src="res/images/viewGuestBook.png"/>【详情】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="live/liveManagementAction_home.action" name="actionName"/>
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
                      <li class="currentHover"><a style="white-space: nowrap;">Message management</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="guestBookAction_home.action" namespace="/guestbook" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                            User name:
				  				<input type="text" name="model.user_name" id="user_name" maxlength="255" style="margin-left:10px" />&nbsp;&nbsp;
				  				 Contact phone number:
				  				<input type="text" name="model.tel" id="tel" maxlength="30" style="margin-left:10px" />&nbsp;&nbsp;  				
			                    Message content:
				  				<input type="text" name="model.msg" id="msg" maxlength="255" style="margin-left:10px"/>&nbsp;&nbsp;
				  				Start time:
				  				  <input  name="startTime" id="startTime" value="<s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />" style="margin-left:10px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>&nbsp;&nbsp;
				  				 End time:
				  				  <input  name="endTime" id="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss" />" style="margin-left:10px" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
  									<input type="submit" value="search" class="Sear" style="margin-left:20px" onclick="findGuestBook()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="13%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">User name</th>
					    <th scope="col" width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Contact phone number</th>
					    <th scope="col" width="45%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Message content</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Creation time</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </tr>
					  
					 <s:form namespace="/guestbook" action="guestBookAction_delByIDs.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="liveManagementId" name="idList" value="${id}"/></td>
					    
					    <!-- 用户姓名-->
				        <td width="13%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        <s:property value="user_name"/>
				        </div></td>
				        <!-- 联系电话 -->
				        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><s:property value="tel"/></div></td>
				        <!-- 留言内容-->
				        <td width="48%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center" class="texthidden_150" id="content" align="center" style="width:670px; overflow:hidden; padding-left:15px; text-overflow:ellipsis; white-space:nowrap;">
				        <s:property value="msg" />
				        </div></td>
				        <!-- 创建时间 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"> <s:date name="create_time" format="yyyy-MM-dd HH:mm:ss" /> </div></td>
						<!-- 操作 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    <a href="javascript:loadViewLink(${item.id});"><img alt="" src="res/images/viewGuestBook.png"/>【Details】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="live/liveManagementAction_home.action" name="actionName"/>
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


