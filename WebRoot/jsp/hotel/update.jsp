<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.boyue.karaoke.model.DeviceCategory"%>
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
<title>修改</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script type="text/javascript">
function back(){
	location.href = "<%=basePath%>device/pagedeciveAction.action";
}


function tijiao(){
	
		var hotelname=$("#hotelname").val();
			
		var hotelid=$("#hotelid").val();
		
		if (hotelname==null || hotelname=="") {
			$("#hotelname2").val("酒店名称不能为空");
			alert("酒店名称不能为空");
			 return false;
		}
		
		if (hotelid==null || hotelid=="") {
			$("#hotelid2").val("酒店id不能为空");
			alert("酒店id不能为空");
			 return false;
		}
	     return true;
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
                        <li><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                        <li class="currentHover"><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	<!--  <div class="AlonModule_Body"> -->
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/hotel" method="post" onsubmit="return tijiao();">
     <div class="AlonModule_Body">
      <s:hidden name="hotelRegister.id" value="1"></s:hidden>
		<table width="98%" class="listtable">
			<tr>
				<td  colspan="2" align="center" style="color: red; margin-left: 10">以下信息请勿随意修改</td>
			</tr>
		<tr>
				<th scope="row" align="right">当前酒店名称：</th>
				<td class="inp" align="left">
					<s:textfield name="hotelRegister.oldhotelname" style="color: #CCC" maxlength="30" readonly="true"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">酒店名称：</th>
				<td class="inp" align="left">
					<s:textfield name="hotelRegister.hotelname" id="hotelname" maxlength="30" /><font id="hotelname2" style="color: red; margin-left: 10">必填项*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">酒店ID：</th>
				<td class="inp" align="left">
				<s:textfield name="hotelRegister.hotelid" id="hotelid" maxlength="30" /><font id="hotelid2" style="color: red; margin-left: 10">必填项*</font>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
			 	<s:submit value="确定"/>
		        <input type="submit" value="保存" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="返回" onclick="back();"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                        <li><a href="<%=basePath%>device/pagedeciveAction.action">终端设备列表</a></li>
                      <li ><a href="<%=basePath%>deviceCategory/list.action">终端设备分类</a></li>
                       <li ><a href="<%=basePath%>terminalmenu/list.action">终端排版管理</a></li>
                        <li ><a href="<%=basePath%>backimg/list.action">其他设置</a></li>
                        <li class="currentHover"><a href="<%=basePath%>hotel/list.action">酒店注册</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	<!--  <div class="AlonModule_Body"> -->
	 <div class="AlonModule_list">
	 <s:form action="update" namespace="/hotel" method="post">
     <div class="AlonModule_Body">
      <s:hidden name="hotelRegister.id" value="1"></s:hidden>
		<table width="98%" class="listtable">
			<tr>
				<td  colspan="2" align="center" style="color: red; margin-left: 10"></td>
			</tr>
		<tr>
				<th scope="row" align="right">Current hotel name：</th>
				<td class="inp" align="left">
					<s:textfield name="hotelRegister.oldhotelname" style="color: #CCC" maxlength="30" readonly="true"/><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">hotel name：</th>
				<td class="inp" align="left">
					<s:textfield name="hotelRegister.hotelname" maxlength="30"  /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">hotelID：</th>
				<td class="inp" align="left">
				<s:textfield name="hotelRegister.hotelid" maxlength="30" /><font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="保存" />&nbsp;&nbsp;&nbsp; 
		        <input type="button" value="返回" onclick="back();"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</s:if>
</body>
</html>

