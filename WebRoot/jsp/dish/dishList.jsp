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
<title>菜品列表</title>
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
			window.location.href = "dish/delete.action?idList=" + id ;
		}
	}
	if(a==2){
		//var lv = document.getElementById("lv").value;
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "dish/delete.action?idList=" + id ;
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
		location.href = "dish/toupdate.action?model.id=" + id ;
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
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">自助服务明细</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">左侧内容</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">消费介绍</a></li>
                      	<%-- <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">师工餐吧？</a></li> --%>
                 	    <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li>
                 	
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="dish/list.action" namespace="/dish" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	名称：
	                              <s:textfield name="model.name" id="name" maxlength="50"></s:textfield>
	                                                                                    分类：
					   			  <s:select name="model.styleId" list="styles" headerKey="" headerValue="全部" listKey="id" listValue="name"></s:select>
	                              <input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" onclick="findIntroduceName();"/>
	         
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                                <a href="<%=basePath%>dish/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
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
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图片</th>
                        <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">分类</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操&nbsp;&nbsp;作</th>
					  </tr>
					  
					 <s:form namespace="/dish" action="dish/delete.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
						
					    <!-- 菜品名称-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="name"/>
				        </div></td>
				        <!-- 图片-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					       <img src="${item.img}" width="200" height="100"/>
				        </div></td>
				         <!--菜品分类-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="style.name"/>
				        </div></td>

						<!-- 操作 -->				
							<td class="Operating" nowrap="nowrap" width="8%">
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
						    </td> 
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="8">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="dish/list.action" name="actionName"/>
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
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">Service</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">Service Detail</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">Left Content</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">Consumption introduced</a></li>
                      	<%-- <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">T work meal?</a></li> --%>
                 	    <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Dish</a></li>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Dish Type</a></li>
                 	
                 	
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="dish/list.action" namespace="/dish" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	Name:
	                              <s:textfield name="model.namee" id="name" maxlength="50"></s:textfield>
	                                                                                 Classification:
					   			  <s:select name="model.styleId" list="styles" headerKey="" headerValue="all" listKey="id" listValue="name"></s:select>
	                              <input type="submit" value="search" class="Sear" style="margin-left:10px" onclick="findIntroduceName();"/>
	         
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                                <a href="<%=basePath%>dish/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> add</a>
	                              	 	<a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> delete</a>

	                              	 </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">name</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">picture</th>
                        <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">classification</th>
					    <th scope="col" width="8%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >operation</th>
					  </tr>
					  
					 <s:form namespace="/dish" action="dish/delete.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <td class="check" width="2%"><input type="checkbox" class="checkCls" id="shopIntroduceId" name="idList" value="${id}"/></td>
						
					    <!-- 菜品名称-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="namee"/>
				        </div></td>
				        <!-- 图片-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					       <img src="${item.img}" width="200" height="100"/>
				        </div></td>
				         <!--菜品分类-->
				        <td width="15%" height="15" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" ><div align="center">
					        <s:property value="style.namee"/>
				        </div></td>

						<!-- 操作 -->				
							<td class="Operating" nowrap="nowrap" width="8%">
						    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
						    </td> 
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="8">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="dish/list.action" name="actionName"/>
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


