<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <base href="<%=basePath%>"></base>
<title>Document</title>
<script src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<style type="text/css">
*{margin: 0;padding: 0;}
ul{position: relative;height: 404px;width: 800px;margin: 20px auto;text-algin:center}
li{width: 200px;height: 200px;position: absolute;border-right: 1px black solid;
	border-bottom: 1px black solid;list-style: none;}
li:nth-child(1){top: 0;left: 0;border-left: 1px black solid;border-top: 1px black solid;}
li:nth-child(2){top: 202px;left: 0;border-left: 1px black solid;}
li:nth-child(3){top: 0;left: 202px;border-top: 1px black solid;}
li:nth-child(4){top: 202px;left: 202px;}
li:nth-child(5){top: 0;left: 404px;border-top: 1px black solid;}
li:nth-child(6){top: 202px;left: 404px;}
</style>
</head>
<body>


<ul>
<s:form namespace="/shopintroduce" action="shopIntroduceAction_viewShiYiTu.action" method="post" id="delForm" cssClass="delForm">
	<s:iterator value="pageBean.elements" id="item">
	<li style="background-repeat:no-repeat;"><s:property value="name"/><img src="${item.logo}" width="200" height="100"/></li>
<!-- 
    <li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
 -->
</s:iterator>
</s:form>
<li style="top: 406px;width: 600px;">
<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_viewShiYiTu.action" name="actionName"/>
							</jsp:include>
							</div>
	</li>								
</ul>

</body>
</html>