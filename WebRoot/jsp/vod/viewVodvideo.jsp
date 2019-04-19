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

</script>

</head>

<body>
<s:if test="#session.language==1">
<s:form action="vodVideoAction_updateVodvideo.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">【<%=session.getAttribute("vodprogramname") %>】节目--修改续集</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
				<s:hidden name="id" id="id" value="%{model.id}"></s:hidden>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">视频名称：</td>
					<td class="STYLE1"><input type="text" name="voidname" id="voidname" value="${model.voidname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">播放地址：</td>
					<td class="STYLE1"><input type="text" name="voidpath" id="voidpath" value="${model.voidpath}" size="90px" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>

				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">视频格式：</td>
					<td class="STYLE1"><select name="voidformat" id="voidformat">
						 <s:if test="%{model.voidformat=='wmv'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv" selected="selected">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:if>
						 <s:elseif test="%{model.voidformat=='mp3'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3" selected="selected">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>
						 <s:elseif test="%{model.voidformat=='rmvb'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb" selected="selected">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='ts'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts" selected="selected">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='itv'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv"  selected="selected">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='flv'}">
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv" selected="selected">flv</option>						 
						 </s:elseif>		
						 <s:else>
                			<option value="a">===请选择===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
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
					<td align="right" class="STYLE1" style="margin-right: 10px">视频等级：</td>
					<td class="STYLE1"><select name="voidgrade" id="voidgrade">
						  <s:if test="%{model.voidgrade=='M0'}">
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
				
				<!-- 视频发布状态--> 			
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">视频发布状态：</td>
					<td class="STYLE1"><select name="voidstatus" id="voidstatus">
						  <s:if test="%{model.voidstatus==1}">
							<option value="0">未发布</option>
							<option value="1" selected="selected">发布</option>						  
						  </s:if>
						  <s:else>
							<option value="0">未发布</option>
							<option value="1">发布</option>						  
						  </s:else>

						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">视频启用状况：</td>
					<td class="STYLE1"><select name="ifenable" id="ifenable">
						  <s:if test="%{model.ifenable==1}">
							<option value="0">停止</option>
							<option value="1" selected="selected">启用</option>						  
						  </s:if>
						  <s:else>
							<option value="0">停止</option>
							<option value="1">启用</option>						  
						  </s:else>

						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>				
				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">分发类型：</td>
					<td class="STYLE1"><select name="releasetype" id="releasetype" onchange="selectRosService(this)">
						  <s:if test="%{model.releasetype==1}">
							<option value="0">自动发布</option>
              				<option value="1" selected="selected">手动发布</option>						  
						  </s:if>	
						  <s:else>
							<option value="0">自动发布</option>
              				<option value="1">手动发布</option>						  
						  </s:else>
              			</select>
						<span><font style="color: red">&nbsp;*<span id="errorService"></span> </font></span>
					</td>
				</tr>
				
				<!--注意操作方式-->
				<tr id="subtree">
					<td align="right" class="STYLE1" style="margin-right: 10px">资源服务器：</td>
					<td class="STYLE1">
						<table>
							<!-- 已选择的服务器 -->
							<s:iterator value="servicerListChecked">
								<tr>
									<td height="25" class="STYLE1">
									<input type="checkbox" name="serverid" id="serverid" checked="checked" value="${serverid}" /></td>
									<input type="hidden" name="servicename" id="servicename" value="${servicename}" />
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
							<!-- 未选择服务器 -->
							<s:iterator value="servicerList" id="list">
								<tr>
									<td height="25" class="STYLE1">
									<input type="checkbox" name="serverid" id="serverid" value="${serverid}" /></td>
									<input type="hidden" name="servicename" id="servicename" value="${servicename}" />
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
						</table>
					</td>
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
<s:form action="vodVideoAction_updateVodvideo.action" method="post" >
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">【<%=session.getAttribute("vodprogramname") %>】Show, modify the sequel</div></td>
  </tr>
	
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
				<s:hidden name="id" id="id" value="%{model.id}"></s:hidden>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">name of the video:</td>
					<td class="STYLE1"><input type="text" name="voidname" id="voidname" value="${model.voidname}" /><span><font style="color: red">&nbsp;*&nbsp;&nbsp;</font></span><font style="color: red;size: 12px"><span id="error"></span></font></td>
				</tr>
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Broadcast address:</td>
					<td class="STYLE1"><input type="text" name="voidpath" id="voidpath" value="${model.voidpath}" size="90px" /><span><font style="color: red">&nbsp;*</font></span></td>
				</tr>

				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Video formats:</td>
					<td class="STYLE1"><select name="voidformat" id="voidformat">
						 <s:if test="%{model.voidformat=='wmv'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv" selected="selected">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:if>
						 <s:elseif test="%{model.voidformat=='mp3'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3" selected="selected">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>
						 <s:elseif test="%{model.voidformat=='rmvb'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb" selected="selected">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='ts'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts" selected="selected">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='itv'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv"  selected="selected">itv</option>
                			<option value="flv">flv</option>						 
						 </s:elseif>	
						 <s:elseif test="%{model.voidformat=='flv'}">
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
               		 	    <option value="rmvb">rmvb</option>
                			<option value="ts">ts</option>
                			<option value="itv">itv</option>
                			<option value="flv" selected="selected">flv</option>						 
						 </s:elseif>		
						 <s:else>
                			<option value="a">===Please select a===</option>
                			<option value="wmv">wmv</option>
                			<option value="mp3">mp3</option>
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
					<td align="right" class="STYLE1" style="margin-right: 10px">Level of video:</td>
					<td class="STYLE1"><select name="voidgrade" id="voidgrade">
						  <s:if test="%{model.voidgrade=='M0'}">
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
				
				<!-- 视频发布状态--> 			
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Video release status：</td>
					<td class="STYLE1"><select name="voidstatus" id="voidstatus">
						  <s:if test="%{model.voidstatus==1}">
							<option value="0">Not release</option>
							<option value="1" selected="selected">release</option>						  
						  </s:if>
						  <s:else>
							<option value="0">Not release</option>
							<option value="1">release</option>						  
						  </s:else>

						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>					
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Video enabled status:</td>
					<td class="STYLE1"><select name="ifenable" id="ifenable">
						  <s:if test="%{model.ifenable==1}">
							<option value="0">stop</option>
							<option value="1" selected="selected">To enable the</option>						  
						  </s:if>
						  <s:else>
							<option value="0">stop</option>
							<option value="1">To enable the</option>						  
						  </s:else>

						</select>
						 <span><font style="color: red">&nbsp;*</font></span>
					</td>
				</tr>				
				
				<tr>
					<td align="right" class="STYLE1" style="margin-right: 10px">Distribution type：</td>
					<td class="STYLE1"><select name="releasetype" id="releasetype" onchange="selectRosService(this)">
						  <s:if test="%{model.releasetype==1}">
							<option value="0">Automatic release</option>
              				<option value="1" selected="selected">Manual release</option>						  
						  </s:if>	
						  <s:else>
							<option value="0">Automatic release</option>
              				<option value="1">Manual release</option>						  
						  </s:else>
              			</select>
						<span><font style="color: red">&nbsp;*<span id="errorService"></span> </font></span>
					</td>
				</tr>
				
				<!--注意操作方式-->
				<tr id="subtree">
					<td align="right" class="STYLE1" style="margin-right: 10px">The resource server：</td>
					<td class="STYLE1">
						<table>
							<!-- 已选择的服务器 -->
							<s:iterator value="servicerListChecked">
								<tr>
									<td height="25" class="STYLE1">
									<input type="checkbox" name="serverid" id="serverid" checked="checked" value="${serverid}" /></td>
									<input type="hidden" name="servicename" id="servicename" value="${servicename}" />
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
							<!-- 未选择服务器 -->
							<s:iterator value="servicerList" id="list">
								<tr>
									<td height="25" class="STYLE1">
									<input type="checkbox" name="serverid" id="serverid" value="${serverid}" /></td>
									<input type="hidden" name="servicename" id="servicename" value="${servicename}" />
									<td class="STYLE1"><s:property value="servicename"/></td>
								</tr>
							</s:iterator>
						</table>
					</td>
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
