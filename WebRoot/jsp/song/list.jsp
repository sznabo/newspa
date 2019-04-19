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
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
$(function() {
if(a==1){
	
}else if(a==2){
  $("input[type=file]").filestyle({
          image: "<%=basePath%>/res/images/file.png",
          imageheight : 22,
          imagewidth : 82,
          width : 150
      });
}
    
});
function del(id) {if(a==1){
	if (window.confirm("确定要删除吗?")) {
		window.location.href = "song/delete.action?idList="+id;
	}
}
if(a==2){
	if (window.confirm("Sure you want to delete?")) {
		window.location.href = "song/delete.action?idList="+id;
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

//删除歌词
function delLyricFile(id){if(a==1){
	if(window.confirm("确定要删除歌词吗?")){
		location.href = "song/delLyricFile.action?id="+id;
	}
}
if(a==2){
	if(window.confirm("Sure you want to delete the lyrics?")){
		location.href = "song/delLyricFile.action?id="+id;
	}
}
}

//编辑
function edit(id){
	location.href = "song/toupdate.action?id="+id;
}	

function macLead(){if(a==1){
  var xls = document.getElementById('xls').value;
  if(xls!=null&&xls.replace(/\s/g,"")!=""){
  var type = xls.split(".");
  if(type[1]=='xls'){
		return true;
	}else{
		document.getElementById('error2').innerHTML = "&nbsp;&nbsp;请选择标准的excel文件";
		return false;
	}
	}else{
		document.getElementById('error2').innerHTML = "&nbsp;&nbsp;请选择标准的excel文件";
		return false;
	}
	return false;
	}
	if(a==2){
  var xls = document.getElementById('xls').value;
  if(xls!=null&&xls.replace(/\s/g,"")!=""){
  var type = xls.split(".");
  if(type[1]=='xls'){
		return true;
	}else{
		document.getElementById('error2').innerHTML = "&nbsp;&nbsp;Please select a standard excel file";
		return false;
	}
	}else{
		document.getElementById('error2').innerHTML = "&nbsp;&nbsp;Please select a standard excel file";
		return false;
	}
	return false;
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
                      <li class="currentHover"><a href="<%=basePath%>song/list.action">歌曲管理</a></li>
                      <li ><a href="<%=basePath%>songCategory/list.action">专辑管理</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/song">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;歌曲名称：<s:textfield name="song.songName" cssStyle="width:100px"/>
					   			 &nbsp;歌手：<s:textfield name="song.singer"  cssStyle="width:100px"/>
	                              <input class="Sear" type="submit" value="搜&nbsp;索" style="margin-left:10px"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>song/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	            <s:form action="macRead" namespace="/song" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="批量导入" onclick="return macLead();" style="margin-left:70px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">导入成功！</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">导入失败！请检查格式</span></s:elseif>
		  		   </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="41%"  nowrap="nowrap">歌曲名称</th>
					    <th scope="col" width="42%"  nowrap="nowrap">歌手</th>
					    <!-- <th scope="col" width="15%"  nowrap="nowrap">歌曲文件</th> -->
					    <th scope="col" width="15%" nowrap="nowrap">操作</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songName" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singer" /></td>
					    <%-- <!--歌曲文件-->
					    <td nowrap="nowrap" align="center">
					    		<a href="<%=basePath%>${item.musicFile}" target="_blank">下载</a>
					    </td> --%>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="4">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="song/list.action" name="actionName"/>
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
                      <li class="currentHover"><a href="<%=basePath%>song/list.action">Song</a></li>
                      <li ><a href="<%=basePath%>songCategory/list.action">Album</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/song">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;Name:<s:textfield name="song.songNamee" cssStyle="width:100px"/>
					   			 &nbsp;Singer:<s:textfield name="song.singere"  cssStyle="width:100px"/>
	                              <input class="Sear" type="submit" value="search" style="margin-left:10px"/>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="<%=basePath%>song/toadd.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delBatch());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	            <s:form action="macRead" namespace="/song" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="Import" onclick="return macLead();" style="margin-left:70px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">Import success!</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">The import failed!Please check the format</span></s:elseif>
		  		   </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col" width="41%"  nowrap="nowrap">Song name</th>
					    <th scope="col" width="42%"  nowrap="nowrap">Singer</th>
					    <!-- <th scope="col" width="15%"  nowrap="nowrap">歌曲文件</th> -->
					    <th scope="col" width="15%" nowrap="nowrap">Operation</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="idList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songNamee" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singere" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="javascript:edit(${item.id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="4">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="song/list.action" name="actionName"/>
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

