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
  	var name = document.getElementById('vodpartname').value;
  	/*if(name!=null&&name!=""){
  		if ($("#partintr").val().length>255) {
  			alert("描述不能超过255个字符");
  			return false;
  		}
  		return true;
  	}else{
  		document.getElementById('error').innerHTML ="请按要求填写*部分的内容信息";
  		return false;
  	}
  	return false;*/
  	if(name == null || name == ""){
  		alert("请输入名称");
  		return false;
  	}
  	if ($("#path").val().trim() == '') {
		alert("请选择图片");
		return false;
	}
  	if($("#vodpartname").val().trim() != ""){
  		var isname = isName($("#vodpartname").val().trim());
  		if(isname == false ){
			alert("您输入的名称在系统中已经存在");
			return false;
		}
  	}
  	return true;
  }
  if(a==2){
  	var name = document.getElementById('vodpartname').value;
  	/*if(name!=null&&name!=""){
  		if ($("#partintr").val().length>255) {
  			alert("描述不能超过255个字符");
  			return false;
  		}
  		return true;
  	}else{
  		document.getElementById('error').innerHTML ="请按要求填写*部分的内容信息";
  		return false;
  	}
  	return false;*/
  	if(name == null || name == ""){
  		alert("Please enter a name");
  		return false;
  	}
  	if ($("#path").val().trim() == '') {
		alert("Please select a picture");
		return false;
	}
  	if($("#vodpartname").val().trim() != ""){
  		var isname = isName($("#vodpartname").val().trim());
  		if(isname == false ){
			alert("You enter the name of the already exists in the system");
			return false;
		}
  	}
  	return true;
  }
  }
  
  function isName(name){
	var param = "model.vodpartname="+name+"&model.id=";
	var exist = false;
	$.ajax({
		type:  "POST",
		async: false,
		url:  "admin/vodPartAction_isName.action",
		data:  param,
		success: function(msg){
			exist = msg.msgBody;
		}
	});
	//alert(exist);
	return exist;
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      <li class="currentHover"><a>>>添加影片类别信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodPartAction_saveVodPart" namespace="/admin" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.vodpartname" id="vodpartname" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/vodpart/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					注：图片分辨率371px * 355px
				</td>
			</tr>
			<%-- <tr>
				<th scope="row" align="right">描述：</th>
				<td class="inp">
					<s:textarea name="model.partintr" id="partintr" value=""  cols="80" rows="5" ></s:textarea>
						<span><font color="red">最多255个字符</font></span>
				</td>
			</tr> --%>
			
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      <li class="currentHover"><a>>>Add</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodPartAction_saveVodPart.action" namespace="/admin" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name：</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.vodpartnamee" id="vodpartname" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/vodpart/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Note: the image resolution371px * 355px
				</td>
			</tr>
			<%-- <tr>
				<th scope="row" align="right">描述：</th>
				<td class="inp">
					<s:textarea name="model.partintr" id="partintr" value=""  cols="80" rows="5" ></s:textarea>
						<span><font color="red">最多255个字符</font></span>
				</td>
			</tr> --%>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="submit" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="reset" class="STYLE1"  />
				<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
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

