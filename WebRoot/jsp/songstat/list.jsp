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
<title>歌曲点击统计</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                       <li  class="currentHover"><a href="<%=basePath%>songstat/list.action">歌曲点击统计</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/songstat">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;设备ID：<s:textfield name="songStat.mac" cssStyle="width:100px"/>
					   			 &nbsp;用户名：<s:textfield name="songStat.userName"  cssStyle="width:100px"/>
					   			 &nbsp;歌曲名称：<s:textfield name="songStat.songName"  cssStyle="width:100px"/>
					   			&nbsp;时间： <input  name="songStat.startTime" value="<s:date name="songStat.startTime" format="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
					   						-
					   						<input  name="songStat.endTime" value="<s:date name="songStat.endTime" format="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
	                              <input class="Sear" type="submit" value="搜索" style="margin-left:10px;"/>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col"   nowrap="nowrap">设备ID</th>
					    <th scope="col"   nowrap="nowrap">用户名</th>
					    <th scope="col"   nowrap="nowrap">歌曲名称</th>
					    <th scope="col"   nowrap="nowrap">时间</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					     <td nowrap="nowrap">${item.mac}</td>
					     <td nowrap="nowrap">${item.userName}</td>
					     <td nowrap="nowrap">${item.songName}</td>
					     <td nowrap="nowrap"><s:date name="#item.time" format="yyyy-MM-dd HH:mm:ss" /> </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songstat/list.action" name="actionName"/>
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
                       <li  class="currentHover"><a href="<%=basePath%>songstat/list.action">Song click statistics</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
          <div class="AlonModule_list">
	           
	           <s:form method="post" action="list" namespace="/songstat">
	           <div class="ProgramList_Search">
	                         <div class="Search"> 
					   			 &nbsp;&nbsp;&nbsp;Device ID：<s:textfield name="songStat.mac" cssStyle="width:100px"/>
					   			 &nbsp;User name:<s:textfield name="songStat.userName"  cssStyle="width:100px"/>
					   			 &nbsp;Name of the song:<s:textfield name="songStat.songName"  cssStyle="width:100px"/>
					   			&nbsp;Time: <input  name="songStat.startTime" value="<s:date name="songStat.startTime" format="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
					   						-
					   						<input  name="songStat.endTime" value="<s:date name="songStat.endTime" format="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
	                              <input class="Sear" type="submit" value="search" style="margin-left:10px;"/>
	                         </div>
	           </div>
	           </s:form>
	           
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <tr class="TableTitle">
					    <th scope="col"   nowrap="nowrap">Device ID</th>
					    <th scope="col"   nowrap="nowrap">User name</th>
					    <th scope="col"   nowrap="nowrap">Song name</th>
					    <th scope="col"   nowrap="nowrap">time</th>
					  </tr>
					  
					 <s:form namespace="/song" action="delete" method="post" id="delForm">
					  <s:iterator value="pageBean.elements" id="item">
					  <tr>
					     <td nowrap="nowrap">${item.mac}</td>
					     <td nowrap="nowrap">${item.userName}</td>
					     <td nowrap="nowrap">${item.songName}</td>
					     <td nowrap="nowrap"><s:date name="#item.time" format="yyyy-MM-dd HH:mm:ss" /> </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="10">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="songstat/list.action" name="actionName"/>
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

