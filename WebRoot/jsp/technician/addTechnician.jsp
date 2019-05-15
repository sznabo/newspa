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
<title>添加技师</title>
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

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
    window.onload = function()
    {
        //FCKEDITOR.replace( 'model.description' );
        toolbar : 'MyToolbar'
    };
</script>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
  function checkEmpty(){if(a==1){

  	  //验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	if ($("#age").val().trim() == '') {
		alert("请输入年龄");
		return false;
	}
	
    if ($("#typeId").val().trim() == '') {
		alert("请选择分类");
		return false;
	}
	 if ($("#levelId").val().trim() == '') {
		alert("请选择级别");
		return false;
	}
	if ($("#heigh").val().trim() == '') {
		alert("请输入身高");
		return false;
	}
	if ($("#nativePlace").val().trim() == '') {
		alert("请输入籍贯 ");
		return false;
	}
	//验证描述信息
  	if ($("#path").val().trim() == '') {
		alert("请选择图片");
		return false;
	}
    return true;
  }
  if(a==2){

  	  //验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}
	if ($("#age").val().trim() == '') {
		alert("Please enter the age");
		return false;
	}
	
    if ($("#typeId").val().trim() == '') {
		alert("Please select a category");
		return false;
	}
	 if ($("#levelId").val().trim() == '') {
		alert("Please select a level");
		return false;
	}
	if ($("#heigh").val().trim() == '') {
		alert("Please enter the height");
		return false;
	}
	if ($("#nativePlace").val().trim() == '') {
		alert("Please enter the native ");
		return false;
	}
	//验证描述信息
  	if ($("#path").val().trim() == '') {
		alert("Please select a picture");
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">技师浏览</a></li>
                      <li class="currentHover"><a>>>添加技师信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="add" enctype="multipart/form-data" namespace="/technician" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">年龄：</th>
				<td class="inp">
					<input maxlength="3"  type="text" name="model.age" id="age" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">性别：</th>
					<td class="inp">
						<select name="model.sex" style="height:22px;">
	   			 			<option value="0">男</option>
	   			 			<option value="1">女</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">当值：</th>
					<td class="inp">
						<select name="model.onDuty" style="height:22px;">
	   			 			<option value="0">否</option>
	   			 			<option value="1">是</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
				<tr>
				<th scope="row" align="right">状态：</th>
					<td class="inp">
						<select name="model.status" style="height:22px;">
	   			 			<option value="0">空闲</option>
	   			 			<option value="1">忙碌</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">技师类型：</th>
				<td class="inp">
					<s:select list="types" name="model.typeId" id="typeId" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">服务范围：</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.scopeService" id="scopeService" value=""/>
				</td>
			</tr>
				<tr>
				<th scope="row" align="right">技师级别：</th>
				<td class="inp">
					<s:select list="levels" name="model.levelId" id="levelId" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">身高：</th>
				<td class="inp">
					<input maxlength="3"  type="text" name="model.heigh" id="heigh" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color:red;" >*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">籍贯：</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.nativePlace" id="nativePlace" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			
             <tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technician/" name="model.img" id="path"/>
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">Technician to browse</a></li>
                      <li class="currentHover"><a>>>Add a technician information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="technician/add.action" enctype="multipart/form-data" namespace="/technician" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input maxlength="30" type="text" name="model.namee" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Age:</th>
				<td class="inp">
					<input maxlength="3" type="text" name="model.age" id="age" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Gender:</th>
					<td class="inp">
						<select name="model.sex" style="height:22px;">
	   			 			<option value="0">man</option>
	   			 			<option value="1">woman</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">The duty：</th>
					<td class="inp">
						<select name="model.onDuty" style="height:22px;">
	   			 			<option value="0">no</option>
	   			 			<option value="1">yes</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
				<tr>
				<th scope="row" align="right">state：</th>
					<td class="inp">
						<select name="model.status" style="height:22px;">
	   			 			<option value="0">free</option>
	   			 			<option value="1">busy</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">Type:</th>
				<td class="inp">
					<s:select list="types" name="model.typeId" id="typeId" headerKey="" headerValue="Please select a..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr>
				<tr>
				<th scope="row" align="right">Technician level：</th>
				<td class="inp">
					<s:select list="levels" name="model.levelId" id="levelId" headerKey="" headerValue="Please select a..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">stature：</th>
				<td class="inp">
					<input maxlength="3"  type="text" name="model.heigh" id="heigh" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/><font style="color:red;" >*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Native place：</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.nativePlacee" id="nativePlace" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			
			
             <tr>
				<th scope="row" align="right">The picture：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technician/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					Note: the image resolution407px * 259px
				</td>
			</tr>
			
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

