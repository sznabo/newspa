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
	if (window.confirm("确定要删除吗（如果内部存在关联子文件则无法删除）?")) {
			window.location.href = "admin/vodPartAction_delVodPartByIDs.action?idList="+id;
		}
	}
	else if(a==2){
	if (window.confirm("Sure you want to delete it (if the internal link between a file cannot delete)?")) {
			window.location.href = "admin/vodPartAction_delVodPartByIDs.action?idList="+id;
		}
	}
		
	}

	//删除
	function delBatch(){if(a==1){
		if(window.confirm("确定要删除吗（如果内部存在关联子文件则无法删除）?")){
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}if(a==2){
		if(window.confirm("Sure you want to delete it (if the internal link between child cannot delete file）?")){
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	}
	//编辑
	function edit(id){
		location.href = "admin/vodPartAction_toUpdatePage.action?id="+id;
	}	
	
	function findVodpartName(){
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
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2&firstFlag=true">点播广告</a></li> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>play/list.action">切换播放引擎</a></li> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>movieSource/list.action">切换电影源</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="vodPartAction_listVodPart" namespace="/admin" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              <s:textfield name="vodpartName" id="vodpartName" maxlength="50"></s:textfield>
  									<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" onclick="findVodpartName()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>admin/vodPartAction_skip.action?type=goaddVodPart"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="40%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">图片</th> 
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					  
					 <s:form namespace="/admin" action="vodPartAction_delVodPartByIDs" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr id="otd">
					    <td class="check"><input type="checkbox" class="checkCls" id="vodPartId" name="idList" value="${id}"/></td>
					    <!-- 直播名称 -->
				        <td width="40%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" name="vodpartname"><div align="center">
				        <a style="color: blue;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action?model.vodpartid=${id}"><s:property value="vodpartname"/></a>
				        </div></td>
				        <!-- 图片 -->
				        <td height="30" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        <img src="<%=basePath%>${item.img}" align="middle" width="200" height="100" />
				        </div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" />【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="4">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="admin/vodPartAction_listVodPart.action" name="actionName"/>
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
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2&firstFlag=true">Demand Ad</a></li> 
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="vodPartAction_listVodPart" namespace="/admin" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              <s:textfield name="vodpartNamee" id="vodpartName" maxlength="50"></s:textfield>
  									<input type="submit" value="Search" class="Sear" style="margin-left:10px" onclick="findVodpartName()"/>
	                              	
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>admin/vodPartAction_skip.action?type=goaddVodPart"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    <th scope="col" width="40%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    <th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Image</th> 
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Operation</th>
					  </tr>
					  
					 <s:form namespace="/admin" action="vodPartAction_delVodPartByIDs" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr id="otd">
					    <td class="check"><input type="checkbox" class="checkCls" id="vodPartId" name="idList" value="${id}"/></td>
					    <!-- 名称 -->
				        <td width="40%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE" name="vodpartname"><div align="center">
				        <a style="color: blue;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action?model.vodpartid=${id}"><s:property value="vodpartnamee"/></a>
				        </div></td>
				        <!-- 图片 -->
				        <td height="30" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center" class="texthidden_150">
				        <img src="<%=basePath%>${item.img}" align="middle" width="200" height="100" />
				        </div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" />【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="4">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="admin/vodPartAction_listVodPart.action" name="actionName"/>
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


