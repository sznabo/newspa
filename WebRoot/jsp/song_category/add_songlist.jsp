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
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li class="currentHover"><a  style="white-space: nowrap;">专辑【${songCategory.name}】>>添加歌曲</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:form method="post" action="toAddCategorySong" namespace="/songCategory">
	           <div class="ProgramList_Search" style="height: auto;">
	                         <div class="Search"> 
					   			 &nbsp;歌曲名称：<s:textfield name="song.songName" cssStyle="width:80px;"/>
					   			 &nbsp;歌手：<s:textfield name="song.singer" cssStyle="width:80px;"/>
	                              <input class="Sear" type="submit" value="搜索"/>
	                         </div>
	                         
	                         <div class="add_dar">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void($('#addForm').submit());"><img alt="" src="res/images/Gnome-List-Add-32.png"/>添加到专辑</a>
	                              </div>
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
					 <s:form namespace="/songCategory" action="addSong" method="post" id="addForm">
					  <s:iterator value="songList" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="songIdList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songName" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singer" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="<%=basePath%>songCategory/addSong.action?songIdList=${item.id}&song.categoryId=${song.categoryId}"><img alt="" src="res/images/Modification.png"/>【添加】</a>
					    </td>
					  </tr>
					  
					  </s:iterator>
					  
					</s:form>
					
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
                      <li class="currentHover"><a  style="white-space: nowrap;">The album "${songCategory.name}" > > add songs</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           <s:form method="post" action="toAddCategorySong" namespace="/songCategory">
	           <div class="ProgramList_Search" style="height: auto;">
	                         <div class="Search"> 
					   			 &nbsp;Name of the song:<s:textfield name="song.songName" cssStyle="width:80px;"/>
					   			 &nbsp;Singer:<s:textfield name="song.singer" cssStyle="width:80px;"/>
	                              <input class="Sear" type="submit" value="search"/>
	                         </div>
	                         
	                         <div class="add_dar">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground"> 
	                              	 <a href="javascript:void($('#addForm').submit());"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Added album</a>
	                              </div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'cls')"/> </th>
					    <th scope="col"   nowrap="nowrap">Song name</th>
					    <th scope="col"   nowrap="nowrap">singer</th>
					    <th scope="col" width="10%" nowrap="nowrap">Operation</th>
					  </tr>
					 <s:form namespace="/songCategory" action="addSong" method="post" id="addForm">
					  <s:iterator value="songList" id="item">
					  <tr>
					    <td class="check"><input type="checkbox" class="cls" name="songIdList"  value="${item.id}"/></td>
					    <!-- 歌曲名称 -->
					    <td nowrap="nowrap"><s:property value="songName" /></td>
					    <!-- 歌手 -->	
					    <td nowrap="nowrap"><s:property value="singer" /></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap">
					    	<a href="<%=basePath%>songCategory/addSong.action?songIdList=${item.id}&song.categoryId=${song.categoryId}"><img alt="" src="res/images/Modification.png"/>【添加】</a>
					    </td>
					  </tr>
					  
					  </s:iterator>
					  
					</s:form>
					
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>
</s:if>
</body>
</html>

