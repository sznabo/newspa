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
<title>顶部</title>
<style type="text/css">
</style>

<script type="text/javascript">
function changeRight(url) {
	$(window.parent.document.getElementById("rightFrame")).attr("src", url);
}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<TABLE border="0" width="100%"  align="left">
	<tr>
		<td align="center" width="100%" valign="top" >
			顶部内容
		</td>
	</tr>
</TABLE>
</s:if>
<s:if test="#session.language==2">
<TABLE border="0" width="100%"  align="left">
	<tr>
		<td align="center" width="100%" valign="top" >
			Headings
		</td>
	</tr>
</TABLE>
</s:if>
</body>
</html>

