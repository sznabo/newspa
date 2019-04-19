<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
int i=1;
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
var a = <%=session.getAttribute("language")%>
function selectAll() {
		var obj = document.getElementsByName('vedioid');
		var tige = document.getElementById('delid').checked;
		var tige2 = document.getElementById('undelid');
		tige2.checked = false;
		if(tige == true){
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vedioid') {
					obj[i].checked = true;
				}
			}
		}else{
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vedioid') {
					obj[i].checked = false;
				}
			}
		}
		
	}

	function unselectAll() {
		var obj = document.getElementsByName('vedioid');
		var tige = document.getElementById('delid');
		tige.checked= false;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == 'vedioid') {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}

	function addVodprogram(){
		var vodpartid = document.getElementById("vodpartid").value;
		window.location.href = "admin/vodManagement_skip.action?vodpartid="+vodpartid+"&type=skip";
	}

	function delRoleLink() {if(a==1){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
		        var type = confirm("确认要删除么");
			        if(type == false){
			        	return;
			        }
				location.href = "admin/liveManagement_delLive.action?liveid="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('Please choose！');
		        return false;
		    }else {
		        var type = confirm("Confirm to delete it");
			        if(type == false){
			        	return;
			        }
				location.href = "admin/liveManagement_delLive.action?liveid="+ids;
				}
	}
	}
	
	//批量获得ID,供生成xml适用
	function gainIDs(){if(a==1){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
				location.href = "admin/vodManagement_loadVodProgramByID.action?vodid="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('Please choose！');
		        return false;
		    }else {
				location.href = "admin/vodManagement_loadVodProgramByID.action?vodid="+ids;
				}
	}
	}
	
	
	function loadLiveLink(liveid){
		window.location.href = "admin/liveManagement_loadLiveByID.action?liveid="+liveid+"&type=modifyLive";
	}
	
	function liveSingleInfo(liveid){
		window.location.href = "admin/liveManagement_loadLiveByID.action?liveid="+liveid+"&type=liveInfo";		
	}	
	
	

</script>

</head>

<body>
<s:if test="#session.language==1">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">【<%=session.getAttribute("channel") %>】栏目列表</div></td>
  </tr>
  <tr><td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr><td height="20" background="<%=path%>/images/right_10.gif" bgcolor="#FFFFFF" class="STYLE3">
	  	  <input name="Submit" type="button" class="right-button08" value="添加" onclick="addVodprogram();" />
	  	  <input name="Submit" type="button" class="right-button08" value="删除" onclick="" />
	      <input name="Submit" type="button" class="right-button08" value="发布视频" onclick="gainIDs();"/>
	      <input name="Submit" type="button" class="right-button08" value="撤销发布" onclick=""/>
	      <input name="Submit" type="button" class="right-button08" value="批量上传" onclick=""/>	      	      
      </td></tr>
  </table></td></tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   
	   <table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr><td width="2%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
						<s:hidden name="vodpartid" id="vodpartid" value="%{model.vodpartid}"></s:hidden>
						<div align="center" style="size: 8px">
							<input type="checkbox" id="delid" name="delid" onclick="selectAll();" />全
							<SPAN style="color: blue;" >/</SPAN>
							<input type="checkbox" id="undelid" name="undelid" onclick="unselectAll();"/>反
						</div>
					</td>
					<td width="1%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">序号</div></td>
					<td width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">视频名称</div></td>
					<td width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">路径</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">发布状态</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">视频状态</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">格式</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">分发类型</div></td>
					<td width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">上传时间</div></td>
					<td width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">发布时间</div></td>	
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">发布人</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">操作</div></td>										
				</tr>
		 
	      <s:iterator value="vodprogramList" status="i">
	      <tr>
	      	<!-- checkbox -->
	        <td width="2%" height="25" class="STYLE1" bgcolor="#FFFFFF" align="center"><input type="checkbox" id="vedioid" name="vedioid" value="${id}"/></td> 
	        <!-- 序号 -->
	        <td width="1%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><%=i++ %></div></td>			        
	        <!-- 视频名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><a href="javascript:liveSingleInfo(${id});"><s:property value="voidname"/></a></div></td>
	        <!-- 地址 -->
	        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="voidpath"/></div></td>
	        
	        <!-- 发布状态 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">
	        	<s:if test="%{voidstatus==1}">已发布</s:if>
	        	<s:else>未发布</s:else>
	        
	        </div></td>
	        
	        <!--视频状态 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        	<s:if test="ifenable==0"><div align="center" style="color: red">停用</div></s:if>
	        	<s:else><div align="center">启用</div></s:else>
	        </td>
	       
	        <!-- 格式 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="voidformat"/></div></td>
	        <!-- 分发类型 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <s:if test="%{releasetype==1}"><div align="center">手动发布</div></s:if>
	        	<s:else><div align="center" style="color:blue">自动发布</div></s:else>
	        </td>
	        <!-- 上传时间 -->
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="createtime"/></div></td>
	        <!-- 发布时间 -->
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="releasetime"/></div></td>	        
	        <!-- 发布人 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="createadmin"/></div></td>
       		<!--操作 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        			<!--
	        			<a href="javascript:editRoleLink(${roleid});">修改</a>|
	        			  -->
						<a href="javascript:loadLiveLink(${id});">编辑</a>
			</td>
	      </tr>
	      </s:iterator>	

	    </table>
	    <!-- 显示内容结束 -->
		<!--分页 -->
		<table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1">
			<tr><td></td></tr>
		</table>
	</td>
 </tr>
 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="button" name="Submit" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:if>
<s:if test="#session.language==2">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">【<%=session.getAttribute("channel") %>】The column list</div></td>
  </tr>
  <tr><td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr><td height="20" background="<%=path%>/images/right_10.gif" bgcolor="#FFFFFF" class="STYLE3">
	  	  <input name="Submit" type="button" class="right-button08" value="add" onclick="addVodprogram();" />
	  	  <input name="Submit" type="button" class="right-button08" value="delete" onclick="" />
	      <input name="Submit" type="button" class="right-button08" value="Released video" onclick="gainIDs();"/>
	      <input name="Submit" type="button" class="right-button08" value="The publication" onclick=""/>
	      <input name="Submit" type="button" class="right-button08" value="Batch upload" onclick=""/>	      	      
      </td></tr>
  </table></td></tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   
	   <table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr><td width="2%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE">
						<s:hidden name="vodpartid" id="vodpartid" value="%{model.vodpartid}"></s:hidden>
						<div align="center" style="size: 8px">
							<input type="checkbox" id="delid" name="delid" onclick="selectAll();" />all
							<SPAN style="color: blue;" >/</SPAN>
							<input type="checkbox" id="undelid" name="undelid" onclick="unselectAll();"/>the
						</div>
					</td>
					<td width="1%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">serial number</div></td>
					<td width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">name of the video</div></td>
					<td width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">The path</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Post status</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Video state</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">format</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Distribution type</div></td>
					<td width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Upload time</div></td>
					<td width="20%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Release time</div></td>	
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Release people</div></td>
					<td width="5%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">operation</div></td>										
				</tr>
		 
	      <s:iterator value="vodprogramList" status="i">
	      <tr>
	      	<!-- checkbox -->
	        <td width="2%" height="25" class="STYLE1" bgcolor="#FFFFFF" align="center"><input type="checkbox" id="vedioid" name="vedioid" value="${id}"/></td> 
	        <!-- 序号 -->
	        <td width="1%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><%=i++ %></div></td>			        
	        <!-- 视频名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><a href="javascript:liveSingleInfo(${id});"><s:property value="voidname"/></a></div></td>
	        <!-- 地址 -->
	        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="voidpath"/></div></td>
	        
	        <!-- 发布状态 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center">
	        	<s:if test="%{voidstatus==1}">The published</s:if>
	        	<s:else>Not release</s:else>
	        
	        </div></td>
	        
	        <!--视频状态 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        	<s:if test="ifenable==0"><div align="center" style="color: red">disable</div></s:if>
	        	<s:else><div align="center">To enable the</div></s:else>
	        </td>
	       
	        <!-- 格式 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="voidformat"/></div></td>
	        <!-- 分发类型 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <s:if test="%{releasetype==1}"><div align="center">Manual release</div></s:if>
	        	<s:else><div align="center" style="color:blue">Automatic release</div></s:else>
	        </td>
	        <!-- 上传时间 -->
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="createtime"/></div></td>
	        <!-- 发布时间 -->
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="releasetime"/></div></td>	        
	        <!-- 发布人 -->
	        <td width="5%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><s:property value="createadmin"/></div></td>
       		<!--操作 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        			<!--
	        			<a href="javascript:editRoleLink(${roleid});">修改</a>|
	        			  -->
						<a href="javascript:loadLiveLink(${id});">The editor</a>
			</td>
	      </tr>
	      </s:iterator>	

	    </table>
	    <!-- 显示内容结束 -->
		<!--分页 -->
		<table align="center"" width="99%" border="0" cellpadding="4" cellspacing="1">
			<tr><td></td></tr>
		</table>
	</td>
 </tr>
 	<TR>
		<TD align="center" height="50px" bgcolor="#FFFFFF">
			<input type="button" name="Submit" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
		</TD>
	 </TR>
</table>
</s:if>
</body>
</html>
