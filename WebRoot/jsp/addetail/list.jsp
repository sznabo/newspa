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
	function del(id) { 
		if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "addetail/delete.action?idList="+id;
		}
	}if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "addetail/delete.action?idList="+id;
		}
	}
	}

	//删除
	function delBatch(){
	if(a==1){
		if(window.confirm("确定要删除吗?")){
			document.getElementById("delForm").submit();
		}
	}if(a==2){
		if(window.confirm("Sure you want to delete?")){
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function edit(id,adid){
		location.href = "addetail/toupdate.action?adDetail.id="+id +"&adid="+adid;
	}	
	
	function findAdDetail(){
		//var addetailid = document.getElementById("addetailid").value;
		//var showFlag = document.getElementById("showFlag").value;
		//alert("show" + showFlag);
		location.href = "addetail/list.action";
	}
	
 	function comeBack(){
	 	var addetailid = document.getElementById("addetailid").value;
		var showFlag = document.getElementById("showFlag").value;
		location.href = "ad/list.action?adDetail.id=" + addetailid + "&showFlag=" + showFlag;
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
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">点播广告</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">自助服务</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">左侧内容</a></li>
                 	</s:if>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">【${sessionScope.curAd.name}】明细列表</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="updateContentType" namespace="/addetail">
	           <input type="hidden" name="ad.id" value="${sessionScope.curAd.id}"/>
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         <s:if test="#session.cate != 1">
	                         <font style="color:#818689;margin-left:20px;" >
	                         	内容类型:</font>
	                         	<s:select list="#{1:'图片',2:'视频'}" name="ad.contentType" value="%{#session.curAd.contentType}" />  
	                         	<input class="Sear" type="submit" value="修&nbsp;改"/>
	                         	</s:if>
	                         	<!-- <input type="button" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findAdDetail()"/> -->
	                         	<input type="button" value="返&nbsp;回" class="Sear" style="margin-left:20px"  onclick="comeBack()" />
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>addetail/toadd.action?adid=${adDetail.adid }"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
	                <s:hidden name="showFlag" id="showFlag"></s:hidden>
	                <s:hidden name="adDetail.adid" id="addetailid"></s:hidden>
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="30%" nowrap="nowrap">名称</th>
					    <th scope="col" width="15%" nowrap="nowrap">排序</th>
					    <s:if test="#session.curAd.contentType==1">
					    	<th scope="col" width="23%" nowrap="nowrap">图片</th>
					    </s:if>
					    <s:else>
					    	<th scope="col" width="23%" nowrap="nowrap">视频</th>
					    </s:else>
					    <th scope="col" width="15%" nowrap="nowrap">时间间隔</th>
					    <th scope="col" width="15%">操作</th>
					  </tr>
					  
					 <s:form namespace="/addetail" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap">${item.name}</td>
					    <!-- 排序 -->
					    <td nowrap="nowrap">${item.position}</td>
					    <td nowrap="nowrap">
					    	<!-- 如果是图片直接显示 -->
					    	<s:if test="#session.curAd.contentType==1">
					    		<img src="${item.path}" width="200" height="100"/>
					    	</s:if>
					    	<s:else>
					    		<%-- <a href="<%=basePath%>${item.path}" target="_blank">下载</a> --%>
					    	</s:else>
					    </td>
					    <td nowrap="nowrap">${item.inter}秒</td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id},${adDetail.adid })"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="addetail/list.action" name="actionName"/>
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
                 	<s:if test="#session.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">Advertising</a></li>
                 	</s:if>
                    <s:if test="#session.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Movie</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">On demand</a></li>
                 	</s:if>
                 	<s:if test="#session.showFlag == 3">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">Self-service</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">Left content</a></li>
                 	</s:if>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" href="<%=basePath%>addetail/list.action">【${sessionScope.curAd.name}】明细列表</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="updateContentType" namespace="/addetail">
	           <input type="hidden" name="ad.id" value="${sessionScope.curAd.id}"/>
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         <s:if test="#session.cate != 1">
	                         <font style="color:#818689;margin-left:20px;" >
	                         	Content type:</font>
	                         	<s:select list="#{1:'image',2:'video'}" name="ad.contentType" value="%{#session.curAd.contentType}" />  
	                         	<input class="Sear" type="submit" value="修&nbsp;改"/>
	                         	</s:if>
	                         	<!-- <input type="button" value="搜&nbsp;索" class="Sear" style="margin-left:20px" onclick="findAdDetail()"/> -->
	                         	<input type="button" value="返&nbsp;回" class="Sear" style="margin-left:20px" onclick="comeBack()"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>addetail/toadd.action?adid=${adDetail.adid }"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
	                <s:hidden name="showFlag" id="showFlag"></s:hidden>
	                <s:hidden name="adDetail.adid" id="addetailid"></s:hidden>
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="30%" nowrap="nowrap">Name </th>
					    <th scope="col" width="15%" nowrap="nowrap">Sorting</th>
					    <s:if test="#session.curAd.contentType==1">
					    	<th scope="col" width="23%" nowrap="nowrap">Image</th>
					    </s:if>
					    <s:else>
					    	<th scope="col" width="23%" nowrap="nowrap">Video</th>
					    </s:else>
					    <th scope="col" width="15%" nowrap="nowrap">Time interval</th>
					    <th scope="col" width="15%">Operation</th>
					  </tr>
					  
					 <s:form namespace="/addetail" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap">${item.name}</td>
					    <!-- 排序 -->
					    <td nowrap="nowrap">${item.position}</td>
					    <td nowrap="nowrap">
					    	<!-- 如果是图片直接显示 -->
					    	<s:if test="#session.curAd.contentType==1">
					    		<img src="${item.path}" width="200" height="100"/>
					    	</s:if>
					    	<s:else>
					    		<%-- <a href="<%=basePath%>${item.path}" target="_blank">下载</a> --%>
					    	</s:else>
					    </td>
					    <td nowrap="nowrap">${item.inter}seconds</td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id},${adDetail.adid })"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="addetail/list.action" name="actionName"/>
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

