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
<title>添加</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
function checkForm(){if(a==1){
	if($("#name").val().trim() == ""){
		alert("请输入产品名称");
		return false;
	}
	var count  = 0;
	$(".cls").each(function(){
		if (this.checked) {
			count++;		
		}}
	);
	if (count==0) {
		alert("请选择功能");
		return false;
	}
	if(!checkLen("description", 250)) {
		alert("备注不能超过250个字符");
		return false
	}
	return true
}
if(a==2){
	if($("#name").val().trim() == ""){
		alert("Please enter the product name");
		return false;
	}
	var count  = 0;
	$(".cls").each(function(){
		if (this.checked) {
			count++;		
		}}
	);
	if (count==0) {
		alert("Please select a function");
		return false;
	}
	if(!checkLen("description", 250)) {
		alert("Note cannot exceed 250 characters");
		return false
	}
	return true
}
}

function back(){
	location.href = "product/list.action";
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
                      <li  class="currentHover"><a href="<%=basePath%>product/list.action">产品管理</a></li>
                      <li class="currentHover"><a>>>修改产品</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/product" method="post" onsubmit="return checkForm()">
	 <s:hidden name="product.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">产品名称：</th>
				<td class="inp">
					<s:textfield name="product.name"  maxlength="30" id="name"></s:textfield> <font style="color: red; margin-left: 10">*</font>
				</td>
		  	<tr>
		  	<tr>
				<th scope="row" align="right">状态：</th>
				<td class="inp">
					<s:radio list="#{1:'可用', 2:'停用'}" name="product.status" value="1"></s:radio>
				</td>
		  	<tr>
		  	<tr>
				<td scope="row"  align="right" valign="top"><b> 产品内容：</b></td>
				<td nowrap="nowrap">
					<table class="listtable"  id="allProgramTable" width="90%" align="left">
						<tr class="Header">
							<th scope="col" nowrap="nowrap" align="left" width="20px;"><input type="checkbox" onclick="checkAll(this, 'cls')"/></th>
						    <th scope="col" nowrap="nowrap" align="left">&nbsp;功能名称</th>
						</tr>
						<s:iterator value="allModules" id="item">
						<tr>
							<s:if test="#productModuleMap[#item.id]">
							<td  align="left" style="height: 35px;width=20px;"><input type="checkbox" name="moduleIdList" class="cls" value="${item.id}" checked="checked"/> </td>
							</s:if>
							<s:else>
							<td  align="left" style="height: 35px;width=20px;"><input type="checkbox" name="moduleIdList" class="cls" value="${item.id}"/> </td>
							</s:else>
							<td style="font-size: 12px;height: 35px;" align="left">&nbsp;${item.name}</td>
						</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
			<tr>
				<th scope="row"  align="right">说明：</th>
				<td class="inp">
					<s:textarea name="product.description" id="description" cols="38" wrap="20"></s:textarea>
					<font style="color: red; margin-left: 10"></font>
				</td>
			</tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="保存" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="返回" onclick="back();"/>
		    </td>
			</tr>
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
                      <li  class="currentHover"><a href="<%=basePath%>product/list.action">Product management</a></li>
                      <li class="currentHover"><a>>>Modify the product</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/product" method="post" onsubmit="return checkForm()">
	 <s:hidden name="product.id"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Product name:</th>
				<td class="inp">
					<s:textfield name="product.name"  maxlength="30" id="name"></s:textfield> <font style="color: red; margin-left: 10">*</font>
				</td>
		  	<tr>
		  	<tr>
				<th scope="row" align="right">Status:</th>
				<td class="inp">
					<s:radio list="#{1:'available', 2:'disable'}" name="product.status" value="1"></s:radio>
				</td>
		  	<tr>
		  	<tr>
				<td scope="row"  align="right" valign="top"><b>Content of the product:</b></td>
				<td nowrap="nowrap">
					<table class="listtable"  id="allProgramTable" width="90%" align="left">
						<tr class="Header">
							<th scope="col" nowrap="nowrap" align="left" width="20px;"><input type="checkbox" onclick="checkAll(this, 'cls')"/></th>
						    <th scope="col" nowrap="nowrap" align="left">&nbsp;name of the function</th>
						</tr>
						<s:iterator value="allModules" id="item">
						<tr>
							<s:if test="#productModuleMap[#item.id]">
							<td  align="left" style="height: 35px;width=20px;"><input type="checkbox" name="moduleIdList" class="cls" value="${item.id}" checked="checked"/> </td>
							</s:if>
							<s:else>
							<td  align="left" style="height: 35px;width=20px;"><input type="checkbox" name="moduleIdList" class="cls" value="${item.id}"/> </td>
							</s:else>
							<td style="font-size: 12px;height: 35px;" align="left">&nbsp;${item.name}</td>
						</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
			<tr>
				<th scope="row"  align="right">Description:</th>
				<td class="inp">
					<s:textarea name="product.description" id="description" cols="38" wrap="20"></s:textarea>
					<font style="color: red; margin-left: 10"></font>
				</td>
			</tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="save" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="return" onclick="back();"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
</body>
</html>

