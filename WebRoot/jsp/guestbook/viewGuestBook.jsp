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
<style type="text/css">
	#wrap{word-break:break-all; width:500px; overflow:auto;}
</style>
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
  function checkEmpty(){if(a==1){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入频道名称");
		return false;
	}
	//验证频率
	if ($("#freq").val().trim() == '') {
		alert("请输入正确的频率（数字）");
		return false;
	}
	//验证频道顺序
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("请选择频道的顺序");
				return false;
			}
   }
  }
  if(a==2){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter the channel name");
		return false;
	}
	//验证频率
	if ($("#freq").val().trim() == '') {
		alert("Please input the correct frequency (digital)");
		return false;
	}
	//验证频道顺序
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("Please select the order of the channel");
				return false;
			}
   }
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
                      <li><a style="white-space: nowrap;" href="<%=basePath%>guestbook/guestBookAction_home.action">留言管理</a></li>
                      <li class="currentHover"><a>>>查看留言管理信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="guestBookAction_view.action" namespace="/guestbook" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="model.id" ></s:hidden>
			<tr>
				<th scope="row" align="right" >用户姓名:</th>
				<td class="inp">
					<div style="padding-left: 10px;color:black;">
				        ${model.user_name }
				    </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> 联系电话:</th>
				<td class="inp">
				<div style="padding-left: 10px;color:black;">
				        ${model.tel }
				    </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> 创建时间:</th>
				<td class="inp">
				<div style="padding-left: 10px;color:black;">
				        <s:date name="model.create_time" format="yyyy-MM-dd HH:mm:ss"/>
				  </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> 留言内容:</th>
				<td class="inp">
					<div style="padding-left: 10px;color:black;" id="wrap">
				        ${model.msg }
				    </div>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        
				<input type="button" name="back" value="关闭" class="STYLE1" style="margin-left:250px;" onclick="window.history.go(-1);"/>
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
                      <li><a style="white-space: nowrap;" href="<%=basePath%>guestbook/guestBookAction_home.action">Message management</a></li>
                      <li class="currentHover"><a>>>Check the message management information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="guestBookAction_view.action" namespace="/guestbook" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="model.id" ></s:hidden>
			<tr>
				<th scope="row" align="right" >User name:</th>
				<td class="inp">
					<div style="padding-left: 10px;color:black;">
				        ${model.user_name }
				    </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> Contact phone number:</th>
				<td class="inp">
				<div style="padding-left: 10px;color:black;">
				        ${model.tel }
				    </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> Create a time:</th>
				<td class="inp">
				<div style="padding-left: 10px;color:black;">
				        <s:date name="model.create_time" format="yyyy-MM-dd HH:mm:ss"/>
				  </div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right"> Message content:</th>
				<td class="inp">
					<div style="padding-left: 10px;color:black;" id="wrap">
				        ${model.msg }
				    </div>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        
				<input type="button" name="back" value="Shut down" class="STYLE1" style="margin-left:250px;" onclick="window.history.go(-1);"/>
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

