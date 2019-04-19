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
<title>更新数据库信息</title>
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
    if ($("#nodeName").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	if ($("#nodeIp").val().trim() == '') {
		alert("请输入ip地址！");
		return false;
	}
	if ($("#nodePort").val().trim() == '') {
		alert("请输入端口！");
		return false;
	}
	if ($("#dataName").val().trim() == '') {
		alert("请输入数据库名称！");
		return false;
	}
	if ($("#dataUser").val().trim() == '') {
		alert("请输入数据库用户名！");
		return false;
	}
	
	
	if ($("#dataPass").val().trim() == '') {
		alert("请输入数据库密码！");
		return false;
	}
	return true;
}
if(a==2){
    if ($("#nodeName").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}
	if ($("#nodeIp").val().trim() == '') {
		alert("Please enter the IP address!");
		return false;
	}
	if ($("#nodePort").val().trim() == '') {
		alert("Please enter the port!");
		return false;
	}
	if ($("#dataName").val().trim() == '') {
		alert("Please type database name!");
		return false;
	}
	if ($("#dataUser").val().trim() == '') {
		alert("Please enter the database user name!");
		return false;
	}
	
	
	if ($("#dataPass").val().trim() == '') {
		alert("Please enter the password database!");
		return false;
	}
	return true;
}
}

  //检测IP格式
  function checkIP(){if(a==1){
  	var ip = document.getElementById('nodeIp').value;
  	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;  
  	if(!re.test(ip)){
  		document.getElementById('iperror').innerHTML = "请使用标准的IP格式！";
  		document.getElementById('sub').disabled = true;
	}else{
		document.getElementById('iperror').innerHTML = "";
		document.getElementById('sub').disabled = false;
	}
  }
  if(a==2){
  	var ip = document.getElementById('nodeIp').value;
  	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;  
  	if(!re.test(ip)){
  		document.getElementById('iperror').innerHTML = "Please use the standard IP format!";
  		document.getElementById('sub').disabled = true;
	}else{
		document.getElementById('iperror').innerHTML = "";
		document.getElementById('sub').disabled = false;
	}
  }
  }
  
    //检测端口号
  function checkPort(val,error){
  	var port = document.getElementById(val).value;
  	if(port!=null){if(a==1){
  		var re =  /\d*/i;
  		var r = port.match(re);
  		if(r!=port){
  			document.getElementById(error).innerHTML = "请写入数字符号！";
  			document.getElementById('sub').disabled = true;
  		}else{
			document.getElementById(error).innerHTML = "";
			document.getElementById('sub').disabled = false;
  		}
  	}
  	if(a==2){
  		var re =  /\d*/i;
  		var r = port.match(re);
  		if(r!=port){
  			document.getElementById(error).innerHTML = "Please write number sign!";
  			document.getElementById('sub').disabled = true;
  		}else{
			document.getElementById(error).innerHTML = "";
			document.getElementById('sub').disabled = false;
  		}
  	}
  	}
  }
  
function back(){
	location.href = "message/pagemessageAction.action";
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
function showPlayType() {
	  if ($("#playType2").attr('checked')) {
		  $("#MessagePlayType").show();
		  $("#MessagePlayTimeType").show();
	  } else {
		  $("#MessagePlayType").hide();
		  $("#MessagePlayTimeType").hide();
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
                     <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li>
                      <li class="currentHover"><a>>>修改总服务器信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="cloudsManage/update.action" method="post">
		<s:hidden name="model.id" value="%{model.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">服务器名称：</th>
				<td class="inp">
					<input name="model.nodeName" id="nodeName" value="${model.nodeName}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">ip地址：</th>
				<td class="inp">
					<input name="model.nodeIp" id="nodeIp" value="${model.nodeIp}" maxlength="30"  onchange="checkIP();"/><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"><span id="iperror"></span></font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">数据库端口：</th>
				<td class="inp">
					<input name="model.dataPort" id="nodePort" value="${model.dataPort}" maxlength="30" onchange="checkPort('nodePort','porterror');" /><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"><span id="porterror"></span></font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">数据库名称：</th>
				<td class="inp">
					<input name="model.dataName" id="dataName" value="${model.dataName}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">数据库用户名：</th>
				<td class="inp">
					<input name="model.dataUser" id="dataUser" value="${model.dataUser}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">数据库密码：</th>
				<td class="inp">
					<input name="model.dataPass" id="dataPass" value="${model.dataPass}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr  class="TableTitle">
				<th scope="row" align="right">开始标志：</th>
				<td class="inp">
					<input name="model.startLine" id="startLine" value="${model.startLine}" maxlength="3" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px">*</font>
				</td>
			</tr>
			
			<tr class="TableTitle">
				<th scope="row" align="right">结束标志：</th>
				<td class="inp">
					<input name="model.endLine" id="endLine" value="${model.endLine}" maxlength="3" onkeyup="value=value.replace(/[^\d]/g,'')" /><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"></font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">描述：</th>
				<td class="inp">
					<s:textarea name="model.descript" id="content" value="%{model.descript}" cols="38" wrap="20" rows="5" onkeyup="this.value = this.value.slice(0, 255)"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
		
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit" id="sub" value="保存"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
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
                     <li ><a href="<%=basePath%>cloudsManage/list.action">The total server information</a></li>
                      <li class="currentHover"><a>>>Modify server information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="cloudsManage/update.action" method="post">
		<s:hidden name="model.id" value="%{model.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">The server name:</th>
				<td class="inp">
					<input name="model.nodeName" id="nodeName" value="${model.nodeName}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">IP address:</th>
				<td class="inp">
					<input name="model.nodeIp" id="nodeIp" value="${model.nodeIp}" maxlength="30"  onchange="checkIP();"/><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"><span id="iperror"></span></font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">Database port:</th>
				<td class="inp">
					<input name="model.dataPort" id="nodePort" value="${model.dataPort}" maxlength="30" onchange="checkPort('nodePort','porterror');" /><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"><span id="porterror"></span></font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">name of the database:</th>
				<td class="inp">
					<input name="model.dataName" id="dataName" value="${model.dataName}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">Database user name:</th>
				<td class="inp">
					<input name="model.dataUser" id="dataUser" value="${model.dataUser}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr  class="TableTitle">
				<th scope="row" align="right">Database password:</th>
				<td class="inp">
					<input name="model.dataPass" id="dataPass" value="${model.dataPass}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr  class="TableTitle">
				<th scope="row" align="right">Begin to sign:</th>
				<td class="inp">
					<input name="model.startLine" id="startLine" value="${model.startLine}" maxlength="3" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px">*</font>
				</td>
			</tr>
			
			<tr class="TableTitle">
				<th scope="row" align="right">End:</th>
				<td class="inp">
					<input name="model.endLine" id="endLine" value="${model.endLine}" maxlength="3" onkeyup="value=value.replace(/[^\d]/g,'')" /><font style="color: red; margin-left: 10">*</font>
				<font style="color: red;size: 12px"></font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Description:</th>
				<td class="inp">
					<s:textarea name="model.descript" id="content" value="%{model.descript}" cols="38" wrap="20" rows="5" onkeyup="this.value = this.value.slice(0, 255)"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
		
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit" id="sub" value="save"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
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

