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
	//添加
	function add(){
		window.location.href = "<%=basePath%>device/adddeviceAction.action";	
	}

	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?(如果正在使用，则无法删除)")) {
			window.location.href = "deviceCategory/delete.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?(if you are using, cannot delete)")) {
			window.location.href = "deviceCategory/delete.action?idList="+id;
		}
	}
}
	//删除
	function delBatch(){if(a==1){
		if(window.confirm("确定要删除吗?(如果正在使用，则无法删除)")){
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if(window.confirm("Sure you want to delete?(if you are using, cannot delete)")){
			document.getElementById("delForm").submit();
		}
	}
	}
	
	//编辑
	function edit(id){
		location.href = "deviceCategory/toupdate.action?id="+id;
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
                     <li><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li  class="currentHover"><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                         <li><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/deviceCategory">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>deviceCategory/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"  width="83%" nowrap="nowrap">分类名称</th>
					    <th scope="col" width="15%" nowrap="nowrap">操作</th>
					  </tr>
					  
					 <s:form namespace="/deviceCategory" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap"><s:property value="name" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%" >
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
								<jsp:param value="deviceCategory/list.action" name="actionName"/>
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
                     <li><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li  class="currentHover"><a href="<%=basePath%>deviceCategory/list.action">Terminal Type</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">Terminal Layout</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">Other Settings</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/deviceCategory">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>deviceCategory/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"  width="83%" nowrap="nowrap">Category name</th>
					    <th scope="col" width="15%" nowrap="nowrap">Operation</th>
					  </tr>
					  
					 <s:form namespace="/deviceCategory" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 姓名 -->
					    <td nowrap="nowrap"><s:property value="name" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%" >
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
								<jsp:param value="deviceCategory/list.action" name="actionName"/>
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
