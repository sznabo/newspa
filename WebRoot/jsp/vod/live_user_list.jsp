<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=basePath%>webjsp/style/common.css" type="text/css">
<script language="JavaScript" src="<%=basePath%>js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="<%=basePath%>js/common.js"></script>
 <script language="javascript" type="text/javascript" src="<%=basePath%>js/my97datepicker/WdatePicker.js" defer="defer"></script>
<title>用户查询</title>
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

</head>

<body>
<s:if test="#session.language==1">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="3" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">[${curProgram.voidprogramname}]在线用户信息列表(<s:property value="#vodUserList.size()"/>)</div></td>
    <td background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3" width="50"><input type="button" value="返回" onclick="javascript:window.history.go(-1);"/></td>
  </tr> 
  <!-- MAC批量导入 -->
  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   <table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr> 
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">用户姓名</div></td>
					<td   height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">设备ID</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">设备状态</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">所属代理商</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">使用产品</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">设备开通时间</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">设备到期时间</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">创建时间</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">IP地址</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">最近连接时间</div></td>
				</tr>
	      <s:iterator value="vodUserList" id="item">
	      <tr>
	        <td   height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  ${item.username} </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="boxmac"/></div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="macisable==1">启用</s:if><s:else>停用</s:else>   </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="#item.agent != null">${item.agent.name}</s:if>  </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="#item.product != null">${item.product.name}</s:if>  </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="macbegintime" format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="macendtime"  format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="createtime"  format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"> ${item.userVideo.ip}</div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="#item.userVideo.date"  format="yyyy-MM-dd HH:mm:ss"/></div></td>
	      </tr>
	      </s:iterator>
	    </table>
	</td>
 </tr>
</table>
</s:if>
<s:if test="#session.language==2">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="3" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">[${curProgram.voidprogramname}]Online user information list(<s:property value="#vodUserList.size()"/>)</div></td>
    <td background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3" width="50"><input type="button" value="return" onclick="javascript:window.history.go(-1);"/></td>
  </tr> 
  <!-- MAC批量导入 -->
  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   <table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr> 
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">The user name</div></td>
					<td   height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Device ID</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Equipment state</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Belong to the agent</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Use the product</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Equipment opening time</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Equipment due time</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Creation time</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">The IP address</div></td>
					<td  height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Recent connection time</div></td>
				</tr>
	      <s:iterator value="vodUserList" id="item">
	      <tr>
	        <td   height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  ${item.username} </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="boxmac"/></div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="macisable==1">To enable the</s:if><s:else>disable</s:else>   </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="#item.agent != null">${item.agent.name}</s:if>  </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">  <s:if test="#item.product != null">${item.product.name}</s:if>  </div></td>
	        <td height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="macbegintime" format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="macendtime"  format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="createtime"  format="yyyy-MM-dd"/></div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"> ${item.userVideo.ip}</div></td>
	        <td  height="35" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:date name="#item.userVideo.date"  format="yyyy-MM-dd HH:mm:ss"/></div></td>
	      </tr>
	      </s:iterator>
	    </table>
	</td>
 </tr>
</table>
</s:if>
</body>
</html>
