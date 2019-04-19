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
		var obj = document.getElementsByName('vodPartId');
		var tige = document.getElementById('delid').checked;
		//var tige2 = document.getElementById('undelid');
		//tige2.checked = false;
		if(tige == true){
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vodPartId') {
					obj[i].checked = true;
				}
			}
		}else{
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vodPartId') {
					obj[i].checked = false;
				}
			}
		}
		
	}

	function unselectAll() {
		var obj = document.getElementsByName('vodPartId');
		var tige = document.getElementById('delid');
		tige.checked= false;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == 'vodPartId') {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}

	function addVodPartLink(){
		window.location.href = "admin/vodPartAction_skip.action?type=goaddVodPart";
	}

	function delVodPartLink() {if(a==1){
		var obj = document.getElementsByName('vodPartId');
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
				location.href = "admin/vodPartAction_delVodPart.action?vodPartId="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vodPartId');
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
				location.href = "admin/vodPartAction_delVodPart.action?vodPartId="+ids;
				}
	}
	}

	//function loadVodPartLink(vodPartId){
	//	window.location.href = "admin/vodManagement_loadVodPartByID.action?vodPartId="+vodPartId+"&type=modifyVodPart";
	//}
	
	//修改栏目信息
	function loadVodPartLink(vodPartId){
		window.location.href = "admin/vodPartAction_loadVodPartByID.action?vodPartId="+vodPartId+"&type=modifyVodPart";
	}	
	
	function vodChannelInfo(vodPartId){
		window.location.href = "admin/vodProgramAction_browseAllVodprogramByVodpartID.action?vodpartid="+vodPartId+"&type=vodprogramlist";			
	}	

</script>

</head>

<body>
<s:if test="#session.language==1">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" width="100%" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">点播管理</div></td>
  </tr>
  <!-- 查询条件 -->
  <tr><td colspan="5">
  	<table id="maintable" align="left" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" >
  	<s:form action="admin/vodManagement_listVodPart.action" method="post" cssStyle="border:0px;marggin:0px;padding:0px;">
  		<tr>
  			<td width="5%" height="25" style="size: 16px;padding-left:15" nowrap="nowrap"  bgcolor="#FFFFFF">
  				<s:hidden name="type" value="goListVodPart"></s:hidden>
  				名称:
  				<input type="text" name="vodquery.name" id="name" maxlength="30" style="margin-left:10px" />
  				<input type="submit" value="查询"  style="margin-left:10px"/>
  			</td>
  		</tr>
  	</s:form>	
  	</table>
  </td></tr>

  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   
	   <table id="maintable" align="center" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr>
					<td width="1%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">序号</div></td>
					<td width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">名称</div></td>
					<td width="35%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">简介</div></td>		
				</tr>
		 
	      <s:iterator value="pageBean.elements" id="item">
	      <tr>
	        <!-- 序号 -->
	        <td width="2%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><%=i++ %></div></td>			        
	        <!-- 直播名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <div align="center">
	        <td nowrap="nowrap">
				<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=<s:property value="#item.id"/>"><s:property value="#item.vodpartname"/></a>
			</td>
		  	     
	        </div>
	        </td>
	        <!-- 简介 -->
	        <td width="8%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <div align="center">
	        	<s:property value="#item.partintr"/>
	        </div></td>
	      </tr>
	      </s:iterator>	

	    </table>
	    <!-- 显示内容结束 -->
		<!--分页 -->
		<!--分页 -->
		<table align="center">
			<jsp:include page="/jsp/page.jsp" flush="false">
				<jsp:param value="admin/vodManagement_listVodPart.action" name="actionName"/>
			</jsp:include>
		</table>
	</td>
 </tr>
</table>
</s:if>
<s:if test="#session.language==2">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="d5d4d4">
  <tr>
    <td height="22" colspan="4" width="100%" background="<%=path%>/images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">On demand management</div></td>
  </tr>
  <!-- 查询条件 -->
  <tr><td colspan="5">
  	<table id="maintable" align="left" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" >
  	<s:form action="admin/vodManagement_listVodPart.action" method="post" cssStyle="border:0px;marggin:0px;padding:0px;">
  		<tr>
  			<td width="5%" height="25" style="size: 16px;padding-left:15" nowrap="nowrap"  bgcolor="#FFFFFF">
  				<s:hidden name="type" value="goListVodPart"></s:hidden>
  				Name:
  				<input type="text" name="vodquery.name" id="name" maxlength="30" style="margin-left:10px" />
  				<input type="submit" value="query"  style="margin-left:10px"/>
  			</td>
  		</tr>
  	</s:form>	
  	</table>
  </td></tr>

  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
	   
	   <table id="maintable" align="center" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" >
				<tr>
					<td width="1%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">serial number</div></td>
					<td width="10%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">name</div></td>
					<td width="35%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Introduction to the</div></td>		
				</tr>
		 
	      <s:iterator value="pageBean.elements" id="item">
	      <tr>
	        <!-- 序号 -->
	        <td width="2%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center"><%=i++ %></div></td>			        
	        <!-- 直播名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <div align="center">
	        <td nowrap="nowrap">
				<a style="color: blue;" href="<%=basePath%>addetail/list.action?adDetail.adid=<s:property value="#item.id"/>"><s:property value="#item.vodpartname"/></a>
			</td>
		  	     
	        </div>
	        </td>
	        <!-- 简介 -->
	        <td width="8%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF">
	        <div align="center">
	        	<s:property value="#item.partintr"/>
	        </div></td>
	      </tr>
	      </s:iterator>	

	    </table>
	    <!-- 显示内容结束 -->
		<!--分页 -->
		<!--分页 -->
		<table align="center">
			<jsp:include page="/jsp/page.jsp" flush="false">
				<jsp:param value="admin/vodManagement_listVodPart.action" name="actionName"/>
			</jsp:include>
		</table>
	</td>
 </tr>
</table>
</s:if>
</body>
</html>
