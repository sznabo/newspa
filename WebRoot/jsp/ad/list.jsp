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
	var a = <%=session.getAttribute("language")%>	
	//编辑
	  	
	function edit(id){
	
		location.href = "ad/toupdate.action?ad.id="+id;
	}
	if(a==1){	
	//查询
	function findLiveManagementName(){
		document.getElementById("searchForm").submit();
	}
	
	//删除
	function delBatch(){
		//获取被选中的要删除的项ID
		var obj = document.getElementsByName("idList");
			var ids = [];
				for ( var i = 0; i < obj.length; i++) {
					if(obj[i].checked == true){
						var id = obj[i].value+"";
						ids.push(id);
				}
			}
		//如果未选择，则请先选择	
		if (ids.length <= 0) {
			alert("请先选择要删除的项！");
			return false;
		} 
		//查询是否存在广告
		function checkIsAd(){
			var params = "checkidList=" + ids;
			var exist = false;
			$.ajax({
				type:"POST",
				async:false,
				url:"ad/checkIsAd.action",
				data:params,
				success:function(msg){
					exist = msg.msgBody;
				}
			});
			return exist;
		}
		
		if(window.confirm("确定要删除吗?")){
			var flag = checkIsAd();
			if(!flag){
				alert("所属栏目为【广告】的不能删除！");
				return false;
			}else{
				document.getElementById("delForm").submit();
			}
		}
	}
	//编辑
	function editNew(id){
		var newshowFlag = document.getElementById("showFlag").value;
		location.href = "ad/edit.action?ad.id=" + id + "&showFlag=" + newshowFlag;
	}
	function del(id) {
		if (window.confirm("确定要删除吗?")) {
			//var showFlag = document.getElementById("showFlag");
			window.location.href = "ad/delete.action?idList=" + id ;
		}
	}
	}if(a==2){	
	//查询
	function findLiveManagementName(){
		document.getElementById("searchForm").submit();
	}
	
	//删除
	function delBatch(){
		//获取被选中的要删除的项ID
		var obj = document.getElementsByName("idList");
			var ids = [];
				for ( var i = 0; i < obj.length; i++) {
					if(obj[i].checked == true){
						var id = obj[i].value+"";
						ids.push(id);
				}
			}
		//如果未选择，则请先选择	
		if (ids.length <= 0) {
			alert("Please select items to delete!");
			return false;
		} 
		//查询是否存在广告
		function checkIsAd(){
			var params = "checkidList=" + ids;
			var exist = false;
			$.ajax({
				type:"POST",
				async:false,
				url:"ad/checkIsAd.action",
				data:params,
				success:function(msg){
					exist = msg.msgBody;
				}
			});
			return exist;
		}
		
		if(window.confirm("Sure you want to delete?")){
			var flag = checkIsAd();
			if(!flag){
				alert("Column for [AD] cannot be deleted!");
				return false;
			}else{
				document.getElementById("delForm").submit();
			}
		}
	}
	//编辑
	function editNew(id){
		var newshowFlag = document.getElementById("showFlag").value;
		location.href = "ad/edit.action?ad.id=" + id + "&showFlag=" + newshowFlag;
	}
	function del(id) {
		if (window.confirm("Sure you want to delete?")) {
			//var showFlag = document.getElementById("showFlag");
			window.location.href = "ad/delete.action?idList=" + id ;
		}
	}
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
                 	<s:if test="#session.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                        <li class="currentHover"><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
                        <li><a href="<%=basePath%>mainAd/list.action">主屏广告</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">点播广告</a></li>
                      	<li><a href="<%=basePath%>play/list.action">切换播放引擎</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">左侧内容</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&firstFlag=true">消费介绍</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li>
                 	</s:if> 
                 	
                 	<s:if test="#session.showFlag == 4">
                 		<li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">左侧内容</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4">消费介绍</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li>
                 	</s:if> 
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:if test="#request.showFlag != 1">
	           <s:form method="post" action="list" namespace="/ad" id="searchForm">
	           			<div class="ProgramList_Search">
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
  									<!-- <input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findAd()"/> -->
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>ad/add.action?showFlag=${showFlag}"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a> </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           		</div> 
	           </s:form>
	           </s:if>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
	                <s:hidden name="showFlag"></s:hidden>
					  <tr class="TableTitle">
					  	<s:if test="#request.showFlag != 1">
					    	<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    	<th scope="col" width="42%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">内容类型</th>
					    	<!-- <th scope="col" width="26%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">所属栏目</th> -->
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th> 
					    </s:if>
					    <s:else>
					    	<th scope="col" width="50%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    	<th scope="col" width="50%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">内容类型</th>
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th> 
					    	<!-- <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">所属栏目</th> -->
					    </s:else>
					    
					    <%-- <s:if test="#request.showFlag != 1">
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th> 
					    </s:if> --%>
					  </tr>
					  
					 <s:form namespace="/ad" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					  	<s:if test="#request.showFlag != 1">
					  		<td class="check" width="2%"><input type="checkbox" class="checkCls" id="adId" name="idList" value="${id}"/></td>
					   <!-- 名称-->
					    <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=${item.id}&showFlag=${item.category}&category=${category}"><s:property value="name"/></a>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="41%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.contentType == 1">
				        		图片
				        	</s:if>
				        	<s:elseif test="#item.contentType == 2">
				        		视频
				        	</s:elseif>
				        	<s:else>
				        		flash
				        	</s:else>
				        	</div>
				        </td>
				        <!-- 所属栏目 -->
				        <%-- <td width="26%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
					        <s:if test="#item.category == 1">
					        		广告
					        	</s:if>
					        	<s:elseif test="#item.category == 2">
					        		点播广告
					        	</s:elseif>
					        	<s:else>
					        		本店介绍
					        	</s:else>
					        </div>
				        </td> --%>
						<!-- 操作 -->
						    <td class="Operating" nowrap="nowrap" width="15%">
						        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>		
						    </td> 
					    </s:if>
					    
					  	<s:else>
					  		<!-- 名称-->
					    <td width="50%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=${item.id}&showFlag=${item.category}&category=${category}"><s:property value="name"/></a>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="50%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.contentType == 1">
				        		图片
				        	</s:if>
				        	<s:elseif test="#item.contentType == 2">
				        		视频
				        	</s:elseif>
				        	<s:else>
				        		flash
				        	</s:else>
				        	</div>
				        </td>
				         <td class="Operating" nowrap="nowrap" width="15%">
						        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    </td> 
				        <!-- 所属栏目 -->
				        <%-- <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
					        <s:if test="#item.category == 1">
					        		广告
					        	</s:if>
					        	<s:elseif test="#item.category == 2">
					        		点播广告
					        	</s:elseif>
					        	<s:else>
					        		本店介绍
					        	</s:else>
					        </div>
				        </td> --%>
					  	</s:else>
					 
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<s:if test="#request.showFlag != 1">
							<td colspan="4">
								<div>
								<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="ad/list.action" name="actionName"/>
								</jsp:include>
								</div>
							</td>
						</s:if>
						<s:else>
							<td colspan="3">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="ad/list.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
						</s:else>
						<%-- <td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="ad/list.action" name="actionName"/>
							</jsp:include>
							</div>
						</td> --%>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>
</s:if><s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                 	<s:if test="#session.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                        <li class="currentHover"><a href="<%=basePath%>ad/list.action?showFlag=1">Ad</a></li>
                        <li><a href="<%=basePath%>mainAd/list.action">Home Ad</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">Demand Ad</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">Service</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">Left Content</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&firstFlag=true">Consumption Introduced</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Dish</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Dish Type</a></li>
                 	</s:if> 
                 	
                 	<s:if test="#session.showFlag == 4">
                 		<li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">Service</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">Left Sontent</a></li>
                      	<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4">Consumption Introduced</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Dish</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Dish Type</a></li>
                 	</s:if> 
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:if test="#request.showFlag != 1">
	           <s:form method="post" action="list" namespace="/ad" id="searchForm">
	           			<div class="ProgramList_Search">
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
  									<!-- <input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findAd()"/> -->
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>ad/add.action?showFlag=${showFlag}"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> Delete</a> </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           		</div> 
	           </s:form>
	           </s:if>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
	                <s:hidden name="showFlag"></s:hidden>
					  <tr class="TableTitle">
					  	<s:if test="#request.showFlag != 1">
					    	<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    	<th scope="col" width="42%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Content type</th>
					    	<!-- <th scope="col" width="26%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">所属栏目</th> -->
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th> 
					    </s:if>
					    <s:else>
					    	<th scope="col" width="50%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    	<th scope="col" width="50%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Content type</th>
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th> 
					    	<!-- <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">所属栏目</th> -->
					    </s:else>
					    
					    <%-- <s:if test="#request.showFlag != 1">
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th> 
					    </s:if> --%>
					  </tr>
					  
					 <s:form namespace="/ad" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					  	<s:if test="#request.showFlag != 1">
					  		<td class="check" width="2%"><input type="checkbox" class="checkCls" id="adId" name="idList" value="${id}"/></td>
					   <!-- 名称-->
					    <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=${item.id}&showFlag=${item.category}&category=${category}"><s:property value="name"/></a>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="41%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.contentType == 1">
				        		Image
				        	</s:if>
				        	<s:elseif test="#item.contentType == 2">
				        		Video
				        	</s:elseif>
				        	<s:else>
				        		Flash
				        	</s:else>
				        	</div>
				        </td>
				        <!-- 所属栏目 -->
				        <%-- <td width="26%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
					        <s:if test="#item.category == 1">
					        		广告
					        	</s:if>
					        	<s:elseif test="#item.category == 2">
					        		点播广告
					        	</s:elseif>
					        	<s:else>
					        		本店介绍
					        	</s:else>
					        </div>
				        </td> --%>
						<!-- 操作 -->
						    <td class="Operating" nowrap="nowrap" width="15%">
						        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>		
						    </td> 
					    </s:if>
					    
					  	<s:else>
					  		<!-- 名称-->
					    <td width="50%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=${item.id}&showFlag=${item.category}&category=${category}"><s:property value="name"/></a>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="50%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.contentType == 1">
				        		Picture
				        	</s:if>
				        	<s:elseif test="#item.contentType == 2">
				        		Video
				        	</s:elseif>
				        	<s:else>
				        		Flash
				        	</s:else>
				        	</div>
				        </td>
				         <td class="Operating" nowrap="nowrap" width="15%">
						        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    </td> 
				        <!-- 所属栏目 -->
				        <%-- <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
					        <s:if test="#item.category == 1">
					        		广告
					        	</s:if>
					        	<s:elseif test="#item.category == 2">
					        		点播广告
					        	</s:elseif>
					        	<s:else>
					        		本店介绍
					        	</s:else>
					        </div>
				        </td> --%>
					  	</s:else>
					 
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<s:if test="#request.showFlag != 1">
							<td colspan="4">
								<div>
								<jsp:include page="/jsp/page.jsp" flush="false">
									<jsp:param value="ad/list.action" name="actionName"/>
								</jsp:include>
								</div>
							</td>
						</s:if>
						<s:else>
							<td colspan="3">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="ad/list.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
						</s:else>
						<%-- <td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="ad/list.action" name="actionName"/>
							</jsp:include>
							</div>
						</td> --%>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>
</s:if>
</body>
</html>

