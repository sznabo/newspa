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

	function addVideo(){
		//获得program的ID
		var vodprogramid = document.getElementById("vodprogramid").value;
		window.location.href = "admin/vodVideoAction_skip.action?vodprogramid="+vodprogramid+"&type=skip";
	}	
	

</script>

</head>

<body>
<s:if test="#session.language==1">
	<s:if test="%{model.voidprogramdescription==1}">
		<img align="middle" width="450" height="300" src="<%=path%>${model.voidprogramimg}">
	</s:if>
	<s:else>
		<br/><br/><p align="center">该文件不存在，请核实信息！</p>
	</s:else>
	</s:if>
	<s:if test="#session.language==2">
	<s:if test="%{model.voidprogramdescription==1}">
		<img align="middle" width="450" height="300" src="<%=path%>${model.voidprogramimg}">
	</s:if>
	<s:else>
		<br/><br/><p align="center">The file does not exist, please check the information!s</p>
	</s:else>
	</s:if>
</body>

</html>
