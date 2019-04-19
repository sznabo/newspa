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

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>	
  function checkEmpty(){
  	//验证名称
  	if(a==1){
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}}
	if(a==2){
  	if ($("#name").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}}
	
	//验证频道顺序
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if(a==1){
			if (!isSelect) {
				alert("请选择频道的顺序");
				return false;
			}}
			if(a==2){
			if (!isSelect) {
				alert("Please select the order of the channel");
				return false;
			}}
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
                      <s:if test="#request.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">广告管理</a></li>
                 	</s:if>
                    <s:if test="#request.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">点播广告</a></li>
                      	<li class="currentHover">&nbsp;&nbsp;<a>>>添加点播广告信息</a></li>
                 	</s:if>
                 	<s:else>
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">自助服务</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">左侧内容</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4">消费介绍</a></li>
                      	<s:if test="#request.showFlag == 3">
                      	<li class="currentHover" style>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>>>添加左侧内容信息</a></li>
                      	</s:if>
                      	<s:if test="#request.showFlag == 4">
                      	<li class="currentHover" style>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>>>添加消费介绍</a></li>
                      	</s:if>
                 	</s:else>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="saveAd" namespace="/ad" method="post">
     <div class="AlonModule_Body">
     <s:hidden name="showFlag"></s:hidden>
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="ad.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				
				<s:if test="#request.showFlag == 2">
						<th scope="row" align="right" style="display: none;">内容类型：</th>
						<s:textfield name="ad.contentType" value="2" cssStyle="display:none;"></s:textfield>
				</s:if>
				<s:if test="#request.showFlag == 3 || #request.showFlag == 4">
					<th scope="row" align="right">内容类型：</th>
					<td class="inp">
						<select name="ad.contentType" style="height:22px;">
	   			 			<option value="1">图片</option>
	   			 			<option value="2">视频</option>
	   			 			<option value="3">flash</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
				</s:if>
				<%--<td class="inp">
					<select name="ad.contentType" style="height:22px;">
   			 			<option value="1">图片</option>
   			 			<option value="2">视频</option>
   			 			<option value="3">flash</option>
   			 		 </select>
					<font style="color:red;">*</font>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">所属栏目：</th>
				<td class="inp">
					<select name="ad.category" style="height:22px;">
   			 			<option value="2">点播广告</option>
   			 			<option value="3">本店介绍</option>
   			 		 </select>
					<font style="color:red;">*</font>
				</td>--%>
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
</div></s:if>
<s:if test="#session.language==2"><div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <s:if test="#request.showFlag == 1">
                 		<li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                        <li><a href="<%=basePath%>ad/list.action?showFlag=1">Ad</a></li>
                 	</s:if>
                    <s:if test="#request.showFlag == 2">
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=2">Demand Ad</a></li>
                      	<li class="currentHover">&nbsp;&nbsp;<a>>>Add Demand Ad</a></li>
                 	</s:if>
                 	<s:else>
                 		<li ><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">Service</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=3">Left Content</a></li>
                      	<li ><a style="white-space: nowrap;" href="<%=basePath%>ad/list.action?showFlag=4">Consumption Introduced</a></li>
                      	<s:if test="#request.showFlag == 3">
                      	<li class="currentHover" style>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>>>Add Left Content </a></li>
                      	</s:if>
                      	<s:if test="#request.showFlag == 4">
                      	<li class="currentHover" style>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>>>Add Consumption Introduced</a></li>
                      	</s:if>
                 	</s:else>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="saveAd" namespace="/ad" method="post">
     <div class="AlonModule_Body">
     <s:hidden name="showFlag"></s:hidden>
		<table width="98%" class="listtable">
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="ad.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				
				<s:if test="#request.showFlag == 2">
						<th scope="row" align="right" style="display: none;">Content type:</th>
						<s:textfield name="ad.contentType" value="2" cssStyle="display:none;"></s:textfield>
				</s:if>
				<s:if test="#request.showFlag == 3 || #request.showFlag == 4">
					<th scope="row" align="right">Content type:</th>
					<td class="inp">
						<select name="ad.contentType" style="height:22px;">
	   			 			<option value="1"> Picture</option>
	   			 			<option value="2">video</option>
	   			 			<option value="3">flash</option>
	   			 		 </select>
					<font style="color:red;">*</font>
					</td>
				</s:if>
				<%--<td class="inp">
					<select name="ad.contentType" style="height:22px;">
   			 			<option value="1">图片</option>
   			 			<option value="2">视频</option>
   			 			<option value="3">flash</option>
   			 		 </select>
					<font style="color:red;">*</font>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">所属栏目：</th>
				<td class="inp">
					<select name="ad.category" style="height:22px;">
   			 			<option value="2">点播广告</option>
   			 			<option value="3">本店介绍</option>
   			 		 </select>
					<font style="color:red;">*</font>
				</td>--%>
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
</div></s:if>

</body>
</html>

