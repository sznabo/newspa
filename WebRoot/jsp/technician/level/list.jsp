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
<title>技师级别列表</title>
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
			window.location.href = "appInfo/delete.action?idList="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "appInfo/delete.action?idList="+id;
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
		location.href = "technicianLevel/toupdate.action?model.id="+id;
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
                    <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">技师浏览</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">类型管理</a></li>
                    <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">级别管理</a></li>
                    
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/technicianLevel">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>technicianLevel/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
					  </tr>
					  
					 <s:form namespace="/technicianLevel" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 名称-->
					    <td nowrap="nowrap">${item.name}</td>
					    <!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="3">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="technicianLevel/list.action" name="actionName"/>
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
                    <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">Technician to browse</a></li>
                    <li ><a style="white-space: nowrap;" href="<%=basePath%>technicianType/list.action">Type management</a></li>
                    <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>technicianLevel/list.action">Level management</a></li>
                    
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/technicianLevel">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>technicianLevel/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="25%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">name</th>
					    <th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">operation</th>
					  </tr>
					  
					 <s:form namespace="/technicianLevel" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 名称-->
					    <td nowrap="nowrap">${item.namee}</td>
					    <!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="20%">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="3">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="technicianLevel/list.action" name="actionName"/>
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

