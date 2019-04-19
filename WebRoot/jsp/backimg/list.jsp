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
<script language="JavaScript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
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
  function checkEmpty(){if(a==1){
	if($("#myrange").val() > 100 || $("#myrange").val() < 1){
		alert("请填写1-100的值");
	}
    return true;
  }
  if(a==2){
	if($("#myrange").val() > 100 || $("#myrange").val() < 1){
		alert("Please fill out the value of 1-100");
	}
    return true;
  }
  }
  window.onload = function() {
	  $("#myrange").change(
				function(){
						$("#val1").html($("#myrange").val());
				}	  
		 );  
  }
 
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li  class="currentHover"><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                        <li ><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="backimg/update.action" namespace="/backimg" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">桌面LOGO：</th>
				<td class="inp">
					<s:file name="logo_img" id="logo" size="70px" ></s:file>
					<span>
						<img  width="50" height="50" src="<%=basePath%>${logo.value}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(不选择图片表示不更换)
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">背景图片：</th>
				<td class="inp">
					<s:file name="back_img" id="back" size="70px" ></s:file>
					<span>
						<img  width="240" height="200" src="<%=basePath%>${back.value}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(不选择图片表示不更换)
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">开机音量：</th>
				<td class="inp" style="color:red">
					<br/>
					&nbsp;min:1 <input id="myrange" type="range" min="1" max="100"  name="volume.value" value="${volume.value }"/> <span style="font-size:16px">max:100</span>
					<span style="margin-left: 20px;color:blue">当前音量：<span id="val1" style="color:green">${volume.value }</span>%</span><br/>
					
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="更改设置" onclick="return checkEmpty()" class="STYLE1" />
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
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a href="<%=basePath%>device/pagedeciveAction.action">Terminal</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">Terminal Type</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">Terminal Layout</a></li>
                        <li  class="currentHover"><a href="<%=basePath%>backimg/list.action">Other Settings</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="backimg/update.action" namespace="/backimg" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Desktop LOGO:</th>
				<td class="inp">
					<s:file name="logo_img" id="logo" size="70px" ></s:file>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Desktop LOGO:</th>
				<td class="inp">
					<span style="margin-left:10px;">
						<img  width="50" height="50" src="<%=basePath%>${logo.value}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(Don't choose pictures will not be changed)
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Background image:</th>
				<td class="inp">
					<s:file name="back_img" id="back" size="70px" ></s:file>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Background image:</th>
				<td class="inp">
					<span style="margin-left:10px;">
						<img  width="240" height="200" src="<%=basePath%>${back.value}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(Don't choose pictures will not be changed)
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Boot volume:</th>
				<td class="inp" style="color:red">
					<br/>
					&nbsp;min:1 <input id="myrange" type="range" min="1" max="100"  name="volume.value" value="${volume.value }"/> <span style="font-size:16px">max:100</span>
					<span style="margin-left: 20px;color:blue">The current volume:<span id="val1" style="color:green">${volume.value }</span>%</span><br/>
					
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="change setting" onclick="return checkEmpty()" class="STYLE1" />
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

