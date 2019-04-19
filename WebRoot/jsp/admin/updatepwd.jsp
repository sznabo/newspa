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
function checkForm() {if(a==1){
	if (isValEmpty("oldpwd")) {
		alert("请输入旧密码");
		return false;
	}
	if (isValEmpty("newpwd1")) {
		alert("请输入新密码");
		return false;
	}
	if (isValEmpty("newpwd2")) {
		alert("请输入确认新密码");
		return false;
	}
	if ($("#newpwd1").val() != $("#newpwd2").val()) {
		alert("两次输入的新密码不一致");
		return false;
	}
	return true;
}if(a==2){
	if (isValEmpty("oldpwd")) {
		alert("Please enter the old password");
		return false;
	}
	if (isValEmpty("newpwd1")) {
		alert("Please enter a new password");
		return false;
	}
	if (isValEmpty("newpwd2")) {
		alert("Please confirm the new password input");
		return false;
	}
	if ($("#newpwd1").val() != $("#newpwd2").val()) {
		alert("Enter a new password twice");
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
                      <li class="currentHover"><a>修改密码</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	<s:form action="updatePwd" namespace="/admin" method="post" onsubmit="return checkForm();">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">旧密码：</th>
				<td class="inp">
					<input name="oldpwd" maxlength="30" id="oldpwd" type="password" />
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">新密码：</th>
				<td class="inp">
					<input type="password" name="newpwd" maxlength="30" id="newpwd1"/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">确认新密码：</th>
				<td class="inp">
					<input  type="password" maxlength="30" id="newpwd2"/>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp; <input type="reset"  value="重置" />
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
                      <li class="currentHover"><a>Change the password</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	<s:form action="updatePwd" namespace="/admin" method="post" onsubmit="return checkForm();">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">The old password:</th>
				<td class="inp">
					<input name="oldpwd" maxlength="30" id="oldpwd" type="password" />
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">The new password:</th>
				<td class="inp">
					<input type="password" name="newpwd" maxlength="30" id="newpwd1"/>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Confirm new password:</th>
				<td class="inp">
					<input  type="password" maxlength="30" id="newpwd2"/>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" value="save"/>&nbsp;&nbsp;&nbsp; <input type="reset"  value="reset" />
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

