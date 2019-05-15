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
<title>模拟直播列表</title>
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
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "live/liveManagementAction_delByIDs.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "live/liveManagementAction_delByIDs.action?idList="+id;
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
		location.href = "live/liveManagementAction_edit.action?model.id="+id;
	}	
	
	function findLiveManagementName(){
		//var vodpartname = document.getElementById("model.vodpartname").value;
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">直播分类管理&lt;&lt;</a></li>
                 </ul>
                 <ul> 
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">模拟直播管理</a></li>
                 </ul>
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">数字直播管理</a></li>
                 </ul> 
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>liveapk/list.action">第三方直播管理</a></li>
                 </ul> 
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">               
	           <s:form method="post" action="liveManagementAction_home" namespace="/live" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	频道：<s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
  									<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findLiveManagementName()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>live/liveManagementAction_add.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="23%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">频道名称</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">频道号</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">频率</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图像制式</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">伴音制式</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th>
					  </tr>
					  
					 <s:form namespace="/live" action="liveManagementAction_delByIDs.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="liveManagementId" name="idList" value="${id}"/></td>
					    
					    <!-- 频道名称-->
				        <td width="23%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:property value="name"/>
				        </div></td>
				        <!-- 频道号-->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:property value="channelcode"/>
				        </div></td>
				        <!-- 频率 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><s:property value="freq"/></div></td>
						<!-- 彩图制式 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        	<s:if test="#item.zhishi == 'AUTO'">
				        		AUTO
				        	</s:if>
				        	<s:if test="#item.zhishi == 'PAL'">
				        		PAL
				        	</s:if>
				        	<s:if test="#item.zhishi == 'NTSC4.43'">
				        		NTSC4.43
				        	</s:if>
				        	<s:if test="#item.zhishi == 'NTSC3.58'">
				        		NTSC3.58
				        	</s:if>
				        	<s:elseif test="#item.zhishi == 'PAL_60'">
				        		PAL_60
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_BGHI'">
				        		PAL_BGHI
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_M'">
				        		PAL_M
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_N'">
				        		PAL_N
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'NTSC_44'">
				        		NTSC_44
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'NTSC_M'">
				        		NTSC_M
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'SECAM'">
				        		SECAM
				        	</s:elseif>
							</div></td>
						<!-- 声音制式 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        	<s:if test="#item.radiozhishi == 'DK'">
				        		DK
				        	</s:if>
				        	<s:elseif test='#item.radiozhishi == "I"'>
				        		I
				        	</s:elseif>
				        	<s:elseif test='#item.radiozhishi == "M"'>
				        		M
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'B/G'">
				        		B/G
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'BG'">
				        		BG
				        	</s:elseif>
				        	<s:elseif test='#item.radiozhishi == "L"'>
				        		L
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'NUM'">
				        		NUM
				        	</s:elseif>
							</div></td>
						<!-- 操作 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">Live classification&lt;&lt;</a></li>
                 </ul>
                 <ul> 
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">Analog broadcast</a></li>
                 </ul>
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">Digital broadcas</a></li>
                 </ul> 
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>liveapk/list.action">Tripartite live</a></li>
                 </ul> 
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">               
	           <s:form method="post" action="liveManagementAction_home.action" namespace="/live" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	Channel:<s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
  									<input type="submit" value="search" class="Sear" style="margin-left:20px" onclick="findLiveManagementName()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>live/liveManagementAction_add.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="23%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Channel no.</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Drequency</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Image formats</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Audio formats</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </tr>
					  
					 <s:form namespace="/live" action="liveManagementAction_delByIDs.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="liveManagementId" name="idList" value="${id}"/></td>
					    
					    <!-- 频道名称-->
				        <td width="23%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:property value="name"/>
				        </div></td>
				        <!-- 频道号-->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
				        <s:property value="channelcode"/>
				        </div></td>
				        <!-- 频率 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><s:property value="freq"/></div></td>
						<!-- 彩图制式 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        	<s:if test="#item.zhishi == 'AUTO'">
				        		AUTO
				        	</s:if>
				        	<s:if test="#item.zhishi == 'PAL'">
				        		PAL
				        	</s:if>
				        	<s:if test="#item.zhishi == 'NTSC4.43'">
				        		NTSC4.43
				        	</s:if>
				        	<s:if test="#item.zhishi == 'NTSC3.58'">
				        		NTSC3.58
				        	</s:if>
				        	<s:elseif test="#item.zhishi == 'PAL_60'">
				        		PAL_60
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_BGHI'">
				        		PAL_BGHI
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_M'">
				        		PAL_M
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'PAL_N'">
				        		PAL_N
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'NTSC_44'">
				        		NTSC_44
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'NTSC_M'">
				        		NTSC_M
				        	</s:elseif>
				        	<s:elseif test="#item.zhishi == 'SECAM'">
				        		SECAM
				        	</s:elseif>
							</div></td>
						<!-- 声音制式 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        	<s:if test="#item.radiozhishi == 'DK'">
				        		DK
				        	</s:if>
				        	<s:elseif test='#item.radiozhishi == "I"'>
				        		I
				        	</s:elseif>
				        	<s:elseif test='#item.radiozhishi == "M"'>
				        		M
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'B/G'">
				        		B/G
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'BG'">
				        		BG
				        	</s:elseif>
				        	<s:elseif test='#item.radiozhishi == "L"'>
				        		L
				        	</s:elseif>
				        	<s:elseif test="#item.radiozhishi == 'NUM'">
				        		NUM
				        	</s:elseif>
							</div></td>
						<!-- 操作 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="7">
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


