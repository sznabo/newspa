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
<script language="JavaScript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
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
		alert("Please enter the stature");
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
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">技师浏览</a></li>
                      <li class="currentHover"><a>>>修改技师信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="technician/update.action" namespace="/technician" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
			<s:hidden name="model.id"></s:hidden>
		    <s:hidden name="model.number"></s:hidden>
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<s:textfield maxlength="30" name="model.name" id="name"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">年龄：</th>
				<td class="inp">
					<s:textfield maxlength="3" name="model.age" id="age" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
			<th scope="row" align="right">性别：</th>
					<td class="inp">
						<s:select name="model.sex" style="height:22px;" id="contentType" 
									  list="%{#{0:'男',1:'女'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			
			<tr>
			<th scope="row" align="right">当值：</th>
					<td class="inp">
						<s:select name="model.onDuty" style="height:22px;" id="contentType" 
									  list="%{#{0:'否',1:'是'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
			<th scope="row" align="right">状态：</th>
					<td class="inp">
						<s:select name="model.status" style="height:22px;" id="contentType" 
									  list="%{#{0:'空闲',1:'忙碌'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">技师类型：</th>
				<td class="inp">
					<s:select list="types" name="model.typeId" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">服务范围：</th>
				<td class="inp">
					<s:textfield maxlength="30" name="model.scopeService" id="scopeService"></s:textfield>
				</td>
			</tr>
				<tr>
				<th scope="row" align="right">技师级别：</th>
				<td class="inp">
					<s:select list="levels" name="model.levelId" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">身高：</th>
				<td class="inp">
					<s:textfield maxlength="3" name="model.heigh" id="heigh" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">籍贯：</th>
				<td class="inp">
					<s:textfield maxlength="30" name="model.nativePlace" id="nativePlace"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technician/" name="model.img" id="path"/>
					<span>
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.img}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(不选择图片表示不更换)
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
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>technician/list.action">Technician to browse</a></li>
                      <li class="currentHover"><a>>>Modify the technician information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="technician/update.action" namespace="/technician" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
			<s:hidden name="model.id"></s:hidden>
		    <s:hidden name="model.number"></s:hidden>
			<tr>
				<th scope="row" align="right">name：</th>
				<td class="inp">
					<s:textfield maxlength="30" name="model.namee" id="name"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">age：</th>
				<td class="inp">
					<s:textfield maxlength="3" name="model.age" id="age" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
			<th scope="row" align="right">gender：</th>
					<td class="inp">
						<s:select name="model.sex" style="height:22px;" id="contentType" 
									  list="%{#{0:'man',1:'woman'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			
			<tr>
			<th scope="row" align="right">The duty：</th>
					<td class="inp">
						<s:select name="model.onDuty" style="height:22px;" id="contentType" 
									  list="%{#{0:'on',1:'yes'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
			<th scope="row" align="right">state：</th>
					<td class="inp">
						<s:select name="model.status" style="height:22px;" id="contentType" 
									  list="%{#{0:'free',1:'busy'}}">
							</s:select>
						<font style="color:red;">*</font>
					</td>
			</tr>
			<tr>
				<th scope="row" align="right">Type：</th>
				<td class="inp">
					<s:select list="types" name="model.typeId" id="leftContent" headerKey="" headerValue="Please select a..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				<font style="color:red;">*</font>
				</td>
			</tr>
				<tr>
				<th scope="row" align="right">Technician level：</th>
				<td class="inp">
					<s:select list="levels" name="model.levelId" id="leftContent" headerKey="" headerValue="Please select a..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> stature：</th>
				<td class="inp">
					<s:textfield maxlength="3" name="model.heigh" id="heigh" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Native place：</th>
				<td class="inp">
					<s:textfield maxlength="30" name="model.nativePlacee" id="nativePlace"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/technician/" name="model.img" id="path"/>
					<span>
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.img}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(don't choose picture will not be changed)
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

