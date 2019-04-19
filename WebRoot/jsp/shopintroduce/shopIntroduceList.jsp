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

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
	function del(id) {
	if(a==1){
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
	function delBatch(){
	if(a==1){	
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
		//var lv = document.getElementById("lv").value;
		location.href = "shopintroduce/shopIntroduceAction_edit.action?model.id=" + id ;
	}	
	//预览介绍
	function viewIntroduce(id){
		location.href = "shopintroduce/shopIntroduceAction_viewIntroduce.action?model.id="+id;
	}
	
	function findIntroduceName(){
		var lv = document.getElementById("lv").value;
		//alert(lv);
		sendLv();
		function sendLv(){
			var params = "queryLv=" + lv;
			var exist = false;
			$.ajax({
				type:"POST",
				async:false,
				url:"shopintroduce/shopIntroduceAction_sendLv.action",
				data:params,
				success:function(msg){
					exist = msg.msgBody;
				}
			});
			return exist;
		}
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
                 	
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">自助服务明细</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">左侧内容</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">消费介绍</a></li>
                      	<%-- <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">师工餐吧？</a></li> --%>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li>
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="shopIntroduceAction_home.action" namespace="/shopintroduce" id="searchForm" >
	          <s:if test="#session.lv == 1">
	          	<s:hidden name="model.lv" id="lv"></s:hidden>
	          </s:if>
	           <s:if test="#session.lv == 2">
	           		<s:hidden name="model.parentID"></s:hidden>
	           </s:if>
	           
	           
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	栏目名称：
	                              <s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
	                              <s:if test="#session.lv == 1">
	                              	 <input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                              </s:if>
  									
	                              	<s:if test="#session.lv == 2">
	                              		<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                              		<input type="button"
												value="返&nbsp;回" class="Sear" style="margin-left:10px"
												onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action?model.id=${id}&model.lv=1'" />
				                 	</s:if>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	<a href="<%=basePath%>shopintroduce/shopIntroduceAction_viewShiYiTu.action?model.lv=${lv}"><img alt="" src="res/images/viewShopIntroduce.png"/>示意图</a>
	                              	<!-- 删除 -->
	                                <a href="<%=basePath%>shopintroduce/shopIntroduceAction_add.action?model.lv=${lv}"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 	 <s:if test="#session.shigongcanbaFlag != 1">
	                              	 	<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a>
	                              </s:if> 
	                              	
	                              	 </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					  <s:if test="#session.shigongcanbaFlag != 1">
					  		<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					  		<!-- <th scope="col" width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">顺序</th> -->
					    <th scope="col" width="29%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">栏目名称</th>
					    <th scope="col" width="32%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图片</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">左侧内容</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th>
					  </s:if>
					  <s:else>
					  	<!-- <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th> -->
					  	<!-- <th scope="col" width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">顺序</th> -->
					    <th scope="col" width="39%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">栏目名称</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图片</th>
					    <!-- <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">左侧内容</th> -->
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th>
					  </s:else>
					    <!-- <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="24%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">栏目名称</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">LOGO图片</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">左侧内容</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th> -->
					  </tr>
					  
					 <s:form namespace="/shopintroduce" action="shopIntroduceAction_delByIDs.action?model.lv=" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					   <s:if test="#session.shigongcanbaFlag != 1">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
					    </s:if>
					    <!-- 顺序 -->
				        <%-- <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:property value="#st.index + 1 + pageBean.pageSize * (pageBean.pageNo -1)"/></div>
				        </td> --%>
						
					    <!-- 栏目名称-->
				        <td width="29%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#session.lv == 1">
					        	<s:if test="#item.shigongcanba == 1">
					        	   <s:if test="#item.id== 1">
				        		     <a style="color: blue;" href="<%=basePath%>technician/list.action"><s:property value="name"/></a>
				        		   </s:if>
				        		   <s:else><s:property value="name"/></s:else>
					        		
					        	</s:if>
					        	<s:else>
					        		<a style="color: blue;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.parentID=${id}&model.lv=2"><s:property value="name"/></a>
					        	</s:else>
					        </s:if>
					        <s:if test="#session.lv == 2">
					        	<s:property value="name"/>
					        </s:if>
				        <%-- <a style="color: blue;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.id=${id}&model.lv=2"><s:property value="name"/></a> --%>
				        </div></td>
				        <!-- logo图片 -->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><img src="${item.logo}" width="200" height="100"/></div></td>
						<!-- 左侧内容 -->
						<s:if test="#session.shigongcanbaFlag != 1">
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
				        	<div align="center" class="texthidden_150">
				        		<s:if test="#item.adid == null">
				        			无
				        		</s:if>
				        		<s:else>
				        			${ad.name}
				        		</s:else>
				        	</div>
				        </td>
						</s:if>
						<!-- 操作 -->				
						<s:if test="#session.lv == 1">  
							<td class="Operating" nowrap="nowrap" width="15%">
						    	<!-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> -->
						    	<%-- <s:if test="#session.lv == 2">
						    		<a href="javascript:viewIntroduce(${item.id})"><img alt="" src="res/images/viewShopIntroduce.png"/>【预览】</a>
						    	</s:if> --%>
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    	<%-- <s:if test="#session.shigongcanbaFlag != 1">
						    		<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
						    	</s:if>	 --%>
						    </td> 
						</s:if> 
						<s:if test="#session.lv == 2">
					    <td class="Operating" nowrap="nowrap" width="22%">
					    	<!-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> -->
					    	<a href="javascript:viewIntroduce(${item.id})"><img alt="" src="res/images/viewShopIntroduce.png"/>【预览】</a>
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<%-- <a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a> --%>
					    </td>
					    </s:if>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="6">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_home.action" name="actionName"/>
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
                 	
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">Service</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">Service Detail</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">Left Content</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">Consumption Introduced</a></li>
                      	<%-- <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">师工餐吧？</a></li> --%>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Dish</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Dish Type</a></li>
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post"  action="shopIntroduceAction_home.action" 
	           						namespace="/shopintroduce" id="searchForm" >
	          <s:if test="#session.lv == 1">
	          		<s:hidden name="model.lv" id="lv"></s:hidden>
	          </s:if>
	           <s:if test="#session.lv == 2">
	           		<s:hidden name="model.parentID"></s:hidden>
	           </s:if>
	           
	           
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	Name:
	                              <s:textfield name="model.namee" id="name" maxlength="50"></s:textfield>
	                              <s:if test="#session.lv == 1">
	                              	 <input type="submit" value="Search" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                              </s:if>
  									
	                              	<s:if test="#session.lv == 2">
	                              		<input type="submit" value="Search" class="Sear" style="margin-left:10px" onclick="findIntroduceName()"/>
	                              		<input type="button"
												value="return" class="Sear" style="margin-left:10px"
												onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action?model.id=${id}&model.lv=1'" />
				                 	</s:if>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	<a href="<%=basePath%>shopintroduce/shopIntroduceAction_viewShiYiTu.action?model.lv=${lv}"><img alt="" src="res/images/viewShopIntroduce.png"/>Sketch map</a>
	                              	
	                                <a href="<%=basePath%>shopintroduce/shopIntroduceAction_add.action?model.lv=${lv}"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 	<%-- <s:if test="#session.shigongcanbaFlag != 1">
	                              	 	<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a>
	                              </s:if> --%>
	                              	
	                              	 </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					  <s:if test="#session.shigongcanbaFlag != 1">
					  		<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					  		<!-- <th scope="col" width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">顺序</th> -->
					    <th scope="col" width="29%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Column name</th>
					    <th scope="col" width="32%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Image</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Left content</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </s:if>
					  <s:else>
					  		<!-- <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th> -->
					  		<!-- <th scope="col" width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">顺序</th> -->
					    <th scope="col" width="39%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Column name</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Image</th>
					    <!-- <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">左侧内容</th> -->
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th>
					  </s:else>
					    <!-- <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="24%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">栏目名称</th>
					    <th scope="col" width="37%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">LOGO图片</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">左侧内容</th>
					    <th scope="col" width="22%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th> -->
					  </tr>
					  
					 <s:form namespace="/shopintroduce" action="shopIntroduceAction_delByIDs.action?model.lv=" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					   <s:if test="#session.shigongcanbaFlag != 1">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
					    </s:if>
					    <!-- 顺序 -->
				        <%-- <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:property value="#st.index + 1 + pageBean.pageSize * (pageBean.pageNo -1)"/></div>
				        </td> --%>
						
					    <!-- 栏目名称-->
				        <td width="29%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:if test="#session.lv == 1">
					        	<s:if test="#item.shigongcanba == 1">
					        	   <s:if test="#item.id== 1">
				        		     <a style="color: blue;" href="<%=basePath%>technician/list.action"><s:property value="namee"/></a>
				        		   </s:if>
				        		   <s:else><s:property value="namee"/></s:else>
					        		
					        	</s:if>
					        	<s:else>
					        		<a style="color: blue;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.parentID=${id}&model.lv=2"><s:property value="namee"/></a>
					        	</s:else>
					        </s:if>
					        <s:if test="#session.lv == 2">
					        	<s:property value="namee"/>
					        </s:if>
				        <%-- <a style="color: blue;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.id=${id}&model.lv=2"><s:property value="name"/></a> --%>
				        </div></td>
				        <!-- logo图片 -->
				        <td width="37%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150"><img src="${item.logo}" width="200" height="100"/></div></td>
						<!-- 左侧内容 -->
						<s:if test="#session.shigongcanbaFlag != 1">
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
				        	<div align="center" class="texthidden_150">
				        		<s:if test="#item.adid == null">
				        			nothing
				        		</s:if>
				        		<s:else>
				        			${ad.name}
				        		</s:else>
				        	</div>
				        </td>
						</s:if>
						<!-- 操作 -->				
						<s:if test="#session.lv == 1">  
							<td class="Operating" nowrap="nowrap" width="15%">
						    	<!-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> -->
						    	<%-- <s:if test="#session.lv == 2">
						    		<a href="javascript:viewIntroduce(${item.id})"><img alt="" src="res/images/viewShopIntroduce.png"/>【预览】</a>
						    	</s:if> --%>
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    	<%-- <s:if test="#session.shigongcanbaFlag != 1">
						    		<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
						    	</s:if>	 --%>
						    </td> 
						</s:if> 
						<s:if test="#session.lv == 2">
					    <td class="Operating" nowrap="nowrap" width="22%">
					    	<!-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> -->
					    	<a href="javascript:viewIntroduce(${item.id})"><img alt="" src="res/images/viewShopIntroduce.png"/>【Preview】</a>
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<%-- <a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a> --%>
					    </td>
					    </s:if>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="6">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_home.action" name="actionName"/>
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


