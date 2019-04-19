<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html>
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SPA后台管理系统</title>
 <link rel="stylesheet" href="<%=basePath%>res/css/signIn.css"></link>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<style type="text/css">
	body {
		font-size: 11px;
	}
</style>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
	function init() {
		loadTopWindow();
		document.getElementById('loginName').focus();
		
	}
	function check() {
		return true;
	}

	function checkForm() {if(a==1){
		if (isValEmpty("loginName")) {
			alert("请输入用户名");
			return false;
		}
		if (isValEmpty("password")) {
			alert("请输入密码");
			return false;
		}
		return true;
	}
	if(a==2){
		if (isValEmpty("loginName")) {
			alert("Please enter your user name");
			return false;
		}
		if (isValEmpty("password")) {
			alert("Please enter the password");
			return false;
		}
		return true;
	}
	
	}

	function loadTopWindow(){
		if (window.top!=null && window.top.document.URL!=document.URL){
			window.top.location= document.URL; 
		}
	}
	
</script>
</head>

<body onload="init();" style="margin:0; font-family:'微软雅黑'; background:#5c9cd7;">

<div class="Signin">
      <div class="Signin_Top">纳博水疗管理系统</div>
      <div class="Signin_body">
          <s:form method="post" action="adminLogin" namespace="/admin" onsubmit="return checkForm();">

               <div class="inp"> <input type="text" name="admin.loginName" value="${admin.loginName}" class="username" id="loginName"></input></div>
               <div class="inp"><input type="password" name="admin.password" value="${admin.password}" class="password" id="password" ></input></div>
               <div style=" color:#728189; font-family: '苹方 中等'; font-size:16px; margin-left: -70px; ">语 &nbsp;言:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:select list="#{1:'中文',2:'English'}"  name="language" id="language"  /></div>
               <div> <button type="submit" > 登&nbsp;&nbsp;陆</button></div> 
          </s:form>
          </div>
          <s:if test="hasErrors()">
          <div style="width: 300px;padding-top: 50px;margin:auto;">
          	<s:actionerror cssStyle="font-size: 13px;text-align:center;color:orange;"/>
          </div>
          </s:if>
          <div class="copyright" >Copyright &copy; 2012 - 2016 . All Rights Reserved &nbsp;</div>
</div>

</body>

</html>

