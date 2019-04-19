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
<script language="JavaScript" src="<%=basePath %>js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>js/jquery-1.3.2.min.js"></script>
<title>无标题文档</title>
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
  	var name = document.getElementById('vodpartname').value;
  	if(name!=null&&name!=""){
  		if ($("#partintr").val().length>255) {
  			alert("描述不能超过255个字符");
  			return false;
  		}
  		return true;
  	}else{
  		document.getElementById('error').innerHTML ="请按要求填写*部分的内容信息";
  		return false;
  	}
  	return false;
  }
  if(a==2){
  	var name = document.getElementById('vodpartname').value;
  	if(name!=null&&name!=""){
  		if ($("#partintr").val().length>255) {
  			alert("Description cannot exceed 255 characters");
  			return false;
  		}
  		return true;
  	}else{
  		document.getElementById('error').innerHTML ="Please fill in the required * part of the contents of the information";
  		return false;
  	}
  	return false;
  }
  }
</script>

</head>

<body>
<s:if test="#session.language==1">
<s:form action="vodPartAction_updateVodPart.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">修改点播栏目</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr><s:hidden name="model.id" id="id" value="%{model.id}"></s:hidden>
					<td align="right" class="STYLE1" style="margin-right: 10px">栏目名称：</td>
					<td class="STYLE1"><input maxlength="30" type="text" name="model.vodpartname" id="vodpartname" value="${model.vodpartname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">描述：</td>
					<td class="STYLE1"><s:textarea name="model.partintr" id="partintr" value="%{model.partintr}"  cols="80" rows="5" ></s:textarea> </td>
				</tr>								
							
			</table>
		</td>
	</tr>



 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<!--
			<s:submit value="提交"  cssClass="STYLE1" />
			  -->
			<input type="submit" name="submit" value="提交" onclick=" return checkEmpty()" class="STYLE1" />
			<input type="reset" name="reset" value="重置" class="STYLE1"  />
			<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:form>
</s:if>
<s:if test="#session.language==2">
<s:form action="vodPartAction_updateVodPart.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">Changes on demand program</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr><s:hidden name="model.id" id="id" value="%{model.id}"></s:hidden>
					<td align="right" class="STYLE1" style="margin-right: 10px">Column name:</td>
					<td class="STYLE1"><input maxlength="30" type="text" name="model.vodpartname" id="vodpartname" value="${model.vodpartname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">describe：</td>
					<td class="STYLE1"><s:textarea name="model.partintr" id="partintr" value="%{model.partintr}"  cols="80" rows="5" ></s:textarea> </td>
				</tr>								
							
			</table>
		</td>
	</tr>



 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<!--
			<s:submit value="提交"  cssClass="STYLE1" />
			  -->
			<input type="submit" name="submit" value="submit" onclick=" return checkEmpty()" class="STYLE1" />
			<input type="reset" name="reset" value="reset" class="STYLE1"  />
			<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:form>
</s:if>
</body>
</html>
