<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                  	<ul>
                  		<li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">直播分类管理</a></li>
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/toSelect.action">直播类型选择</a></li>
                  	</ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="update" namespace="/liveapk" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="40%" class="listtable">
			<tr>
				<th scope="row" align="right">已选择类型：</th>
				
				<td class="inp">
					[${selectLive.name }]
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">选择直播类型：</th>
				<td class="inp">
					<s:select list="lives" listKey="id" listValue="name" name="model.id" value="selectLive.id ">
						
					</s:select>
				</td>
				
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" class="STYLE1" />
				
				<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                  	<ul>
                  		<li ><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/list.action">Live classification</a></li>
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>liveCategory/toSelect.action">Live type selection</a></li>
                  	</ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="liveCategory/select.action" namespace="/liveapk" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="40%" class="listtable">
			<tr>
				<th scope="row" align="right">Selected type:</th>
				
				<td class="inp">
					[${selectLive.name }]
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Choose to live type:</th>
				<td class="inp">
					<s:select list="lives" listKey="id" listValue="name" name="model.id" value="selectLive.id ">
						
					</s:select>
				</td>
				
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="submit" class="STYLE1" />
				
				<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
</body>
</html>

