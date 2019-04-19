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
<title>添加节目</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<style type="text/css">
</style>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function checkForm() {
if(a==1){
	if (isValEmpty("userName")) {
		alert("请输入姓名");
		return false;
	}
	if (isValEmpty("loginName")) {
		alert("请输入登陆名");
		return false;
	}
	if (isValEmpty("password")) {
		alert("请输入密码");
		return false;
	}
	return true;
}if(a==2){
	if (isValEmpty("userName")) {
		alert("Please enter your name");
		return false;
	}
	if (isValEmpty("loginName")) {
		alert("Please enter login name");
		return false;
	}
	if (isValEmpty("password")) {
		alert("Please enter the password");
		return false;
	}
	return true;
}
}

</script>
</head>

<body>
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li  ><a href="<%=basePath%>admin/list.action">管理员</a></li>
                      <li class="currentHover"><a>新增管理员</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	<s:form action="save" namespace="/admin" method="post" onsubmit="return checkForm();">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">姓名：</th>
				<td class="inp">
					<input type="text" name="admin.userName" maxlength="30" id="userName" value=""/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">登陆名：</th>
				<td class="inp">
					<input type="text" name="admin.loginName" maxlength="30" id="loginName" value=""/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">密码：</th>
				<td class="inp">
					<input type="password" maxlength="30" id="password" name="admin.password" value=""/>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp; <input type="button" value="返回" onclick="window.location.href='<%=basePath%>admin/list.action'"/>
			    </td>
			</tr>
			<s:if test="hasErrors()">
			<tr>
				<td>&nbsp;</td>
				<td>
					<s:actionerror/>
				</td>
			</tr>
			</s:if>
			<s:if test="hasActionMessages()">
				<tr>
				<td>&nbsp;</td>
				<td>
					<s:actionmessage/>
				</td>
			</tr>
			</s:if>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li  ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
                      <li class="currentHover"><a>Add</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	<s:form action="save" namespace="/admin" method="post" onsubmit="return checkForm();">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input type="text" name="admin.userName" maxlength="30" id="userName" value=""/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Login name:</th>
				<td class="inp">
					<input type="text" name="admin.loginName" maxlength="30" id="loginName" value=""/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Password:</th>
				<td class="inp">
					<input type="password" maxlength="30" id="password" name="admin.password" value=""/>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" value="save"/>&nbsp;&nbsp;&nbsp; <input type="button" value="return" onclick="window.location.href='<%=basePath%>admin/list.action'"/>
			    </td>
			</tr>
			<s:if test="hasErrors()">
			<tr>
				<td>&nbsp;</td>
				<td>
					<s:actionerror/>
				</td>
			</tr>
			</s:if>
			<s:if test="hasActionMessages()">
				<tr>
				<td>&nbsp;</td>
				<td>
					<s:actionmessage/>
				</td>
			</tr>
			</s:if>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
</body>
</html>

