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
<title>添加菜品</title>
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
    window.onload = function()
    {
        //FCKEDITOR.replace( 'model.description' );
        toolbar : 'MyToolbar'
    };
</script>
<script type="text/javascript">
  function checkEmpty(){if(a==1){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	if ($("#styleId").val().trim() == '') {
		alert("请选择分类");
		return false;
	}
	//图片 
  	if ($("#path").val().trim() == '') {
		alert("请选择图片");
		return false;
	}
	
	//验证描述信息
	//applicationform是ckeditor的id或者名字
    var val = CKEDITOR.instances.description.getData();
    
    if (val.length == 0)
    {
       alert("请输入描述信息");
       return false;
    }else if(val.length > 5000){
    	alert("描述信息不能大于5000个字");
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
	if ($("#styleId").val().trim() == '') {
		alert("Please select a category");
		return false;
	}
	//图片 
  	if ($("#path").val().trim() == '') {
		alert("Please select a picture");
		return false;
	}
	
	//验证描述信息
	//applicationform是ckeditor的id或者名字
    var val = CKEDITOR.instances.description.getData();
    
    if (val.length == 0)
    {
       alert("Please enter a description");
       return false;
    }else if(val.length > 5000){
    	alert("Description is not greater than 5000 characters");
		return false;
    }
    return true;
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
                    <%-- <li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">自助服务</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">自助服务明细</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">左侧内容</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">消费介绍</a></li>
                      	 <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">师工餐吧？</a></li> --%>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">菜品管理</a></li>
                 	     <li class="currentHover"><a>>>添加菜品信息</a></li>
                 	    <!-- <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">菜品分类</a></li> -->
                 	
                     
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="add" enctype="multipart/form-data" namespace="/dish" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>

			<tr>
				<th scope="row" align="right">分类：</th>
				<td class="inp">
					<s:select list="styles" name="model.styleId" id="styleId" cssStyle="height:22px;"  listKey="id" listValue="name" headerKey="" headerValue="请选择..." />
				</td>
			</tr>

			
			
             <tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/dish/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;
					注：图片分辨率407px * 259px
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">描述信息：</th>
				<td class="inp">
				<textarea rows="30" cols="50" name="model.description" id="description"></textarea>
				<script type="text/javascript">CKEDITOR.replace('model.description',{toolbar : 'MyToolbar'});</script>
				</td>
			</tr>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="重置" class="STYLE1"  />
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
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                    <%-- <li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1">self-service</a></li>
                 		<s:if test="#session.lv == 2">
                 		<li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=2">The self-service subsidiary</a></li>
                 		</s:if>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3&firstFlag=true">On the left side of the content</a></li>
                      	<li><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4&&firstFlag=true">Consumption is introduced</a></li>
                      	 <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduceview/shopIntroduceViewAction_home.action">T work meal?</a></li> --%>
                 	    <li><a style="white-space: nowrap;" href="<%=basePath%>dish/list.action">Dish</a></li>
                 	     <li class="currentHover"><a>>>Add</a></li>
                 	    <!-- <li><a style="white-space: nowrap;" href="<%=basePath%>dishStyle/list.action">Classification of food</a></li> -->
                 	

                     
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list">
	 <s:form action="dish/add.action" enctype="multipart/form-data" namespace="/dish" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input maxlength="30"  type="text" name="model.namee" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>

			<tr>
				<th scope="row" align="right">Classification:</th>
				<td class="inp">
					<s:select list="styles" name="model.styleId" id="styleId" cssStyle="height:22px;"  listKey="id" listValue="name" headerKey="" headerValue="please select..." />
				</td>
			</tr>

			
			
             <tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<b:fileUpload uploadSavePath="upload/dish/" name="model.img" id="path"/>
					<font style="color: red; margin-left: 10">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Note: the image resolution407px * 259px
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Description:</th>
				<td class="inp">
				<textarea rows="30" cols="50" name="model.descriptione" id="description"></textarea>
				<script type="text/javascript">CKEDITOR.replace('model.descriptione',{toolbar : 'MyToolbar'});</script>
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

