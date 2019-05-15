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
<meta charset="UTF-8">
<title>Document</title>
<style type="text/css">
*{margin: 0;padding: 0;}
ul{position: relative;height: 404px;width: 610px;margin: 20px auto;}
li{width: 200px;height: 200px;border-right: 1px black solid;border-bottom: 1px black solid;list-style: none;position:absolute;}
/***li:nth-child(1){top: 0;left: 0;border-left: 1px black solid;border-top: 1px black solid;}
li:nth-child(2){top: 202px;left: 0;border-left: 1px black solid;}
li:nth-child(3){top: 0;left: 202px;border-top: 1px black solid;}
li:nth-child(4){top: 202px;left: 202px;}
li:nth-child(5){top: 0;left: 404px;border-top: 1px black solid;}
li:nth-child(6){top: 202px;left: 404px;}
li.one{border-left: 1px black solid;border-top: 1px black solid;}
li.two{margin-top:202px;border-left: 1px black solid;}
li.three{margin-left:202px;border-top: 1px black solid;}

li.fore{margin-top:202px;margin-left:202px;}

li.five{margin-left:404px;border-top: 1px black solid;}

li.six{margin-top:202px;margin-left:404px;}****/
</style>

<script src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="javascript">

$(function(){

	$("ul li").eq(0).css('border-left','1px black solid');
	$("ul li").eq(0).css('border-top','1px black solid');
	if($("ul li").length>2){
	$("ul li").eq(1).css('margin-top','202px');
	$("ul li").eq(1).css('border-left','1px black solid');
	if($("ul li").length>3){
	$("ul li").eq(2).css('border-top','1px black solid');
	$("ul li").eq(2).css('margin-left','202px');
	if($("ul li").length>4){
	$("ul li").eq(3).css('margin-top','202px');
	$("ul li").eq(3).css('margin-left','202px');
	if($("ul li").length>5){
	$("ul li").eq(4).css('border-top','1px black solid');
	$("ul li").eq(4).css('margin-left','404px');
	if($("ul li").length>6){
	$("ul li").eq(5).css('margin-left','404px');
	$("ul li").eq(5).css('margin-top','202px');
	}
	
	}
	}
	}
	
	}
	
	$("#ul1 li:last").css("border","none");
	$("#ul1 li:last").css("position","relative");
	$("#div").css("position","absolute");
	

});
</script>


</head>
<body>
<!-- <p><input type="button" value="返&nbsp;回" class="Sear" style="margin-left:404px" onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action'" /></p> -->
<ul id="ul1" >
<s:form namespace="/shopintroduce" action="shopIntroduceAction_viewShiYiTu" method="post" id="delForm" cssClass="delForm">
	
	<s:iterator value="pageBean.elements" id="item">
	<li style="background-repeat:no-repeat;"><img src="${item.logo}" width="200" height="160"/><p style="text-align: center;"><s:property value="name"/></p></li>

	</s:iterator>

	</s:form>
	<s:if test="#session.lv == 2">
			<s:hidden name="model.parentID"></s:hidden>
			<input type="hidden" name="model.lv" value="2"/>
			<input type="hidden" name="redirectLv" value="${2}"/>
		</s:if>
		<s:else>
			<s:hidden name="model.lv"></s:hidden>
		</s:else>
		
	 <li style="width: 600px;"> 
<div id="div" style="float:left; margin:0px; top:420px ;">
							<p><jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_viewShiYiTu.action" name="actionName"/>
							</jsp:include>
							<input type="button" value="返&nbsp;回" class="Sear" style="position:absolute; top:0px;px; left:380px;" onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action'" />
							</p></div>
							
	</li> 
</ul>
</body>
</html>