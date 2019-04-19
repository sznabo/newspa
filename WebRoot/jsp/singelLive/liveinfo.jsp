<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
  function checkEmpty(){
  	var name = document.getElementById('livemanagementname').value;
  	var addres = document.getElementById('livemanagementaddress').value;
  	var agree = document.getElementById('livemanagementagreement').value;
  	var filtype = document.getElementById('livemanagementtype').value;
  	var grade   = document.getElementById('livemanagementgrade').value;
  	var record  = document.getElementById('recording').value;
  	var source  = document.getElementById('source').value;
  	var bgntim  = document.getElementById('begintime').value;
  	var endtim  = document.getElementById('endtime').value;
  	if(name.replace(/\s/g,"")!=""&&addres.replace(/\s/g,"")!=""&&agree!='a'&&filtype!='a'&&grade!='a'&&bgntim.replace(/\s/g,"")!=""&&endtim.replace(/\s/g,"")!=""){
  		var obj = document.getElementsByName('livemanagementserver');
  		var ids = [];
  		for ( var i = 0; i < obj.length; i++) {
  			if(obj[i].checked == true){
  				var id = obj[i].value;
				ids.push(id);	
			}
		}
		if (ids.length<=0){
	        alert('请选择资源服务器！');
	        return false;
	    }else {
	    	return true;
		}
  		return false;
  	}else{
  		document.getElementById('error').innerHTML ="请按要求填写*部分的内容信息";
  		return false;
  	}
  	return false;
  }
</script>

</head>

<body>
<s:if test="#session.language==1">
<s:form action="liveManagement_updateLive.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">添加直播频道</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr><s:hidden name="id" id="id" value="%{model.id}"></s:hidden>
					<td align="right" class="STYLE1" style="margin-right: 10px">直播名称：</td>
					<td class="STYLE1"><input type="text" name="livemanagementname" id="livemanagementname" maxlength="20" value="${model.livemanagementname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">直播地址：</td>
					<td class="STYLE1"><input type="text" name="livemanagementaddress" id="livemanagementaddress" maxlength="1024" value="${model.livemanagementaddress}" size="45" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>
			
				<!-- 资源服务器分配修改 -->
				<tr id="subtree">
					<td align="right" class="STYLE1" style="margin-right: 10px">资源服务器：</td>
					<td class="STYLE1">
						<table>
							<!-- 已选择的服务器 -->
							<s:iterator value="servicerListChecked" id="list">
								<tr>
									<td height="28" class="STYLE1">
										<input type="checkbox" name="livemanagementserver" id="livemanagementserver" checked="checked" value="${serviceid}" />
										<s:hidden name="livemanagementservername" id="livemanagementservername" value="%{servicename}" ></s:hidden>
									</td>
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
							<!-- 未选择服务器 -->
							<s:iterator value="serverList" id="list2">
								<tr>
									<td height="28" class="STYLE1">
										<input type="checkbox" name="livemanagementserver" id="livemanagementserver" value="${serviceid}" />
										<s:hidden name="livemanagementservername" id="livemanagementservername" value="%{servicename}" ></s:hidden>
									</td>
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>				
			
				<!-- 该策略暂无实现 -->
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">策略列表：</td>
					<td class="STYLE1">
						<input type="radio" name="strategylist" id="strategylist" value="1"/>回看<span><font style="color: red">&nbsp;&nbsp;&nbsp;</font></span>
						<input type="radio" name="strategylist" id="strategylist" value="0"/>不回看<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>	
				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">文件类型：</td>
					<td class="STYLE1"><select name="livemanagementtype" id="livemanagementtype">
							<s:if test="%{model.livemanagementtype=='wmv'}">
	                			<option value="a">===请选择===</option>
	                			<option value="wmv" selected="selected">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:if>
							<s:elseif test="%{model.livemanagementtype=='rmvb'}">
	                			<option value="a">===请选择===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb" selected="selected">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='ts'}">
	                			<option value="a">===请选择===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts" selected="selected">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='itv'}">
	                			<option value="a">===请选择===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv" selected="selected">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='flv'}">
	                			<option value="a">===请选择===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv" selected="selected">flv</option>							
							</s:elseif>
							<s:else>
	                			<option value="a">===请选择===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:else>
             			 </select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
							
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">协议实现：</td>
					<td class="STYLE1"><select name="livemanagementagreement" id="livemanagementagreement">
							<s:if test="%{model.livemanagementagreement==0}">
								<option value="a">===请选择===</option>
								<option value="0" selected="selected" >微软兼容(ms_wms)</option>
								<option value="1" >Real兼容(real)</option>
								<option value="2" >标准HTTP方式</option>
								<option value="3" >原力HTTP方式</option>
								<option value="4" >标准UDP方式</option>								
							</s:if>	
													
							<s:elseif test="%{model.livemanagementagreement==1}">
								<option value="a">===请选择===</option>
								<option value="0" >微软兼容(ms_wms)</option>
								<option value="1" selected="selected" >Real兼容(real)</option>
								<option value="2" >标准HTTP方式</option>
								<option value="3" >原力HTTP方式</option>
								<option value="4" >标准UDP方式</option>
							</s:elseif>
							
							<s:elseif test="%{model.livemanagementagreement==2}">
								<option value="a">===请选择===</option>
								<option value="0" >微软兼容(ms_wms)</option>
								<option value="1" >Real兼容(real)</option>
								<option value="2" selected="selected" >标准HTTP方式</option>
								<option value="3" >原力HTTP方式</option>
								<option value="4" >标准UDP方式</option>							
							</s:elseif>												
 							<s:elseif test="%{model.livemanagementagreement==3}">
								<option value="a">===请选择===</option>
								<option value="0" >微软兼容(ms_wms)</option>
								<option value="1" >Real兼容(real)</option>
								<option value="2" >标准HTTP方式</option>
								<option value="3" selected="selected" >原力HTTP方式</option>
								<option value="4" >标准UDP方式</option> 							
							</s:elseif>               			
 							<s:elseif test="%{model.livemanagementagreement==4}">
								<option value="a">===请选择===</option>
								<option value="0" >微软兼容(ms_wms)</option>
								<option value="1" >Real兼容(real)</option>
								<option value="2" >标准HTTP方式</option>
								<option value="3" >原力HTTP方式</option>
								<option value="4" selected="selected" >标准UDP方式</option>
							</s:elseif>
							<s:else>
								<option value="a" selected="selected">===请选择===</option>
								<option value="0" >微软兼容(ms_wms)</option>
								<option value="1" >Real兼容(real)</option>
								<option value="2" >标准HTTP方式</option>
								<option value="3" >原力HTTP方式</option>
								<option value="4" >标准UDP方式</option>								
							</s:else>        			
                			</select>
							<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">视频等级：</td>
					<td class="STYLE1"><select name="livemanagementgrade" id="livemanagementgrade">
							<s:if test="%{model.livemanagementgrade=='M0'}">
								<option value="a">===请选择===</option>
								<option value="M0" selected="selected">M0</option>							
							</s:if>
							<s:else>
								<option value="a">===请选择===</option>
								<option value="M0">M0</option>							
							</s:else>
						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color:red; ">开启录制：</font></td>
					<td class="STYLE1"><select name="recording" id="recording">
							<s:if test="%{model.recording==1}">
								<option value="0">关闭</option>
	              				<option value="1" selected="selected">开启</option>							
							</s:if>
							<s:else>
								<option value="0">关闭</option>
	              				<option value="1">开启</option>							
							</s:else>
              			</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color:red; ">节目单来源：</font></td>
					<td class="STYLE1"><select name="source" id="source">
							<s:if test="%{model.source==1}">
								<option value="0">导入</option>
              					<option value="1" selected="selected">抓取</option>						
							</s:if>
							<s:else>
								<option value="0">导入</option>
              					<option value="1">抓取</option>							
							</s:else>
              			</select>
						<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>						
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">节目单抓取地址：</td>
					<td class="STYLE1"><input type="text" name="crawladdress" id="crawladdress" maxlength="1024" value="${model.crawladdress}" size="60px"/></td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">节目单保存时间：</td>
					<td class="STYLE1"><input type="text" name="programsavetime" id="programsavetime" value="${model.programsavetime}"/></td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">录制延长时间（分钟）：</td>
					<td class="STYLE1"><input type="text" name="recordingtime" id="recordingtime" value="${model.recordingtime}"/></td>
				</tr>	
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color: red;">开始时间：</font> </td>
					<td class="STYLE1"><input type="text" name="begintime" id="begintime" value="${model.begintime}" /><span><font style="color: red">&nbsp;*&nbsp;(hh:mm)</font></span></td>
				</tr>				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">结束时间：</td>
					<td class="STYLE1"><input type="text" name="endtime" id="endtime" value="${model.endtime}" /><span><font style="color: red">&nbsp;*&nbsp;(hh:mm)</font></span></td>
				</tr>	
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">描述：</td>
					<td class="STYLE1"><s:textarea name="description" id="description" value="%{model.description}"  cols="80" rows="5" ></s:textarea> </td>
				</tr>								
							
			</table>
		</td>
	</tr>

 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:form>
</s:if>
<s:if test="#session.language==2">
<s:form action="liveManagement_updateLive.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">Add a broadcast</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr><s:hidden name="id" id="id" value="%{model.id}"></s:hidden>
					<td align="right" class="STYLE1" style="margin-right: 10px">name：</td>
					<td class="STYLE1"><input type="text" name="livemanagementname" id="livemanagementname" maxlength="20" value="${model.livemanagementname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Broadcast address:</td>
					<td class="STYLE1"><input type="text" name="livemanagementaddress" id="livemanagementaddress" maxlength="1024" value="${model.livemanagementaddress}" size="45" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>
			
				<!-- 资源服务器分配修改 -->
				<tr id="subtree">
					<td align="right" class="STYLE1" style="margin-right: 10px">Resource server:</td>
					<td class="STYLE1">
						<table>
							<!-- 已选择的服务器 -->
							<s:iterator value="servicerListChecked" id="list">
								<tr>
									<td height="28" class="STYLE1">
										<input type="checkbox" name="livemanagementserver" id="livemanagementserver" checked="checked" value="${serviceid}" />
										<s:hidden name="livemanagementservername" id="livemanagementservername" value="%{servicename}" ></s:hidden>
									</td>
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
							<!-- 未选择服务器 -->
							<s:iterator value="serverList" id="list2">
								<tr>
									<td height="28" class="STYLE1">
										<input type="checkbox" name="livemanagementserver" id="livemanagementserver" value="${serviceid}" />
										<s:hidden name="livemanagementservername" id="livemanagementservername" value="%{servicename}" ></s:hidden>
									</td>
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>				
			
				<!-- 该策略暂无实现 -->
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Policy list：</td>
					<td class="STYLE1">
						<input type="radio" name="strategylist" id="strategylist" value="1"/>look back<span><font style="color: red">&nbsp;&nbsp;&nbsp;</font></span>
						<input type="radio" name="strategylist" id="strategylist" value="0"/>Don't look back<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>	
				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">file type：</td>
					<td class="STYLE1"><select name="livemanagementtype" id="livemanagementtype">
							<s:if test="%{model.livemanagementtype=='wmv'}">
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv" selected="selected">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:if>
							<s:elseif test="%{model.livemanagementtype=='rmvb'}">
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb" selected="selected">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='ts'}">
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts" selected="selected">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='itv'}">
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv" selected="selected">itv</option>
	                			<option value="flv">flv</option>							
							</s:elseif>
							<s:elseif test="%{model.livemanagementtype=='flv'}">
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv" selected="selected">flv</option>							
							</s:elseif>
							<s:else>
	                			<option value="a">===Please select a===</option>
	                			<option value="wmv">wmv</option>
	               		 	    <option value="rmvb">rmvb</option>
	                			<option value="ts">ts</option>
	                			<option value="itv">itv</option>
	                			<option value="flv">flv</option>							
							</s:else>
             			 </select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
							
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Protocol implementation：</td>
					<td class="STYLE1"><select name="livemanagementagreement" id="livemanagementagreement">
							<s:if test="%{model.livemanagementagreement==0}">
								<option value="a">===Please select a===</option>
								<option value="0" selected="selected" >Microsoft compatible(ms_wms)</option>
								<option value="1" >Realcompatibility
(real)</option>
								<option value="2" >The standard HTTP methods</option>
								<option value="3" >The force HTTP</option>
								<option value="4" >Standard UDP way</option>								
							</s:if>	
													
							<s:elseif test="%{model.livemanagementagreement==1}">
								<option value="a">===Please select a===</option>
								<option value="0" >Microsoft compatible(ms_wms)</option>
								<option value="1" selected="selected" >Realcompatibility(real)</option>
								<option value="2" >The standard HTTP methods</option>
								<option value="3" >The force HTTP</option>
								<option value="4" >Standard UDP way</option>
							</s:elseif>
							
							<s:elseif test="%{model.livemanagementagreement==2}">
								<option value="a">===Please select a===</option>
								<option value="0" >Microsoft compatible(ms_wms)</option>
								<option value="1" >Realcompatibility(real)</option>
								<option value="2" selected="selected" >The standard HTTP methods</option>
								<option value="3" >The force HTTP</option>
								<option value="4" >Standard UDP way</option>							
							</s:elseif>												
 							<s:elseif test="%{model.livemanagementagreement==3}">
								<option value="a">===Please select a===</option>
								<option value="0" >Microsoft compatible(ms_wms)</option>
								<option value="1" >Realcompatibility(real)</option>
								<option value="2" >The standard HTTP methods</option>
								<option value="3" selected="selected" >The force HTTP</option>
								<option value="4" >Standard UDP way</option> 							
							</s:elseif>               			
 							<s:elseif test="%{model.livemanagementagreement==4}">
								<option value="a">===Please select a===</option>
								<option value="0" >Microsoft compatible(ms_wms)</option>
								<option value="1" >RealCompatible with(real)</option>
								<option value="2" >The standard HTTP methods</option>
								<option value="3" >The force HTTP</option>
								<option value="4" selected="selected" >Standard UDP way</option>
							</s:elseif>
							<s:else>
								<option value="a" selected="selected">===Please select a===</option>
								<option value="0" >Microsoft compatible(ms_wms)</option>
								<option value="1" >Realcompatibility(real)</option>
								<option value="2" >The standard HTTP methods</option>
								<option value="3" >The force HTTP</option>
								<option value="4" >Standard UDP way</option>								
							</s:else>        			
                			</select>
							<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Video class：</td>
					<td class="STYLE1"><select name="livemanagementgrade" id="livemanagementgrade">
							<s:if test="%{model.livemanagementgrade=='M0'}">
								<option value="a">===Please select a===</option>
								<option value="M0" selected="selected">M0</option>							
							</s:if>
							<s:else>
								<option value="a">===Please select a===</option>
								<option value="M0">M0</option>							
							</s:else>
						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color:red; ">Open the recording:</font></td>
					<td class="STYLE1"><select name="recording" id="recording">
							<s:if test="%{model.recording==1}">
								<option value="0">Shut down</option>
	              				<option value="1" selected="selected">open</option>							
							</s:if>
							<s:else>
								<option value="0">Shut down</option>
	              				<option value="1">open</option>							
							</s:else>
              			</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color:red; ">Program source：</font></td>
					<td class="STYLE1"><select name="source" id="source">
							<s:if test="%{model.source==1}">
								<option value="0">import</option>
              					<option value="1" selected="selected">grab</option>						
							</s:if>
							<s:else>
								<option value="0">导入</option>
              					<option value="1">grab</option>							
							</s:else>
              			</select>
						<span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>						
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">The programme grab address：</td>
					<td class="STYLE1"><input type="text" name="crawladdress" id="crawladdress" maxlength="1024" value="${model.crawladdress}" size="60px"/></td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">The programme to save time:</td>
					<td class="STYLE1"><input type="text" name="programsavetime" id="programsavetime" value="${model.programsavetime}"/></td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Recording to extend the time (minutes)：</td>
					<td class="STYLE1"><input type="text" name="recordingtime" id="recordingtime" value="${model.recordingtime}"/></td>
				</tr>	
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px"><font style="color: red;">start time：</font> </td>
					<td class="STYLE1"><input type="text" name="begintime" id="begintime" value="${model.begintime}" /><span><font style="color: red">&nbsp;*&nbsp;(hh:mm)</font></span></td>
				</tr>				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">end time
：</td>
					<td class="STYLE1"><input type="text" name="endtime" id="endtime" value="${model.endtime}" /><span><font style="color: red">&nbsp;*&nbsp;(hh:mm)</font></span></td>
				</tr>	
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">describe：</td>
					<td class="STYLE1"><s:textarea name="description" id="description" value="%{model.description}"  cols="80" rows="5" ></s:textarea> </td>
				</tr>								
							
			</table>
		</td>
	</tr>

 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:form>
</s:if>
</body>
</html>
