<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="b" uri="/boyueTags"%>  
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
  	//验证名称
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	if ($("#filePath").val().trim() == '') {
		alert("请选择文件");
		return false;
	}
	if ($("#inter").val().trim() == '') {
		alert("请填写时间间隔");
		return false;
	}
	if ($("#position").val().trim() == '') {
		alert("请填写排序号");
		return false;
	}

  }
  if(a==2){
  	//验证名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}
	if ($("#filePath").val().trim() == '') {
		alert("Please select a file");
		return false;
	}
	if ($("#inter").val().trim() == '') {
		alert("Please fill in the time interval");
		return false;
	}
	if ($("#position").val().trim() == '') {
		alert("Please fill out the sorting number");
		return false;
	}

  }
  }

function btnChange(type) {
		if (type==1) {
			  $("#musicTr").show();
		} else {
			  $("#musicTr").hide();
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
                	   <li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                       <li><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
                       <li class="currentHover"><a href="<%=basePath%>mainAd/list.action">主屏广告</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="save" namespace="/mainAd" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">类型：</th>
				<td class="inp">
					<select name="model.type" style="height:22px;" id="type" onchange='btnChange(this[selectedIndex].value);'>
   			 			<option value="1">图片</option>
   			 			<option value="2">视频</option>
   			 		 </select>
				<font style="color:red;">*</font>
				</td>
			</tr> 
			
			<tr>
				<th scope="row" align="right">文件：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/mainAd/" name="model.filePath" id="filePath"/>
				<font style="color:red;">*</font>
				</td>
			</tr> 
			<tr id="musicTr">
				<th scope="row" align="right">音频文件：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/mainAd/" name="model.musicPath" id="musicPath"/>
				</td>
			</tr> 
			<tr>
				<th scope="row" align="right">时间间隔：</th>
				<td class="inp">
					<s:textfield size="4" name="model.inter" id="inter" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">排序号：</th>
				<td class="inp">
					<s:textfield size="4" name="model.position" id="position" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="重置" class="STYLE1"  />
				<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
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
                	   <li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                       <li><a href="<%=basePath%>ad/list.action?showFlag=1">Ad</a></li>
                       <li class="currentHover"><a href="<%=basePath%>mainAd/list.action">Home Ad</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="save" namespace="/mainAd" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Type:</th>
				<td class="inp">
					<select name="model.type" style="height:22px;" id="type" onchange='btnChange(this[selectedIndex].value);'>
   			 			<option value="1">Image</option>
   			 			<option value="2">video</option>
   			 		 </select>
				<font style="color:red;">*</font>
				</td>
			</tr> 
			
			<tr>
				<th scope="row" align="right">File:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/mainAd/" name="model.filePath" id="filePath"/>
				<font style="color:red;">*</font>
				</td>
			</tr> 
			<tr id="musicTr">
				<th scope="row" align="right">Audio files:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/mainAd/" name="model.musicPath" id="musicPath"/>
				</td>
			</tr> 
			<tr>
				<th scope="row" align="right">Time interval:</th>
				<td class="inp">
					<s:textfield size="4" name="model.inter" id="inter" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Order no. :</th>
				<td class="inp">
					<s:textfield size="4" name="model.position" id="position" maxlength="3"  onkeyup="value=value.replace(/[^\d]/g,'')" /> <font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="Submit" onclick="return checkEmpty()" class="STYLE1" />
				
				<input type="button" name="back" value="Return" class="STYLE1" onclick="window.history.go(-1);"/>
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

