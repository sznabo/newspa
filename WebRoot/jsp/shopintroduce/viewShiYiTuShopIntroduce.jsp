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
<style type="text/css">
	#wrap{word-break:break-all; width:500px; overflow:auto;}
</style>
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

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script language="javascript">

$(function(){
	$("ul li").eq(0).css('border-left','1px black solid');
	$("ul li").eq(0).css('border-top','1px black solid');
	$("ul li").eq(1).css('margin-top','202px');
	$("ul li").eq(1).css('border-left','1px black solid');
	$("ul li").eq(2).css('border-top','1px black solid');
	$("ul li").eq(2).css('margin-left','202px');
	$("ul li").eq(3).css('margin-top','202px');
	$("ul li").eq(3).css('margin-left','202px');
	$("ul li").eq(4).css('border-top','1px black solid');
	$("ul li").eq(4).css('margin-left','404px');
	$("ul li").eq(5).css('margin-left','404px');
	$("ul li").eq(5).css('margin-top','202px');

});
</script>
</head>
<body>
<s:if test="#session.language==1">

<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1" ><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">本店介绍</a></li>
                      <li class="currentHover"><a>>>示意图</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_viewShiYiTu.action" namespace="/shopintroduce" method="post">
     <div class="AlonModule_Body"  >
		<table width="10%" class="listtable">
		<ul>
<s:form namespace="/shopintroduce" action="shopIntroduceAction_viewShiYiTu.action" method="post" id="delForm" cssClass="delForm">
	<s:iterator value="pageBean.elements" id="item">
	<li style="background-repeat:no-repeat;"><img src="${item.logo}" width="200" height="160"/><p><s:property value="name"/></p></li>

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
	<li style="top: 406px;width: 600px; border:none;">
<div style="text-align: center;">
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_viewShiYiTu.action" name="actionName"/>
							</jsp:include>
							<input type="button" value="返&nbsp;回" class="Sear" style="position:absolute; top:0px;px; left:480px;" onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action'" />
							</div>
							
	</li>	
</ul>
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
           <div class="AlonModule_Top1" ><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">This shop is introduced</a></li>
                      <li class="currentHover"><a>>>sketch map</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_viewShiYiTu.action" namespace="/shopintroduce" method="post">
     <div class="AlonModule_Body"  >
		<table width="10%" class="listtable">
		<ul>
<s:form namespace="/shopintroduce" action="shopIntroduceAction_viewShiYiTu.action" method="post" id="delForm" cssClass="delForm">
	<s:iterator value="pageBean.elements" id="item">
	<li style="background-repeat:no-repeat;"><img src="${item.logo}" width="200" height="160"/><p><s:property value="name"/></p></li>

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
	<li style="top: 406px;width: 600px; border:none;">
<div style="text-align: center;">
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="shopintroduce/shopIntroduceAction_viewShiYiTu.action" name="actionName"/>
							</jsp:include>
							<input type="button" value="return" class="Sear" style="position:absolute; top:0px;px; left:480px;" onclick="window.location.href='shopintroduce/shopIntroduceAction_home.action'" />
							</div>
							
	</li>	
</ul>
		</table>
     </div>
	</s:form>
</div>
</div>
</div> 
   </s:if>
</body>
</html>

