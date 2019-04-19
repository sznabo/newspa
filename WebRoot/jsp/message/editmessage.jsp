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
<title>添加消息</title>
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

	if($("#title").val().trim() == ""){
		alert("请填写消息标题");
		return false;
	}
	
	if($('#playType2').attr('checked')){
		if($("#startDate").val().trim() == ""){
		alert("请选择消息开始日期");
		return false;
		}
	
		if($("#endDate").val().trim() == ""){
			alert("请选择消息结束日期");
			return false;
		}
		
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
     	if (isValEmpty("startTime")) {
	  		alert("开始时间不能为空");
	  		return false;
	  	}
	  	if (startTime != "") {
	  		if (!checkTime(startTime)) {
				alert("开始时间输入有误， 格式如   小时:分钟  ##:## 不能出现中文冒号");
				return false;
			}
	  	}
	  	
     	if (isValEmpty("endTime")) {
	  		alert("结束时间不能为空");
	  		return false;
	  	}
	  	if (endTime != "") {
	  		if (!checkTime(endTime)) {
				alert("结束时间输入有误， 格式如   小时:分钟  ##:## 不能出现中文冒号");
				return false;
			}
	  	}
	  	if(compareTime(startTime,endTime)){
	  		alert("开始时间应早于结束时间");
	  		return false;
	  	}
	}
	
	if($("#content").val().trim() == ""){
		alert("请输入消息内容");
		return false;
	}
	if($("#content").val().length > 250){
		alert("消息内容不能大于250个字");
		return false;
	}
	var selectCount = 0;
	$("input[name=idListsave]").each(
			function(){
		        if (this.checked === true) {
		        	selectCount ++;
		        }
	});
	if (selectCount ==0) {
		alert("请选择推送终端");
		return false;
	}	
	return true;
}
if(a==2){

	if($("#title").val().trim() == ""){
		alert("Please fill out the news headlines");
		return false;
	}
	
	if($('#playType2').attr('checked')){
		if($("#startDate").val().trim() == ""){
		alert("Please select the message start date");
		return false;
		}
	
		if($("#endDate").val().trim() == ""){
			alert("Please select a message end date");
			return false;
		}
		
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
     	if (isValEmpty("startTime")) {
	  		alert("The start time cannot be empty");
	  		return false;
	  	}
	  	if (startTime != "") {
	  		if (!checkTime(startTime)) {
				alert("Start time input is wrong, format, such as hours: minutes # #, # # cannot appear the colon in Chinese");
				return false;
			}
	  	}
	  	
     	if (isValEmpty("endTime")) {
	  		alert("The end time cannot be empty");
	  		return false;
	  	}
	  	if (endTime != "") {
	  		if (!checkTime(endTime)) {
				alert("End time input errors, format, such as hours: minutes # #, # # cannot appear the colon in Chinese");
				return false;
			}
	  	}
	  	if(compareTime(startTime,endTime)){
	  		alert("Start time should be before the end of time");
	  		return false;
	  	}
	}
	
	if($("#content").val().trim() == ""){
		alert("Please enter the message content");
		return false;
	}
	if($("#content").val().length > 250){
		alert("The message content is not greater than 250 characters");
		return false;
	}
	var selectCount = 0;
	$("input[name=idListsave]").each(
			function(){
		        if (this.checked === true) {
		        	selectCount ++;
		        }
	});
	if (selectCount ==0) {
		alert("Please select a push terminal");
		return false;
	}	
	return true;
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
                      <li><a href="<%=basePath%>message/pagemessageAction.action">消息管理</a></li>
                      <li class="currentHover"><a>>>修改消息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="message/updatemessageAction.action" method="post">
		<s:hidden name="message.id" value="%{message.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">标题：</th>
				<td class="inp">
					<input name="message.title" id="title" value="${message.title}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">状态：</th>
				<td >
					<s:radio list="#{0:'停用', 1:'启用'}" name="message.status" value="%{message.status}" id="sta"></s:radio>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr style="display: none;">
				<th scope="row" align="right">位置：</th>
				<td >
					<s:radio list="#{1:'顶部', 2:'底部'}" name="message.position" value="%{message.position}" id="position"></s:radio>
				</td>
			</tr>
			
			<tr>
						<th scope="row" align="right">播放模式：</th>
						<td valign="top" class="inp">
							<s:if test="message.type == 1">
								<s:radio list="#{1:'实时播放', 2:'定时播放'}" id="playType" value="1" name="playType" cssClass="playType" onclick="showPlayType()"></s:radio>
							</s:if>
							<s:else>
								<s:radio list="#{1:'实时播放', 2:'定时播放'}" id="playType" value="2" name="playType" cssClass="playType" onclick="showPlayType()"></s:radio>
							</s:else>
							<font style="color: red; margin-left: 10">*</font>
						</td>
					</tr>
				
					<s:if test="message.type == 2">
						<tr id="MessagePlayType">
							<th scope="row" align="right">有效日期段：</th>
							<td class="inp">
								
								<input type="text" name="message.startDate" value="<s:date name="message.startDate" format="yyyy-MM-dd"/>" id="startDate" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\',{d:-1})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" />
								至
								<input type="text" name="message.endDate" value="<s:date name="message.endDate" format="yyyy-MM-dd"/>" id="endDate"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\',{d:0})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" />
								<font style="color: red; margin-left: 10">*</font>
							</td>
						</tr>
						
						<tr id="MessagePlayTimeType">
						<th scope="row" align="right">有效时间段：</th>
						<td class="inp">
							<!-- <input name="message.startTime" id="startTime" maxlength="5" /> -->
							<s:textfield name="message.startTime" id="startTime" maxlength="5"></s:textfield>
							<!-- <input type="text" name="message.startTime" id="startTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\',{d:-1})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" /> -->
									
							至
							<!-- <input type="text" name="message.endTime" id="endTime"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:0})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" /> -->
							<!-- <input name="message.endTime" id="endTime" maxlength="5" /> -->
							<s:textfield name="message.endTime" id="endTime" maxlength="5"></s:textfield>
							<font style="color: red; margin-left: 10">*</font>
							<br/>
							时间格式为（24小时制）：小时:分钟 ,不能出现中文冒号,<font color="red">如：02:12  或 23:10</font>
						</td>
					</tr>
					</s:if>
					<s:else>
						<tr id="MessagePlayType" style="display:none;">
							<th scope="row" align="right">有效日期段：</th>
							<td class="inp">
								
								<input type="text" name="message.startDate" value="<s:date name="message.startDate" format="yyyy-MM-dd"/>" id="startDate" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\',{d:-1})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" />
								至
								<input type="text" name="message.endDate" value="<s:date name="message.endDate" format="yyyy-MM-dd"/>" id="endDate"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\',{d:0})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" />
								<font style="color: red; margin-left: 10">*</font>
							</td>
						</tr>
						
						<tr id="MessagePlayTimeType" style="display: none;">
						<th scope="row" align="right">有效时间段：</th>
						<td class="inp">
							<s:textfield name="message.startTime" id="startTime" maxlength="5"></s:textfield>
							<!-- <input name="message.startTime" id="startTime" maxlength="5" /> -->
							<!-- <input type="text" name="message.startTime" id="startTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\',{d:-1})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" /> -->
									
							至
							<!-- <input type="text" name="message.endTime" id="endTime"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:0})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" /> -->
							<!-- <input name="message.endTime" id="endTime" maxlength="5" /> -->
							<s:textfield name="message.endTime" id="endTime" maxlength="5"></s:textfield>
							<font style="color: red; margin-left: 10">*</font>
							<br/>
							时间格式为（24小时制）：小时:分钟 ,不能出现中文冒号,<font color="red">如：02:12  或 23:10</font>
						</td>
					</tr>
					</s:else>
			<tr>
				<th scope="row" align="right">内容：</th>
				<td class="inp">
					<s:textarea name="message.content" id="content" value="%{message.content}" cols="38" wrap="20" rows="5"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
		  <tr>
		    <th scope="row" valign="top" align="right">推送终端：</th>
		    <td valign="top">
				<ul id="authTree">
				 <s:iterator value="deviceCategoryList" id="item">
				   <li>
				   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
				   <ul style="background-color:#EDEBEB;">
				  	    <s:iterator value="devices" id="items">
				  	 	  <li>
				   		   <input class="check${categoryId}" type="checkbox" <s:if test="msgTagdeviceMap[id] != null">checked=true</s:if> name="idListsave" value="${items.id}" />
				   		   <s:property value="userName"/>
				  		 </li>
				   		</s:iterator>
				   </ul>
				   </li>
				  </s:iterator>
				</ul>
		   </td>
		  </tr>			
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit"  value="保存"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
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
                      <li><a href="<%=basePath%>message/pagemessageAction.action">Message</a></li>
                      <li class="currentHover"><a>>>Modify Message</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 
     <div class="AlonModule_Body">
     	<s:form action="message/updatemessageAction.action" method="post">
		<s:hidden name="message.id" value="%{message.id}"></s:hidden>
		<table width="98%" class="listtable">
			<tr  class="TableTitle">
				<th scope="row" align="right">Title:</th>
				<td class="inp">
					<input name="message.title" id="title" value="${message.title}" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr>
				<th scope="row" align="right">Status:</th>
				<td >
					<s:radio list="#{0:'disable', 1:'To enable the'}" name="message.status" value="%{message.status}" id="sta"></s:radio>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
			<tr style="display: none;">
				<th scope="row" align="right">Location:</th>
				<td >
					<s:radio list="#{1:'At the top of the', 2:'At the bottom of the'}" name="message.position" value="%{message.position}" id="position"></s:radio>
				</td>
			</tr>
			
			<tr>
						<th scope="row" align="right">Playback modes:</th>
						<td valign="top" class="inp">
							<s:if test="message.type == 1">
								<s:radio list="#{1:'Real-time playback', 2:'playing regularly'}" id="playType" value="1" name="playType" cssClass="playType" onclick="showPlayType()"></s:radio>
							</s:if>
							<s:else>
								<s:radio list="#{1:'Real-time playback', 2:'Timing play'}" id="playType" value="2" name="playType" cssClass="playType" onclick="showPlayType()"></s:radio>
							</s:else>
							<font style="color: red; margin-left: 10">*</font>
						</td>
					</tr>
				
					<s:if test="message.type == 2">
						<tr id="MessagePlayType">
							<th scope="row" align="right">Effective date:</th>
							<td class="inp">
								
								<input type="text" name="message.startDate" value="<s:date name="message.startDate" format="yyyy-MM-dd"/>" id="startDate" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\',{d:-1})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" />
								至
								<input type="text" name="message.endDate" value="<s:date name="message.endDate" format="yyyy-MM-dd"/>" id="endDate"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\',{d:0})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" />
								<font style="color: red; margin-left: 10">*</font>
							</td>
						</tr>
						
						<tr id="MessagePlayTimeType">
						<th scope="row" align="right">Effective period:</th>
						<td class="inp">
							<!-- <input name="message.startTime" id="startTime" maxlength="5" /> -->
							<s:textfield name="message.startTime" id="startTime" maxlength="5"></s:textfield>
							<!-- <input type="text" name="message.startTime" id="startTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\',{d:-1})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" /> -->
									
							至
							<!-- <input type="text" name="message.endTime" id="endTime"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:0})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" /> -->
							<!-- <input name="message.endTime" id="endTime" maxlength="5" /> -->
							<s:textfield name="message.endTime" id="endTime" maxlength="5"></s:textfield>
							<font style="color: red; margin-left: 10">*</font>
							<br/>
							Time format for (24-hour) : hours, minutes, cannot appear the colon in Chinese,<font color="red">Such as: 02:12 or 23:10</font>
						</td>
					</tr>
					</s:if>
					<s:else>
						<tr id="MessagePlayType" style="display:none;">
							<th scope="row" align="right">Effective date:</th>
							<td class="inp">
								
								<input type="text" name="message.startDate" value="<s:date name="message.startDate" format="yyyy-MM-dd"/>" id="startDate" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\',{d:-1})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" />
								至
								<input type="text" name="message.endDate" value="<s:date name="message.endDate" format="yyyy-MM-dd"/>" id="endDate"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\',{d:0})}',dateFmt:'yyyy-MM-dd'})" 
										style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" />
								<font style="color: red; margin-left: 10">*</font>
							</td>
						</tr>
						
						<tr id="MessagePlayTimeType" style="display: none;">
						<th scope="row" align="right">Effective period:</th>
						<td class="inp">
							<s:textfield name="message.startTime" id="startTime" maxlength="5"></s:textfield>
							<!-- <input name="message.startTime" id="startTime" maxlength="5" /> -->
							<!-- <input type="text" name="message.startTime" id="startTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\',{d:-1})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-right:10" /> -->
									
							至
							<!-- <input type="text" name="message.endTime" id="endTime"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:0})}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
									style="width:150px; height:20px; font-size:12px; border:solid 1px #ccc; margin-left:10" /> -->
							<!-- <input name="message.endTime" id="endTime" maxlength="5" /> -->
							<s:textfield name="message.endTime" id="endTime" maxlength="5"></s:textfield>
							<font style="color: red; margin-left: 10">*</font>
							<br/>
							Time format for (24-hour) : hours, minutes, cannot appear the colon in Chinese,<font color="red">Such as: 02:12 or 23:10</font>
						</td>
					</tr>
					</s:else>
			<tr>
				<th scope="row" align="right">Content:</th>
				<td class="inp">
					<s:textarea name="message.contente" id="content" value="%{message.contente}" cols="38" wrap="20" rows="5"></s:textarea>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			
		  <tr>
		    <th scope="row" valign="top" align="right">Push Terminal：</th>
		    <td valign="top">
				<ul id="authTree">
				 <s:iterator value="deviceCategoryList" id="item">
				   <li>
				   <input type="checkbox" class="check" name="checkbox1" onclick="selectAll(this,${item.id})"><s:property value="name"/>
				   <ul style="background-color:#EDEBEB;">
				  	    <s:iterator value="devices" id="items">
				  	 	  <li>
				   		   <input class="check${categoryId}" type="checkbox" <s:if test="msgTagdeviceMap[id] != null">checked=true</s:if> name="idListsave" value="${items.id}" />
				   		   <s:property value="userName"/>
				  		 </li>
				   		</s:iterator>
				   </ul>
				   </li>
				  </s:iterator>
				</ul>
		   </td>
		  </tr>			
		
		  <tr>
		  	<td>&nbsp;</td>
				 <td class="addButton">
			        <input type="submit" class="submit"  value="submit"  onclick="return save();"/>&nbsp;&nbsp;&nbsp; 
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

