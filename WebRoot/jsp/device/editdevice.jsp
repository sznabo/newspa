<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.boyue.karaoke.model.DeviceCategory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
	
int oneLetterWidth = 12;
int typeWidth = 120;


if (request.getAttribute("categorylist") != null) {
	List<DeviceCategory> typeList = (List<DeviceCategory>) request.getAttribute("categorylist");
	for(DeviceCategory dc:typeList) {
		if (dc.getName().length()*oneLetterWidth > typeWidth) {
			typeWidth = dc.getName().length()*oneLetterWidth;
		}
	}
}
	
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加节目</title>

<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<link rel="stylesheet" href="<%=basePath%>css/common.css" />

<style type="text/css">
.typeCls{
	width: <%=typeWidth +18 %>px;
	margin-left: -<%=typeWidth%>px;
}

.select{
	margin-left:<%=typeWidth%>px;
	width:18px;
	overflow:hidden;
}

.type{
	width:<%=typeWidth%>px;
	position:absolute;
	left:0px;
}
</style>

<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>

<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script language="JavaScript" type="text/javascript">
var a = <%=session.getAttribute("language")%>	
function save(){if(a==1){
	if($("#userName").val().trim() == ""){
		alert("请输入位置号");
		return false;
	}
	if($("#mac").val().trim() == ""){
		alert("请输入MAC地址");
		return false;
	}
	if($("#category").val().trim() == ""){
		alert("请选择分类");
		return false;
	}
	return true;
}
if(a==2){
	if($("#userName").val().trim() == ""){
		alert("Please enter the position number");
		return false;
	}
	if($("#mac").val().trim() == ""){
		alert("Please enter the MAC address");
		return false;
	}
	if($("#category").val().trim() == ""){
		alert("Please select a category");
		return false;
	}
	return true;
}
}
	

function back(){
	location.href = "device/pagedeciveAction.action";
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
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">设备管理</a></li>
                      <li class="currentHover"><a>>>修改设备信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="updatedeviceAction" namespace="/device" method="post" onsubmit="return save();">
	 <s:hidden name="device.id" value="%{device.id}"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">位置号：</th>
				<td class="inp">
					<input name="device.userName" id="userName" maxlength="10" value="${device.userName}" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">MAC地址：</th>
				<td class="inp">
					<input name="device.mac" id="mac" value="${device.mac}" maxlength="50" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">IP地址：</th>
				<td class="inp">
					<!-- <input name="device.ipaddr" id="ipaddr" maxlength="15" /> -->
					<s:textfield name="device.ipaddr" id="ipaddr" maxlength="15"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">状态：</th>
				<td >
					<s:radio list="#{1:'启动', 2:'停用'}" name="device.status"   id="sta"></s:radio>
					<font style="color: red">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">分类：</th>
				<td  align="left">
						 <s:select list="categorylist"  name="device.categoryId" id="category" headerKey="" headerValue="请选择..." listKey="id" listValue="name" />
						<font style="color: red">&nbsp;*</font>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">位置说明：</th>
				<td class="inp"> 
					 <s:textfield name="device.position" maxlength="30"/> <font style="color: red; margin-left: 10"> </font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">内容包：</th>
				<td  align="left">
						<s:select list="allProducts"  name="device.product.id" id="productid" headerKey="" headerValue="请选择..." listKey="id" listValue="name" />
				</td>
			</tr>
			<%-- <tr>
				<th scope="row" align="right">说明：</th>
				<td class="inp">
					<s:textarea name="device.remark" id="remark" value="%{device.remark}" cols="30"></s:textarea>
				</td>
			</tr>
		
		  	<tr> --%>
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
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="updatedeviceAction" namespace="/device" method="post" onsubmit="return save();">
	 <s:hidden name="device.id" value="%{device.id}"></s:hidden>
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Position no. :</th>
				<td class="inp">
					<input name="device.userName" id="userName" maxlength="10" value="${device.userName}" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">MAC address:</th>
				<td class="inp">
					<input name="device.mac" id="mac" value="${device.mac}" maxlength="50" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">IP address:</th>
				<td class="inp">
					<!-- <input name="device.ipaddr" id="ipaddr" maxlength="15" /> -->
					<s:textfield name="device.ipaddr" id="ipaddr" maxlength="15"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Status:</th>
				<td >
					<s:radio list="#{1:'Start the', 2:'disable'}" name="device.status"   id="sta"></s:radio>
					<font style="color: red">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Classification:</th>
				<td  align="left">
						 <s:select list="categorylist"  name="device.categoryId" id="category" headerKey="" headerValue="请选择..." listKey="id" listValue="name" />
						<font style="color: red">&nbsp;*</font>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Position description:</th>
				<td class="inp"> 
					 <s:textfield name="device.position" maxlength="30"/> <font style="color: red; margin-left: 10"> </font>
				</td>
			</tr>
			<tr style="display: none;">
				<th scope="row" align="right">Content package:</th>
				<td  align="left">
						<s:select list="allProducts"  name="device.product.id" id="productid" headerKey="" headerValue="Please select a..." listKey="id" listValue="name" />
				</td>
			</tr>
			<%-- <tr>
				<th scope="row" align="right">说明：</th>
				<td class="inp">
					<s:textarea name="device.remark" id="remark" value="%{device.remark}" cols="30"></s:textarea>
				</td>
			</tr>
		
		  	<tr> --%>
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

