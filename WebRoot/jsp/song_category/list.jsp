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
<title>歌曲分类列表</title>
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
			window.location.href = "songCategory/delete.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "songCategory/delete.action?idList="+id;
		}
	}
	}

	//删除
	function delBatch(){if(a==1){
		if(window.confirm("确定要删除吗?")){
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if(window.confirm("Sure you want to delete?")){
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function edit(id){
		location.href = "songCategory/toupdate.action?id="+id;
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
                      <li><a href="<%=basePath%>song/list.action">歌曲管理</a></li>
                      <li class="currentHover"><a href="<%=basePath%>songCategory/list.action">专辑管理</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/songCategory">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>songCategory/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"  width="83%" nowrap="nowrap">专辑名称</th>
					    <th scope="col" width="15%" nowrap="nowrap">操作</th>
					  </tr>
					 <s:form namespace="/songCategory" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap"> <a style="color: blue;" href="<%=basePath%>songCategory/categorySongs.action?first=1&song.categoryId=${item.id}"><s:property value="name" /></a></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songCategory/list.action" name="actionName"/>
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
                      <li><a href="<%=basePath%>song/list.action">Song</a></li>
                      <li class="currentHover"><a href="<%=basePath%>songCategory/list.action">Album</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/songCategory">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>songCategory/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"  width="83%" nowrap="nowrap">Name</th>
					    <th scope="col" width="15%" nowrap="nowrap">operation</th>
					  </tr>
					 <s:form namespace="/songCategory" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap"> <a style="color: blue;" href="<%=basePath%>songCategory/categorySongs.action?first=1&song.categoryId=${item.id}"><s:property value="namee" /></a></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songCategory/list.action" name="actionName"/>
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

