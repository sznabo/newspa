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
<title>修改留言</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>

<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function save(){if(a==1){

	if($("#title").val().trim() == ""){
		alert("请填写留言标题");
		return false;
	}
	
	/*if($("#startTime").val().trim() == ""){
		alert("请选择消息开始时间");
		return false;
	}
	
	if($("#endTime").val().trim() == ""){
		alert("请选择消息结束时间");
		return false;
	}*/
	
	if($("#content").val().trim() == ""){
		alert("请输入留言内容");
		return false;
	}
	if ($("#content").val().length>250) {
		alert("内容不能大于250个字");
		return false;
	}
	var selectCount = 0;
	$("input[name=idListsave]").each(
			function(){
		        if (this.checked === true) {
		        	selectCount ++;
		        }
	});
	if (selectCount ==0) {
		alert("请选择推送终端");
		return false;
	}	
	return true;
}
if(a==2){

	if($("#title").val().trim() == ""){
		alert("Please fill in the message header");
		return false;
	}
	
	/*if($("#startTime").val().trim() == ""){
		alert("请选择消息开始时间");
		return false;
	}
	
	if($("#endTime").val().trim() == ""){
		alert("请选择消息结束时间");
		return false;
	}*/
	
	if($("#content").val().trim() == ""){
		alert("Please enter the message content");
		return false;
	}
	if ($("#content").val().length>250) {
		alert("Content is not greater than 250 characters");
		return false;
	}
	var selectCount = 0;
	$("input[name=idListsave]").each(
			function(){
		        if (this.checked === true) {
		        	selectCount ++;
		        }
	});
	if (selectCount ==0) {
		alert("Please select a push terminal");
		return false;
	}	
	return true;
}
}
function back(){
	location.href = "servermsg/serverMsgAction_home.action";
}

//树勾选
function selectAll(el,id) {
	$(".check"+id).each(function() {
		this.checked = el.checked;
	});
}
function changeRight(url) {
	 window.parent.document.getElementById("iframepage").src=url;
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
                      <li><a href="<%=basePath%>servermsg/serverMsgAction_home.action">留言信息</a></li>
                      <li class="currentHover"><a>>>修改留言信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="servermsg/serverMsgAction_updateServerMsg.action" method="post">
		<s:hidden name="model.id" value="%{model.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">标题：</th>
				<td class="inp">
					<input name="model.title" id="title" value="${model.title}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">内容：</th>
				<td class="inp">
					<s:textarea name="model.content" id="content" value="%{model.content}" rows="8" cols="50" wrap="20"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
		  <tr>
		    <th scope="row" valign="top" align="right">推送终端：</th>
		    <td valign="top">
				<ul id="authTree">
				 <s:iterator value="deviceCategoryList" id="item">
				   <li>
				   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
				   <ul style="background-color:#EDEBEB;">
				  	    <s:iterator value="devices" id="items">
				  	 	  <li>
				   		   <input class="check${categoryId}" type="checkbox" <s:if test="msgTagdeviceMap[id] != null">checked=true</s:if> name="idListsave" value="${items.id}" />
				   		   <s:property value="userName"/>
				  		 </li>
				   		</s:iterator>
				   </ul>
				   </li>
				  </s:iterator>
				</ul>
		   </td>
		  </tr>			
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit"  value="保存"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
			        <input type="button"  class="back"  value="返回" onclick="back();"/>
			    </td>
			</tr>
		</table>
		</s:form>
     </div>
</div>
<script type="text/javascript" defer="defer">
$("#authTree").treeview({
	collapsed: false
});
</script>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a href="<%=basePath%>servermsg/serverMsgAction_home.action">Message</a></li>
                      <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="servermsg/serverMsgAction_updateServerMsg.action" method="post">
		<s:hidden name="model.id" value="%{model.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">Title:</th>
				<td class="inp">
					<input name="model.title" id="title" value="${model.title}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Content:</th>
				<td class="inp">
					<s:textarea name="model.contente" id="content" value="%{model.contente}" rows="8" cols="50" wrap="20"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
		  <tr>
		    <th scope="row" valign="top" align="right">Push terminal:</th>
		    <td valign="top">
				<ul id="authTree">
				 <s:iterator value="deviceCategoryList" id="item">
				   <li>
				   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
				   <ul style="background-color:#EDEBEB;">
				  	    <s:iterator value="devices" id="items">
				  	 	  <li>
				   		   <input class="check${categoryId}" type="checkbox" <s:if test="msgTagdeviceMap[id] != null">checked=true</s:if> name="idListsave" value="${items.id}" />
				   		   <s:property value="userName"/>
				  		 </li>
				   		</s:iterator>
				   </ul>
				   </li>
				  </s:iterator>
				</ul>
		   </td>
		  </tr>			
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit"  value="save"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
			        <input type="button"  class="back"  value="return" onclick="back();"/>
			    </td>
			</tr>
		</table>
		</s:form>
     </div>
</div>
<script type="text/javascript" defer="defer">
$("#authTree").treeview({
	collapsed: false
});
</script>
</s:if>
</body>
</html>

