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
<title>添加应用分类</title>
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
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
    window.onload = function()
    {
        //FCKEDITOR.replace( 'model.description' );
        toolbar : 'MyToolbar'
    };
</script>
<script type="text/javascript">var a = <%=session.getAttribute("language")%>
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
  function checkEmpty(){
  if(a==1){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	//验证描述信息
  	if(isValEmpty("path")){
		alert("请选择图标");
		return false;
	}
	if ($("#position").val().trim() == '') {
		alert("请输入位置");
		return false;
	}
    return true;
  }if(a==2){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}
	//验证描述信息
  	if(isValEmpty("path")){
		alert("Please choose the icon");
		return false;
	}
	if ($("#position").val().trim() == '') {
		alert("Please enter the location");
		return false;
	}
    return true;
  }
  }

function showLiveList() {
		if ($("#positionType1").attr("checked")) {
			  $("#LiveListTr").show();
		} else {
			  $("#LiveListTr").hide();
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>appCategory/list.action">应用管理</a></li>
                      <li class="currentHover"><a>>>添加应用分类信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="save" enctype="multipart/form-data" namespace="/appCategory" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30" size="60"  type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
		    <tr>
				<th scope="row" align="right">顺序：</th>
				<td class="inp">
					<input maxlength="5" size="30"  onkeyup="value=value.replace(/[^\d]/g,'')" type="text" name="model.position" id="position" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
		<!-- 	<tr>
				<th scope="row" align="right">文件类型：</th>
				<td  >
					<s:radio list="#{0:'图片', 1:'视频'}" name="model.fileType" value="0" id="sta"></s:radio>
					<font style="color: red">*</font>
				</td>
			</tr> -->
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/app_category/" name="model.path" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					注：图片分辨率407px * 259px
					
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>appCategory/list.action">Application management</a></li>
                      <li class="currentHover"><a>>>Add application classification</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="appCategory/save.action" enctype="multipart/form-data" namespace="/appCategory" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input maxlength="30" size="60"  type="text" name="model.namee" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
		    <tr>
				<th scope="row" align="right">Order:</th>
				<td class="inp">
					<input maxlength="5" size="30"  onkeyup="value=value.replace(/[^\d]/g,'')" type="text" name="model.position" id="position" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
		<!-- 	<tr>
				<th scope="row" align="right">文件类型：</th>
				<td  >
					<s:radio list="#{0:'图片', 1:'视频'}" name="model.fileType" value="0" id="sta"></s:radio>
					<font style="color: red">*</font>
				</td>
			</tr> -->
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/app_category/" name="model.path" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note: the image resolution407px * 259px
					
				</td>
			</tr>
	
			
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="Submit" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="Reset" class="STYLE1"  />
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

