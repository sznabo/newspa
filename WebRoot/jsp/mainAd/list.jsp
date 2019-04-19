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
		location.href = "mainAd/toupdate.action?ad.id="+id;
	}	
	//查询
	function findLiveManagementName(){
		document.getElementById("searchForm").submit();
	}
	
	//删除
	function delBatch(){if(a==1){
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
		
		if(window.confirm("确定要删除吗?")){
			
		 document.getElementById("delForm").submit();
			
		}
	}
	if(a==2){
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
		
		if(window.confirm("Sure you want to delete?")){
			
		 document.getElementById("delForm").submit();
			
		}
	}
	}
	//编辑
	function editNew(id){
		location.href = "mainAd/toUpdate.action?model.id=" + id;
	}
	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			//var showFlag = document.getElementById("showFlag");
			window.location.href = "mainAd/delete.action?idList=" + id ;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			//var showFlag = document.getElementById("showFlag");
			window.location.href = "mainAd/delete.action?idList=" + id ;
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
               		<li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                    <li><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
               	    <li class="currentHover"><a href="<%=basePath%>mainAd/list.action">主屏广告</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">  
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
                              	 <a href="<%=basePath%>mainAd/toAdd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a> </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
           		</div> 
           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    	<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    	<th scope="col" width="42%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">内容类型</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">间隔时间（s）</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">排序号</th>
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >操作</th> 
					  </tr>
					 <s:form namespace="/mainAd" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					  	
					  	<td class="check" width="2%"><input type="checkbox" class="checkCls" id="adId" name="idList" value="${id}"/></td>
					   <!-- 名称-->
					    <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="name"/>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="41%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.type == 1">
				        		图片
				        	</s:if>
				        	<s:elseif test="#item.type == 2">
				        		视频
				        	</s:elseif>
				        	</div>
				        </td>
				        <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="inter"/>
					    	</div>
					   </td>
				       <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="position"/>
					    	</div>
					   </td>
						<!-- 操作 -->
					    <td class="Operating" nowrap="nowrap" width="15%">
					        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>		
					    </td> 
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="6">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="mainAd/list.action" name="actionName"/>
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
               		<li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                    <li><a href="<%=basePath%>ad/list.action?showFlag=1">Ad</a></li>
               	    <li class="currentHover"><a href="<%=basePath%>mainAd/list.action">Home Ad</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">  
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
                              	 <a href="<%=basePath%>mainAd/toAdd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a> </div>
                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
                         </div>
           		</div> 
           </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    	<th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
					    	<th scope="col" width="42%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Name</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Content type</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Time interval between（s）</th>
					    	<th scope="col" width="41%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">Order no.</th>
					    	<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE" >Operation</th> 
					  </tr>
					 <s:form namespace="/ad" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					  	
					  	<td class="check" width="2%"><input type="checkbox" class="checkCls" id="adId" name="idList" value="${id}"/></td>
					   <!-- 名称-->
					    <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="name"/>
					    	</div>
					    </td>
					    
					    <!-- 内容类型-->
				        <td width="41%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center">
				        	<s:if test="#item.type == 1">
				        		Image
				        	</s:if>
				        	<s:elseif test="#item.type == 2">
				                video
				        	</s:elseif>
				        	</div>
				        </td>
				        <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="inter"/>
					    	</div>
					   </td>
				       <td width="42%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
					    	<div align="center">
					    	<s:property value="position"/>
					    	</div>
					   </td>
						<!-- 操作 -->
					    <td class="Operating" nowrap="nowrap" width="15%">
					        <a href="javascript:editNew(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>		
					    </td> 
					  </tr>
					  </s:iterator>
					</s:form>
					
					<tr>
						<td colspan="6">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="mainAd/list.action" name="actionName"/>
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

