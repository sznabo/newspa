<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="b" uri="/boyueTags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>

		<title>升级包管理</title>

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
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script type="text/javascript">
	var a = <%=session.getAttribute("language")%>
	$(function() {
if(a==1){
	
}else if(a==2){
  $("input[type=file]").filestyle({
          image: "<%=basePath%>/res/images/file.png",
          imageheight : 22,
          imagewidth : 82,
          width : 150
      });
}
    
});
function checkForm() {if(a==1){
	if (isValEmpty("name")) {
		alert("请输入名称");
		return false;
	}
	if (isValEmpty("version")) {
		alert("请输入版本");
		return false;
	}
	if (isValEmpty("packageName")) {
		alert("请输入软件包名");
		return false;
	} 
	
	if (!checkLen("remark", 250)) {
		alert("备注不能超过250个字符");
		return false;
	}
	return true;
}
if(a==2){
	if (isValEmpty("name")) {
		alert("Please enter a name");
		return false;
	}
	if (isValEmpty("version")) {
		alert("Please enter the version");
		return false;
	}
	if (isValEmpty("packageName")) {
		alert("Please enter the package name");
		return false;
	} 
	
	if (!checkLen("remark", 250)) {
		alert("Note cannot exceed 250 characters");
		return false;
	}
	return true;
}
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
                         <li><a href="<%=basePath%>soft/list.action">软件包管理</a></li>
                         <li class="currentHover"><a>>>修改软件包</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
	<div class="AlonModule_list">
   <form action="<%=basePath%>soft/update.action" method="post"  enctype="multipart/form-data"  onsubmit="return checkForm();"> 
         <table width="100%" class="listtable">
         <s:hidden name="soft.id" /> 
  <tr>
    <th scope="row" width="10%" align="right">名称：</th>
    <td class="inp"><s:textfield name="soft.name" id="name" maxlength="30"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">版本：</th>
    <td class="inp"><s:textfield name="soft.version" maxlength="4" id="version" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr style="display: none;">
    <th scope="row" align="right">包名：</th>
    <td class="inp"><s:textfield name="soft.packageName" id="packageName"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">软件包：</th>
    <td class="inp">
  	<s:file  name="addFile" id="file" /> (不选择表示不作修改) <!-- id="upload" -->
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">描述：</th>
    <td> <s:textarea name="soft.remark" id="remark" cols="50" rows="5"></s:textarea></td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td> <input  class="submit" type="submit" value="提交"/>  <input type="button"   class="back" value="返回" onclick="window.location.href='<%=basePath%>soft/list.action'"/></td>
  </tr>
</table>
   </form>
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
                         <li><a href="<%=basePath%>soft/list.action">Soft</a></li>
                         <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
	<div class="AlonModule_list">
   <form action="<%=basePath%>soft/update.action" method="post"  enctype="multipart/form-data"  onsubmit="return checkForm();"> 
         <table width="100%" class="listtable">
         <s:hidden name="soft.id" /> 
  <tr>
    <th scope="row" width="10%" align="right">Name:</th>
    <td class="inp"><s:textfield name="soft.name" id="name" maxlength="30"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">Version:</th>
    <td class="inp"><s:textfield name="soft.version" maxlength="4" id="version" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr style="display: none;">
    <th scope="row" align="right">Package name:</th>
    <td class="inp"><s:textfield name="soft.packageName" id="packageName"></s:textfield>
    	<font style="color: red; margin-left: 10">*</font>
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">Package:</th>
    <td class="inp">
   <s:file name="addFile" id="file" /> <!-- id="upload"  -->
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				(Don't modify chose not to say) 
    </td>
  </tr>
  <tr>
    <th scope="row" align="right">Description:</th>
    <td> <s:textarea name="soft.remark" id="remark" cols="50" rows="5"></s:textarea></td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td> <input  class="submit" type="submit" value="submit"/>  <input type="button"   class="back" value="return" onclick="window.location.href='<%=basePath%>soft/list.action'"/></td>
  </tr>
</table>
   </form>
</div>
</div>
</div>
</s:if>
</body>
</html>
