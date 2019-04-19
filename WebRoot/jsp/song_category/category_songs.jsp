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
<title>歌曲管理</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function add() {
	var url = "<%=basePath%>songCategory/toAddCategorySong.action";
	window.open(url, "a", "dialogWidth=1200px;dialogHeight=700px;center=yes;");
}

function del(id) {if(a==1){
	if (window.confirm("确定要删除吗?")) {
		window.location.href = "<%=basePath%>songCategory/deleteSong.action?songIdList="+ id ;
	}
}
if(a==2){
	if (window.confirm("Sure you want to delete?")) {
		window.location.href = "<%=basePath%>songCategory/deleteSong.action?songIdList="+ id ;
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
                      <li ><a href="<%=basePath%>songCategory/list.action">专辑管理</a></li>
                      <li class="currentHover"  ><a style="white-space: nowrap;" href="<%=basePath%>songCategory/categorySongs.action?song.categoryId=${song.categoryId}">
                      	专辑【${songCategory.name}】歌曲列表</a>
                      	</li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:form method="post" action="categorySongs" namespace="/songCategory">
	           <s:hidden name="song.categoryId"></s:hidden>
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;歌曲名称：<s:textfield name="song.songName" cssStyle="width:100px"/>
					   			 &nbsp;歌手：<s:textfield name="song.singer"  cssStyle="width:100px"/>
	                              <input class="Sear" type="submit" value="搜&nbsp;索" style="margin-left:10px;"/>
	                              <input type="button" class="Sear" value="返&nbsp;回" class="STYLE1" style="margin-left:10px;" onclick="window.history.go(-1);"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(add(${song.categoryId}));"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"   nowrap="nowrap">歌曲名称</th>
					    <th scope="col"   nowrap="nowrap">歌手</th>
					    <th scope="col" width="10%" nowrap="nowrap">操作</th>
					  </tr>
					  
					 <s:form namespace="/songCategory" action="deleteSong" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="songIdList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songName" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singer" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songCategory/categorySongs.action" name="actionName"/>
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
                      <li><a href="<%=basePath%>song/list.action">Song management</a></li>
                      <li ><a href="<%=basePath%>songCategory/list.action">Album management</a></li>
                      <li class="currentHover"  ><a style="white-space: nowrap;" href="<%=basePath%>songCategory/categorySongs.action?song.categoryId=${song.categoryId}">
                      	Album "${songCategory. Name}" song list</a>
                      	</li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:form method="post" action="categorySongs" namespace="/songCategory">
	           <s:hidden name="song.categoryId"></s:hidden>
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;Song name:<s:textfield name="song.songName" cssStyle="width:100px"/>
					   			 &nbsp;singer：<s:textfield name="song.singer"  cssStyle="width:100px"/>
	                              <input class="Sear" type="submit" value="search" style="margin-left:10px;"/>
	                              <input type="button" class="Sear" value="return" class="STYLE1" style="margin-left:10px;" onclick="window.history.go(-1);"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void(add(${song.categoryId}));"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"   nowrap="nowrap">Song name</th>
					    <th scope="col"   nowrap="nowrap">Singer</th>
					    <th scope="col" width="10%" nowrap="nowrap">Operation</th>
					  </tr>
					  
					 <s:form namespace="/songCategory" action="deleteSong" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="songIdList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songName" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singer" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songCategory/categorySongs.action" name="actionName"/>
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

