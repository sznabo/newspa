<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>
		<title>升级任务管理</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
  		<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
		<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
		<!-- 树 -->
		<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
		<script src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js" type="text/javascript"></script>
		<script language="javascript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
		<script src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js" type="text/javascript"></script>
		<script src="<%=basePath%>res/js/common.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<%=basePath%>css/common.css" />
	</head>
	<script type="text/javascript">
	var a = <%=session.getAttribute("language")%>
	function selectAll(el,id) {
		$(".check"+id).each(function() {
			this.checked = el.checked;
		});
	}
	function selectOption(string1)
	{
	  window.document.getElementById("version").value=string1;
	}
	function checkForm() {if(a==1){
	if (isValEmpty("name")) {
		alert("请输入名称");
		return false;
	}

	if (isValEmpty("startTime")) {
		alert("请输开始时间");
		return false;
	}
	if (isValEmpty("endTime")) {
		alert("请输结束时间");
		return false;
	}
	if ($("soft").val() == "") {
		alert("请选择软件包");
		return false;
	}
	if ($('#remark').val().length > 250) {
		alert("描述不能超过250个字符");
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
		alert("请勾选要更新的设备");
		return false;
	}
	return true;
   }
   if(a==2){
	if (isValEmpty("name")) {
		alert("Please enter a name");
		return false;
	}

	if (isValEmpty("startTime")) {
		alert("Please start time");
		return false;
	}
	if (isValEmpty("endTime")) {
		alert("Please lose over time");
		return false;
	}
	if ($("soft").val() == "") {
		alert("Please select a package");
		return false;
	}
	if ($('#remark').val().length > 250) {
		alert("Description cannot exceed 250 characters");
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
		alert("Please check the update of equipment");
		return false;
	}
	return true;
   }
   }
		function changeRight(url) {
	 window.parent.document.getElementById("iframepage").src=url;
	}
	</script>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>softup/list.action">升级管理</a></li>
                         <li class="currentHover"><a>>>增加升级任务</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
   <s:form action="save"  namespace="/softup"  method="post" enctype="multipart/form-data"   onsubmit="return checkForm();">
   <table width="98%" class="listtable">
  <tr class="TableTitle">
    <th scope="row"  width="10%" >名称：</th>
    <td class="inp">
    <input type="text" name="softUpdateTask.name" maxlength="30"  id="name"/>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row">软件包：</th>
    <td class="inp">
    	<s:select list="softList" id="soft" name="softUpdateTask.soft.id" listKey="id" listValue="name"></s:select>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row">目标版本：</th>
    <td class="inp">
    	<s:textfield name="softUpdateTask.targetVersion" id="targetVersion" maxlength="4" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
    </td>
  </tr>
  <tr>
    <th scope="row">状态：</th>
    <td><input type="radio" name="softUpdateTask.status" value="1" checked="checked">启用
    <input type="radio" name="softUpdateTask.status" value="2">停止
    	<font style="color: red; margin-left: 10">*</font>
     </td>
  </tr>
  <tr>
    <th scope="row">升级时间：</th>
    <td>
    	从
    	<input id="startTime" name="softUpdateTask.startTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
    	到
    	<input id="endTime" name="softUpdateTask.endTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  
  
  <tr>
    <th scope="row" valign="top">描述：</th>
    <td> <textarea id="remark" rows="5" cols="50" name="softUpdateTask.remark"></textarea></td>
  </tr>
  <tr>
    <th scope="row">升级目标：</th>
    <td valign="top">
		<ul id="authTree">
		 <s:iterator value="categories" id="item">
		   <li>
		   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
		   <ul style="background-color:#EDEBEB;">
		  	    <s:iterator value="devices" id="items">
		  	 	  <li>
		   		   <input class="check${categoryId}" type="checkbox"  name="idListsave"  value="${items.id}" />
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
  <td class="addButton"  align="center">
  </td>
  <td>
   <input  class="submit"   type="submit" value="提交"/> 
  <input type="button"   class="back"  value="返回" onclick="window.location.href='<%=basePath%>softup/list.action'"/></td>
  </tr>
</table>
</s:form>
</div>
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
                         <li><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
                         <li class="currentHover"><a>>>Add</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>		
 <div class="AlonModule_Body">
   <div class="AlonModule_list">
   <s:form action="save"  namespace="/softup"  method="post" enctype="multipart/form-data"   onsubmit="return checkForm();">
   <table width="98%" class="listtable">
  <tr class="TableTitle">
    <th scope="row"  width="10%" >name：</th>
    <td class="inp">
    <input type="text" name="softUpdateTask.name" maxlength="30"  id="name"/>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row">Package:</th>
    <td class="inp">
    	<s:select list="softList" id="soft" name="softUpdateTask.soft.id" listKey="id" listValue="name"></s:select>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row">The target version:</th>
    <td class="inp">
    	<s:textfield name="softUpdateTask.targetVersion" id="targetVersion" maxlength="4" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
    </td>
  </tr>
  <tr>
    <th scope="row">Status:</th>
    <td><input type="radio" name="softUpdateTask.status" value="1" checked="checked">Start
    <input type="radio" name="softUpdateTask.status" value="2">stop
    	<font style="color: red; margin-left: 10">*</font>
     </td>
  </tr>
  <tr>
    <th scope="row"> upgrade time:</th>
    <td>
    	from
    	<input id="startTime" name="softUpdateTask.startTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
    	to
    	<input id="endTime" name="softUpdateTask.endTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd H:m:s'})"/>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  
  
  <tr>
    <th scope="row" valign="top">Description:</th>
    <td> <textarea id="remark" rows="5" cols="50" name="softUpdateTask.remark"></textarea></td>
  </tr>
  <tr>
    <th scope="row">Upgrade target:</th>
    <td valign="top">
		<ul id="authTree">
		 <s:iterator value="categories" id="item">
		   <li>
		   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
		   <ul style="background-color:#EDEBEB;">
		  	    <s:iterator value="devices" id="items">
		  	 	  <li>
		   		   <input class="check${categoryId}" type="checkbox"  name="idListsave"  value="${items.id}" />
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
  <td class="addButton"  align="center">
  </td>
  <td>
   <input  class="submit"   type="submit" value="submit"/> 
  <input type="button"   class="back"  value="return" onclick="window.location.href='<%=basePath%>softup/list.action'"/></td>
  </tr>
</table>
</s:form>
</div>
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
