<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="<%=basePath%>res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<title>添加数字直播信息</title>
<style type="text/css">
<!--
body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
  function checkEmpty(){if(a==1){
  	if (isValEmpty("livemanagementname")) {
  		alert("请输入直播名称");
  		return false;
  	}
  	
  	if (isValEmpty("livemanagementaddress")) {
  		alert("请输入直播地址");
  		return false;
  	}
  	/*
  	if (!$("#livemanagementserver").attr("checked")) {
  		alert("请输勾选可用资源");
  		return false;
  	}
  	
  	
  	if ($("#livemanagementagreement").val() == "a") {
  		alert("请选择协议实现");
  		return false;
  	}
  	
  	if ($("#livemanagementtype").val() == "a") {
  		alert("请选择文件类型");
  		return false;
  	}  */

  	/*
  	var bgntim = $("#begintime").val();
  	var endtim = $("#endtime").val();
  	if (bgntim != "") {
  		if (!checkTime(bgntim)) {
			alert("开始日期输入有误， 格式如   小时:分钟 ");
			return false;
		}
  	}
  	
  	if (endtim != "") {
  		if (!checkTime(endtim)) {
			alert("结束日期输入有误， 格式如   小时:分钟 ");
			return false;
		}
  	}
	if (bgntim.trim() != "" && endtim.trim() != "") {
		if (compareTime(bgntim, endtim)) {
			alert("开始时间不能大于结束时间");
			return false;
		}
	}
	*/
	
	if ($("#description").val().length>500) {
		alert("描述不能超过500个字符");
		return false;
	}
	
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("请选择视频的顺序");
				return false;
			}
     }
  	return true;
  }
  if(a==2){
  	if (isValEmpty("livemanagementname")) {
  		alert("Please enter the name live");
  		return false;
  	}
  	
  	if (isValEmpty("livemanagementaddress")) {
  		alert("Please enter the broadcast address");
  		return false;
  	}
  	/*
  	if (!$("#livemanagementserver").attr("checked")) {
  		alert("请输勾选可用资源");
  		return false;
  	}
  	
  	
  	if ($("#livemanagementagreement").val() == "a") {
  		alert("请选择协议实现");
  		return false;
  	}
  	
  	if ($("#livemanagementtype").val() == "a") {
  		alert("请选择文件类型");
  		return false;
  	}  */

  	/*
  	var bgntim = $("#begintime").val();
  	var endtim = $("#endtime").val();
  	if (bgntim != "") {
  		if (!checkTime(bgntim)) {
			alert("开始日期输入有误， 格式如   小时:分钟 ");
			return false;
		}
  	}
  	
  	if (endtim != "") {
  		if (!checkTime(endtim)) {
			alert("结束日期输入有误， 格式如   小时:分钟 ");
			return false;
		}
  	}
	if (bgntim.trim() != "" && endtim.trim() != "") {
		if (compareTime(bgntim, endtim)) {
			alert("开始时间不能大于结束时间");
			return false;
		}
	}
	*/
	
	if ($("#description").val().length>500) {
		alert("Description cannot exceed 500 characters");
		return false;
	}
	
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("Please select a video sequence");
				return false;
			}
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


 <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <!-- <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">直播双模管理</a></li>
                 </ul> -->
                 <ul>
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action?type=goListLiveMange">数字直播管理</a></li>
                      <li class="currentHover"><a>>>添加数字直播信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
    
	 <div class="AlonModule_list">
<s:form action="singelLive/saveLive.action" method="post" >
 <div class="AlonModule_Body">
<table width="98%" class="listtable">

	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr>
					<th scope="row" align="right">直播名称：</th>
					<td class="STYLE1"><input maxlength="30" size="30" type="text" name="model.livemanagementname" id="livemanagementname" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<th scope="row" align="right">直播地址：</th>
					<td class="STYLE1"><input maxlength="300" type="text" name="model.livemanagementaddress" id="livemanagementaddress" size="95px" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>
						
				
				<s:hidden name="model.livemanagementgrade" value="MO"></s:hidden>
				<s:hidden name="model.recording" value="0"></s:hidden>
				<s:hidden name="model.source" value="0"></s:hidden>
				
				<tr>
					<th scope="row" align="right">顺序：</th>
					<td valign="top">
						<s:radio list="#{0:'最后一个', 1:'置于指定节目之前'}" id="positionType" value="0" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					</td>
				</tr>
				
				<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="allLiveList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.livemanagementname} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row" align="right">描述：</th>
					<td class="STYLE1"><s:textarea name="model.description" id="description" cols="80" rows="5" ></s:textarea></td>
				</tr>								
							
			</table>
		</td>
	</tr>

 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="submit" name="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
			<input type="reset" name="reset" value="重置" class="STYLE1"  />
			<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</div>
</s:form>
</div>
</s:if>
<s:if test="#session.language==2">


 <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <!-- <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">直播双模管理</a></li>
                 </ul> -->
                 <ul>
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action?type=goListLiveMange">Digital broadcast management</a></li>
                      <li class="currentHover"><a>>>Add live digital information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
    
	 <div class="AlonModule_list">
<s:form action="singelLive/saveLive.action" method="post" >
 <div class="AlonModule_Body">
<table width="98%" class="listtable">

	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr>
					<th scope="row" align="right">Live name:</th>
					<td class="STYLE1"><input maxlength="30" size="30" type="text" name="model.livemanagementnamee" id="livemanagementname" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<th scope="row" align="right">Broadcast address:</th>
					<td class="STYLE1"><input maxlength="300" type="text" name="model.livemanagementaddress" id="livemanagementaddress" size="95px" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>
				
				<s:hidden name="model.livemanagementgrade" value="MO"></s:hidden>
				<s:hidden name="model.recording" value="0"></s:hidden>
				<s:hidden name="model.source" value="0"></s:hidden>
				
				<tr>
					<th scope="row" align="right">The order：</th>
					<td valign="top">
						<s:radio list="#{0:'The last one, 1: placed in the designated program before'}" id="positionType" value="0" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					</td>
				</tr>
				
				<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="allLiveList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.livemanagementname} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row" align="right">Description:</th>
					<td class="STYLE1"><s:textarea name="model.description" id="description" cols="80" rows="5" ></s:textarea></td>
				</tr>								
							
			</table>
		</td>
	</tr>

 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="submit" name="submit" value="sunmit" onclick="return checkEmpty()" class="STYLE1" />
			<input type="reset" name="reset" value="reset" class="STYLE1"  />
			<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</div>
</s:form>
</div>
</s:if>
</body>
</html>
