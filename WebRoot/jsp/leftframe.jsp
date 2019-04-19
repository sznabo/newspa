<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>左边</title>
<script src="<%=basePath%>res/js/jquery-1.8.3.min.js" type="text/javascript" ></script>
<style type="text/css">
</style>

<script type="text/javascript">
function changeRight(url) {
	$(window.parent.document.getElementById("centerFrame")).attr("src", url);
}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<TABLE border="0" width="100%"  align="left">
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>device/pagedeciveAction.action'));">设备管理</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>message/pagemessageAction.action'));">滚动字幕管理</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>program/list.action'));">节目管理</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>programlist/list.action'));">节目单管理</a>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>programupdatetask/list.action'));">设备内容更新管理</a>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>soft/list.action'));">软件包管理</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>softup/list.action'));">终端升级管理</a>
		</td>
	</tr>
</TABLE>
</s:if>
<s:if test="#session.language==2">
<TABLE border="0" width="100%"  align="left">
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>device/pagedeciveAction.action'));">Equipment management</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>message/pagemessageAction.action'));">Scrolling marquee management</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>program/list.action'));">Program management</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>programlist/list.action'));">The programme management</a>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>programupdatetask/list.action'));">Equipment update content management</a>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>soft/list.action'));">Package management</a>
		</td>
	</tr>
	<tr>
		<td align="center" width="100%" valign="top" style="background-color: #6699FF;height: 30px;line-height: 30px;font-size: 14px;">
			<a href="javascript:void(changeRight('<%=basePath%>softup/list.action'));">Terminal upgrade management</a>
		</td>
	</tr>
</TABLE>
</s:if>
</body>
</html>

